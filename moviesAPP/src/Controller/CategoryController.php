<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Movie;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use App\Repository\MovieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api/category")
 */
class CategoryController extends AbstractController
{
    /**
     * @Route("/admin", name="category_index", methods="GET")
     */
    public function index(CategoryRepository $categoryRepository): Response
    {
        return $this->render('category/index.html.twig', ['categories' => $categoryRepository->findAll()]);
    }

    /**
     * @Route("/new", name="category_new", methods="GET|POST")
     */
    public function new(Request $request): Response
    {
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($category);
            $em->flush();

            return $this->redirectToRoute('category_index');
        }

        return $this->render('category/new.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="category_show", methods="GET")
     */
    public function show(Category $category): Response
    {
        return $this->render('category/show.html.twig', ['category' => $category]);
    }

    /**
     * @Route("/", name="category_index", methods="GET")
     */
    public function showCategoriesMovie(Request $request, SerializerInterface $serializer): Response
    {
        $date = $request->query->get('date');
        $order = $request->query->get('order');


        /** @var MovieRepository */
        $repository = $this->getDoctrine()->getManager()->getRepository(Category::class);

        $categories = $repository->moviesByCategories(null, $date, $order);
        $json = $serializer->serialize($categories, 'json', array('groups' => ['categories']));


        dump($categories);

        return new JsonResponse($json, 200, [], true);
    }

    /**
     * @Route("/{categoryId}/movies", name="category_movies_show", methods="GET")
     *
     */
    public function showCategoryMovie(Request $request, SerializerInterface $serializer, $categoryId) {

        $date = $request->query->get('date');
        $order = $request->query->get('order');
        
        /** @var MovieRepository */
        $repository = $this->getDoctrine()->getManager()->getRepository(Category::class);

        $categories = $repository->moviesByCategories($categoryId, $date, $order);

        $json = $serializer->serialize($categories, 'json', array('groups' => ['categories']));

        return new JsonResponse($json, 200, [], true);
    }

    /**
     * @Route("/{id}/edit", name="category_edit", methods="GET|POST")
     */
    public function edit(Request $request, Category $category): Response
    {
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('category_index', ['id' => $category->getId()]);
        }

        return $this->render('category/edit.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="category_delete", methods="DELETE")
     */
    public function delete(Request $request, Category $category): Response
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($category);
            $em->flush();
        }

        return $this->redirectToRoute('category_index');
    }
}
