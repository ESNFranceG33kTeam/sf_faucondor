<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 19/05/15
 * Time: 14:51
 */

namespace UserBundle\EventListener;

use Symfony\Component\Security\Csrf\TokenStorage\TokenStorageInterface;
use UserBundle\Entity\User;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\Routing\Router;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Symfony\Component\Security\Core\SecurityContext;

class LoginListener {

    /**
     * @var Router
     */
    private $router;

    /**
     * @var TokenStorage
     */
    private $tokenStorage;

    public function __construct(Router $router, TokenStorage $tokenStorage){
        $this->router       = $router;
        $this->tokenStorage = $tokenStorage;
    }

    public function onKernelRequest(GetResponseEvent $event){
        $request = $event->getRequest();

        $user = ($this->tokenStorage->getToken()) ? $this->tokenStorage->getToken()->getUser() : null;

        if (!$user instanceof User){
            if($request->get('_route') != null
                && $request->get('_route') != "faucondor_login"
                && $request->get('_route') != "faucondor_login_check"
                && $request->get('_route') != "faucondor_logout"
                && $request->get('_route') != "fos_user_security_login"
                && $request->get('_route') != "index"
                && substr($request->get('_route'), 0, 2) != "api"
            ){
                $event->setResponse(new RedirectResponse($this->router->generate('faucondor_login')));
            }
        }
    }

}