<?php

namespace FaucondorBundle\Controller;

use Doctrine\ORM\EntityManager;
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

        $users = $em->getRepository('UserBundle:User')->findAll();

        return $this->render('FaucondorBundle:Faucondor:annuaire.html.twig', array(
            "users" => $users
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
        $sections = $em->getRepository('FaucondorBundle:Section')->findBy(array("country" => $this->container->getParameter('code_country')));

        return $this->render('FaucondorBundle:Faucondor:participation.html.twig', array(
            'events' => $events,
            'sections' => $sections
        ));
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function editBoardAction(Request $request)
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $form = $this->createForm(new BoardType());
        $formHandler = new BoardHandler($em, $form, $request);
        $form->handleRequest($request);

        if ($formHandler->process()){
            $this->addFlash('success', 'label.mail.updated');
        }

        return $this->render("FaucondorBundle:Faucondor:email.html.twig", array(
                "form" => $form->createView()
            )
        );

        return $this->render('FaucondorBundle:Faucondor:board.html.twig');
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function mailrlAction(Request $request)
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $form = $this->createForm(new MailType());
        $formHandler = new MailHandler($em, $form, $request, $this->container, $this->get('templating'), $this->get('mailer'));
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

            if (count($users) > 0){
                $posts_users[$post->getName()] = array();

                $users_str = "";
                /** @var User $user */
                foreach($users as $user){
                    if ($user->getEmail())
                        $users_str .= $user->getEmail() . ", ";
                }

                $users_str = substr($users_str, 0, -2);
                $posts_users[$post->getName()] = $users_str;
            }
        }

        return $this->render('FaucondorBundle:Faucondor:export.html.twig', array(
                "posts_users" => $posts_users
            )
        );
    }
}
