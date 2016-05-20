<?php

/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 11/08/15
 * Time: 12:07
 */

namespace UserBundle\Form\Handler;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Section;
use Symfony\Component\Form\FormError;
use UserBundle\Form\Model\ModelUser;
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
                    $this->form->addError(new FormError('Missing parameter(s)'));
                } else {
                    if (!filter_var($user->getEmail(), FILTER_VALIDATE_EMAIL) || !filter_var($user->getEmailGalaxy(), FILTER_VALIDATE_EMAIL)) {
                        $error = new FormError('email invalid');

                        if (!filter_var($user->getEmail(), FILTER_VALIDATE_EMAIL))
                            $this->form->get('email')->addError($error);

                        if (!filter_var($user->getEmailGalaxy(), FILTER_VALIDATE_EMAIL))
                            $this->form->get('emailGalaxy')->addError($error);

                    } else {
                        $section_id = $this->em->getRepository('FaucondorBundle:Section')->find($user->getSection());
                        $section_code = $this->em->getRepository('FaucondorBundle:Section')->findOneBy(array(
                            "code" => $user->getSection()
                        ));

                        if (!$section_id && !$section_code){
                            $this->form->get('section')->addError(new FormError('Section with id ' . $user->getSection() . ' not found'));
                        } else {
                            /** @var Section $section */
                            $section = ($section_id) ? $section_id : $section_code;
                            $this->onSuccess($user, $section);

                            return true;
                        }
                    }
                }
            }
        }

        return false;
    }

    /**
     * Add a User
     *
     * @author Jeremie Samson <jeremie.samson@ix.esnlille.fr>
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
        $user->setMobile($model->getMobile());

        $section->addUser($user);

        $this->em->persist($user);
        $this->em->flush();
    }
}