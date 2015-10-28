<?php

namespace FaucondorBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('FaucondorBundle:Default:index.html.twig');
    }
}
