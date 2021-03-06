<?php

namespace FaucondorBundle\Controller;

use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use FaucondorBundle\Entity\Section;
use FaucondorBundle\Form\Type\SectionType;

/**
 * Section controller.
 *
 */
class SectionController extends Controller
{

    /**
     * Lists all Section entities.
     *
     */
    public function indexAction()
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $sections = $em->getRepository('FaucondorBundle:Section')->findBy(array("country" => substr($this->container->getParameter('country'),0,2)), array("name" => "ASC"));

        return $this->render('FaucondorBundle:Section:index.html.twig', array(
            'sections' => $sections,
        ));
    }
    /**
     * Creates a new Section entity.
     *
     */
    public function createAction(Request $request)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $entity = new Section();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('section_show', array('id' => $entity->getId())));
        }

        return $this->render('FaucondorBundle:Section:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Section entity.
     *
     * @param Section $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Section $entity)
    {
        $form = $this->createForm(new SectionType(), $entity, array(
            'action' => $this->generateUrl('section_create'),
            'method' => 'POST',
        ));

        return $form;
    }

    /**
     * Displays a form to create a new Section entity.
     *
     */
    public function newAction()
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $entity = new Section();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Section:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }


    /**
     * Displays a form to edit an existing Section entity.
     *
     */
    public function editAction($id)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Section')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Section entity.');
        }

        $editForm = $this->createEditForm($entity);

        return $this->render('FaucondorBundle:Section:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView()
        ));
    }

    /**
    * Creates a form to edit a Section entity.
    *
    * @param Section $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Section $entity)
    {
        $form = $this->createForm(new SectionType(), $entity, array(
            'action' => $this->generateUrl('section_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        return $form;
    }
    /**
     * Edits an existing Section entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Section')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Section entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('section_edit', array('id' => $id)));
        }

        return $this->render('FaucondorBundle:Section:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Section entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('FaucondorBundle:Section')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Section entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('section'));
    }

    /**
     * Creates a form to delete a Section entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('section_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
