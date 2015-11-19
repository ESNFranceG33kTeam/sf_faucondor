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

    public function __construct($em, User $user, $code_country, $type = null){
        $this->em = $em;
        $this->user = $user;
        $this->code_country = $code_country;
        $this->type = $type;
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
            $level = ($this->user->isNationalBoardMember()) ? $this->user->getNationalBoardPost()->getLevel() : $this->user->getLocalBoardPost()->getLevel();

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
