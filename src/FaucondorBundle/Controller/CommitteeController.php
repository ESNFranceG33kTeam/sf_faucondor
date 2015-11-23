<?php

namespace FaucondorBundle\Controller;

use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use FaucondorBundle\Entity\Committee;
use FaucondorBundle\Form\Type\CommitteeType;

/**
 * Committee controller.
 *
 */
class CommitteeController extends Controller
{

    /**
     * Lists all Committee entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('FaucondorBundle:Committee')->findAll();

        return $this->render('FaucondorBundle:Committee:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Committee entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Committee();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('committee_show', array('id' => $entity->getId())));
        }

        return $this->render('FaucondorBundle:Committee:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Committee entity.
     *
     * @param Committee $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Committee $entity)
    {
        $form = $this->createForm(new CommitteeType(), $entity, array(
            'action' => $this->generateUrl('committee_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Committee entity.
     *
     */
    public function newAction()
    {
        $entity = new Committee();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Committee:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Committee entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Committee')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Committee entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('FaucondorBundle:Committee:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Committee entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Committee')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Committee entity.');
        }

        $editForm = $this->createEditForm($entity);

        return $this->render('FaucondorBundle:Committee:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView()
        ));
    }

    /**
    * Creates a form to edit a Committee entity.
    *
    * @param Committee $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Committee $entity)
    {
        $form = $this->createForm(new CommitteeType(), $entity, array(
            'action' => $this->generateUrl('committee_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        return $form;
    }
    /**
     * Edits an existing Committee entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        /** @var Committee $committee */
        $committee = $em->getRepository('FaucondorBundle:Committee')->find($id);

        if (!$committee) {
            throw $this->createNotFoundException('Unable to find Committee entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($committee);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            $this->addFlash('success', $this->get('translator')->trans('committee.success.update'));

            return $this->redirect($this->generateUrl('committee_edit', array('id' => $id)));
        }

        return $this->render('FaucondorBundle:Committee:edit.html.twig', array(
            'entity'      => $committee,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Committee entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        /** @var Committee $committee */
        $committee = $em->getRepository('FaucondorBundle:Committee')->find($id);

        if (!$committee) {
            throw $this->createNotFoundException('Unable to find Committee entity.');
        }

        //$em->remove($committee);
        $em->flush();

        $this->addFlash('success', $this->get('translator')->trans('committee.success.delete'));

        return $this->redirect($this->generateUrl('committee'));
    }

    /**
     * Creates a form to delete a Committee entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('committee_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
