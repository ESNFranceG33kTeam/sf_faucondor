<?php

namespace RestBundle\Form\Model;
use FaucondorBundle\Entity\Post;
use UserBundle\Entity\User;

/**
 * Created by PhpStorm.
 * User: jerem
 * Date: 13/12/15
 * Time: 11:52
 */
class ModelUserRole
{

    /**
     * @var User
     */
    private $user;

    /**
     * @var Post
     */
    private $role;

    /**
     * @return Post
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * @param Post $role
     */
    public function setRole($role)
    {
        $this->role = $role;
    }

    /**
     * @return User
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param User $user
     */
    public function setUser($user)
    {
        $this->user = $user;
    }
}