<?php

namespace FaucondorBundle\Controller;

use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Events;
use FaucondorBundle\Entity\Section;
use FaucondorBundle\Form\Handler\MailHandler;
use FaucondorBundle\Form\Type\MailType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;

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
    public function sectionEventAction($section_id, $event_id){
        if (!$this->getRequest()->isXmlHttpRequest()) {
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

    public function editBoardAction()
    {
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
        return $this->render('FaucondorBundle:Faucondor:export.html.twig');
    }
}
