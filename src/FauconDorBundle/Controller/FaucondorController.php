<?php

namespace FaucondorBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class FaucondorController extends Controller
{
    public function indexAction()
    {
        return $this->render('FaucondorBundle:Faucondor:index.html.twig');
    }

    public function annuaireAction()
    {
        return $this->render('FaucondorBundle:Faucondor:annuaire.html.twig');
    }

    public function participationAction()
    {
        return $this->render('FaucondorBundle:Faucondor:participation.html.twig');
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
