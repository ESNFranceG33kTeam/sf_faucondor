<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 20/04/15
 * Time: 23:53
 */

namespace UserBundle\Security\User;

use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use phpCAS;
use UserBundle\Security\User\GalaxyUser;

class UserProvider implements UserProviderInterface
{
    /**
     * @var array
     */
    protected $cas;

    public function __construct($cas_server, $cas_path, $cas_port){
        $this->cas = array(
            "server" => $cas_server,
            "port" => $cas_port,
            "path" => $cas_path
        );
    }

    public function loadUserByUsername($username)
    {
        phpCAS::setDebug();
        phpCAS::client(CAS_VERSION_2_0, $this->cas["server"], $this->cas["port"], $this->cas["path"], false);
        phpCAS::setNoCasServerValidation();
        phpCAS::forceAuthentication();

        $username =  phpCAS::getUser();

        if ($username) {
            $attributes = phpCAS::getAttributes();

            return new GalaxyUser($username, $attributes, null, null, array());
        }

        throw new UsernameNotFoundException(
            sprintf('Username "%s" does not exist.', $username)
        );
    }

    /**
     * @return GalaxyUser
     */
    public function loadGalaxyUser()
    {
        phpCAS::setDebug();
        phpCAS::client(CAS_VERSION_2_0, $this->cas["server"], $this->cas["port"], $this->cas["path"], false);
        phpCAS::setNoCasServerValidation();
        phpCAS::forceAuthentication();

        $username =  phpCAS::getUser();

        if ($username) {
            $attributes = phpCAS::getAttributes();

            return new GalaxyUser($username, $attributes, null, null, array());
        }

        throw new UsernameNotFoundException(
            sprintf('Username "%s" does not exist.', $username)
        );
    }

    public function refreshUser(UserInterface $user)
    {
        if (!$user instanceof GalaxyUser) {
            throw new UnsupportedUserException(
                sprintf('Instances of "%s" are not supported.', get_class($user))
            );
        }

        return $this->loadUserByUsername($user->getUsername());
    }

    public function logout($cas_host, $cas_port, $cas_context){
        phpCAS::setDebug();
        phpCAS::client(CAS_VERSION_2_0, $cas_host, $cas_port, $cas_context);
        phpCAS::logout();
        return true;
    }

    public function supportsClass($class)
    {
        return $class === 'UserBundle\Security\User\UserProvider';
    }


}