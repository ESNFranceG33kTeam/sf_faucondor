<?php

namespace UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;
use UserBundle\Entity\User;
use UserBundle\Security\User\UserProvider;

class LoginController extends Controller
{
    /**
     * @param Request $request
     *
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function checkAction(Request $request){
        $em = $this->getDoctrine()->getEntityManager();
        $user_cas = null;

        $cas_host = $this->container->getParameter('cas_server');
        $cas_port = $this->container->getParameter('cas_port');
        $cas_context = $this->container->getParameter('cas_path');
        $code_section = $this->container->getParameter('code_section');

        /** @var UserProvider $up */
        $up = new UserProvider($cas_host, $cas_port, $cas_context);

        $user_cas = $up->loadGalaxyUser();

        if ($user_cas != null && $user_cas->getSc() == $code_section){
            $user_db = $em->getRepository("ESNUserBundle:User")->findOneBy(array("email" => $user_cas->getEmail()));

            //Check
            if (!$user_db)
                $user_db = $em->getRepository("ESNUserBundle:User")->findOneBy(array("firstname" => $user_cas->getFirstname(), "lastname" => $user_cas->getLastname()));

            $user = (!$user_db) ? new User() : $user_db;

            $user->setUsername($user_cas->getEmail());
            $user->setUsernameCanonical($user_cas->getEmail());
            $user->setEmail($user_cas->getEmail());
            $user->setGalaxyRoles(implode(",", $user_cas->getRoles()));
            $user->setFirstname($user_cas->getFirstname());
            $user->setLastname($user_cas->getLastname());
            $user->setBirthdate(\DateTime::createFromFormat("d/m/Y", $user_cas->getBirthdate()));
            $user->setGender($user_cas->getGender());
            $user->setSection($user_cas->getSection());
            $user->setCodeSection($user_cas->getSc());
            $user->setGalaxyPicture($user_cas->getPicture());
            $user->setMobile($user_cas->getTelephone());

            if (!$user_db) {
                $user->setEnabled(true);
                $user->setEsner(true);
                $user->setUsername($user_cas->getEmail());
                $user->setUsernameCanonical($user_cas->getEmail());
                $user->setEmail($user_cas->getEmail());
                $user->setRoles(array('ROLE_USER'));
                $user->setRandomPassword();
                $em->persist($user);
            }

            $em->flush();

            $token = new UsernamePasswordToken($user, null, "main", $user->getRoles());
            $this->get("security.context")->setToken($token);

            /** @var Request $request */
            $request = $this->get("request");
            $event = new InteractiveLoginEvent($request, $token);
            $this->get("event_dispatcher")->dispatch("security.interactive_login", $event);

            return $this->redirect($this->generateUrl('faucondor_homepage'));
        }

        return $this->redirect($this->generateUrl('faucondor_login'));
    }

    public function logoutAction(){
        $this->get('security.context')->setToken(null);
        $this->get('request')->getSession()->invalidate();

        return $this->redirect($this->generateUrl('faucondor_login'));
    }
}
