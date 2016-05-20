<?php

/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 11/08/15
 * Time: 12:07
 */

namespace RestBundle\Form\Handler;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Section;
use RestBundle\Form\Model\ModelUser;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Serializer\Tests\Model;
use Symfony\Component\Translation\Exception\NotFoundResourceException;
use UserBundle\Entity\User;

class UserHandler
{
    /**
     * Form
     *
     * @var FormInterface
     */
    protected $form;

    /**
     * Request
     *
     * @var Request
     */
    protected $request;

    /**
     * Object manager
     *
     * @var ObjectManager
     */
    protected $em;

    /**
     * @param Request $request
     * @param FormInterface $form
     */
    public function __construct(Request $request, FormInterface $form, ObjectManager $em)
    {
        $this->request = $request;
        $this->form = $form;
        $this->em = $em;
    }

    /**
     * Prepare & process form
     *
     * @author Jeremie Samson <jeremie@ylly.fr>
     *
     * @return bool
     */
    public function process()
    {
        if ($this->request->isMethod('POST')) {

            $this->form->handleRequest($this->request);

            if ($this->form->isValid()) {
                /** @var ModelUser $user */
                $user = $this->form->getData();

                if (!$user->getFirstname() || !$user->getLastname() || !$user->getEmailGalaxy() || !$user->getSection()){
                    throw new Exception('Missing parameters');
                }

                $section = $this->em->getRepository('FaucondorBundle:Section')->find($user->getSection());

                if (!$section){
                    throw new NotFoundResourceException('Section with id ' . $user->getSection() . ' not found');
                }

                $this->onSuccess($user, $section);

                return true;
            }
        }

        return false;
    }

    /**
     * Add a User
     *
     * @author Jeremie Samson <jeremie@ylly.fr>
     *
     * @param ModelUser $user
     */
    protected function onSuccess(ModelUser $model, Section $section)
    {
        $user = new User();
        $user->setEnabled(true);
        $user->setRandomPassword();

        $user->setFirstname($model->getFirstname());
        $user->setLastname($model->getLastname());
        $user->setEmailgalaxy($model->getEmailGalaxy());
        $user->setEmail(($model->getEmail()) ? $model->getEmail() : $model->getEmailGalaxy());
        $user->setUsername($model->getEmailgalaxy());

        $section->addUser($user);

        $this->em->persist($user);
        $this->em->flush();
    }
}