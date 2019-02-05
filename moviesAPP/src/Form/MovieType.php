<?php

namespace App\Form;

use App\Entity\Movie;
use App\Entity\Artist;
use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;


class MovieType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('synopsis')
            ->add('price')
            ->add('image')
            ->add('date', DateType::class, array(
                'widget' => 'single_text',
                // adds a class that can be selected in JavaScript
                'attr' => ['class' => 'js-datepicker'],
            ))
            ->add('categories')
            ->add('url_trailer')
            ->add('url_download')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Movie::class,
        ]);
    }
}
