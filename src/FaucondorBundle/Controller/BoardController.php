<?php

namespace FaucondorBundle\Controller;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Committee;
use FaucondorBundle\Entity\ContactList;
use FaucondorBundle\Entity\Post;
use FaucondorBundle\Form\Type\BoardType;
use Symfony\Component\Form\FormError;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use UserBundle\Entity\User;
use UserBundle\Form\Type\UserTypeBase as UserType;

/**
 * User controller.
 *
 */
class BoardController extends Controller
{

    /**
     * Lists all User entities.
     *
     */
    public function indexAction()
    {
        if ($this->checkPermission()){
            throw $this->createAccessDeniedException();
        }

        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        /** @var User $user */
        $user = $this->getUser();

        $users = $committees = array();

        //Local Board Members
        if ($user->isLocalBoardMember()){
            //$board_members = $em->getRepository('UserBundle:User')->findUsersByPost($user->getLocalBoardPost());
            $board_members = $em->getRepository('UserBundle:User')->findUsersBySection($user->getSection());
            $users[$user->getLocalBoardPost()->getName()] = array();

            /** @var User $board_member */
            foreach($board_members as $board_member){
                if ($board_member->getSection() == $this->getUser()->getSection())
                    $users[$user->getLocalBoardPost()->getName()][] = $board_member;

                if (!isset($committees[$board_member->getId()]))
                    $committees[$board_member->getId()] = array();

                $committees_db = $em->getRepository('FaucondorBundle:Committee')->findByUser($board_member);
                if ($committees_db) {
                    /** @var Committee $com */
                    foreach($committees_db as $com){
                        $committees[$board_member->getId()][] = $com->getName();
                    }
                }
            }
        }

        //National Board Members
        if ($user->isNationalBoardMember() ){
            $nationalboardname = "ESN " . $this->container->getParameter('country');
            $board_members = $em->getRepository('UserBundle:User')->findUsersByPost($user->getNationalBoardPost());
            $users[$user->getNationalBoardPost()->getName()] = array();

            /** @var User $board_member */
            foreach($board_members as $board_member){
                $users[$user->getNationalBoardPost()->getName()][] = $board_member;

                if (!isset($committees[$board_member->getId()]))
                    $committees[$board_member->getId()] = array();

                $committees_db = $em->getRepository('FaucondorBundle:Committee')->findByUser($board_member);

                if ($committees_db) {
                    /** @var Committee $com */
                    foreach($committees_db as $com){
                        if (!in_array($com->getName(), $committees[$board_member->getId()]))
                            $committees[$board_member->getId()][] = $com->getName();
                    }
                }
            }
        }

        //National Committee Members
        if ($user->isNationalChair()){
            /** @var Committee $committee */
            $committee = $em->getRepository('FaucondorBundle:Committee')->findOneBy(array("chair" => $user));

            if ($committee){
                $users["committee"] = array();


                foreach($committee->getUsers() as $board_member){
                    $users["committee"][] = $board_member;
                }
            }
        }

        if (count($users) == 0){
            throw $this->createNotFoundException('No members, faucondor system error');
        }

        return $this->render('FaucondorBundle:Board:index.html.twig', array(
            'board_members' => $users,
            'committees'    => $committees,
            'nationalboardname' => $nationalboardname
        ));
    }
    /**
     * Creates a new User entity.
     *
     */
    public function createAction(Request $request)
    {
        if ($this->checkPermission()){
            throw $this->createAccessDeniedException();
        }

        $entity = new User();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            /** @var EntityManager $em */
            $em = $this->getDoctrine()->getManager();

            $user_db = $em->getRepository('UserBundle:User')->findOneByUsername($form->get('email')->getData());

            if ($user_db) {
                $this->addFlash('error', 'Email already used');

                return $this->render('FaucondorBundle:Board:new.html.twig', array(
                    'entity' => $entity,
                    'form'   => $form->createView(),
                ));
            }

            if (!$entity->getId()){
                if ($entity->isRL()){
                    $this->sendRLEmail($entity);
                }else{
                    $this->sendWelcomeEmail($entity);
                }

                $entity->setEmailgalaxy($form->get('email')->getData());
                $entity->setUsername($form->get('email')->getData());
                $entity->setRandomPassword();
                $entity->setEnabled(1);
            }

            $em->persist($entity);
            $em->flush();

            if ($this->getUser()->isSCV()) {
                $contactlist_id = $request->getSession()->get('contactlist_id');
                if ($contactlist_id){
                    /** @var ContactList $contactlist */
                    $contactlist = $em->getRepository('FaucondorBundle:ContactList')->find($contactlist_id);

                    if ($contactlist){
                        $contactlist->addUser($entity);
                        $em->flush();

                        return $this->redirect($this->generateUrl('contactlist_show', array('id' => $contactlist_id)));
                    }
                }else{
                    return $this->redirect($this->generateUrl('board'));
                }
            }else{
                return $this->redirect($this->generateUrl('board'));
            }
        }

