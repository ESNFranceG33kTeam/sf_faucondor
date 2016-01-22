<?php

namespace FaucondorBundle\Controller;

use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use FaucondorBundle\Entity\Points;
use FaucondorBundle\Form\Type\PointsType;

/**
 * Points controller.
 *
 */
class PointsController extends Controller
{

    /**
     * Lists all Points entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $points = $em->getRepository('FaucondorBundle:Points')->findBy(array("from" => $this->getUser()));

        $total = 0;
        $potential = 0;

        /** @var Points $point */
        foreach($points as $point){
            $potential += $point->getPoints();

            if ($point->getStatus() == 1)
                $total += $point->getPoints();
        }

        return $this->render('FaucondorBundle:Points:index.html.twig', array(
            'total'  => $total,
            'potential' => $potential,
            'points' => $points
        ));
    }
    /**
     * Creates a new Points entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Points();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            //From User Points
            $total = $entity->getBasicAction() * $entity->getTo()->getValue() * $entity->getBonus();
            $entity->setPoints($total);
            $entity->setStatus(0);
            $entity->setFrom($this->getUser());
            $em->persist($entity);

            //Other User Points
            $receiverPoints = new Points();
            $receiverPoints->setBasicAction($entity->getBasicAction());
            $receiverPoints->setPoints($entity->getBasicAction() * $this->getUser()->getValue() * $form->get('situation')->getData());
            $receiverPoints->setBonus($form->get('situation')->getData());
            $receiverPoints->setFrom($entity->getTo());
            $receiverPoints->setTo($this->getUser());
            $receiverPoints->setStatus(-1);
            $receiverPoints->setDate($entity->getDate());
            $em->persist($receiverPoints);

            $em->flush();

            return $this->redirect($this->generateUrl('points'));
        }

        return $this->render('FaucondorBundle:Points:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Points entity.
     *
     * @param Points $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Points $entity)
    {
        $form = $this->createForm(new PointsType(), $entity, array(
            'action' => $this->generateUrl('points_create'),
            'method' => 'POST',
        ));

        return $form;
    }

    /**
     * Displays a form to create a new Points entity.
     *
     */
    public function newAction()
    {
        $entity = new Points();
        $form   = $this->createCreateForm($entity);

        return $this->render('FaucondorBundle:Points:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Points entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Points')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Points entity.');
        }

        $editForm = $this->createEditForm($entity);

        return $this->render('FaucondorBundle:Points:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView()
        ));
    }

    /**
     * Displays a form to edit an existing Points entity.
     *
     */
    public function validateAction($id)
    {
        /** @var EntityManager $em */
        $em = $this->getDoctrine()->getManager();

        /** @var Points $entity */
        $entity = $em->getRepository('FaucondorBundle:Points')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Points entity.');
        }

        $entity->setStatus(1);

        /** @var Points $pointRelated */
        $pointRelated = $em->getRepository('FaucondorBundle:Points')->findBy(array(
            'from' => $entity->getTo(),
            'to' => $entity->getFrom()
        ));

        $em->flush();

        $this->addFlash(
            'success',
            'success.points.validated'
        );

        return $this->redirect($this->generateUrl('points'));
    }

    /**
    * Creates a form to edit a Points entity.
    *
    * @param Points $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Points $entity)
    {
        $form = $this->createForm(new PointsType(), $entity, array(
            'action' => $this->generateUrl('points_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        return $form;
    }
    /**
     * Edits an existing Points entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FaucondorBundle:Points')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Points entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('points_edit', array('id' => $id)));
        }

        return $this->render('FaucondorBundle:Points:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Points entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('FaucondorBundle:Points')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Points entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('points'));
    }

    /**
     * Creates a form to delete a Points entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('points_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
