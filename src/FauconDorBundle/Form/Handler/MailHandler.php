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
     * @var ContainerInterface
     */
    protected $container;

    /**
     * Twig
     *
     * @var TwigEngine
     */
    protected $templating;

    /**
     * Mailer
     *
     * @var \Swift_Mailer
     */
    protected $mailer;

    /**
     * Initialize the handler with the form and the request.
     * @param
     * @param Form    $form
     * @param Request $request
     * @param $mailer
     */
    public function __construct(EntityManager $em, Form $form, Request $request, ContainerInterface $container, TwigEngine $templating, \Swift_Mailer $mailer)
    {
        $this->em = $em;
        $this->form = $form;
        $this->request = $request;
        $this->container = $container;
        $this->templating = $templating;
        $this->mailer = $mailer;
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
        $this->em->flush();
    }

    /**
     * Send email to user
     *
     * @param User $user
     */
    private function sendEmail(User $user){
        $attach = __DIR__ . "/../../../HRBundle/Resources/views/Emails/guide.pptx";

        $message = \Swift_Message::newInstance()
            ->setSubject('[ESN Lille] Bienvenue dans l\'association')
            ->setFrom($this->container->getParameter('mailer_from'))
            ->setTo($user->getEmail())
            ->setBody(
                $this->templating->render(
                    'ESNHRBundle:Emails:registration.html.twig',
                    array('user' => $user)
                ),
                'text/html'
            )
            ->attach(\Swift_Attachment::fromPath($attach))
        ;
        $this->mailer->send($message);
    }
}