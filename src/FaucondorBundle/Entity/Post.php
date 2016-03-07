<?php

namespace FaucondorBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use UserBundle\Entity\User;
use JMS\Serializer\Annotation\ExclusionPolicy;
use JMS\Serializer\Annotation\Expose;
use JMS\Serializer\Annotation\Groups;
use JMS\Serializer\Annotation\VirtualProperty;

/**
 * Post
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="FaucondorBundle\Entity\PostRepository")
 *
 * @ExclusionPolicy("all")
 */
class Post
{
    const LOCAL = "local";
    const NATIONAL = "national";
    const INTERNATIONAL = "international";

    public static $types = array("committee" => "committee", "localBoardMember" => "Local", "NationalBoardMember" => "National");

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     *
     * @Expose
     * @Groups({"default"})
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     *
     * @Expose
     * @Groups({"default"})
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="role", type="string", length=255)
     *
     * @Expose
     * @Groups({"default"})
     */
    private $role;

    /**
     * @var string
     *
     * @ORM\Column(name="level", type="string", length=255)
     *
     * @Expose
     * @Groups({"default"})
     */
    private $level;

    /**
     * ToString
     */
    public function __toString(){
        return $this->getName();
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Post
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return string
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * @param string $role
     */
    public function setRole($role)
    {
        $this->role = $role;
    }

    /**
     * @return string
     */
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * @param string $level
     */
    public function setLevel($level)
    {
        $this->level = $level;
    }

    public function isLocal(){
        return strtolower($this->getLevel()) == "local";
    }

    public function isNational(){
        return strtolower($this->getLevel()) == "national";
    }

    public function isChair(){
        return strtolower($this->getRole()) == "projectcoordinator";
    }

    public function isInternational(){
        return strtolower($this->getLevel()) == "international";
    }

    public function isBoardMember(){
        return strtolower($this->getRole()) == "regularboardmember";
    }

    public function isSCV(){
        return strtolower($this->getRole()) == "scv";
    }

    public function fullname(){
        return $this->getLevel() . " " . $this->getName();
    }
}

