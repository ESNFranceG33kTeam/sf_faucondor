<?php

namespace UserBundle\Security\Authentification\Token;

use Symfony\Component\Security\Core\Authentication\Token\AbstractToken;

/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 02/07/15
 * Time: 12:06
 */

class WsseUserToken extends AbstractToken {

    /**
     * Creation date
     *
     * @var string
     */
    public $created;
    /**
     * Digest
     *
     * @var string
     */
    public $digest;
    /**
     * Nonce
     *
     * @var string
     */
    public $nonce;
    /**
     * {@inheritdoc}
     */
    public function __construct(array $roles = array())
    {
        parent::__construct($roles);
        // If user has roles: he is authenticated
        $this->setAuthenticated(count($roles) > 0);
    }
    /**
     * {@inheritdoc}
     */
    public function getCredentials()
    {
        return '';
    }
}