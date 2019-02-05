<?php

namespace App\Controller;

use App\Entity\HasArtist;
use App\Form\HasArtistType;
use App\Repository\HasArtistRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/api/has-artist")
 */
class HasArtistController extends AbstractController
{
    /**
     * @Route("/", name="has_artist_index", methods="GET")
     */
    public function index(HasArtistRepository $hasArtistRepository): Response
    {
        return $this->render('has_artist/index.html.twig', ['has_artists' => $hasArtistRepository->findAll()]);
    }

    /**
     * @Route("/new", name="has_artist_new", methods="GET|POST")
     */
    public function new(Request $request): Response
    {
        $hasArtist = new HasArtist();
        $form = $this->createForm(HasArtistType::class, $hasArtist);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($hasArtist);
            $em->flush();

            return $this->redirectToRoute('has_artist_index');
        }

        return $this->render('has_artist/new.html.twig', [
            'has_artist' => $hasArtist,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="has_artist_show", methods="GET")
     */
    public function show(HasArtist $hasArtist): Response
    {
        return $this->render('has_artist/show.html.twig', ['has_artist' => $hasArtist]);
    }

    /**
     * @Route("/{id}/edit", name="has_artist_edit", methods="GET|POST")
     */
    public function edit(Request $request, HasArtist $hasArtist): Response
    {
        $form = $this->createForm(HasArtistType::class, $hasArtist);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('has_artist_index', ['id' => $hasArtist->getId()]);
        }

        return $this->render('has_artist/edit.html.twig', [
            'has_artist' => $hasArtist,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="has_artist_delete", methods="DELETE")
     */
    public function delete(Request $request, HasArtist $hasArtist): Response
    {
        if ($this->isCsrfTokenValid('delete'.$hasArtist->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($hasArtist);
            $em->flush();
        }

        return $this->redirectToRoute('has_artist_index');
    }
}
