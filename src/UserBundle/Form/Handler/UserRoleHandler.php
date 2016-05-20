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
use FaucondorBundle\Entity\Post;
use FaucondorBundle\Entity\Section;
use UserBundle\Form\Model\ModelUser;
use UserBundle\Form\Model\ModelUserRole;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Serializer\Tests\Model;
use Symfony\Component\Translation\Exception\NotFoundResourceException;
use UserBundle\Entity\User;

class UserRoleHandler
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
                /** @var ModelUserRole $model */
                $model = $this->form->getData();

                if (!$model->getUser() || !$model->getRole()){
                    throw new Exception('Missing parameters');
                }

                /** @var User $user */
                $user = $this->em->getRepository('UserBundle:User')->find($model->getUser());

                /** @var Post $role */
                $role = $this->em->getRepository('FaucondorBundle:Post')->find($model->getRole());

                if (!$user){
                    throw new NotFoundResourceException('User with id ' . $model->getUser() . ' not found ');
                }

                if (!$role){
                    throw new NotFoundResourceException('Role with id ' . $model->getRole() . ' not found ');
                }

                $this->onSuccess($user, $role);

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
     * @param User $user
     * @param Post $post
     */
    protected function onSuccess(User $user, Post $post)
    {
        $user->addPost($post);

        $this->em->flush();
    }
}