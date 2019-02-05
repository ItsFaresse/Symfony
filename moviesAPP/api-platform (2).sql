-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 14 déc. 2018 à 11:09
-- Version du serveur :  5.7.21
-- Version de PHP :  7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `api-platform`
--

-- --------------------------------------------------------

--
-- Structure de la table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artist`
--

INSERT INTO `artist` (`id`, `firstname`, `lastname`) VALUES
(3, 'Emma', 'Stone');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(39, 'Action'),
(40, 'Thriller '),
(41, 'Drame'),
(42, 'Horreur '),
(43, 'Animation '),
(44, 'Fantastique'),
(45, 'Comédie'),
(46, 'Aventure'),
(47, 'Policier'),
(48, 'Science-Fiction');

-- --------------------------------------------------------

--
-- Structure de la table `has_artist`
--

DROP TABLE IF EXISTS `has_artist`;
CREATE TABLE IF NOT EXISTS `has_artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `is_actor` tinyint(1) NOT NULL,
  `is_director` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2D7B811CB7970CF8` (`artist_id`),
  KEY `IDX_2D7B811C8F93B6FC` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `has_artist`
--

INSERT INTO `has_artist` (`id`, `artist_id`, `movie_id`, `is_actor`, `is_director`) VALUES
(4, 3, 15, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20181206104040');

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `url_trailer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_download` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id`, `name`, `synopsis`, `price`, `image`, `date`, `url_trailer`, `url_download`) VALUES
(15, 'Amazing spider man', 'Élevé à New York par son oncle Ben et sa tante Mae, Peter Parker, à présent jeune homme, s\'est toujours interrogé sur la disparition de ses parents, qui l\'auraient abandonné. Un jour, dans un porte-document ayant appartenu à son père, un éminent biochimiste, des éléments le mettent sur la piste d\'un ancien associé de celui-ci, le docteur Curt Connors.', 4, 'http://xdesktopwallpapers.com/wp-content/uploads/2012/07/The%20Amazing%20Spider-Man%20-%20Face%20Closeup.jpg', '2012-07-04', 'https://www.youtube.com/embed/-tnxzJ0SSOw', 'https://www.youtube.com/embed/-tnxzJ0SSOw'),
(16, 'American Nightmare', 'Dans une Amérique rongée par une criminalité débridée et des prisons surpeuplées, le gouvernement a donné son accord pour qu\'une fois par an, pendant 12 heures, toutes activités criminelles, meurtres inclus, soient légalisées. La police ne peut intervenir. Les hôpitaux suspendent leurs services. Une nuit durant, les citoyens sont à même de définir leurs propres règles et de faire leur propre loi, sans avoir à craindre de sanctions.', 13, 'https://cinephilionnet.files.wordpress.com/2018/07/american-nightmare-4-les-origines-cinc3a9philion.jpg?w=960', '2013-08-07', 'https://www.youtube.com/embed/JgViSMsXatk', 'https://www.youtube.com/embed/JgViSMsXatk'),
(17, 'Cinquante nuances de Grey', 'Étudiante en littérature anglaise, Anastasia Steele se rend à Seattle dans les bureaux de Christian Grey, jeune homme d\'affaires déjà à la tête d\'un empire de télécom. Elle remplace sa colocataire malade, apprentie journaliste qui devait l\'interviewer pour le magazine de l\'université. Grey tombe sous le charme de cette jeune femme réservée. Au jeu de la séduction, les forces semblent bien distribuées.', 20, 'https://www.wallpaperup.com/uploads/wallpapers/2015/01/28/603479/ff587da7668836b398bbffef108684d9.jpg', '2015-02-11', 'https://www.youtube.com/embed/SfZWFDs0LxA', 'https://www.youtube.com/embed/SfZWFDs0LxA'),
(18, 'Pacific Rim', 'Surgies des flots, des hordes de créatures monstrueuses venues d\'ailleurs, les Kaiju, ont déclenché une guerre qui a fait des millions de victimes et épuisé les ressources naturelles de l\'humanité pendant des années. Pour les combattre, une arme d\'un genre nouveau a été mise au point : de gigantesques robots, les Jaegers, contrôlés simultanément par deux pilotes qui communiquent par télépathie grâce à une passerelle neuronale baptisée le courant.', 10, 'http://images.fandango.com/images/fandangoblog/pacrimlarge.jpg', '2013-07-17', 'https://www.youtube.com/embed/5guMumPFBag', 'https://www.youtube.com/embed/5guMumPFBag'),
(19, 'Mad Max: Fury Road', 'Mad max film de voiture', 12, 'https://static1.squarespace.com/static/55294647e4b043705b242393/5591a69fe4b0a12fd54631d3/5591a6bbe4b046b88ece4f6a/1533414681734/mad-max-fury-road-poster-by-matt-talbot.png', '2015-05-14', 'https://www.youtube.com/embed/hEJnMQG9ev8', 'https://www.youtube.com/embed/hEJnMQG9ev8'),
(20, 'Les Aventuriers de l\'arche perdue', '1936. Parti à la recherche d\'une idole sacrée en pleine jungle péruvienne, l\'aventurier Indiana Jones échappe de justesse à une embuscade tendue par son plus coriace adversaire : le Français René Belloq.\r\nRevenu à la vie civile à son poste de professeur universitaire d\'archéologie, il est mandaté par les services secrets et par son ami Marcus Brody, conservateur du National Museum de Washington, pour mettre la main sur le Médaillon de Râ, en possession de son ancienne amante Marion Ravenwood, désormais tenancière d\'un bar au Tibet.\r\nCet artefact égyptien serait en effet un premier pas sur le chemin de l\'Arche d\'Alliance, celle-là même où Moïse conserva les Dix Commandements. Une pièce historique aux pouvoirs inimaginables dont Hitler cherche à s\'emparer...', 4, 'https://occhimagazine.com/occhi/wp-content/uploads/2018/02/RaidersPoster-1024x496.jpg', '2013-09-16', 'https://www.youtube.com/embed/RvXJqRml_Jo', 'https://www.youtube.com/embed/RvXJqRml_Jo'),
(21, 'Kubo and the Two Strings', 'Kubo est un être aussi intelligent que généreux, qui gagne chichement sa vie en sa qualité de conteur, dans un village de bord de mer. Cette petite vie tranquille, ainsi que celle de ses compagnons Hosato, Hashi et Kamekichi va être bouleversée quand par erreur il invoque un démon du passé. Surgissant des nues cet esprit malfaisant va abattre son courroux sur le village afin d’appliquer une vindicte ancestrale.\r\n\r\nDans sa fuite, Kubo fait équipe avec Monkey et Beetle, pour se lancer dans une épopée palpitante afin de sauver sa famille et percer le secret de la chute de son père, le plus grand samouraï que le monde ait jamais connu. À l’aide de son Shamisen- un instrument musical magique-il va affronter toutes sortes de dieux et de monstres, notamment le terrible Moon King assoiffé de vengeance ainsi que les affreuses sœurs jumelles afin de dénouer le mystère de son héritage, réunir sa famille et accomplir sa destinée héroïque.', 10, 'http://i.imgbox.com/z56FlHLd.jpg', '2016-01-01', 'https://www.youtube.com/embed/p4-6qJzeb3A', 'https://www.youtube.com/embed/p4-6qJzeb3A'),
(22, 'Old Boy', 'A la fin des années 80, Oh Dae-Soo, père de famille sans histoire, est enlevé un jour devant chez lui. Séquestré pendant plusieurs années dans une cellule privée, son seul lien avec l\'extérieur est une télévision. Par le biais de cette télévision, il apprend le meurtre de sa femme, meurtre dont il est le principal suspect. Au désespoir d\'être séquestré sans raison apparente succède alors chez le héros une rage intérieure vengeresse qui lui permet de survivre. Il est relâché 15 ans plus tard, toujours sans explication. Oh Dae-Soo est alors contacté par celui qui semble être le responsable de ses malheurs, qui lui propose de découvrir qui l\'a enlevé et pourquoi. Le cauchemar continue pour le héros.', 20, 'http://img.over-blog-kiwi.com/0/71/65/83/20160226/ob_80e90e_oldboy.jpg', '2013-01-01', 'https://www.youtube.com/embed/C4_9O7G0e9U', 'https://www.youtube.com/embed/C4_9O7G0e9U'),
(23, 'Walk The Line', 'En retraçant le destin du chanteur country-rock Johnny Cash, Walk the line évoque la naissance d\'un nouveau style d\'artiste, celle d\'un homme qui au-delà de ses colères, des ravages de la dépendance et des tentations du statut de star, a tout dépassé pour devenir une icône.\r\nC\'est aussi le parcours d\'un homme qui, du fond de la période la plus noire de sa vie, a été porté par une histoire d\'amour fusionnelle avec June Carter. Leur passion a nourri son art tout au long de sa vie.\r\nCette saga est marquée par les thèmes qui feront la force de la musique de Cash et\r\nde son style minimaliste : la mort, l\'amour, la trahison, le péché, l\'espoir et la foi.', 15, 'http://townsquare.media/site/204/files/2013/06/Walk-the-Line.jpg?w=980&q=75', '2013-01-01', 'https://www.youtube.com/embed/-AFO0rUjXIA', 'https://www.youtube.com/embed/-AFO0rUjXIA'),
(24, 'Anchorman', 'Dans les années 70, Ron Burgundy est présentateur vedette à la télévision locale de San Diego. Quand le féminisme entre à la rédaction sous la forme de la présentatrice ambitieuse Veronica Corningstone, Ron se montre tolérant tant que cette dernière reste à sa place. Mais quand celle-ci se campe derrière le bureau des actualités, une véritable guerre se déclenche entre les deux journalistes...', 20, 'https://fanart.tv/fanart/movies/8699/moviethumb/anchorman-the-legend-of-ron-burgundy-520b26613df91.jpg', '2013-01-01', 'https://www.youtube.com/embed/-T3wnP91OnI', 'https://www.youtube.com/embed/-T3wnP91OnI'),
(25, 'Casino Royal', 'Pour sa première mission, James Bond affronte le tout-puissant banquier privé du terrorisme international, Le Chiffre. Pour achever de le ruiner et démanteler le plus grand réseau criminel qui soit, Bond doit le battre lors d\'une partie de poker à haut risque au Casino Royale. La très belle Vesper, attachée au Trésor, l\'accompagne afin de veiller à ce que l\'agent 007 prenne soin de l\'argent du gouvernement britannique qui lui sert de mise, mais rien ne va se passer comme prévu. \r\nAlors que Bond et Vesper s\'efforcent d\'échapper aux tentatives d\'assassinat du Chiffre et de ses hommes, d\'autres sentiments surgissent entre eux, ce qui ne fera que les rendre plus vulnérables...', 4, 'https://www.wallpaperup.com/uploads/wallpapers/2014/10/31/501185/92ed69ef640eef8915486d258e180d48-700.jpg', '2013-01-01', 'https://www.youtube.com/embed/36mnx8dBbGE', 'https://www.youtube.com/embed/36mnx8dBbGE'),
(26, 'Alien', 'Le vaisseau commercial Nostromo et son équipage, sept hommes et femmes, rentrent sur Terre avec une importante cargaison de minerai. Mais lors d\\\'un arrêt forcé sur une planète déserte, l\'officier Kane se fait agresser par une forme de vie inconnue, une arachnide qui étouffe son visage. Après que le docteur de bord lui retire le spécimen, l\'équipage retrouve le sourire et dîne ensemble. Jusqu\\\'à ce que Kane, pris de convulsions, voit son abdomen perforé par un corps étranger vivant, qui s\'échappe dans les couloirs du vaisseau...', 2, 'http://fr.web.img3.acsta.net/medias/nmedia/18/35/14/60/18363837.jpg', '2013-01-01', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18355736&amp;isApp=true', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18355736&amp;isApp=true'),
(27, 'Amadeus', 'A Vienne, en novembre 1823. Au coeur de la nuit, un vieil homme égaré clame cette étonnante confession : Pardonne, Mozart, pardonne à ton assassin. Ce fantôme, c\'est Antonio Salieri, jadis musicien réputé et compositeur officiel de la Cour. Dès l\'enfance, il s\'était voué tout entier au service de Dieu, s\'engageant à le célébrer par sa musique, au prix d\'un incessant labeur. Pour prix de ses sacrifices innombrables, il réclamait la gloire éternelle. Son talent, reconnu par l\'empereur mélomane Joseph II, valut durant quelques années à Salieri les plus hautes distinctions. Mais, en 1781, un jeune homme arrive à Vienne, précédé d\'une flatteuse réputation. Wolfgang Amadeus Mozart est devenu le plus grand compositeur du siècle. Réalisant la menace que représente pour lui ce surdoué arrogant dont il admire le profond génie, Salieri tente de l\'évincer.', 4, 'http://fr.web.img6.acsta.net/medias/nmedia/18/35/90/78/18686561.jpg', '1970-01-01', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18671421&amp;isApp=true', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18671421&amp;isApp=true'),
(28, 'America, America', 'Au début du siècle, un jeune Anatolien fuit un pays où Grecs et Arméniens sont persécutés par les Turcs. Il désire émigrer en Amérique, mais s\'aperçoit bien vite que ce périple vers la terre promise est un parcours semé d\'embûches.', 4, 'http://fr.web.img6.acsta.net/medias/nmedia/18/64/43/28/18778270.jpg', '2013-01-01', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18803475&amp;isApp=true\\', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18803475&amp;isApp=true\\'),
(29, 'Barry Lyndon', 'Au XVIIIe siècle en Irlande, à la mort de son père, le jeune Redmond Barry ambitionne de monter dans l\'échelle sociale. Il élimine en duel son rival,un officier britannique amoureux de sa cousine mais est ensuite contraint à l\'exil. Il s\'engage dans l\'armée britannique et part combattre sur le continent européen. Il déserte bientôt et rejoint l\'armée prussienne des soldats de Frederic II afin d\'échapper à la peine de mort. Envoyé en mission, il doit espionner un noble joueur, mène un double-jeu et se retrouve sous la protection de ce dernier. Introduit dans la haute société européenne, il parvient à devenir l\'amant d\'une riche et magnifique jeune femme, Lady Lyndon. Prenant connaissance de l\'adultère, son vieil époux sombre dans la dépression et meurt de dépit. Redmond Barry épouse Lady Lyndon et devient Barry Lyndon...\'', 4, 'http://fr.web.img6.acsta.net/medias/nmedia/18/36/14/49/18455746.jpg', '2013-01-01', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18782028&amp;isApp=true\\', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=18782028&amp;isApp=true\\'),
(30, 'Brazil', 'Sam Lowry, fonctionnaire modèle d\'une mégapole étrange, à la fois d\'hier, beaucoup d\'aujourd\'hui et tout à fait de demain, a des problèmes avec sa maman et avec l\'Etat, tout puissant. Pour couronner le tout, des songes bizarres l\'entraînent chaque nuit sur les ailes d\'Icare, à la recherche d\'une jeune femme blonde, évanescente, inaccessible. Chaque fois qu\'il est sur le point de l\'atteindre, leurs trajectoires se séparent et le songe s\'interrompt cruellement. Pourtant une nuit, la belle Jill Layton entre dans sa vie... Par le biais d\'une erreur dans la machinerie fantastique qui préside à l\'organisation de la vie quotidienne des citoyens de cette ville étrange, l\'Ordinateur suprême a désigné le brave Buttle à la place de l\'escroc Tuttle, activement recherché. Après le décès fâcheux du pauvre Buttle, Saw Lowry, jusque là employé rampant, est promu au Service des Recherches, très brigué... pour dédommager la veuve du défunt. La belle Jill habite au dessus de l\'infortunée famille... En fait de recherches, Sam va passer son temps à retrouver la femme de ses rêves. Sa maman, elle, a des soucis beaucoup plus terre-à-terre. Elle surveille fébrilement les résultats des multiples interventions de chirurgie plastique réalisées par une sorte de Grand-Maître d\'une secte étrange dans cet univers incroyable.', 4, 'https://www.filmonpaper.com/site/media/2013/05/Brazil_quad_UK-1.jpg', '1985-06-10', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=19352259&amp;isApp=true\\', 'http://www.allocine.fr/_video/iblogvision.aspx?cmedia=19352259&amp;isApp=true\\'),
(252, 'Titanic', 'En 1997, l\'épave du Titanic est l\'objet d\'une exploration fiévreuse, menée par des chercheurs de trésor en quête d\'un diamant bleu qui se trouvait à bord. Frappée par un reportage télévisé, l\'une des rescapés du naufrage, âgée de 102 ans, Rose DeWitt, se rend sur place et évoque ses souvenirs. 1912. Fiancée à un industriel arrogant, Rose croise sur le bateau un artiste sans le sou.', 11, 'https://www.empirecinemas.co.uk/_uploads/film_images/3774_2917.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(253, 'Harry Potter', 'Harry Potter est un enfant né d\'une famille de magicien. Il est destiné à vaincre les ténèbres.', 5, 'http://img.filmsactu.net/datas/films/h/a/harry-potter-et-les-reliques-de-la-mort-partie-1/xl/4ce145bfd4619.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(254, 'Leon', 'Un tueur à gages répondant au nom de Léon prend sous son aile Mathilda, une petite fille de 12 ans, seule rescapée du massacre de sa famille. Bientôt, Léon va faire de Mathilda une `nettoyeuse\', comme lui. La jeune fille pourra alors venger son petit frère.', 11, 'https://images-na.ssl-images-amazon.com/images/I/711HkXFISQL._SY445_.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(255, 'American Pie', 'L\'année scolaire se termine au lycée de Great Falls. Désespéré depuis que ses parents l\'ont surpris dans une situation plus que gênante devant un film X, Jim, élève de terminale, scelle un pacte avec sa bande de copains : finis les plaisirs solitaires, ils seront tous des hommes avant d\'entrer à la fac.', 3, 'https://is4-ssl.mzstatic.com/image/thumb/Video/3a/7e/8e/mzl.fiohzlyh.jpg/268x0w.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(256, 'The Mist', 'Tous deux se rendent en ville pour se ravitailler, mais une fois dans le supermarché, la brume, qui en vérité cache des créatures immondes et meurtrières, envahit le parking. Toute personne qui se risque à l\'extérieur subit une mort atroce.', 15, 'https://www.telerama.fr/sites/tr_master/files/e5c29db2-5d60-4c55-b230-fb217b9640c1_2.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(257, 'Note Book', 'Atteinte de la maladie d\'Alzheimer, Allie vit en maison de retraite. Chaque jour, Noah lui lit le même livre. Il s\'agit du carnet où Allie a consigné sa propre histoire, lorsqu\'elle a appris sa maladie. Pour ne pas oublier ses sentiments, elle a écrit, et Noah, inlassablement, lui relit ses propres mots.', 12, 'http://fr.web.img3.acsta.net/medias/nmedia/18/35/32/48/18384546.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(258, 'Avengers', 'Nick Fury, le directeur du S.H.I.E.L.D., l\'organisation qui préserve la paix dans le monde, veut former une équipe d\'irréductibles pour empêcher la destruction du monde. Iron Man, Hulk, Thor, Captain America, Hawkeye et Black Widow répondent présents. La nouvelle équipe, baptisée Avengers, a beau sembler soudée, il reste encore à ses illustres membres à apprendre à travailler ensemble', 4, 'https://cdn.vox-cdn.com/thumbor/TAzotU1RnNkUJ7RwFtu7Rn1Ntcw=/0x0:1688x2500/1200x0/filters:focal(0x0:1688x2500):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/11614195/InfinityWar5aabd55fed5fa.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(259, 'Mortal Engines', 'Des centaines d’années après qu’un évènement apocalyptique a détruit la Terre, l’humanité s’est adaptée pour survivre en trouvant un nouveau mode de vie. Ainsi, de gigantesques villes mobiles errent sur Terre prenant sans pitié le pouvoir sur d’autres villes mobiles plus petites.', 7, 'http://t1.gstatic.com/images?q=tbn:ANd9GcTQZmE7hqHvI6HcjZQAk9Vvd-R9GpUlJvT3YVZ927FUdYyvewIg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(260, 'La Tour Sombre', 'Le dernier Pistolero, Roland Deschain, est condamné à livrer une éternelle bataille contre Walter O\'Dim, alias l\'Homme en noir. Il doit à tout prix l\'empêcher de détruire la Tour sombre, clé de voûte de la cohésion de l\'univers. Le destin de tous les mondes est en jeu et le bien et le mal vont s\'affronter dans un ultime combat. Roland est le seul à pouvoir défendre la Tour contre l\'Homme en noir', 3, 'http://t3.gstatic.com/images?q=tbn:ANd9GcQf3vMW1Z28zE900cGu50XHdQ0Eq_1VKtEfcKyRwzcvQ9IysLgO', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(261, 'Call Me by Your Name', 'Été 1983. Elio Perlman, 17 ans, passe ses vacances dans la villa du XVIIe siècle que possède sa famille en Italie, à jouer de la musique classique, à lire et à flirter avec son amie Marzia. Son père, éminent professeur, et sa mère, traductrice, lui ont donné une excellente éducation. Un jour, Oliver, un séduisant Américain qui prépare son doctorat, vient travailler auprès du père d\'Elio. Elio et Oliver vont bientôt découvrir l\'éveil du désir', 11, 'https://img1.od-cdn.com/ImageType-100/1493-1/%7B3F1635DA-BC24-42BA-BD6C-80F5866906FF%7DImg100.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(262, 'RrRrrrr', 'Il y a 37.000 ans, deux tribus voisines sont rivales. Pendant que la tribu des Cheveux Propres coule des jours paisibles en gardant pour elle seule le secret de la formule du shampooing, la tribu des Cheveux Sales se lamente. Son chef décide d\'envoyer un espion pour voler la recette, mais un événement bien plus grave va bouleverser la vie des Cheveux Propres : pour la première fois dans l\'histoire de l\'humanité, un crime vient d\'être commis', 4, 'http://fr.web.img5.acsta.net/medias/nmedia/18/35/18/13/18370242.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(263, 'Cloud Atlas', 'En 1849, un jeune notaire fait une difficile traversée du Pacifique. En 1936, un musicien ambitieux sans le sou quitte son amant pour travailler auprès d\'un illustre compositeur à Edimbourg. Quelque cinquante ans plus tard, à San Francisco, une journaliste enquête sur les actions douteuses d\'une compagnie pétrolière. A Londres, en 2012, un vieil éditeur endetté placé contre son gré dans une maison de retraite tente de s\'en évader', 14, 'http://fr.web.img5.acsta.net/medias/nmedia/18/92/29/61/20471737.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(264, 'Interstellar', 'Dans un futur proche, la Terre est de moins en moins accueillante pour l\'humanité qui connaît une grave crise alimentaire. Le film raconte les aventures d\'un groupe d\'explorateurs qui utilise une faille récemment découverte dans l\'espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire.', 6, 'http://img.over-blog-kiwi.com/1/36/64/60/20150323/ob_23a5c4_illuminatiwatcherdotcom-interstellar-m.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(265, 'La mariée du Diable', 'En 1966, sur une petite île de Finlande, une adolescente amoureuse d\'un homme marié se retrouve au cœur d\'une véritable chasse aux sorcières.', 13, 'https://media.senscritique.com/media/000017027577/source_big/Devil_s_Bride.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(266, '8 Mile', 'A Detroit, en 1995, Jimmy Smith Jr. a des rêves plein la tête, mais il lui manque encore les mots pour les exprimer. Sa vie d\'adolescent se déroule entre banlieue blanche et quartiers noirs, le long de cette ligne de démarcation que l\'on nomme 8 Mile Road. En dépit de tous ses efforts, Jimmy n\'a jamais franchi cette barrière symbolique et continue d\'accumuler les déboires familiaux, professionnels et sentimentaux. Un jour, il participe à un clash, une joute oratoire de rappeurs.', 13, 'http://fr.web.img4.acsta.net/medias/nmedia/00/02/46/93/affiche.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(267, 'Slumdog Millionaire', 'Depuis son enfance dans les bidonvilles de Mumbai, Jamal Malik poursuit son rêve : retrouver Latika, une jeune orpheline dont il est amoureux. Alors qu\'il commence à perdre espoir, il imagine une solution surprenante pour retrouver son amour : participer au plus grand show télévisé du pays, Qui veut gagner des millions ? . Il atteint la question finale à 20 millions de roupies mais il est arrêté par la police, qui le soupçonne de tricherie.', 8, 'https://i.pinimg.com/originals/43/c1/e4/43c1e491ceb2a9f59ae79c9cdd17b0ef.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(268, 'La Ligne Verte', 'Paul Edgecomb, pensionnaire centenaire d\'une maison de retraite, est hanté par ses souvenirs. Gardien-chef du pénitencier de Cold Mountain, en 1935, en Louisiane, il était chargé de veiller au bon déroulement des exécutions capitales au bloc E (la ligne verte) en s\'efforçant d\'adoucir les derniers moments des condamnés. Parmi eux se trouvait un colosse du nom de John Coffey, accusé du viol et du meurtre de deux fillettes.', 8, 'http://fr.web.img4.acsta.net/medias/nmedia/18/66/15/78/19254683.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(269, 'La petite sirène', 'Ariel, la petite Sirène, a la plus belle voix des océans mais elle ne rêve que du prince Eric et du monde des humains. Ursula, la Sorcière des mers, lui propose un terrible marché. Saura-t-elle se sortir de ses griffes ? Trouvera-t-elle le moyen de réaliser ses rêves ?', 12, 'http://t0.gstatic.com/images?q=tbn:ANd9GcTvjE5Xz0bc91hkdeC45oiOYo6c63KMGS_F3EZcZsrfIlALlZx9', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(270, 'Cendrillion', 'Cendrillon, une douce jeune fille, subit les méchancetés de sa belle-mère et de ses deux horribles filles. Un jour, transformée par sa marraine la bonne fée en princesse éclatante de beauté, elle se rend au bal du prince qui tombe fou amoureux d\'elle..', 3, 'http://t1.gstatic.com/images?q=tbn:ANd9GcQ8AXnq7PoVqOkkbph-UZHsCeey0Hsxf5ELIzmmWtVYG9Uy7WSi', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(271, 'Blanche Neige', 'Blanche Neige est une très jolie princesse. Sa belle-mère, la Reine, sentant qu\'un jour la beauté de Blanche Neige dépasserait la sienne donne l\'ordre à son garde chasse de la tuer. N\'ayant pas le courage d\'exécuter ses ordres, il l\'abandonne dans la forêt.', 3, 'http://t3.gstatic.com/images?q=tbn:ANd9GcQYs1mW7msIZvPuOsuDWoZNpqgvBeOYuMGKvDU-tNuCAoj5MolL', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(272, 'Hercules', 'Dans la Grèce antique, alors que la fête bat son plein et que les fées se penchent sur le berceau d\'Hercule, fils de Zeus, Hadès, seigneur des enfers, ronge son frein. En consultant les Moires, il apprend que les planètes lui seront favorables dans dix-huit ans. Pour gouverner l\'Olympe, il lui suffira de libérer les Titans, jadis emprisonnés par Zeus, après avoir éliminé le seul dieu capable de le tenir en échec : Hercule.', 3, 'http://4.bp.blogspot.com/-3k8o7RnOs2g/VdmRJiP2_4I/AAAAAAAAANA/dlXAvQoDS3w/s1600/Hercules_Disney.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com'),
(273, 'Shrek', 'Shrek, un ogre verdâtre, découvre de petites créatures agaçantes qui errent dans son marais. Shrek se rend alors au château du seigneur Lord Farquaad, qui aurait soi-disant expulsé ces êtres de son royaume. Ce dernier souhaite épouser la princesse Fiona, mais celle-ci est retenue prisonnière par un abominable dragon. Il lui faut un chevalier assez brave pour secourir la belle. Shrek accepte d\'accomplir cette mission.', 10, 'https://www.cdn-cinenode.com/movie_poster/17/full/shrek-16640.jpg', NULL, 'http://www.youtube.com', 'http://www.youtube.com');

-- --------------------------------------------------------

--
-- Structure de la table `movie_categories`
--

DROP TABLE IF EXISTS `movie_categories`;
CREATE TABLE IF NOT EXISTS `movie_categories` (
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`category_id`),
  KEY `IDX_D30336548F93B6FC` (`movie_id`),
  KEY `IDX_D303365412469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `movie_categories`
--

INSERT INTO `movie_categories` (`movie_id`, `category_id`) VALUES
(15, 44),
(16, 40),
(17, 41),
(18, 39),
(19, 44),
(252, 41),
(253, 44),
(254, 47),
(255, 45),
(256, 42),
(257, 41),
(258, 39),
(259, 48),
(260, 44),
(261, 44),
(262, 44),
(263, 44),
(264, 44),
(265, 44),
(266, 44),
(267, 44),
(268, 44),
(269, 43),
(270, 43),
(271, 43),
(272, 43),
(273, 43);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `has_artist`
--
ALTER TABLE `has_artist`
  ADD CONSTRAINT `FK_2D7B811C8F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `FK_2D7B811CB7970CF8` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);

--
-- Contraintes pour la table `movie_categories`
--
ALTER TABLE `movie_categories`
  ADD CONSTRAINT `FK_D303365412469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D30336548F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
