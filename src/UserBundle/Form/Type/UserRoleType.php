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

class UserRoleType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('user', null, array('required' => true))
            ->add('role', null, array('required' => true))
            ->setMethod('post');
    }

    /**
     * {@inheritdoc}
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection'   => false,
            'data_class'    => 'RestBundle\Form\Model\ModelUserRole'
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