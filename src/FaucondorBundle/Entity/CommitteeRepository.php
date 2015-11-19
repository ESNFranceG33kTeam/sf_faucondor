<?php

namespace FaucondorBundle\Entity;

/**
 * CommitteeRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CommitteeRepository extends \Doctrine\ORM\EntityRepository
{
    public function findByUser($user){
        return $this->createQueryBuilder('c')
            ->leftjoin("c.users", "u")
            ->where("u = :user")
            ->setParameter('user', $user)
            ->orderBy('c.name', 'ASC')
            ->getQuery()
            ->getResult();
    }
}
