<?php

namespace FaucondorBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\EventDispatcher\Event;
use UserBundle\Entity\User;

/**
 * Section
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="FaucondorBundle\Entity\SectionRepository")
 */
class Section
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="joindate", type="datetime")
     */
    private $joindate;

    /**
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=255)
     */
    private $code;

    /**
     * @var string
     *
     * @ORM\Column(name="street", type="string", length=255)
     */
    private $street;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255)
     */
    private $city;

    /**
     * @var string
     *
     * @ORM\Column(name="website", type="string", length=255)
     */
    private $website;

    /**
     * @var string
     *
     * @ORM\Column(name="facebook", type="string", length=255)
     */
    private $facebook;

    /**
     * @var integer
     *
     * @ORM\Column(name="longitude", type="integer")
     */
    private $longitude;

    /**
     * @var integer
     *
     * @ORM\Column(name="latitude", type="integer")
     */
    private $latitude;

    /**
     * @var string
     *
     * @ORM\Column(name="country", type="string", length=255)
     */
    private $country;

    /**
     * @var ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="\FaucondorBundle\Entity\Events", cascade={"persist"})
     */
    private $events;

    /**
     * @var ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="UserBundle\Entity\User", mappedBy="section")
     */
    private $users;

    /**
     * Constructor
     */
    public function __constructor(){
        $this->users  = new ArrayCollection();
        $this->events = new ArrayCollection();
    }

    /**
     * @return string
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
     * @return Section
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
     * Set joindate
     *
     * @param \DateTime $joindate
     *
     * @return Section
     */
    public function setJoindate($joindate)
    {
        $this->joindate = $joindate;

        return $this;
    }

    /**
     * Get joindate
     *
     * @return \DateTime
     */
    public function getJoindate()
    {
        return $this->joindate;
    }

    /**
     * Set code
     *
     * @param string $code
     *
     * @return Section
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set country
     *
     * @param string $country
     *
     * @return Section
     */
    public function setCountry($country)
    {
        $this->country = $country;

        return $this;
    }

    /**
     * Get country
     *
     * @return string
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * @param Events $event
     */
    public function addEvent(Events $event){
        $this->events->add($event);

        return $this;
    }

    /**
     *
     */
    public function removeEvent(Events $event){
        $this->events->removeElement($event);
    }

    /**
     * @return ArrayCollection
     */
    public function getEvents(){
        return $this->events;
    }

    /**
     * @param Events $event
     */
    public function hasParticipated(Events $event){
        return $this->events->contains($event);
    }

    /**
     * @return string
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * @param string $street
     */
    public function setStreet($street)
    {
        $this->street = $street;
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
    public function getWebsite()
    {
        return $this->website;
    }

    /**
     * @param string $website
     */
    public function setWebsite($website)
    {
        $this->website = $website;
    }

    /**
     * @return string
     */
    public function getFacebook()
    {
        return $this->facebook;
    }

    /**
     * @param string $facebook
     */
    public function setFacebook($facebook)
    {
        $this->facebook = $facebook;
    }

    /**
     * @return int
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * @param int $longitude
     */
    public function setLongitude($longitude)
    {
        $this->longitude = $longitude;
    }

    /**
     * @return int
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * @param int $latitude
     */
    public function setLatitude($latitude)
    {
        $this->latitude = $latitude;
    }

    /**
     * @param User $user
     * @return $this
     */
    public function addUser(User $user)
    {
        $this->users->add($user);

        $user->setSection($this);

        return $this;
    }

    /**
     * @param User $user
     */
    public function removeUser(User $user)
    {
        $this->users->removeElement($user);
    }

    /**
     * @return ArrayCollection
     */
    public function getUsers()
    {
        return $this->users;
    }
}

