<?php

namespace FaucondorBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class ContactListType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder@
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('users', null, array(
                'multiple' => true,
                'attr'     => array(
                    'class' => 'select2'
                )
            ))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'FaucondorBundle\Entity\ContactList'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'faucondorbundle_contactlist';
    }
}