        return $this->render('FaucondorBundle:Board:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a User entity.
     *
     * @param User $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(User $entity)
    {
        $type = $this->getUser()->isSCV() ? "SCV" : null;

        $form = $this->createForm(new BoardType($this->getDoctrine()->getManager(), $this->getUser(), substr($this->container->getParameter('country'),0,2), $type), $entity, array(
            'action' => $this->generateUrl('board_create'),
            'method' => 'POST',
        ));

        return $form;
    }

    /**
     * Displays a form to create a new User entity.
     *
     */
    public function newAction()
    {
        if ($this->checkPermission()){
            throw $this->createAccessDeniedException();
        }

        $entity = new User();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Board:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Displays a form to create a new User entity.
     *
     */
    public function newSCVContactAction()
    {
        if (!$this->getUser()->isSCV()){
            throw $this->createAccessDeniedException();
        }

        $entity = new User();
        $form = $this->createForm(new BoardType($this->getDoctrine()->getManager(), $this->getUser(), substr($this->container->getParameter('country'),0,2), "SCV"), $entity, array(
            'action' => $this->generateUrl('board_create'),
            'method' => 'POST',
        ));

        return $this->render('FaucondorBundle:Board:new.html.twig', array(
            'type'   => 'scv',
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * @param $id
     * @param $type
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function editAction($id, $type)
    {
        if ($this->checkPermission()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('UserBundle:User')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find User entity.');
        }

        $editForm = $this->createEditForm($entity, $type);

        return $this->render('FaucondorBundle:Board:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView()
        ));
    }

    /**
    * Creates a form to edit a User entity.
    *
    * @param User $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(User $entity, $type)
    {
        $form = $this->createForm(new BoardType($this->getDoctrine()->getManager(), $this->getUser(), substr($this->container->getParameter('country'),0,2), Post::$types[$type]), $entity, array(
            'action' => $this->generateUrl('board_update', array('id' => $entity->getId(), 'type' => $type)),
            'method' => 'PUT',
        ));

        return $form;
    }
    /**
     * Edits an existing User entity.
     *
     */
    public function updateAction(Request $request, $type, $id)
    {
        if ($this->checkPermission()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('UserBundle:User')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find User entity.');
        }

        $editForm = $this->createEditForm($entity, $type);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            $this->addFlash('success', $this->get('translator')->trans('board.success.update'));

            return $this->redirect($this->generateUrl('board'));
        }

        return $this->render('FaucondorBundle:Board:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView()
        ));
    }
    /**
     * Deletes a User entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        if ($this->checkPermission()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();
        $entity = $em->getRepository('UserBundle:User')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find User entity.');
        }

        $em->remove($entity);
        $em->flush();

        $this->addFlash('success', $this->get('translator')->trans('board.success.delete'));

        return $this->redirect($this->generateUrl('board'));
    }

    /**
     * Send email to user
     *
     * @param User $user
     */
    private function sendRLEmail(User $user){
        $attach = __DIR__ . "/../../../FauconDorBundle/Resources/views/Emails/FicheDePosteRL.pdf";

        $message = \Swift_Message::newInstance()
            ->setSubject('[ESN France] Faucon d\'or')
            ->setFrom($this->container->getParameter('mailer_from'))
            ->setTo($user->getEmail())
            ->setBody(
                $this->get('templating')->render(
                    'FaucondorBundle:Emails:rl.html.twig',
                    array('user' => $user)
                ),
                'text/html'
            )
            ->attach(\Swift_Attachment::fromPath($attach))
        ;
        $this->get('mailer')->send($message);
    }

    /**
     * Send email to user
     *
     * @param User $user
     */
    private function sendWelcomeEmail(User $user){
        $message = \Swift_Message::newInstance()
            ->setSubject('[ESN France] Faucon d\'or')
            ->setFrom($this->container->getParameter('mailer_from'))
            ->setTo($user->getEmail())
            ->setBody(
                $this->get('templating')->render(
                    'FaucondorBundle:Emails:welcome.html.twig',
                    array('user' => $user)
                ),
                'text/html'
            )
        ;
        $this->get('mailer')->send($message);
    }

    /**
     * Check Permission on board functions
     *
     * @return bool
     */
    public function checkPermission(){
        return !$this->getUser()->isSCV() && !$this->getUser()->isRL() && !$this->getUser()->isNationalBoardMember() && !$this->getUser()->isNationalChair();
    }
}
