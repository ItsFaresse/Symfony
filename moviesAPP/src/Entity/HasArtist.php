<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\Entity(repositoryClass="App\Repository\HasArtistRepository")
 */
class HasArtist
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"movie"})
     */
    private $is_Actor;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"movie"})
     */
    private $is_Director;

    /**
     * @ORM\ManyToOne(targetEntity="Artist", inversedBy="hasArtist")
     * @ORM\JoinColumn(name="artist_id", referencedColumnName="id")
     * @Groups({"movie"})
     */
    private $artist;

    /**
     * @ORM\ManyToOne(targetEntity="Movie", inversedBy="has_Artist")
     * @ORM\JoinColumn(name="movie_id", referencedColumnName="id")
     */
    private $movie;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIsActor(): ?bool
    {
        return $this->is_Actor;
    }

    public function setIsActor(bool $is_Actor): self
    {
        $this->is_Actor = $is_Actor;

        return $this;
    }

    public function getIsDirector(): ?bool
    {
        return $this->is_Director;
    }

    public function setIsDirector(bool $is_Director): self
    {
        $this->is_Director = $is_Director;

        return $this;
    }

    public function getArtist(): ?Artist
    {
        return $this->artist;
    }

    public function setArtist(?Artist $artist): self
    {
        $this->artist = $artist;

        return $this;
    }

    public function getMovie(): ?Movie
    {
        return $this->movie;
    }

    public function setMovie(?Movie $movie): self
    {
        $this->movie = $movie;

        return $this;
    }


}
