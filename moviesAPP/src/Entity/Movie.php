<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\DateFilter;

/**
 * @ApiResource()
 * @ApiFilter(DateFilter::class, properties={"dateProperty"})
 * @ORM\Entity(repositoryClass="App\Repository\MovieRepository")
 */
class Movie
{
    //TODO: Filters


    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"movie", "categories"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"movie", "categories"})
     */
    private $name;

    /**
     * @ORM\Column(type="text")
     * @Groups({"movie", "categories"})
     */
    private $synopsis;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"movie", "categories"})
     */
    private $price;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"movie", "categories"})
     */
    private $image;

    /**
     * @ORM\Column(type="date", nullable=true )
     * @Groups({"movie", "categories"})
     */
    private $date;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"movie"})
     */
    private $urlTrailer;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"movie"})
     */
    private $urlDownload;


    /**
     * @ORM\OneToMany(targetEntity="HasArtist", mappedBy="movie")
     * @Groups({"movie"})
     */
    private $hasArtist;

    /**
     * @ORM\ManyToMany(targetEntity="Category", inversedBy="movies", cascade={"persist"})
     * @ORM\JoinTable(name="movie_categories")
     */
    private $categories;


    public function __construct()
    {
        $this->has_Artist = new ArrayCollection();
        $this->categories = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getSynopsis(): ?string
    {
        return $this->synopsis;
    }

    public function setSynopsis(string $synopsis): self
    {
        $this->synopsis = $synopsis;

        return $this;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getUrlTrailer(): ?string
    {
        return $this->urlTrailer;
    }

    public function setUrlTrailer(string $urlTrailer): self
    {
        $this->urlTrailer = $urlTrailer;

        return $this;
    }

    public function getUrlDownload(): ?string
    {
        return $this->urlDownload;
    }

    public function setUrlDownload(string $urlDownload): self
    {
        $this->urlDownload = $urlDownload;

        return $this;
    }

    /**
     * @return Collection|HasArtist[]
     */
    public function getHasArtist(): Collection
    {
        return $this->hasArtist;
    }

    public function addHasArtist(HasArtist $hasArtist): self
    {
        if (!$this->hasArtist->contains($hasArtist)) {
            $this->hasArtist[] = $hasArtist;
            $hasArtist->setMovie($this);
        }

        return $this;
    }

    public function removeHasArtist(HasArtist $hasArtist): self
    {
        if ($this->hasArtist->contains($hasArtist)) {
            $this->hasArtist->removeElement($hasArtist);
            // set the owning side to null (unless already changed)
            if ($hasArtist->getMovie() === $this) {
                $hasArtist->setMovie(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Category[]
     */
    public function getCategories(): Collection
    {
        return $this->categories;
    }

    public function addCategory(Category $category): self
    {
        if (!$this->categories->contains($category)) {
            $this->categories[] = $category;
        }

        return $this;
    }

    public function removeCategory(Category $category): self
    {
        if ($this->categories->contains($category)) {
            $this->categories->removeElement($category);
        }

        return $this;
    }

    /**
     * @return mixed
     */

    public function __toString(){
        // to show the name of the Movie in the select
        return $this->name;
        // to show the id of the Movie in the select
        // return $this->id;
    }



}
