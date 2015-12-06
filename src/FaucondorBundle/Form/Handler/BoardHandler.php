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
     * @param EntityManager $em
     * @param Form    $form
     * @param Request $request
     */
    public function __construct(EntityManager $em, Form $form, Request $request, TwigEngine $templating, \Swift_Mailer $mailer)
    {
        $this->em = $em;
        $this->form = $form;
        $this->request = $request;
        $this->templating = $templating;
        $this->mailer = $mailer;
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
        if (!$user->getId()){}
            $this->sendEmail($user);

        $this->em->persist($user);
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
                    'FaucondorBundle:Emails:rl.html.twig',
                    array('user' => $user)
                ),
                'text/html'
            )
            ->attach(\Swift_Attachment::fromPath($attach))
        ;
        $this->mailer->send($message);
    }
}