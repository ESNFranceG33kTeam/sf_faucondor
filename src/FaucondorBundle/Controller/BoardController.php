<?php

namespace FaucondorBundle\Controller;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Committee;
use FaucondorBundle\Form\Type\BoardType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use UserBundle\Entity\User;
use UserBundle\Form\UserType;

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
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        /** @var User $user */
        $user = $this->getUser();

        $users = new ArrayCollection();

        //Local Board Members
        if ($user->isLocalBoardMember()){
            $board_members = $em->getRepository('UserBundle:User')->findUsersByPost($user->getLocalBoardPost());
            foreach($board_members as $board_member){
                $users->add($board_member);
            }
        }


        //National Board Members
        if ($user->isNationalBoardMember()){
            $board_members = $em->getRepository('UserBundle:User')->findUsersByPost($user->getNationalBoardPost());
            foreach($board_members as $board_member){
                $users->add($board_member);
            }
        }

        //National Committee Members
        if ($user->isNationalChair()){
            /** @var Committee $committee */
            $committee = $em->getRepository('FaucondorBundle:Committee')->findOneBy(array("chair" => $user));
            $board_members = $committee->getUsers();
            foreach($board_members as $board_member){
                $users->add($board_member);
            }
        }

        if (count($users) == 0){
            throw $this->createNotFoundException('No members, faucondor system error');
        }

        return $this->render('FaucondorBundle:Board:index.html.twig', array(
            'board_members' => $users,
        ));
    }
    /**
     * Creates a new User entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new User();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            /** @var EntityManager $em */
            $em = $this->getDoctrine()->getManager();

            if (!$entity->getId()){
                $entity->setUsername($form->get('email')->getData());
                $entity->setRandomPassword();
                $entity->setSection($this->getUser()->getSection());
            }

            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('board'));
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
        $form = $this->createForm(new BoardType(), $entity, array(
            'action' => $this->generateUrl('board_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new User entity.
     *
     */
    public function newAction()
    {
        $entity = new User();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Board:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a User entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Board')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find User entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:Board:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing User entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Board')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find User entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:Board:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a User entity.
    *
    * @param User $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(User $entity)
    {
        $form = $this->createForm(new UserType(), $entity, array(
            'action' => $this->generateUrl('user_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing User entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Board')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find User entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('user_edit', array('id' => $id)));
        }

        return $this->render('FaucondorBundle:Board:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a User entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('FaucondorBundle:Board')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find User entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('user'));
    }

    /**
     * Creates a form to delete a User entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('user_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
