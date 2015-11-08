<?php

namespace FaucondorBundle\Controller;

use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Events;
use FaucondorBundle\Entity\Section;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;

class FaucondorController extends Controller
{
    public function indexAction()
    {
        return new RedirectResponse('annuaire');
    }

    public function annuaireAction()
    {
        return $this->render('FaucondorBundle:Faucondor:annuaire.html.twig');
    }


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
        $sections = $em->getRepository('FaucondorBundle:Section')->findAll();

        return $this->render('FaucondorBundle:Faucondor:participation.html.twig', array(
            'events' => $events,
            'sections' => $sections
        ));
    }

    public function editBoardAction()
    {
        return $this->render('FaucondorBundle:Faucondor:board.html.twig');
    }

    public function eventsAction()
    {
        return $this->render('FaucondorBundle:Faucondor:events.html.twig');
    }

    public function sectionsAction()
    {
        return $this->render('FaucondorBundle:Faucondor:sections.html.twig');
    }

    public function mailrlAction()
    {
        return $this->render('FaucondorBundle:Faucondor:email.html.twig');
    }

    public function exportlistesAction()
    {
        return $this->render('FaucondorBundle:Faucondor:export.html.twig');
    }
}
