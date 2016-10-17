<?php

namespace UserBundle\Command;

use Doctrine\ORM\EntityManager;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use UserBundle\Entity\User;

class CreateDocApiUsersCommand  extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('create:users')
            ->setDescription('Create doc and api user')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        /** @var EntityManager $em */
        $em = $this->getContainer()->get('doctrine')->getManager();

        $docuser = new User();
        $docuser->setEnabled(1);
        $docuser->setFirstname("Doc");
        $docuser->setLastname("User");
        $docuser->setEmail("doc@faucondor.ixesn.fr");
        $docuser->setUsername("doc");
        $docuser->setPlainPassword($this->generateRandomString());
        $docuser->setEmailgalaxy("doc@faucondor.ixesn.fr");

        $em->persist($docuser);

        $apiuser = new User();
        $apiuser->setEnabled(1);
        $apiuser->setFirstname("api");
        $apiuser->setLastname("User");
        $apiuser->setEmail("api@faucondor.ixesn.fr");
        $apiuser->setUsername("api");
        $apiuser->setPlainPassword($this->generateRandomString());
        $apiuser->setEmailgalaxy("api@faucondor.ixesn.fr");

        $em->persist($apiuser);
        $em->flush();
    }

    private function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}