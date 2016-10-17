<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 02/07/15
 * Time: 12:15
 */

namespace UserBundle\Security\Authentification\Provider;


use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use UserBundle\Security\Authentification\Token\WsseUserToken;
use Symfony\Component\Security\Core\Authentication\Provider\AuthenticationProviderInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\Exception\NonceExpiredException;


class WsseProvider implements AuthenticationProviderInterface
{
    private $userProvider;
    private $cacheDir;

    public function __construct(UserProviderInterface $userProvider, $cacheDir)
    {
        $this->userProvider = $userProvider;
        $this->cacheDir     = $cacheDir;
    }

    public function authenticate(TokenInterface $token)
    {
        $user = $this->userProvider->loadUserByUsername($token->getUsername());

        if ($user && $this->validateDigest($token->digest, $token->nonce, $token->created, $user->getPassword())) {
            $authenticatedToken = new WsseUserToken($user->getRoles());
            $authenticatedToken->setUser($user);

            return $authenticatedToken;
        }

        throw new AuthenticationException('The WSSE authentication failed.');
    }

    protected function validateDigest($digest, $nonce, $created, $secret)
    {
        // Timestamp expires after 5 minutes
        if (time() - strtotime($created) > 300) {
            return false;
        }

        // Access to cache dir
        if (!is_dir($this->cacheDir)) {
            mkdir($this->cacheDir, 0777, true);
        }

        if (!is_writable($this->cacheDir)) {
            chmod($this->cacheDir, 0777);
        }

        // Validate nonce uniqueness in 5 minutes
        $filename = sprintf('%s/%s', $this->cacheDir, $nonce);
        if (is_file($filename) && (int)file_get_contents($filename) + 300 > time()) {
            throw new NonceExpiredException('Previously used nonce detected.');
        }

        file_put_contents($filename, time());
        // Validate secret
        //$expected = base64_encode(sha1(base64_decode($nonce).$created.$secret, true));
        // Need to encode it without base64_decode and no binary sha1 output because of iOS
        $expected = base64_encode(sha1($nonce.$created.$secret));

        return $digest === $expected;
    }

    public function supports(TokenInterface $token)
    {
        return $token instanceof WsseUserToken;
    }
}