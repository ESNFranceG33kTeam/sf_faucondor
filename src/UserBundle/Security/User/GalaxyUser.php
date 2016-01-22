<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 20/04/15
 * Time: 23:49
 */

namespace UserBundle\Security\User;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\EquatableInterface;

class GalaxyUser implements UserInterface, EquatableInterface
{
    private $username;
    private $password;
    private $salt;
    private $roles;

    private $email;
    private $sc;
    private $firstname;
    private $lastname;
    private $nationality;
    private $picture;
    private $birthdate;
    private $gender;
    private $telephone;
    private $address;
    private $section;
    private $country;

    public function __construct($username, $attributes, $password = null, $salt = null, array $roles = null)
    {
        $this->username     = $username;
        $this->email        = (array_key_exists('mail', $attributes)) ? $attributes['mail'] : null;
        $this->firstname    = (array_key_exists('first', $attributes)) ? $attributes['first'] : null;
        $this->lastname     = (array_key_exists('last', $attributes)) ? $attributes['last'] : null;
        $this->nationality  = (array_key_exists('nationality', $attributes)) ? $attributes['nationality'] : null;
        $this->picture      = (array_key_exists('picture', $attributes)) ? $attributes['picture'] : null;
        $this->birthdate    = (array_key_exists('birthdate', $attributes)) ? $attributes['birthdate'] : null;
        $this->gender       = (array_key_exists('gender', $attributes)) ? $attributes['gender'] : null;
        $this->telephone    = (array_key_exists('telephone', $attributes)) ? $attributes['telephone'] : null;
        $this->address      = (array_key_exists('address', $attributes)) ? $attributes['address'] : null;
        $this->section      = (array_key_exists('section', $attributes)) ? $attributes['section'] : null;
        $this->country      = (array_key_exists('country', $attributes)) ? $attributes['country'] : null;
        $this->sc           = (array_key_exists('sc', $attributes)) ? $attributes['sc'] : null;
        $this->roles        = (array_key_exists('roles', $attributes)) ? $attributes['roles'] : null;
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
    public function getSc()
    {
        return $this->sc;
    }

    /**
     * @param mixed $sc
     */
    public function setSc($sc)
    {
        $this->sc = $sc;
    }

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
    public function getNationality()
    {
        return $this->nationality;
    }

    /**
     * @param mixed $nationality
     */
    public function setNationality($nationality)
    {
        $this->nationality = $nationality;
    }

    /**
     * @return mixed
     */
    public function getPicture()
    {
        return $this->picture;
    }

    /**
     * @param mixed $picture
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;
    }

    /**
     * @return mixed
     */
    public function getBirthdate()
    {
        return $this->birthdate;
    }

    /**
     * @param mixed $birthdate
     */
    public function setBirthdate($birthdate)
    {
        $this->birthdate = $birthdate;
    }

    /**
     * @return mixed
     */
    public function getGender()
    {
        return $this->gender;
    }

    /**
     * @param mixed $gender
     */
    public function setGender($gender)
    {
        $this->gender = $gender;
    }

    /**
     * @return mixed
     */
    public function getTelephone()
    {
        return $this->telephone;
    }

    /**
     * @param mixed $telephone
     */
    public function setTelephone($telephone)
    {
        $this->telephone = $telephone;
    }

    /**
     * @return mixed
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * @param mixed $address
     */
    public function setAddress($address)
    {
        $this->address = $address;
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
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * @param mixed $country
     */
    public function setCountry($country)
    {
        $this->country = $country;
    }

    /**
     * @return mixed
     */
    public function getAttributes()
    {
        return $this->attributes;
    }

    /**
     * @param mixed $attributes
     */
    public function setAttributes($attributes)
    {
        $this->attributes = $attributes;
    }

    public function getRoles()
    {
        return $this->roles;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function getSalt()
    {
        return $this->salt;
    }

    public function getUsername()
    {
        return $this->username;
    }

    public function eraseCredentials()
    {
    }

    public function isEqualTo(UserInterface $user)
    {
        if (!$user instanceof User) {
            return false;
        }

        if ($this->password !== $user->getPassword()) {
            return false;
        }

        if ($this->salt !== $user->getSalt()) {
            return false;
        }

        if ($this->username !== $user->getUsername()) {
            return false;
        }

        return true;
    }
}