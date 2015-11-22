<?php

namespace FaucondorBundle\Form\Handler;

use Doctrine\ORM\EntityManager;
use FaucondorBundle\Form\Model\Mail;
use Symfony\Bundle\TwigBundle\TwigEngine;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;

/**
 * Created by PhpStorm.
 * User: jerem
 * Date: 11/11/15
 * Time: 11:54
 */
class MailHandler
{
    protected $em;
    protected $form;
    protected $request;

    /**
     * Initialize the handler with the form and the request.
     * @param
     * @param Form    $form
     * @param Request $request
     * @param $mailer
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

                /** @var Mail $mail */
                $mail = $this->form->getData();

                $this->onSuccess($mail);

                return true;
            }
        }
        return false;
    }

    /**
     * @param Mail $mail
     */
    protected function onSuccess(Mail $mail){
        //Update body
        file_put_contents(__DIR__ . Mail::EMAILPATH, $mail->getBody());
    }
}