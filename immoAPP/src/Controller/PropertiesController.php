<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Entity\Property;
use App\Form\ContactType;
use App\Notification\ContactNotification;
use App\Repository\PropertyRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PropertiesController extends AbstractController
{
    /**
     * @var PropertyRepository
     */

    public function __construct(PropertyRepository $repository, ObjectManager $em)
    {
        $this->repository = $repository;
        $this->em = $em;
    }


    /**
     * @Route("/articles", name="property.index")
     */
    public function index()
    {
        $properties = $this->repository->findAllVisible();


        return $this->render('properties/index.html.twig', [
            'controller_name' => 'PropertyController',
            'current_menu' => 'properties',
            'properties'   => $properties
        ]);
    }

    /**
     * @Route("/articles/{slug}-{id}", name="property.show", requirements={"slug": "[a-z0-9\-]*"})
     * @param $slug
     * @param $id
     * @param Property $property
     * @return Response
     */
    public function show(string $slug, $id, Property $property, Request $request, ContactNotification $notification): Response
    {
        if($property->getSlug() !== $slug) {
            return $this->redirectToRoute('property.show', [
                'id'   => $property->getId(),
                'slug' => $property->getSlug()
            ], 301);
        }

        $properties = new Property();
        dump($properties);

        $contact = new Contact();
        $contact->setProperty($property);
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $notification->notify($contact);
            $this->addFlash('success', 'Votre message a bien été envoyé');
            return $this->redirectToRoute('property.show', [
                'id'   => $property->getId(),
                'slug' => $property->getSlug()
            ]);
        }

        $property = $this->repository->find($id);
        return $this->render('properties/show.html.twig',[
            'property'     => $property,
            'current_menu' => 'properties',
            'form'         => $form->createView()
        ]);
    }
}
