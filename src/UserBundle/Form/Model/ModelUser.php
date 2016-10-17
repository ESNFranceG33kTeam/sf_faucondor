<?php

namespace UserBundle\Form\Model;

/**
 * Created by PhpStorm.
 * User: jerem
 * Date: 13/12/15
 * Time: 11:52
 */
class ModelUser
{

    private $firstname;

    private $lastname;

    private $emailGalaxy;

    private $email;

    private $section;

    private $mobile;

    /**
     * @return mixed
     */
    public function getFirstname()
    {
        return $this->firstname;
    }

    /**
     * @param mixed $firstname
     */
    public function setFirstname($firstname)
    {
        $this->firstname = $firstname;
    }

    /**
     * @return mixed
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * @param mixed $lastname
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;
    }

    /**
     * @return mixed
     */
    public function getEmailGalaxy()
    {
        return $this->emailGalaxy;
    }

    /**
     * @param mixed $emailGalaxy
     */
    public function setEmailGalaxy($emailGalaxy)
    {
        $this->emailGalaxy = $emailGalaxy;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * @return mixed
     */
    public function getSection()
    {
        return $this->section;
    }

    /**
     * @param mixed $section
     */
    public function setSection($section)
    {
        $this->section = $section;
    }

    /**
     * @return mixed
     */
    public function getMobile()
    {
        return $this->mobile;
    }

    /**
     * @param mixed $mobile
     */
    public function setMobile($mobile)
    {
        $this->mobile = $mobile;
    }
}