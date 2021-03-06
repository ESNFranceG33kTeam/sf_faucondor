<?php

namespace UserBundle\Form\Type;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use FaucondorBundle\Entity\Post;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class UserTypeBase extends AbstractType
{
    public function __construct(){

    }

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
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

        /*$builder
            ->add('section', null, array(
            'query_builder' => function(EntityRepository $er) {
                return $er->createQueryBuilder('s')
                    ->where('s.country = :country')
                    ->setParameter('country', $this->code_country)
                    ->orderBy('s.name', 'ASC');
            },
        )):*/

        if ($this->type != "committee"){
            $builder
                ->add('posts', null, array(
                    'query_builder' => function(EntityRepository $er) {
                        return $er->findByLevel(Post::LOCAL);
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
