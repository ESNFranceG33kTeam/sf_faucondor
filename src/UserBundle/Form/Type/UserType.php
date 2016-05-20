<?php

/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 11/08/15
 * Time: 12:07
 */

namespace RestBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class UserType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname', 'text', array('required' => true))
            ->add('lastname', 'text', array('required' => true))
            ->add('emailGalaxy', 'email', array('required' => true))
            ->add('email', 'email', array('required' => false))
            ->add('section', null, array('required' => true))
            ->setMethod('post');
    }

    /**
     * {@inheritdoc}
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection'   => false,
            'data_class'    => 'RestBundle\Form\Model\ModelUser'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getName()
    {
        return 'userName';
    }
}