<?php

namespace FaucondorBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\EventDispatcher\Event;

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
     * Constructor
     */
    public function __constructor(){
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
}

