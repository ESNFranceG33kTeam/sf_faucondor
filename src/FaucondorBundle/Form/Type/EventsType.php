<?php

namespace FaucondorBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class EventsType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('start', null, array(
                'widget'=> 'single_text',
                'format'=>'d/m/Y',
                'attr'  => array(
                    'class' => 'datepicker'
                )
            ))
            ->add('end', null, array(
                'widget'=> 'single_text',
                'format'=>'d/m/Y',
                'attr'  => array(
                    'class' => 'datepicker'
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
            'data_class' => 'FaucondorBundle\Entity\Events'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'faucondorbundle_events';
    }
}
