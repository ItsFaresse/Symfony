<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Movie;
use App\Form\MovieType;
use App\Repository\MovieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\Serializer\SerializerInterface;



/**
 * @Route("/api/movies")
 */
class MovieController extends AbstractController
{
    // TODO: Requêtes URL /movies?cat=fantastique&order=asc/desc
    /**
     * @Route("/",  name="movie_parameter")
     * @Method({"GET"})
     * @return JsonResponse
     */
    public function getAllMovie(Request $request){
        //?cat={cat}&order={order
        $em = $this->getDoctrine()->getManager();

        $category = $request->query->get('cat');
        $order = $request->query->get('order');
        $date = $request->query->get('year');

        $query = $em->createQueryBuilder();

        $query->select('m')
            ->from('App\Entity\Movie', 'm');

        /*
            ->leftJoin('m.has_Artist', 'ha')
            ->addSelect('ha')
            ->leftJoin('ha.artist', 'a')
            ->addSelect('a');
        */

        if($category != null) {
            $query->join('m.categories', 'c')
                ->andWhere('c.name = :cat')
                ->setParameter('cat', $category)
                ->addSelect('c');
        }

        if($date!= null) {
            $query->andWhere('YEAR(m.date) = :date')
                  ->setParameter('date', $date);
                //->addSelect('d');
        }

        if($order != null && $order =='asc') {
            $query->orderBy('m.date', 'ASC');

        }

        if($order != null && $order == 'desc'){
            $query->orderBy('m.date', 'DESC');
        }

        $movies = $query->getQuery()->getResult();

        dump($movies);

        dump($movies[0]->getHasArtist());

        $data = $this->get('serializer')->serialize($movies, 'json', ['groups' => ['movie']]);


        dump($data);

        return new JsonResponse($data, 200, [], true);
    }
    /**
     * @Route("/new", name="movie_new", methods="GET|POST")
     */
    public function new(Request $request): Response
    {
        $movie = new Movie();
        $form = $this->createForm(MovieType::class, $movie);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($movie);
            $em->flush();

            return $this->redirectToRoute('movie_index');
        }

        return $this->render('movie/new.html.twig', [
            'movie' => $movie,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/plop", name="movie_index", methods="GET")
     */
    public function index(MovieRepository $movieRepository): Response
    {
        return $this->render('movie/index.html.twig', ['movies' => $movieRepository->findAll()]);
    }

    /**
     * @Route("/{id}", name="movie_show", methods="GET")
     */
    public function show(SerializerInterface $serializer, Movie $movie): Response
    {
        $repository = $this->getDoctrine()->getManager()->getRepository(Movie::class);
        $movie = $repository->showMovieDetails($movie);

        $json = $serializer->serialize($movie, 'json', array('groups' => ['movie']));

        /*   return $this->render('movie/show.html.twig', ['movie' => $movie]);*/
        return new JsonResponse($json, 200, [], true);
    }

    /**
     * @Route("/{id}/edit", name="movie_edit", methods="GET|POST")
     */
    public function edit(Request $request, Movie $movie): Response
    {
        $form = $this->createForm(MovieType::class, $movie);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('movie_index', ['id' => $movie->getId()]);
        }

        return $this->render('movie/edit.html.twig', [
            'movie' => $movie,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="movie_delete", methods="DELETE")
     */
    public function delete(Request $request, Movie $movie): Response
    {
        if ($this->isCsrfTokenValid('delete'.$movie->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($movie);
            $em->flush();
        }

        return $this->redirectToRoute('movie_index');
    }
}
