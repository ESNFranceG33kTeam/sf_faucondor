<?php

namespace FaucondorBundle\Controller;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Committee;
use FaucondorBundle\Entity\Events;
use FaucondorBundle\Entity\Post;
use FaucondorBundle\Entity\Section;
use FaucondorBundle\Form\Handler\BoardHandler;
use FaucondorBundle\Form\Handler\MailHandler;
use FaucondorBundle\Form\Type\BoardType;
use FaucondorBundle\Form\Type\MailType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Acl\Exception\Exception;
use UserBundle\Entity\User;

class FaucondorController extends Controller
{
    /**
     * Redirect to Annuaire page
     *
     * @return RedirectResponse
     */
    public function indexAction()
    {
        return new RedirectResponse('annuaire');
    }


    public function annuaireAction()
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        //LOCAL BOARD MEMBERS
        $localusers = array();

        $sections = $em->getRepository('FaucondorBundle:Section')->findBy(array("country" => substr($this->container->getParameter('country'),0,2)));

        /** @var Section $section */
        foreach($sections as $section){
            $localusers[$section->getName()] = array();

            /** @var User $user */
            foreach($section->getUsers() as $user){
                if ($user->isLocalBoardMember()){
                    $localusers[$section->getName()][] = $user;
                }
            }
        }

        //NATIONAL BOARD MEMBERS
        $nationalusers = array();
        $nationalName = "ESN " . $this->container->getParameter('country');

        $nationalPosts = $em->getRepository('FaucondorBundle:Post')->findPostsByLevel(Post::NATIONAL);

        /** @var Post $post */
        foreach($nationalPosts as $post){
            $user = $em->getRepository('UserBundle:User')->findUsersByPost($post);

            if (!isset($nationalusers[$nationalName])){
                $nationalusers[$nationalName] = array();
            }

            if (count($user) == 1) {
                $nationalusers[$nationalName][] = $user;
            }elseif (count($user) > 1){
                throw new Exception('Multiple National Board members on the same post');
            }
        }

        //COMMITTEES BOARD MEMBERS
        $committeesusers = array();

        $committees = $em->getRepository('FaucondorBundle:Committee')->findAll();

        /** @var Committee $committee */
        foreach($committees as $committee){
            $committeesusers[$committee->getName()] = array();

            /** @var User $user */
            foreach($committee->getUsers() as $user){
                $committeesusers[$committee->getName()][] = $user;
            }
        }

        return $this->render('FaucondorBundle:Faucondor:annuaire.html.twig', array(
            'nationalusers'     => $nationalusers,
            'localusers'        => $localusers,
            'committeesusers'   => $committeesusers
        ));
    }

    /**
     *
     *
     * @param $section_id
     * @param $event_id
     * @return JsonResponse
     */
    public function sectionEventAction(Request $request, $section_id, $event_id){
        if (!$request->isXmlHttpRequest()) {
            throw $this->createNotFoundException();
        }

        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        /** @var Section $section */
        $section = $em->getRepository('FaucondorBundle:Section')->find($section_id);

        /** @var Events $event */
        $event = $em->getRepository('FaucondorBundle:Events')->find($event_id);


        if ($section->getEvents()->contains($event)){
            $section->removeEvent($event);
            $msg = "section.event.removed";
            $id  = "hasNotParticipated";
        }else{
            $section->addEvent($event);
            $msg = "section.event.added";
            $id  = "hasParticipated";
        }

        $em->flush();

        return new JsonResponse(array(
            'code' => 'success',
            'message' => $this->get('translator')->trans($msg, array("%section%" => $section->getName(), "%event%" => $event->getName())),
            'id'   => $id
        ));
    }

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function participationAction()
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $events = $em->getRepository('FaucondorBundle:Events')->findBy(array(), array("start" => "DESC"));
        $sections = $em->getRepository('FaucondorBundle:Section')->findBy(array("country" => substr($this->container->getParameter('country'),0,2)));

        return $this->render('FaucondorBundle:Faucondor:participation.html.twig', array(
            'events' => $events,
            'sections' => $sections
        ));
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function mailrlAction(Request $request)
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $form = $this->createForm(new MailType($this->get('translator')));
        $formHandler = new MailHandler($em, $form, $request);
        $form->handleRequest($request);

        if ($formHandler->process()){
            $this->addFlash('success', 'label.mail.updated');
        }

        return $this->render("FaucondorBundle:Faucondor:email.html.twig", array(
                "form" => $form->createView()
            )
        );
    }

    public function exportlistesAction()
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $posts_users = array();

        $posts = $em->getRepository('FaucondorBundle:Post')->findAll();
        /** @var Post $post */
        foreach($posts as $post){
            $users = $em->getRepository('UserBundle:User')->findUsersByPost($post);
            $postname = $post->getLevel() . " " . $post->getName();

            if (count($users) > 0){
                $posts_users[$postname] = array();

                $users_str = "";
                /** @var User $user */
                foreach($users as $user){
                    if ($user->getEmail())
                        $users_str .= $user->getEmail() . ", ";
                }

                $users_str = substr($users_str, 0, -2);
                $posts_users[$postname] = $users_str;
            }
        }

        return $this->render('FaucondorBundle:Faucondor:export.html.twig', array(
                "posts_users" => $posts_users
            )
        );
    }
}
