<?php

namespace App\DataFixtures;

use App\Entity\Artist;
use App\Entity\Category;
use App\Entity\Movie;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $categoriesName = array('Action', 'Thriller ', 'Drame', 'Horreur ', 'Animation ', 'Fantastique', 'Comédie', 'Aventure', 'Policier', 'Science-Fiction');
        $categoriesEntity = [];
        for ($i = 0; $i < 10; $i++) {
            $cat = new Category();
            $cat->setName($categoriesName[$i]);
            $manager->persist($cat);

            array_push($categoriesEntity, $cat);
        }


        $manager->flush();


        $moviesName = array('Titanic', 'Harry Potter', 'Leon', 'American Pie', 'The Mist', 'Note Book', 'Avengers', 'Mortal Engines', 'La Tour Sombre', 'Call Me by Your Name', 'RrRrrrr', 'Cloud Atlas', 'Interstellar', 'La mariée du Diable', '8 Mile', 'Slumdog Millionaire', 'La Ligne Verte', 'La petite sirène', 'Cendrillion', 'Blanche Neige', 'Hercules', 'Shrek');
        $moviesSynopsis = array(
            'En 1997, l\'épave du Titanic est l\'objet d\'une exploration fiévreuse, menée par des chercheurs de trésor en quête d\'un diamant bleu qui se trouvait à bord. Frappée par un reportage télévisé, l\'une des rescapés du naufrage, âgée de 102 ans, Rose DeWitt, se rend sur place et évoque ses souvenirs. 1912. Fiancée à un industriel arrogant, Rose croise sur le bateau un artiste sans le sou.',
            'Harry Potter est un enfant né d\'une famille de magicien. Il est destiné à vaincre les ténèbres.',
            'Un tueur à gages répondant au nom de Léon prend sous son aile Mathilda, une petite fille de 12 ans, seule rescapée du massacre de sa famille. Bientôt, Léon va faire de Mathilda une `nettoyeuse\', comme lui. La jeune fille pourra alors venger son petit frère.',
            'L\'année scolaire se termine au lycée de Great Falls. Désespéré depuis que ses parents l\'ont surpris dans une situation plus que gênante devant un film X, Jim, élève de terminale, scelle un pacte avec sa bande de copains : finis les plaisirs solitaires, ils seront tous des hommes avant d\'entrer à la fac.',
            'Tous deux se rendent en ville pour se ravitailler, mais une fois dans le supermarché, la brume, qui en vérité cache des créatures immondes et meurtrières, envahit le parking. Toute personne qui se risque à l\'extérieur subit une mort atroce.',
            'Atteinte de la maladie d\'Alzheimer, Allie vit en maison de retraite. Chaque jour, Noah lui lit le même livre. Il s\'agit du carnet où Allie a consigné sa propre histoire, lorsqu\'elle a appris sa maladie. Pour ne pas oublier ses sentiments, elle a écrit, et Noah, inlassablement, lui relit ses propres mots.',
            'Nick Fury, le directeur du S.H.I.E.L.D., l\'organisation qui préserve la paix dans le monde, veut former une équipe d\'irréductibles pour empêcher la destruction du monde. Iron Man, Hulk, Thor, Captain America, Hawkeye et Black Widow répondent présents. La nouvelle équipe, baptisée Avengers, a beau sembler soudée, il reste encore à ses illustres membres à apprendre à travailler ensemble',
            'Des centaines d’années après qu’un évènement apocalyptique a détruit la Terre, l’humanité s’est adaptée pour survivre en trouvant un nouveau mode de vie. Ainsi, de gigantesques villes mobiles errent sur Terre prenant sans pitié le pouvoir sur d’autres villes mobiles plus petites.',
            'Le dernier Pistolero, Roland Deschain, est condamné à livrer une éternelle bataille contre Walter O\'Dim, alias l\'Homme en noir. Il doit à tout prix l\'empêcher de détruire la Tour sombre, clé de voûte de la cohésion de l\'univers. Le destin de tous les mondes est en jeu et le bien et le mal vont s\'affronter dans un ultime combat. Roland est le seul à pouvoir défendre la Tour contre l\'Homme en noir',
            'Été 1983. Elio Perlman, 17 ans, passe ses vacances dans la villa du XVIIe siècle que possède sa famille en Italie, à jouer de la musique classique, à lire et à flirter avec son amie Marzia. Son père, éminent professeur, et sa mère, traductrice, lui ont donné une excellente éducation. Un jour, Oliver, un séduisant Américain qui prépare son doctorat, vient travailler auprès du père d\'Elio. Elio et Oliver vont bientôt découvrir l\'éveil du désir',
            'Il y a 37.000 ans, deux tribus voisines sont rivales. Pendant que la tribu des Cheveux Propres coule des jours paisibles en gardant pour elle seule le secret de la formule du shampooing, la tribu des Cheveux Sales se lamente. Son chef décide d\'envoyer un espion pour voler la recette, mais un événement bien plus grave va bouleverser la vie des Cheveux Propres : pour la première fois dans l\'histoire de l\'humanité, un crime vient d\'être commis',
            'En 1849, un jeune notaire fait une difficile traversée du Pacifique. En 1936, un musicien ambitieux sans le sou quitte son amant pour travailler auprès d\'un illustre compositeur à Edimbourg. Quelque cinquante ans plus tard, à San Francisco, une journaliste enquête sur les actions douteuses d\'une compagnie pétrolière. A Londres, en 2012, un vieil éditeur endetté placé contre son gré dans une maison de retraite tente de s\'en évader',
            'Dans un futur proche, la Terre est de moins en moins accueillante pour l\'humanité qui connaît une grave crise alimentaire. Le film raconte les aventures d\'un groupe d\'explorateurs qui utilise une faille récemment découverte dans l\'espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire.',
            'En 1966, sur une petite île de Finlande, une adolescente amoureuse d\'un homme marié se retrouve au cœur d\'une véritable chasse aux sorcières.',
            'A Detroit, en 1995, Jimmy Smith Jr. a des rêves plein la tête, mais il lui manque encore les mots pour les exprimer. Sa vie d\'adolescent se déroule entre banlieue blanche et quartiers noirs, le long de cette ligne de démarcation que l\'on nomme 8 Mile Road. En dépit de tous ses efforts, Jimmy n\'a jamais franchi cette barrière symbolique et continue d\'accumuler les déboires familiaux, professionnels et sentimentaux. Un jour, il participe à un clash, une joute oratoire de rappeurs.',
            'Depuis son enfance dans les bidonvilles de Mumbai, Jamal Malik poursuit son rêve : retrouver Latika, une jeune orpheline dont il est amoureux. Alors qu\'il commence à perdre espoir, il imagine une solution surprenante pour retrouver son amour : participer au plus grand show télévisé du pays, Qui veut gagner des millions ? . Il atteint la question finale à 20 millions de roupies mais il est arrêté par la police, qui le soupçonne de tricherie.',
            'Paul Edgecomb, pensionnaire centenaire d\'une maison de retraite, est hanté par ses souvenirs. Gardien-chef du pénitencier de Cold Mountain, en 1935, en Louisiane, il était chargé de veiller au bon déroulement des exécutions capitales au bloc E (la ligne verte) en s\'efforçant d\'adoucir les derniers moments des condamnés. Parmi eux se trouvait un colosse du nom de John Coffey, accusé du viol et du meurtre de deux fillettes.',
            'Ariel, la petite Sirène, a la plus belle voix des océans mais elle ne rêve que du prince Eric et du monde des humains. Ursula, la Sorcière des mers, lui propose un terrible marché. Saura-t-elle se sortir de ses griffes ? Trouvera-t-elle le moyen de réaliser ses rêves ?',
            'Cendrillon, une douce jeune fille, subit les méchancetés de sa belle-mère et de ses deux horribles filles. Un jour, transformée par sa marraine la bonne fée en princesse éclatante de beauté, elle se rend au bal du prince qui tombe fou amoureux d\'elle..',
            'Blanche Neige est une très jolie princesse. Sa belle-mère, la Reine, sentant qu\'un jour la beauté de Blanche Neige dépasserait la sienne donne l\'ordre à son garde chasse de la tuer. N\'ayant pas le courage d\'exécuter ses ordres, il l\'abandonne dans la forêt.',
            'Dans la Grèce antique, alors que la fête bat son plein et que les fées se penchent sur le berceau d\'Hercule, fils de Zeus, Hadès, seigneur des enfers, ronge son frein. En consultant les Moires, il apprend que les planètes lui seront favorables dans dix-huit ans. Pour gouverner l\'Olympe, il lui suffira de libérer les Titans, jadis emprisonnés par Zeus, après avoir éliminé le seul dieu capable de le tenir en échec : Hercule.',
            'Shrek, un ogre verdâtre, découvre de petites créatures agaçantes qui errent dans son marais. Shrek se rend alors au château du seigneur Lord Farquaad, qui aurait soi-disant expulsé ces êtres de son royaume. Ce dernier souhaite épouser la princesse Fiona, mais celle-ci est retenue prisonnière par un abominable dragon. Il lui faut un chevalier assez brave pour secourir la belle. Shrek accepte d\'accomplir cette mission.',
            'Élevé à New York par son oncle Ben et sa tante Mae, Peter Parker, à présent jeune homme, s\'est toujours interrogé sur la disparition de ses parents, qui l\'auraient abandonné. Un jour, dans un porte-document ayant appartenu à son père, un éminent biochimiste, des éléments le mettent sur la piste d\'un ancien associé de celui - ci, le docteur Curt Connors .',
            'Dans une Amérique rongée par une criminalité débridée et des prisons surpeuplées, le gouvernement a donné son accord pour qu\'une fois par an, pendant 12 heures, toutes activités criminelles, meurtres inclus, soient légalisées . La police ne peut intervenir . Les hôpitaux suspendent leurs services . Une nuit durant, les citoyens sont à même de définir leurs propres règles et de faire leur propre loi, sans avoir à craindre de sanctions .'
            );
        $moviesImage = array(
            'https://www.empirecinemas.co.uk/_uploads/film_images/3774_2917.jpg',
            'http://img.filmsactu.net/datas/films/h/a/harry-potter-et-les-reliques-de-la-mort-partie-1/xl/4ce145bfd4619.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/711HkXFISQL._SY445_.jpg',
            'https://is4-ssl.mzstatic.com/image/thumb/Video/3a/7e/8e/mzl.fiohzlyh.jpg/268x0w.jpg',
            'https://www.telerama.fr/sites/tr_master/files/e5c29db2-5d60-4c55-b230-fb217b9640c1_2.jpg',
            'http://fr.web.img3.acsta.net/medias/nmedia/18/35/32/48/18384546.jpg',
            'https://cdn.vox-cdn.com/thumbor/TAzotU1RnNkUJ7RwFtu7Rn1Ntcw=/0x0:1688x2500/1200x0/filters:focal(0x0:1688x2500):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/11614195/InfinityWar5aabd55fed5fa.jpg',
            'http://t1.gstatic.com/images?q=tbn:ANd9GcTQZmE7hqHvI6HcjZQAk9Vvd-R9GpUlJvT3YVZ927FUdYyvewIg',
            'http://t3.gstatic.com/images?q=tbn:ANd9GcQf3vMW1Z28zE900cGu50XHdQ0Eq_1VKtEfcKyRwzcvQ9IysLgO',
            'https://img1.od-cdn.com/ImageType-100/1493-1/%7B3F1635DA-BC24-42BA-BD6C-80F5866906FF%7DImg100.jpg',
            'http://fr.web.img5.acsta.net/medias/nmedia/18/35/18/13/18370242.jpg',
            'http://fr.web.img5.acsta.net/medias/nmedia/18/92/29/61/20471737.jpg',
            'http://img.over-blog-kiwi.com/1/36/64/60/20150323/ob_23a5c4_illuminatiwatcherdotcom-interstellar-m.jpg',
            'https://media.senscritique.com/media/000017027577/source_big/Devil_s_Bride.jpg',
            'http://fr.web.img4.acsta.net/medias/nmedia/00/02/46/93/affiche.jpg',
            'https://i.pinimg.com/originals/43/c1/e4/43c1e491ceb2a9f59ae79c9cdd17b0ef.jpg',
            'http://fr.web.img4.acsta.net/medias/nmedia/18/66/15/78/19254683.jpg',
            'http://t0.gstatic.com/images?q=tbn:ANd9GcTvjE5Xz0bc91hkdeC45oiOYo6c63KMGS_F3EZcZsrfIlALlZx9',
            'http://t1.gstatic.com/images?q=tbn:ANd9GcQ8AXnq7PoVqOkkbph-UZHsCeey0Hsxf5ELIzmmWtVYG9Uy7WSi',
            'http://t3.gstatic.com/images?q=tbn:ANd9GcQYs1mW7msIZvPuOsuDWoZNpqgvBeOYuMGKvDU-tNuCAoj5MolL',
            'http://4.bp.blogspot.com/-3k8o7RnOs2g/VdmRJiP2_4I/AAAAAAAAANA/dlXAvQoDS3w/s1600/Hercules_Disney.jpg',
            'https://www.cdn-cinenode.com/movie_poster/17/full/shrek-16640.jpg'
            );
        $moviesUrlTrailer = array('http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com');
        $moviesUrlDownload = array('http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com', 'http://www.youtube.com');

        $moviesCatetories = array($categoriesEntity[2], $categoriesEntity[5], $categoriesEntity[8], $categoriesEntity[6], $categoriesEntity[3], $categoriesEntity[2], $categoriesEntity[0], $categoriesEntity[9], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[5], $categoriesEntity[4], $categoriesEntity[4], $categoriesEntity[4], $categoriesEntity[4], $categoriesEntity[4]);

        for ($i = 0; $i < 22; $i++){

            $movie = new Movie();
            $movie->setName($moviesName[$i]);
            $movie->setSynopsis($moviesSynopsis[$i]);
            $movie->setPrice(mt_rand(3, 15));
            $movie->setImage($moviesImage[$i]);
            $movie->setUrlTrailer($moviesUrlTrailer[$i]);
            $movie->setUrlDownload($moviesUrlDownload[$i]);
            $movie->addCategory($moviesCatetories[$i]);
            $manager->persist($movie);
        }


        $manager->flush();
    }
}
