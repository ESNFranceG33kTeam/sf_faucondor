<?php

namespace FaucondorBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use FaucondorBundle\Entity\ContactList;
use FaucondorBundle\Form\Type\ContactListType;

/**
 * ContactList controller.
 *
 */
class ContactListController extends Controller
{

    /**
     * Lists all ContactList entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('FaucondorBundle:ContactList')->findAll();

        return $this->render('FaucondorBundle:ContactList:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new ContactList entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new ContactList();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            $entity->setCreatedat(new \DateTime("now"));

            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('contactlist', array('id' => $entity->getId())));
        }

        return $this->render('FaucondorBundle:ContactList:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a ContactList entity.
     *
     * @param ContactList $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(ContactList $entity)
    {
        $form = $this->createForm(new ContactListType(), $entity, array(
            'action' => $this->generateUrl('contactlist_create'),
            'method' => 'POST',
        ));

        return $form;
    }

    /**
     * Displays a form to create a new ContactList entity.
     *
     */
    public function newAction()
    {
        $entity = new ContactList();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:ContactList:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ContactList entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:ContactList')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ContactList entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:ContactList:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ContactList entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:ContactList')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ContactList entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:ContactList:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a ContactList entity.
    *
    * @param ContactList $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(ContactList $entity)
    {
        $form = $this->createForm(new ContactListType(), $entity, array(
            'action' => $this->generateUrl('contactlist_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        return $form;
    }
    /**
     * Edits an existing ContactList entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:ContactList')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ContactList entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('contactlist_edit', array('id' => $id)));
        }

        return $this->render('FaucondorBundle:ContactList:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a ContactList entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('FaucondorBundle:ContactList')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find ContactList entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('contactlist'));
    }

    /**
     * Creates a form to delete a ContactList entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('contactlist_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
