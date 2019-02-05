<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass="App\Repository\ArtistRepository")
 */
class Artist
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"movie"})
     */
    private $firstname;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"movie"})
     */
    private $lastname;

    /**
     *  @ORM\OneToMany(targetEntity="HasArtist", mappedBy="artist")
     *
     */
    private $has_Artist;

    public function __construct()
    {
        $this->has_Artist = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFullName(){
        return sprintf('%s %s', $this->firstname, $this->lastname);
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * @return Collection|HasArtist[]
     */
    public function getHasArtist(): Collection
    {
        return $this->has_Artist;
    }

    public function addHasArtist(HasArtist $hasArtist): self
    {
        if (!$this->has_Artist->contains($hasArtist)) {
            $this->has_Artist[] = $hasArtist;
            $hasArtist->setArtist($this);
        }

        return $this;
    }

    public function removeHasArtist(HasArtist $hasArtist): self
    {
        if ($this->has_Artist->contains($hasArtist)) {
            $this->has_Artist->removeElement($hasArtist);
            // set the owning side to null (unless already changed)
            if ($hasArtist->getArtist() === $this) {
                $hasArtist->setArtist(null);
            }
        }

        return $this;
    }

    public function __toString() {
        return $this->lastname;
    }
}
