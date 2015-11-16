<?php

namespace UserBundle\Entity;

/**
 * Created by PhpStorm.
 * User: jerem
 * Date: 27/10/15
 * Time: 22:22
 */

use Doctrine\Common\Collections\ArrayCollection;
use FaucondorBundle\Entity\Committee;
use FaucondorBundle\Entity\Post;
use FaucondorBundle\Entity\Section;
use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="UserBundle\Entity\UserRepository")
 * @ORM\Table(name="fo_user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="firstname", type="string", length=255)
     */
    private $firstname;

    /**
     * @var string
     *
     * @ORM\Column(name="lastname", type="string", length=255)
     */
    private $lastname;

    /**
     * @var string
     *
     * @ORM\Column(name="address", type="string", length=255, nullable=true)
     */
    private $address;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=50, nullable=true)
     */
    private $city;

    /**
     * @var string
     *
     * @ORM\Column(name="zipcode", type="string", length=5, nullable=true)
     */
    private $zipcode;

    /**
     * @var string
     *
     * @ORM\Column(name="galaxy_roles", type="text", nullable=true)
     */
    private $galaxy_roles;

    /**
     * @var string
     *
     * @ORM\Column(name="galaxy_picture", type="string", length=255, nullable=true)
     */
    private $galaxy_picture;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="birthdate", type="date", nullable=true)
     */
    private $birthdate;

    /**
     * @var string
     *
     * @ORM\Column(name="gender", type="string", length=1, nullable=true)
     */
    private $gender;

    /**
     * @var string
     *
     * @ORM\Column(name="mobile", type="string", length=13, nullable=true)
     */
    private $mobile;

    /**
     * @var ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="FaucondorBundle\Entity\Post")
     */
    private $posts;

    /**
     * @var Section
     *
     * @ORM\ManyToOne(targetEntity="FaucondorBundle\Entity\Section", inversedBy="users")
     */
    private $section;

    public function __construct()
    {
        parent::__construct();

        $this->posts = new ArrayCollection();
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getFirstname()
    {
        return $this->firstname;
    }

    /**
     * @param string $firstname
     */
    public function setFirstname($firstname)
    {
        $this->firstname = $firstname;
    }

    /**
     * @return string
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * @param string $lastname
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;
    }

    /**
     * @return string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * @param string $address
     */
    public function setAddress($address)
    {
        $this->address = $address;
    }

    /**
     * @return string
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * @param string $city
     */
    public function setCity($city)
    {
        $this->city = $city;
    }

    /**
     * @return string
     */
    public function getZipcode()
    {
        return $this->zipcode;
    }

    /**
     * @param string $zipcode
     */
    public function setZipcode($zipcode)
    {
        $this->zipcode = $zipcode;
    }

    /**
     * @return string
     */
    public function getGalaxyRoles()
    {
        return $this->galaxy_roles;
    }

    /**
     * @param string $galaxy_roles
     */
    public function setGalaxyRoles($galaxy_roles)
    {
        $this->galaxy_roles = $galaxy_roles;
    }

    /**
     * @return string
     */
    public function getGalaxyPicture()
    {
        return $this->galaxy_picture;
    }

    /**
     * @param string $galaxy_picture
     */
    public function setGalaxyPicture($galaxy_picture)
    {
        $this->galaxy_picture = $galaxy_picture;
    }

    /**
     * @return \DateTime
     */
    public function getBirthdate()
    {
        return $this->birthdate;
    }

    /**
     * @param \DateTime $birthdate
     */
    public function setBirthdate($birthdate)
    {
        $this->birthdate = $birthdate;
    }

    /**
     * @return string
     */
    public function getGender()
    {
        return $this->gender;
    }

    /**
     * @param string $gender
     */
    public function setGender($gender)
    {
        $this->gender = $gender;
    }

    /**
     * @return string
     */
    public function getMobile()
    {
        return $this->mobile;
    }

    /**
     * @param string $mobile
     */
    public function setMobile($mobile)
    {
        $this->mobile = $mobile;
    }

    public function setRandomPassword(){
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 8; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        $this->setPlainPassword(implode($pass)); //turn the array into a string
    }

    /**
     * Check if user is super admin
     *
     * @return bool
     */
    public function isSuperAdmin(){
        return in_array("ROLE_SUPER_ADMIN", $this->getRoles());
    }

    /**
     * Check if user is VP
     *
     * @return bool
     */
    public function isVP(){
        return $this->hasPermission("local", "vicePresident");
    }

    /**
     * Check if user is Treasurer
     *
     * @return bool
     */
    public function isTreasurer(){
        return $this->hasPermission("local", "treasurer");
    }

    /**
     * Check if user is RL
     *
     * @return bool
     */
    public function isRL(){
        return $this->hasPermission("local", "localRepresentative");
    }

    /**
     * Check if user is Webmaster
     *
     * @return bool
     */
    public function isWebmaster(){
        return $this->hasPermission("local", "webmaster");
    }

    /**
     * Check if user is President
     *
     * @return bool
     */
    public function isPresident(){
        return $this->hasPermission("local", "president");
    }

    /**
     * Check if user is Active Member
     *
     * @return bool
     */
    public function isActiveMember(){
        return $this->hasPermission("local", "activeMember");
    }

    /**
     * Check if user is national Comity Chair
     *
     * @return bool
     */
    public function isNationalChair(){
        return $this->hasPermission("national", "projectCoordinator");
    }

    /**
     * Check if user is national Comity Chair
     *
     * @return bool
     */
    public function isInternationalChair(){
        return $this->hasPermission("international", "projectCoordinator");
    }

    /**
     * Check if user is national VP
     *
     * @return bool
     */
    public function isNationalVP(){
        return $this->hasPermission("national", "vicePresident");
    }

    /**
     * Check if user is national NR
     *
     * @return bool
     */
    public function isNationalNR(){
        return $this->hasPermission("national", "representative");
    }

    /**
     * @return string
     */
    public function __toString(){
        return $this->firstname . " " . strtoupper($this->lastname);
    }

    /**
     * @param $level
     * @param $role
     * @return bool
     */
    public function hasPermission($level, $role){
        if ($this->isSuperAdmin()) return true;

        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if (strtolower($post->getLevel()) == strtolower($level) && strtolower($post->getRole()) == strtolower($role))
                return true;
        }

        return false;
    }

    /**
     * @param Post $post
     * @return $this
     */
    public function addPost(Post $post){
        $this->posts->add($post);

        return $this;
    }

    /**
     * @param Post $post
     */
    public function removePost(Post $post){
        $this->posts->removeElement($post);
    }

    /**
     * @return ArrayCollection
     */
    public function getPosts()
    {
        return $this->posts;
    }

    /**
     * Reinit posts
     */
    public function resetPosts(){
        foreach($this->getPosts() as $post){
            $this->removePost($post);
        }
    }


    /**
     * @return Section
     */
    public function getSection()
    {
        return $this->section;
    }

    /**
     * @param Section $section
     */
    public function setSection($section)
    {
        $this->section = $section;
    }

    /**
     * @return ArrayCollection
     */
    public function getAnnuairePosts($level){
        $posts = new ArrayCollection();

        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if (strtolower($post->getLevel()) == $level
                && strtolower($post->getRole()) != "regularboardmember"
                && strtolower($post->getRole()) != "activemember"
                && strtolower($post->getRole()) != "projectcoordinator")
            {
                $posts->add($post);
            }
        }

        return $posts;
    }

    /**
     * @return ArrayCollection
     */
    public function getPostsByLevel($level){
        $posts = new ArrayCollection();

        switch($level){
            case "localBoardMember" :
                $posts = $this->getAnnuairePosts("local");
                break;
            case "nationalBoardMember" :
                $posts = $this->getAnnuairePosts("national");
                break;
        }

        return $posts;
    }

    public function isLocalBoardMember(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isLocal() && $post->isBoardMember()) return true;
        }

        return false;
    }

    public function getLocalBoardPost(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isLocal() && $post->isBoardMember()) return $post;
        }

        return false;
    }

    public function isNationalBoardMember(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isNational() && $post->isBoardMember()) return true;
        }

        return false;
    }

    public function getNationalCommitteePost(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isNational() && $post->isChair()) return $post;
        }

        return false;
    }

    public function getNationalBoardPost(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isNational() && $post->isBoardMember()) return $post;
        }

        return false;
    }

    public function isInternationalBoardMember(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isInternational() && $post->isBoardMember()) return true;
        }

        return false;
    }

    public function getInternationalBoardPost(){
        /** @var Post $post */
        foreach($this->getPosts() as $post){
            if ($post->isInternational() && $post->isBoardMember()) return $post;
        }

        return false;
    }
}