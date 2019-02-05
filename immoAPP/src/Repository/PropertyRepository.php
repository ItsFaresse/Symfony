<?php

namespace App\Repository;

use App\Entity\Property;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Property|null find($id, $lockMode = null, $lockVersion = null)
 * @method Property|null findOneBy(array $criteria, array $orderBy = null)
 * @method Property[]    findAll()
 * @method Property[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PropertyRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Property::class);
    }


    /**
     * @return Property[]
     */
    public function findAllVisible(): array
    {
        // QueryBuilder: Un objet qui permet de créer des requêtes.
        return $this->createQueryBuilder('p')
            ->where('p.sold = false')
            ->getQuery()
            ->getResult();
    }

    /**
     * @param $first_result
     * @param int $max_results
     * @return Paginator
     */
    public function getPosts($first_result, $max_results = 12)
    {
        $qb = $this->createQueryBuilder('property');

        $qb
            ->select('property')
            ->setFirstResult($first_result)
            ->setMaxResults($max_results);

        $paginator = new Paginator($qb);

        return $paginator;
    }

    /**
     * @return Property[]
     */
    public function findLatest(): array
    {
        return $this->createQueryBuilder('p')
            ->where('p.sold = false')
            ->setMaxResults(4)
            ->getQuery()
            ->getResult();
    }

}
