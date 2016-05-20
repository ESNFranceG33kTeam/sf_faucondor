<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 03/07/15
 * Time: 16:00
 */

namespace RestBundle\Controller\Rest;

use FaucondorBundle\Entity\Section;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Controller\Annotations\Get;
use FOS\RestBundle\Controller\Annotations\Post;
use JMS\Serializer\SerializationContext;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use RestBundle\Form\Handler\UserHandler;
use RestBundle\Form\Handler\UserRoleHandler;
use RestBundle\Form\Model\ModelUser;
use RestBundle\Form\Model\ModelUserRole;
use RestBundle\Form\Type\UserRoleType;
use RestBundle\Form\Type\UserType;
use Symfony\Component\BrowserKit\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Component\Form\Form;
use Symfony\Component\Form\FormError;
use Symfony\Component\Form\FormInterface;
use Symfony\Component\HttpFoundation\Request;
use UserBundle\Entity\User;

class UserRestController extends FOSRestController{

    /**
     * Retrieves a specific user
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     output={
     *         "class"="UserBundle\Entity\User",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Get("/user/{email}")
     *
     * @ParamConverter("user", class="UserBundle:User", options={"email" = "email"})
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function getUserByEmailAction(User $user){
        return $this->handleView(
            $this->view(
                $user, 200
            )->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
        );
    }

    /**
     * Retrieves users by section
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     output={
     *         "class"="UserBundle\Entity\User",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Get("/section/{section_id}/users")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function getUsersBySectionAction($section_id){
        $section = $this->getDoctrine()->getRepository('FaucondorBundle:Section')->find($section_id);

        if (!$section){
            throw $this->createNotFoundException('No section with id ' . $section_id);
        }

        return $this->handleView(
            $this->view(
                $this->getDoctrine()->getManager()->getRepository('UserBundle:User')->findBy(array("section" => $section)), 200
            )->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
        );
    }

    /**
     * Retrieves a specific user
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     output={
     *         "class"="UserBundle\Entity\User",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Get("/user/{firstname}/{lastname}")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function getUserByNameAction($firstname, $lastname){
        $user = $this->getDoctrine()->getManager()->getRepository('UserBundle:User')->findOneBy(array("firstname" => $firstname, "lastname" => $lastname));

        if ($user){
            return $this->handleView(
                $this->view(
                    $user, 200
                )->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
            );
        }else{
            throw $this->createNotFoundException();
        }
    }

    /**
     * Retrieves the list of users
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     output={
     *         "class"="UserBundle\Entity\User",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Get("/user")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function getUsersAction(){
        return $this->handleView(
            $this->view(
                $this->getDoctrine()
                    ->getRepository('UserBundle:User')->findAll(), 200
            )
                ->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
        );
    }

    /**
     * Adds a user
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     input="RestBundle\Form\Type\UserType",
     *     output={
     *         "class"="UserBundle\Entity\User",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Post("/user")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function addUserAction() {
        /** @var Request $request */
        $request = $this->get('request');

        /** @var FormInterface $form */
        $form = $this->get('form.factory')->create(new UserType());
        $handler = new UserHandler($request, $form, $this->getDoctrine()->getManager());

        if ($handler->process()) {
            /** @var ModelUser $modelUser */
            $modelUser = $form->getData();

            $user = $this->getDoctrine()->getRepository('UserBundle:User')->findOneBy(array("emailgalaxy" => $modelUser->getEmailGalaxy()));

            if ($user){
                return $this->handleView(
                    $this->view($user, 200)
                        ->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
                );
            }else{
                throw $this->createNotFoundException();
            }

        }

        if (!$form->isSubmitted()) {
            /** @var Form $form */
            $form->addError(new FormError('Veuillez soumettre le formulaire'));
        }

        return $this->handleView($this->view("Error during user post request", 404));
    }

    /**
     * Add a role to a user
     *
     * @ApiDoc(
     *     resource=true,
     *     statusCodes={
     *         200="Returned when successful",
     *         403="Returned when authentification failed",
     *         405="Method not allowed"
     *     },
     *     input="RestBundle\Form\Type\UserAddRoleType",
     *     output={
     *         "class"="UserBundle\Entity\User",
     *         "groups"={"default"},
     *         "parsers"={"Nelmio\ApiDocBundle\Parser\JmsMetadataParser"}
     *     }
     * )
     *
     * @Post("/userAddRole")
     *
     * @author Jérémie Samson <jeremie@ylly.fr>
     * @return Response
     */
    public function AddRoleToUserAction() {
        /** @var Request $request */
        $request = $this->get('request');

        /** @var FormInterface $form */
        $form = $this->get('form.factory')->create(new UserRoleType());
        $handler = new UserRoleHandler($request, $form, $this->getDoctrine()->getManager());

        if ($handler->process()) {
            /** @var ModelUserRole $modelUserRole */
            $modelUserRole = $form->getData();

            $user = $this->getDoctrine()->getRepository('UserBundle:User')->find($modelUserRole->getUser());

            if ($user){
                return $this->handleView(
                    $this->view($user, 200)
                        ->setSerializationContext(SerializationContext::create()->setGroups(array('default')))
                );
            }else{
                throw $this->createNotFoundException();
            }

        }

        if (!$form->isSubmitted()) {
            /** @var Form $form */
            $form->addError(new FormError('Veuillez soumettre le formulaire'));
        }

        return $this->handleView($this->view("Error during user post request", 404));
    }
}