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
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        $sections = $em->getRepository('FaucondorBundle:Section')->findBy(array("country" => $this->container->getParameter('code_country')), array("name" => "ASC"));

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

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Section entity.
     *
     */
    public function newAction()
    {
        $entity = new Section();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Section:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Section entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Section')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Section entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:Section:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Section entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Section')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Section entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:Section:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
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

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Section entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
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
