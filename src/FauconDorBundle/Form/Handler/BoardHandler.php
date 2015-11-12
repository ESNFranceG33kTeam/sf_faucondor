<?php

namespace FaucondorBundle\Form\Handler;

use Doctrine\ORM\EntityManager;
use FaucondorBundle\Form\Model\Mail;
use Symfony\Bundle\TwigBundle\TwigEngine;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;
use UserBundle\Entity\User;

/**
 * Created by PhpStorm.
 * User: jerem
 * Date: 11/11/15
 * Time: 11:54
 */
class BoardHandler
{
    protected $em;
    protected $form;
    protected $request;

    /**
     * Initialize the handler with the form and the request.
     * @param EntityManager $em
     * @param Form    $form
     * @param Request $request
     */
    public function __construct(EntityManager $em, Form $form, Request $request)
    {
        $this->em = $em;
        $this->form = $form;
        $this->request = $request;
    }

    public function process()
    {
        if ($this->form->isValid()) {
            if ('POST' == $this->request->getMethod()) {

                /** @var User $user */
                $user = $this->form->getData();

                $this->onSuccess($user);

                return true;
            }
        }
        return false;
    }

    /**
     * @param User $user
     */
    protected function onSuccess(User $user){
        $this->em->persist($user);
        $this->em->flush();
    }
}