<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 02/07/15
 * Time: 12:09
 */

namespace UserBundle\Security\Firewall;

use UserBundle\Security\Authentification\Token\WsseUserToken;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Symfony\Component\Security\Http\Firewall\ListenerInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\SecurityContextInterface;
use Symfony\Component\Security\Core\Authentication\AuthenticationManagerInterface;

class WsseListener {
    /**
     * @var TokenStorage
     */
    protected $tokenStorage;

    /**
     * @var AuthenticationManagerInterface
     */
    protected $authenticationManager;

    public function __construct(TokenStorage $tokenStorage, AuthenticationManagerInterface $authenticationManager)
    {
        $this->tokenStorage = $tokenStorage;
        $this->authenticationManager = $authenticationManager;
    }

    public function handle(GetResponseEvent $event)
    {
        $request = $event->getRequest();

        $wsseRegex = '/UsernameToken Username="([^"]+)", PasswordDigest="([^"]+)", Nonce="([^"]+)", Created="([^"]+)"/';
        if (!$request->headers->has('x-wsse') || 1 !== preg_match($wsseRegex, $request->headers->get('x-wsse'), $matches)) {
            $response = new Response();
            $response->setStatusCode(403);
            $response->setContent('Invalid or missing WSSE.');
            $event->setResponse($response);
            return;
        }

        $token = new WsseUserToken();
        $token->setUser($matches[1]);
        $token->digest = $matches[2];
        $token->nonce = $matches[3];
        $token->created = $matches[4];


        try {
            $authToken = $this->authenticationManager->authenticate($token);
            $this->tokenStorage->setToken($authToken);
        } catch (AuthenticationException $failed) {
            $response = new Response();
            $response->setStatusCode(403);
            $response->getContent($failed->getMessage());
            $event->setResponse($response);

        }
    }

}