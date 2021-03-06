<?php

namespace FaucondorBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use FaucondorBundle\Entity\Events;
use FaucondorBundle\Form\Type\EventsType;

/**
 * Events controller.
 *
 */
class EventsController extends Controller
{

    /**
     * Lists all Events entities.
     *
     */
    public function indexAction()
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('FaucondorBundle:Events')->findAll();

        return $this->render('FaucondorBundle:Events:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Events entity.
     *
     */
    public function createAction(Request $request)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $entity = new Events();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('events_show', array('id' => $entity->getId())));
        }

        return $this->render('FaucondorBundle:Events:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Events entity.
     *
     * @param Events $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Events $entity)
    {
        $form = $this->createForm(new EventsType(), $entity, array(
            'action' => $this->generateUrl('events_create'),
            'method' => 'POST',
        ));

        return $form;
    }

    /**
     * Displays a form to create a new Events entity.
     *
     */
    public function newAction()
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $entity = new Events();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Events:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Events entity.
     *
     */
    public function editAction($id)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Events')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Events entity.');
        }

        $editForm = $this->createEditForm($entity);

        return $this->render('FaucondorBundle:Events:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView()
        ));
    }

    /**
    * Creates a form to edit a Events entity.
    *
    * @param Events $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Events $entity)
    {
        $form = $this->createForm(new EventsType(), $entity, array(
            'action' => $this->generateUrl('events_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        return $form;
    }
    /**
     * Edits an existing Events entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        if (!$this->getUser()->isNationalVP() || !$this->getUser()->isNationalNR()){
            throw $this->createAccessDeniedException();
        }

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Events')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Events entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('events_edit', array('id' => $id)));
        }

        return $this->render('FaucondorBundle:Events:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Events entity.
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
            $entity = $em->getRepository('FaucondorBundle:Events')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Events entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('events'));
    }

    /**
     * Creates a form to delete a Events entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('events_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
