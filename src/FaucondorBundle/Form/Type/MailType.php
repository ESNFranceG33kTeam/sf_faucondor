<?php

namespace FaucondorBundle\Form\Type;

use FaucondorBundle\Form\Model\Mail;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class MailType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('from', 'text', array(
                'data' => Mail::FROM,
                'read_only' => true
            ))
            ->add('subject', 'text', array(
                'data' => Mail::SUBJECT,
                'read_only' => true
            ))
            ->add('body', 'textarea', array(
                'data' => file_get_contents(__DIR__ . Mail::EMAILPATH)
            ))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'FaucondorBundle\Form\Model\Mail'
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
