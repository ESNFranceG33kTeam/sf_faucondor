<?php

namespace FauconDorBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('FauconDorBundle:Default:index.html.twig');
    }
}
