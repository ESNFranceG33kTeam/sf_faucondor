<?php
/**
 *
 * This file is part of the ERP package.
 *
 * (c) Jeremie Samson <jeremie.samson76@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * User: jerem
 * Date: 20/09/16
 * Time: 17:57
 */

namespace FaucondorBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use UserBundle\Entity\UserRepository;

class ApiController extends Controller
{
    /**
     * @return JsonResponse
     */
    public function userLoginAction(){
        /** @var UserRepository $userRepo */
        $userRepo = $this->getDoctrine()->getManager()->getRepository("UserBundle:User");

        $now = new \DateTime("now");
        $lastWeek = $now->sub(new \DateInterval("P1W"));

        return new JsonResponse(array(
            "todayActivity" => $userRepo->searchLoginActivity(new \DateTime("today")),
            "weekActivity" => $userRepo->searchLoginActivity($lastWeek)
        ));
    }

    /**
     * @return JsonResponse
     */
    public function userSubscribeAction(){
        /** @var UserRepository $userRepo */
        $userRepo = $this->getDoctrine()->getManager()->getRepository("UserBundle:User");

        $now = new \DateTime("now");
        $lastWeek = $now->sub(new \DateInterval("P1W"));

        return new JsonResponse(array(
            "users" => count($userRepo->findAll()),
            "newUsers" => $userRepo->searchCreatedActivity($lastWeek)
        ));
    }
}