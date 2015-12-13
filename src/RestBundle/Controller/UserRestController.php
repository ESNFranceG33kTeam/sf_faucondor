<?php
/**
 * Created by PhpStorm.
 * User: Jérémie Samson | jeremie@ylly.fr
 * Date: 03/07/15
 * Time: 16:00
 */

namespace RestBundle\Controller;

use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Controller\Annotations\Get;
use FOS\RestBundle\Controller\Annotations\Post;
use JMS\Serializer\SerializationContext;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use RestBundle\Form\Handler\UserHandler;
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
            /** @var User $user */
            $user = $form->getData();

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