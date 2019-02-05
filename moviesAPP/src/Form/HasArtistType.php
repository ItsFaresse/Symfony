<?php

namespace App\Form;

use App\Entity\Artist;
use App\Entity\HasArtist;
use App\Entity\Movie;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
class HasArtistType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('is_Actor')
            ->add('is_Director')
            ->add('artist',EntityType::class, array(
                // looks for choices from this entity
                'class' => Artist::class,
                'choice_label' => 'fullName'
            ))
            ->add('movie',EntityType::class, array(
                'class' => Movie::class,
                'choice_label' => 'name'
                ))
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => HasArtist::class,
        ]);
    }
}
