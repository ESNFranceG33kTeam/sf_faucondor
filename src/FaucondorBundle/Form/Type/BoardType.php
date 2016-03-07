<?php

namespace FaucondorBundle\Form\Type;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use FaucondorBundle\Entity\Post;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use UserBundle\Entity\User;

class BoardType extends AbstractType
{
    /**
     * @var string
     */
    private $code_country;

    /**
     * @var EntityManager
     */
    private $em;

    /**
     * @var User
     */
    private $user;

    /**
     * @var string
     */
    private $type;

    public function __construct($em, User $user, $country, $type = null){
        $this->em = $em;
        $this->user = $user;
        $this->code_country = substr($country, 0, 2);
        $this->type = $type;
    }

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $code_country = $this->code_country;

        $builder
            ->add('firstname')
            ->add('lastname')
            ->add('gender', 'choice', array(
                'expanded' => true,
                'choices' => array(
                    'M' => 'm',
                    'F' => 'f'
                )
            ))
            ->add('mobile')
            ->add('email')
        ;

        if ($this->user->isNationalBoardMember() && $this->type != "SCV"){
            $builder
                ->add('section', null, array(
                    'expanded' => false,
                    'property' => 'name',
                    'query_builder' => function(EntityRepository $er) use ($code_country) {
                        return $er->getSectionsByCountry($code_country);
                    }
                ));
        }


        if ($this->type != "committee" && $this->type != "SCV"){
            $level = ($this->user->isNationalBoardMember() || $this->user->isNationalSCV()) ? "National" : "Local";

            $builder
                ->add('posts', null, array(
                    'expanded' => true,
                    'property' => 'fullname',
                    'query_builder' => function(EntityRepository $er) use ($level) {
                        return $er->findByLevel($level);
                    }
                ))
            ;
        }
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'UserBundle\Entity\User'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'userbundle_user';
    }
}
