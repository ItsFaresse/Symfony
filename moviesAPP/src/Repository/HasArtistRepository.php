<?php

namespace App\Repository;

use App\Entity\HasArtist;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method HasArtist|null find($id, $lockMode = null, $lockVersion = null)
 * @method HasArtist|null findOneBy(array $criteria, array $orderBy = null)
 * @method HasArtist[]    findAll()
 * @method HasArtist[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HasArtistRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, HasArtist::class);
    }

    // /**
    //  * @return HasArtist[] Returns an array of HasArtist objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('h.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?HasArtist
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
