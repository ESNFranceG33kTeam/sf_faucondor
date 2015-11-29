<?php

namespace FaucondorBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class PointsType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('basicAction', 'choice', array(
                'choices' => array(
                    "1" => "French Kiss 1pt",
                    "2" => "Oral Sex (giving) 2pts",
                    "3" => "Sex 3pts",
                    "4" => "Other kinky stuff (anal sex, group sex, gang bang, bondage) 4pts"
                 ),
                'empty_value'       => '',
                'empty_data'        => null,
                'preferred_choices' => array(null)
            ))
            ->add('to', null, array(
                'property' => 'toStringWithPoints'
            ))
            ->add('bonus', 'choice', array(
                'choices' => array(
                    "1" => "Single x1",
                    "2" => "In a RelationShip x2",
                    "3" => "Engaged x3",
                    "4" => "Married x4"
                ),
                'empty_value'       => '',
                'empty_data'        => null,
                'preferred_choices' => array(null)
            ))
            ->add('points', 'integer', array(
                'read_only' => true
            ))
            ->add('date', null, array(
                'widget'=> 'single_text',
                'format'=>'d/m/Y',
                'attr'  => array(
                    'class' => 'datepicker'
                )
            ))
            ->add('situation', 'choice', array(
                'mapped'  => false,
                'choices' => array(
                    "1" => "Single x1",
                    "2" => "In a RelationShip x2",
                    "3" => "Engaged x3",
                    "4" => "Married x4"
                ),
                'empty_value'       => '',
                'empty_data'        => null,
                'preferred_choices' => array(null)
            ))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'FaucondorBundle\Entity\Points'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'faucondorbundle_points';
    }
}
