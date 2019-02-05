<?php

namespace App\Repository;

use App\Entity\Category;
use App\Entity\Movie;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Movie|null find($id, $lockMode = null, $lockVersion = null)
 * @method Movie|null findOneBy(array $criteria, array $orderBy = null)
 * @method Movie[]    findAll()
 * @method Movie[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MovieRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Movie::class);
    }

    /**
     *
     * Retourne tous les films de la catégorie
     *
     * @param Category $category
     * @return mixed
     */
    public function moviesByCategory(Category $category) {
        $query = $this->createQueryBuilder('m')
            ->innerJoin('m.categories', 'c')
            ->where('c.id = :cat')
            ->setParameter('cat', $category);

        return $query->getQuery()->getResult();
    }

    public function showMovieDetails( Movie $movie){

        $query = $this->createQueryBuilder('m')
            ->leftJoin('m.has_Artist', 'ha')
            ->where('m.id = :mov')
            ->setParameter('mov', $movie);

        $result = $query->getQuery()->getOneOrNullResult();

        return $result;
    }

}
