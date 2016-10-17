<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 03/07/15
 * Time: 16:00
 */

namespace FaucondorBundle\Controller\Rest;

use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Controller\Annotations\Get;
use FaucondorBundle\Entity\Post;
use JMS\Serializer\SerializationContext;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use Symfony\Component\BrowserKit\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\Form\FormError;
use UserBundle\Entity\User;

class RoleRestController extends FOSRestController{

    /**
     * Retrieves a specific role
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     output={
     *         "class"="FaucondorBundle\Entity\Post",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Get("/role/{level}/{role}")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function getRoleByLevelAndRoleAction($level, $role){
        $role = $this->getDoctrine()->getManager()->getRepository('FaucondorBundle:Post')->findOneBy(array("level" => strtolower($level), "role" => strtolower($role)));

        if ($role){
            return $this->handleView(
                $this->view(
                    $role, 200
                )->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
            );
        }else{
            throw $this->createNotFoundException();
        }
    }

    /**
     * Retrieves the list of roles
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     output={
     *         "class"="FaucondorBundle\Entity\Post",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Get("/role")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function getRolesAction(){
        return $this->handleView(
            $this->view(
                $this->getDoctrine()
                    ->getRepository('FaucondorBundle:Post')->findAll(), 200
            )
                ->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
        );
    }
}