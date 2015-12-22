<?php

namespace UserBundle\Controller;

use FaucondorBundle\Entity\Post;
use FaucondorBundle\Entity\Section;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;
use Symfony\Component\Translation\Translator;
use UserBundle\Entity\User;
use UserBundle\Security\User\GalaxyUser;
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

        $cas_host = $this->container->getParameter('cas_host');
        $cas_port = $this->container->getParameter('cas_port');
        $cas_context = $this->container->getParameter('cas_context');
        $code_country = substr($this->container->getParameter('country'),0,2);

        /*if (isset($_SERVER['HTTP_CLIENT_IP'])
            || isset($_SERVER['HTTP_X_FORWARDED_FOR'])
            || !(in_array(@$_SERVER['REMOTE_ADDR'], array('127.0.0.1', 'fe80::1', '::1')) || php_sapi_name() === 'cli-server')
        ) {*/
            /** @var UserProvider $up */
            $up = new UserProvider($cas_host, $cas_context, $cas_port);

            $user_cas = $up->loadGalaxyUser();
        /*}else{
            /** @var User $user_db */
            //$user_db = $em->getRepository("UserBundle:User")->findOneBy(array("email" => "camille.eurin@gmail.com"));
            //$user_db = $em->getRepository("UserBundle:User")->findOneBy(array("email" => "jeremie.samson@ix.esnlille.fr"));
            //$user_db = $em->getRepository("UserBundle:User")->findOneBy(array("email" => "rl@esnlille.fr"));
            //$user_db = $em->getRepository("UserBundle:User")->findOneBy(array("email" => "rl@esnlille.fr"));

            //$user_cas =  $this->userTransformer($user_db);
        //}


        if ($user_cas != null && $user_cas->getNationality() == $code_country){
            $user_db = $em->getRepository("UserBundle:User")->findOneBy(array("emailgalaxy" => $user_cas->getEmail()));

            //Check on first and lastname
            if (!$user_db){
                $user_db = $em->getRepository("UserBundle:User")->findOneBy(array("firstname" => $user_cas->getFirstname(), "lastname" => $user_cas->getLastname()));

                if ($user_db && $user_db->getEmail() != $user_cas->getEmail()){
                    $user_db->setEmailgalaxy($user_cas->getEmail());
                }
            }else{
                //Check on email
                $user_db = $em->getRepository("UserBundle:User")->findOneBy(array("email" => $user_cas->getEmail()));

                if ($user_db){
                    if (!$user_db->getEmail())
                        $user_db->setEmail($user_cas->getEmail());

                    $user_db->setEmailgalaxy($user_cas->getEmail());
                }
            }

            $user = (!$user_db) ? new User() : $user_db;

            /** @var Section $section */
            $section = $em->getRepository("FaucondorBundle:Section")->findOneBy(array("code" => $user_cas->getSc()));

            if (!$section){
                throw new Exception('Section not found');
            }

            $user->setUsername($user_cas->getEmail());
            $user->setUsernameCanonical($user_cas->getEmail());
            $user->setEmailgalaxy($user_cas->getEmail());
            $user->setGalaxyRoles(implode(",", $user_cas->getRoles()));
            $user->setFirstname($user_cas->getFirstname());
            $user->setLastname($user_cas->getLastname());
            $user->setBirthdate(\DateTime::createFromFormat("d/m/Y", $user_cas->getBirthdate()));
            $user->setGender($user_cas->getGender());
            $user->setGalaxyPicture($user_cas->getPicture());
            $user->setMobile($user_cas->getTelephone());

            $roles = $user_cas->getRoles();
            $user->resetPosts();

            foreach($roles as $role_galaxy){

                if (strpos($role_galaxy, '.') !== false){

                    $tab = explode('.', $role_galaxy);

                    $level = $tab[0];
                    $role = $tab[1];

                    /** @var Post $role_db */
                    $role_db = $em->getRepository('FaucondorBundle:Post')->findOneBy(array("role" => $role, "level" => $level));

                    if ($role_db){
                        $user->addPost($role_db);
                    }else{
                        $post = new Post();
                        $post->setName($role);
                        $post->setLevel($level);
                        $post->setRole($role);

                        $em->persist($post);

                        $user->addPost($post);
                    }

                    $em->flush();
                }
            }

            if (!$user_db) {
                $user->setEnabled(true);
                $user->setEmail($user_cas->getEmail());
                $user->setRoles(array('ROLE_USER'));
                $user->setRandomPassword();
                $section->addUser($user);
                $em->persist($user);
            }

            $em->flush();

            $token = new UsernamePasswordToken($user, null, "main", $user->getRoles());
            $this->get("security.context")->setToken($token);

            /** @var Request $request */
            $request = $this->get("request");
            $event = new InteractiveLoginEvent($request, $token);
            $this->get("event_dispatcher")->dispatch("security.interactive_login", $event);

            $translator = new Translator('fr_FR');
            $this->addFlash('success ', $translator->trans('label.success.login', array(), 'messages'));

            return $this->redirect($this->generateUrl('faucondor_homepage'));
        }

        $translator = new Translator('fr_FR');
        $this->addFlash('error ', $translator->trans('label.error.login'));

        return $this->redirect($this->generateUrl('faucondor_login'));
    }

    public function logoutAction(){
        $this->get('security.context')->setToken(null);
        $this->get('request')->getSession()->invalidate();

        return $this->redirect($this->generateUrl('faucondor_login'));
    }

    /**
     * @param User $user
     *
     * @return GalaxyUser
     */
    private function userTransformer(User $user){
        $username = $user->getUsername();
        $attributes = array();

        $attributes['mail'] = $user->getEmail();
        $attributes['first'] = $user->getFirstname();
        $attributes['last'] = $user->getLastname();
        $attributes['nationality'] = $user->getSection()->getCountry();
        $attributes['picture'] = $user->getGalaxyPicture();
        $attributes['birthdate'] = $user->getBirthdate()->format('d/m/Y');
        $attributes['gender'] = $user->getGender();
        $attributes['telephone'] = $user->getMobile();
        $attributes['address'] = $user->getAddress();
        $attributes['section'] = $user->getSection()->getCode();
        $attributes['country'] = $user->getSection()->getCountry();
        $attributes['sc'] = $user->getSection()->getCode();
        $attributes['roles'] = explode(',', $user->getGalaxyRoles());

        return new GalaxyUser($username, $attributes);
    }
}
