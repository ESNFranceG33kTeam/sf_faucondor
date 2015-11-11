<?php

namespace FaucondorBundle\Command;

use Doctrine\ORM\EntityManager;
use FaucondorBundle\Entity\Section;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

/**
 * Created by PhpStorm.
 * User: jerem
 * Date: 11/11/15
 * Time: 10:40
 */
class ImportSectionCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('fdo:section:import')
            ->setDescription('Import all sections from XML')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        /** @var EntityManager $em */
        $em = $this->getContainer()->get('doctrine.orm.entity_manager');

        $sectionsFile = __DIR__ . "/Data/sections.xml";

        $output->writeln("Début de l'importation");

        $doc = new \DOMDocument();

        $output->writeln('<comment>Loading accounts from file ...</comment>');

        if ($doc->load($sectionsFile)){
            $sections_xml = $doc->getElementsByTagName('section');
            $size = $sections_xml->length;

            $output->writeln('<comment>' .$size. '</comment>');

            foreach($sections_xml as $section_xml){

                //Section
                $code = $section_xml->getElementsByTagName('sc')->item(0)->nodeValue;

                /** @var Section $section_db */
                $section_db = $em->getRepository('FaucondorBundle:Section')->findOneBy(array("code" => $code));

                $section = ($section_db) ? $section_db : new Section();

                $section->setCode($code);

                //Name
                $name = $section_xml->getElementsByTagName('sectionname')->item(0)->nodeValue;
                $section->setName($name);

                //Street
                $street = $section_xml->getElementsByTagName('street')->item(0)->nodeValue;
                $section->setStreet($street);

                //City
                $city = $section_xml->getElementsByTagName('l')->item(0)->nodeValue;
                $section->setCity($city);

                //Country
                $country = $section_xml->getElementsByTagName('c')->item(0)->nodeValue;
                $section->setCountry($country);

                //Website
                $website = $section_xml->getElementsByTagName('website')->item(0)->nodeValue;
                $section->setWebsite($website);

                //Facebook
                $facebook = $section_xml->getElementsByTagName('facebook')->item(0)->nodeValue;
                $section->setFacebook($facebook);

                //Longitude
                $longitude = $section_xml->getElementsByTagName('longitude')->item(0)->nodeValue;
                $section->setLongitude($longitude);

                //Latitude
                $latitude = $section_xml->getElementsByTagName('latitude')->item(0)->nodeValue;
                $section->setLatitude($latitude);

                //Joindate
                $section->setJoindate(new \DateTime());

                if (!$section_db){
                    $em->persist($section);
                }

                $em->flush();
            }
        }

        $output->writeln("Importation terminé");
    }

}