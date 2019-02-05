-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 11 jan. 2019 à 14:57
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `anthem_intell`
--

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
('20190107131719'),
('20190107132716'),
('20190107133034'),
('20190109093940'),
('20190109145649'),
('20190110163557'),
('20190110170404'),
('20190111095824');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `name`) VALUES
(1, 'Adapté PMR'),
(2, 'Balcon'),
(3, 'Ascenceur');

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `surface` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `heat` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `title`, `description`, `surface`, `rooms`, `bedrooms`, `floor`, `price`, `heat`, `city`, `address`, `postal_code`, `sold`, `created_at`, `filename`, `updated_at`) VALUES
(13, 'Villa', 'Magnam amet incidunt molestiae. Dolores mollitia cumque consequatur. Tempore sed at in aperiam tempore voluptas quia.', 161, 8, 6, 5, 1450000, 1, 'GuichardVille', '73, chemin De Sousa48682 Ramos-sur-Mer', '06679', 0, '2019-01-09 13:52:33', '5c3877490bb14508801813.png', '2019-01-11 11:00:24'),
(14, 'Palace', 'Et excepturi saepe autem laboriosam. Voluptatem alias nostrum et debitis et odit deserunt. Quaerat quia corporis quis ut vero est quo consequatur.', 178, 9, 7, 3, 900000, 0, 'Delaunay', '99, avenue Perrin15 249 Fernandes', '47655', 0, '2019-01-09 13:52:33', '5c38777653828579047245.jpg', '2019-01-11 11:01:10'),
(15, 'Château', 'Tempore et ad nobis ipsam laboriosam. Totam dignissimos debitis repellat est qui rem aut. Minima perspiciatis provident impedit molestiae.', 270, 7, 5, 1, 700000, 0, 'Normand', '3, rue Menard48264 Le Gall', '14283', 0, '2019-01-09 13:52:33', '5c387790a8f63968931253.jpg', '2019-01-11 11:01:36'),
(16, 'Duplex-i', 'Id qui illum aliquid labore. Voluptas sit eos est similique facilis et aperiam. Praesentium adipisci adipisci sit.', 117, 6, 4, 10, 506325, 0, 'Leduc', '25, rue Aimée Tessier75 549 Leclercqboeuf', '09866', 0, '2019-01-09 13:52:33', '5c3877ac8c7e3287340576.jpg', '2019-01-11 11:02:04'),
(20, 'Piscine', 'Laboriosam libero ducimus iste consequuntur facere consequatur. Doloremque et aliquam quas aspernatur. Voluptas animi harum qui sint quibusdam ipsam sed.', 192, 9, 7, 1, 1200000, 0, 'Lacombe', '830, boulevard Grenier94534 Pineau-sur-Alexandre', '14117', 0, '2019-01-09 13:52:33', '5c387b8ae321f845401891.jpg', '2019-01-11 11:18:34'),
(29, 'ut consectetur culpa', 'Sunt pariatur quia aut aut rerum eligendi reiciendis. Quia id occaecati amet quis ad ex occaecati. Sequi dolorum ratione repudiandae.', 20, 10, 2, 2, 322389, 1, 'Lacombe-la-Forêt', '14, avenue de Rousseau\n17 842 Leclerc-la-Forêt', '18149', 0, '2019-01-09 13:52:33', '', NULL),
(30, 'totam odio deleniti', 'Qui suscipit quia pariatur dolor qui. Nulla rerum nihil consectetur molestiae rerum. Rerum est et eaque est.', 166, 10, 8, 8, 566279, 0, 'De Oliveiranec', '13, avenue Besson\n25 060 Hamon-sur-Mer', '54352', 0, '2019-01-09 13:52:33', '', NULL),
(31, 'architecto quod et', 'Eos laboriosam odit qui quidem magni sit. Optio rerum aut sint culpa similique molestiae. Temporibus sed vitae inventore sit corporis.', 319, 10, 5, 0, 190266, 1, 'Millet-sur-Mer', '34, rue Mathilde De Sousa\n86 331 Lucas-sur-Mer', '68 037', 0, '2019-01-09 13:52:33', '', NULL),
(32, 'nulla sint quia', 'Dolores culpa sunt quibusdam voluptates voluptatem. Fugiat ut velit odio deserunt saepe dolor. Aut enim alias tempora.', 168, 4, 9, 8, 450454, 0, 'Martin', '76, chemin Begue\n66 794 Garcia', '42 996', 0, '2019-01-09 13:52:33', '', NULL),
(33, 'quisquam et sit', 'Aperiam repellat non veniam qui. Et dolor facere sapiente quis beatae repellendus numquam. Laudantium at soluta aut qui quia deserunt.', 118, 2, 3, 8, 71462, 1, 'Hebert', '7, boulevard Ollivier\n59 191 Maury-la-Forêt', '82641', 0, '2019-01-09 13:52:33', '', NULL),
(34, 'praesentium labore repudiandae', 'Modi optio ea culpa doloribus et optio asperiores. Voluptatum nostrum doloribus ea dolorum. Sed sint odio ullam quibusdam quibusdam.', 291, 9, 8, 1, 583131, 0, 'Fontaine', '49, chemin Renée Breton\n49 853 Da Costa-les-Bains', '72 500', 0, '2019-01-09 13:52:33', '', NULL),
(35, 'quibusdam dolores est', 'Recusandae consectetur architecto et voluptatem ipsum hic consequuntur. Exercitationem occaecati voluptatem qui corrupti praesentium. Voluptate est voluptatem corporis molestiae odit.', 226, 5, 8, 7, 187204, 1, 'Ferreira', '81, rue Roussel\n01 849 Martin-les-Bains', '37 810', 0, '2019-01-09 13:52:33', '', NULL),
(36, 'recusandae temporibus qui', 'Labore aut dolorem mollitia iure dolore. Ea ducimus autem possimus nam. Quis quasi placeat explicabo sunt inventore.', 84, 9, 5, 8, 110875, 1, 'GaillardBourg', '71, rue Henriette Perrot\n31 320 Fleuryboeuf', '46393', 0, '2019-01-09 13:52:33', '', NULL),
(37, 'a magni repellat', 'Qui fugiat ut provident consequatur. Laboriosam eligendi iste rerum quae. Sit quia laborum sed officiis.', 48, 2, 2, 9, 181522, 1, 'Morel-sur-Bonnin', '96, rue Alex Lefort\n87202 Alves-sur-Mer', '12883', 0, '2019-01-09 13:52:33', '', NULL),
(38, 'aspernatur sint rem', 'Ratione blanditiis omnis ex veritatis accusantium odio. Animi id voluptatum velit ea deleniti non ratione sint. Atque quia consequuntur natus at maxime.', 249, 2, 8, 2, 51330, 1, 'Guilbert-les-Bains', '13, rue Lefebvre\n14 298 Petit', '84 754', 0, '2019-01-09 13:52:33', '', NULL),
(39, 'illo sint mollitia', 'Cumque sint eaque impedit aut. Enim ut hic molestiae est quas molestias dolore. Velit fuga qui odit unde.', 253, 4, 5, 8, 136416, 0, 'Boulanger-sur-Mer', '72, avenue Alfred Le Goff\n40350 Leveque-sur-Hebert', '30714', 0, '2019-01-09 13:52:33', '', NULL),
(40, 'voluptate explicabo sint', 'Dolorem pariatur provident aperiam est laudantium veritatis. Accusamus aut vitae aut neque aut atque. Officiis culpa dignissimos quos est et nostrum delectus.', 301, 3, 3, 1, 69294, 1, 'Blanchet', '1, rue de Etienne\n01 327 Bailly-sur-Mer', '72 992', 0, '2019-01-09 13:52:33', '', NULL),
(41, 'earum cum unde', 'In id est odit rerum quas ut. Omnis numquam quis ea similique animi voluptatum ex. Quasi quae est minima ratione.', 47, 7, 3, 1, 303618, 1, 'Bernard-sur-Mer', '528, impasse Pereira\n90 171 Renaultdan', '54 068', 0, '2019-01-09 13:52:33', '', NULL),
(42, 'qui in sunt', 'Mollitia aliquid reprehenderit architecto dolor molestiae architecto fuga. Et minus et sed veritatis doloribus dolorum occaecati eveniet. Dolores voluptatum quis similique reiciendis asperiores.', 261, 2, 3, 2, 536836, 1, 'Camus-les-Bains', '12, impasse William Henry\n08681 Peron', '78050', 0, '2019-01-09 13:52:33', '', NULL),
(43, 'ut nihil voluptates', 'Molestias non quis quae modi aut ea qui. Quasi earum sunt omnis eos. Molestiae quo fuga dicta.', 276, 10, 5, 6, 366106, 0, 'Ollivier', '747, chemin de Seguin\n97 388 Morel', '86 025', 0, '2019-01-09 13:52:33', '', NULL),
(44, 'voluptatem sed quis', 'Dolores expedita et optio. Ab voluptatem modi nobis neque voluptas unde voluptatem. Eaque laborum doloremque illo quisquam sint in fugit.', 126, 4, 7, 6, 252561, 1, 'Normand', '58, rue Da Silva\n66 816 Gomes-sur-Boulanger', '72859', 0, '2019-01-09 13:52:33', '', NULL),
(45, 'quia omnis sit', 'Sed natus facilis esse et numquam. Itaque qui molestias sequi dolore est qui. Voluptatem non autem blanditiis eum voluptatem qui non.', 341, 7, 5, 8, 122885, 0, 'Lefebvreboeuf', 'rue Laporte\n23 581 Potiernec', '82200', 0, '2019-01-09 13:52:33', '', NULL),
(46, 'soluta earum voluptate', 'Qui autem et id et. Sed vel corporis consequatur sed repellat. Error doloribus consectetur quae officiis labore expedita.', 203, 6, 2, 8, 263721, 0, 'Duval', '58, boulevard de Giraud\n19 116 Gautier', '82890', 0, '2019-01-09 13:52:33', '', NULL),
(47, 'id porro at', 'Consequuntur enim et commodi voluptatem numquam omnis. Minus laborum ullam molestiae quia in eum libero eveniet. Eaque mollitia ut sit eaque voluptatem quae explicabo.', 80, 4, 6, 6, 385662, 0, 'Fontaine', '39, impasse de Legendre\n78 456 Roussel', '05811', 0, '2019-01-09 13:52:33', '', NULL),
(48, 'et ut sit', 'Modi repellat aut facilis reiciendis eveniet. Sed animi nisi quia eius. Esse culpa exercitationem magnam aliquid voluptatem.', 174, 7, 4, 10, 233313, 0, 'David', '4, impasse Jacqueline Michaud\n96842 Moulin', '62 080', 0, '2019-01-09 13:52:33', '', NULL),
(49, 'est deleniti magni', 'Assumenda exercitationem magni et labore. Perspiciatis at dolore deleniti occaecati aspernatur natus. Atque ex nesciunt dolorum tempora.', 325, 9, 2, 1, 105999, 0, 'Lucas', 'boulevard Anouk Diallo\n24319 Gregoirenec', '73 991', 0, '2019-01-09 13:52:33', '', NULL),
(50, 'qui voluptates occaecati', 'Autem nihil excepturi molestiae qui quis commodi iure tenetur. Corporis optio fugit distinctio. Nemo eligendi nam qui quia vero magni assumenda.', 232, 10, 3, 9, 188676, 0, 'Bruneaunec', '9, rue Prevost\n08986 ThomasVille', '71 521', 0, '2019-01-09 13:52:33', '', NULL),
(51, 'totam perspiciatis et', 'Nam harum ut sit enim est ad magnam. Voluptas maxime explicabo quasi ad tempora exercitationem. Autem nesciunt et quis voluptatem neque.', 269, 3, 2, 10, 245230, 1, 'Muller-sur-Verdier', '57, boulevard Patricia Fabre\n12 022 Lelievre-sur-Mer', '55759', 0, '2019-01-09 13:52:33', '', NULL),
(52, 'cumque eius molestias', 'Enim magni deserunt repellendus voluptatibus vero qui. Aliquid rem doloribus perferendis doloribus deleniti. Placeat aut dolorem omnis voluptatibus.', 297, 8, 2, 5, 576053, 0, 'Bertrand', '54, rue de Leger\n19 288 Klein-sur-Bernier', '72 052', 0, '2019-01-09 13:52:33', '', NULL),
(53, 'provident quibusdam sed', 'Dolores animi quidem molestias harum cum sit autem. Itaque enim aut a quaerat. Laudantium officia consectetur quo voluptates placeat odit hic.', 79, 6, 4, 9, 548231, 1, 'Poulain', 'chemin Émilie Fontaine\n13 323 Leroy', '24 572', 0, '2019-01-09 13:52:33', '', NULL),
(54, 'consequuntur ipsa corporis', 'Et recusandae libero et facilis aperiam aut ut. Aut consequatur repellendus esse tenetur voluptates. Sed veritatis quibusdam doloribus.', 81, 5, 9, 5, 150872, 0, 'Delannoydan', '7, boulevard Thibaut Baron\n00 320 Weissboeuf', '26 545', 0, '2019-01-09 13:52:33', '', NULL),
(55, 'itaque reprehenderit consequuntur', 'Vitae quam numquam quia ea. Odit nulla consequatur rerum perferendis. Rerum quibusdam delectus non omnis.', 187, 3, 2, 0, 278728, 1, 'Pasquier', 'chemin Margaud Chauveau\n23766 Maury-sur-Blanchet', '97 317', 0, '2019-01-09 13:52:33', '', NULL),
(56, 'ut magnam iusto', 'Aut modi et quis perspiciatis omnis necessitatibus nostrum quia. Quod porro veniam unde dolorem ut. Autem aliquid id non cupiditate blanditiis.', 43, 8, 9, 9, 135550, 0, 'Lemaitre-sur-Lagarde', '48, place de Dupre\n06245 Delannoy', '59103', 0, '2019-01-09 13:52:33', '', NULL),
(57, 'reiciendis odio voluptates', 'Excepturi et corporis in ducimus in vitae. Qui accusamus aut molestiae corporis dolorem. Dolore et magnam autem id reiciendis.', 76, 5, 8, 6, 319858, 0, 'Lefevre', '6, impasse de Pires\n07905 Boucher', '54 661', 0, '2019-01-09 13:52:33', '', NULL),
(58, 'sit aut voluptate', 'Sed neque excepturi quod temporibus facilis. Natus aperiam beatae est consequatur occaecati amet voluptas animi. Repudiandae tempora libero voluptates adipisci dolorum excepturi eos.', 20, 10, 6, 6, 319496, 0, 'Martin', '766, rue Blanc\n19176 Georges-sur-Mer', '75525', 0, '2019-01-09 13:52:33', '', NULL),
(59, 'et iste assumenda', 'Quos nobis dolorem corporis et aliquid. Doloremque quas eius rerum qui qui vel accusantium. Accusantium incidunt et non distinctio mollitia qui alias.', 337, 10, 7, 9, 520360, 1, 'Cordier-sur-Perrot', '56, avenue de Boulanger\n63 055 Rouxnec', '91 870', 0, '2019-01-09 13:52:33', '', NULL),
(60, 'ut repudiandae doloribus', 'Quaerat et aliquam qui. Ut in ab recusandae quaerat facere repellat iste. Aut a corrupti libero magni.', 255, 5, 5, 10, 285996, 1, 'Malletboeuf', '10, chemin Raynaud\n81138 Masse', '71188', 0, '2019-01-09 13:52:33', '', NULL),
(61, 'minima nemo nemo', 'Laboriosam velit quis cum et. Voluptatibus deleniti velit omnis sunt in enim minus. Aut iste voluptatem eum sunt odit illo quia.', 278, 6, 6, 1, 194837, 1, 'Ribeironec', '6, avenue Louis Perrot\n80 626 Brunel', '67 358', 0, '2019-01-09 13:52:33', '', NULL),
(62, 'dolorum nam laudantium', 'Ex et sapiente exercitationem quo illum amet quo iure. Veniam quisquam ea perspiciatis. Quidem reprehenderit quia et ut.', 118, 2, 9, 9, 80204, 0, 'Fabre-la-Forêt', '50, boulevard Vincent\n23178 Fernandez', '80 816', 0, '2019-01-09 13:52:33', '', NULL),
(63, 'mollitia ea nostrum', 'Odit non sit perferendis neque laboriosam veniam. Exercitationem eaque illo quasi corporis. Illo id consequuntur hic corrupti dolor.', 202, 9, 4, 7, 573063, 1, 'Morindan', '22, impasse Patricia Maillard\n30 654 Ribeiro-sur-Mer', '24 509', 0, '2019-01-09 13:52:33', '', NULL),
(64, 'minima sed sunt', 'Rerum temporibus consequatur hic. Provident quos maxime vel minima qui et debitis. Enim eum possimus dolor quia sapiente.', 28, 2, 6, 4, 375275, 0, 'Mahe-les-Bains', '5, place Charrier\n73 174 Maillet', '49 264', 0, '2019-01-09 13:52:33', '', NULL),
(65, 'beatae rerum nemo', 'Ipsa saepe eos vel quae repellendus quibusdam quam consequuntur. Dolores ducimus nihil dolores modi ex a dolore. Nostrum quia voluptatem vel aliquam impedit eum unde fugit.', 303, 6, 5, 6, 107564, 0, 'Olivier-la-Forêt', '627, boulevard Lagarde\n65 392 Julien', '92 162', 0, '2019-01-09 13:52:33', '', NULL),
(66, 'tempore aliquid et', 'Quia id impedit quaerat corrupti tenetur voluptate quam provident. Officiis rerum molestiae voluptate repellendus et dolor et. Consequuntur quae enim consequatur itaque ratione.', 27, 7, 5, 1, 599702, 0, 'Loiseau', '1, rue Marchal\n29 038 Joseph', '02 565', 0, '2019-01-09 13:52:33', '', NULL),
(67, 'id exercitationem nisi', 'Laudantium necessitatibus eligendi molestias inventore voluptatem odit. Quo facere laudantium quia voluptates est perspiciatis. Odio et voluptatem perspiciatis molestiae eum.', 23, 3, 9, 9, 155398, 0, 'Bertrand-la-Forêt', '56, rue de Bonnet\n32 782 Mahe', '12846', 0, '2019-01-09 13:52:33', '', NULL),
(68, 'est fugiat et', 'Vel adipisci est rerum ex libero sapiente delectus corporis. Non voluptatibus natus esse dolores. Sapiente quo est ipsam quo atque fugiat.', 221, 9, 7, 6, 487901, 0, 'Moulin', '71, chemin de Lebon\n55 786 Chretien', '16 399', 0, '2019-01-09 13:52:33', '', NULL),
(69, 'asperiores est quasi', 'Fugit minus officiis nihil dolores. Ad aliquid minima inventore velit. Deserunt et tempore fugit dolorem.', 337, 2, 6, 0, 584669, 1, 'Albertnec', '45, rue de Laurent\n02 564 BazinBourg', '63447', 0, '2019-01-09 13:52:33', '', NULL),
(70, 'et ut quod', 'Doloribus rerum veritatis neque in. Sint placeat est est qui est sed maxime. Ab qui iusto distinctio voluptas fuga illum.', 188, 8, 6, 0, 245097, 1, 'Begue', '61, impasse Astrid Pires\n10250 Charrier', '90 525', 0, '2019-01-09 13:52:33', '', NULL),
(71, 'saepe facilis voluptatem', 'Vel quidem consectetur aut natus. Eos ut assumenda et nesciunt aperiam doloremque. Numquam consequatur praesentium vel officia et.', 246, 7, 5, 4, 505934, 0, 'Durand', 'chemin de Jacques\n23 589 Royer-les-Bains', '66608', 0, '2019-01-09 13:52:33', '', NULL),
(72, 'nemo et nemo', 'Eius id quis sunt aut illum ipsa dolores voluptate. Nihil repellendus deserunt inventore quia. In molestias consequatur omnis iusto aut ea ex.', 65, 2, 7, 4, 361417, 0, 'Lambertdan', '39, impasse Vallee\n95354 Evrard-sur-Hardy', '11 006', 0, '2019-01-09 13:52:33', '', NULL),
(73, 'maiores quod repellat', 'Quidem aperiam quis tenetur doloremque recusandae laborum. Dolore itaque et est placeat. Facilis occaecati minus qui repellat voluptatum.', 79, 4, 6, 6, 447085, 1, 'MartineauBourg', 'chemin Victor Delmas\n42484 Aubert', '42974', 0, '2019-01-09 13:52:33', '', NULL),
(74, 'alias totam quia', 'Sunt velit omnis eius asperiores quos aut. Asperiores sed sint at voluptas rem ut voluptas. Reprehenderit dicta voluptas nesciunt animi at quo similique.', 45, 4, 2, 6, 286292, 0, 'Auger-la-Forêt', '82, place Raynaud\n77 189 Bazin-sur-Barre', '16296', 0, '2019-01-09 13:52:33', '', NULL),
(75, 'ab maiores libero', 'Consequatur maiores hic ad voluptas. Blanditiis laborum odio fuga a vero veritatis. Aut et sequi quia quis.', 154, 4, 7, 5, 208857, 0, 'Godard', '96, avenue Gaudin\n03129 Mendes', '28 673', 0, '2019-01-09 13:52:33', '', NULL),
(76, 'reiciendis sapiente aut', 'Occaecati id amet nam sit. Voluptatem quasi dolor sint ut esse. Nam qui quis et quos est voluptatem.', 132, 4, 9, 6, 166591, 1, 'Leleuboeuf', '40, chemin de Guillot\n48 757 Rousseauboeuf', '44538', 0, '2019-01-09 13:52:33', '', NULL),
(77, 'cum velit sint', 'Pariatur et quae hic labore dolores rerum voluptates placeat. Veniam laboriosam quia maiores facere eum ut libero temporibus. Aliquam dolorum rerum quis sit eos in.', 318, 6, 2, 3, 223403, 1, 'ValentinVille', '317, avenue Cordier\n83771 Clerc', '78 711', 0, '2019-01-09 13:52:33', '', NULL),
(78, 'incidunt alias rerum', 'Omnis vel reiciendis facere. Magnam aspernatur nobis consectetur corrupti aut. Quia repellendus animi adipisci voluptatem quasi.', 241, 6, 7, 9, 572487, 1, 'Martin-sur-Albert', '52, rue Delmas\n23 696 Michel', '85 362', 0, '2019-01-09 13:52:33', '', NULL),
(79, 'dicta eveniet architecto', 'Harum dignissimos nulla dolor minus explicabo. Provident magni reprehenderit nesciunt qui. Aut quod quia cupiditate qui numquam.', 20, 7, 6, 7, 274515, 1, 'Massonnec', '13, avenue Juliette Giraud\n33 221 Guillot', '36865', 0, '2019-01-09 13:52:33', '', NULL),
(80, 'quam ipsum suscipit', 'A maiores deserunt blanditiis incidunt rem. Commodi iste occaecati numquam qui sit et. Quis velit beatae eum voluptatum quasi.', 94, 4, 2, 0, 581759, 1, 'Delannoy', '4, place Guyot\n55 003 Ruiz', '75 563', 0, '2019-01-09 13:52:33', '', NULL),
(81, 'et magnam nostrum', 'Incidunt sunt eum sequi nihil quasi. Illum dolor possimus et accusantium cumque ullam minima tempore. Labore blanditiis ratione cum ipsam dolorum.', 181, 5, 9, 9, 365456, 0, 'Leroy-sur-Fernandes', '572, avenue Nguyen\n31323 Leleu', '74 458', 0, '2019-01-09 13:52:33', '', NULL),
(82, 'qui rerum cupiditate', 'Magni consequuntur sint nobis qui. Omnis deleniti inventore quis similique ipsa quaerat. Aut rerum et rerum aperiam eum.', 116, 3, 4, 7, 530075, 1, 'Carre', 'chemin Gaudin\n20840 Evrard-les-Bains', '66106', 0, '2019-01-09 13:52:33', '', NULL),
(83, 'repellat iusto iusto', 'Alias minima accusantium repellendus qui tempore accusamus deleniti. Cumque consequuntur fugit iure ipsam. Fuga quia quia ex quia quae quos.', 289, 2, 5, 2, 274094, 1, 'Lelievre-la-Forêt', '85, avenue de Poirier\n51 800 Perrier', '73 644', 0, '2019-01-09 13:52:33', '', NULL),
(84, 'et cumque omnis', 'A modi consectetur deleniti. Laudantium dolorem ex eos sapiente consectetur. Fugit odio ea tempore sit molestiae illo inventore.', 315, 8, 8, 2, 90409, 0, 'Blotnec', '5, boulevard de Chretien\n42 917 Georges', '70 858', 0, '2019-01-09 13:52:33', '', NULL),
(85, 'ipsum doloribus ea', 'Velit omnis dicta fuga quia doloribus explicabo explicabo aut. Iure dicta commodi atque qui eius. Et omnis alias nihil quae adipisci.', 298, 5, 9, 0, 344344, 0, 'Techer', '644, rue de Aubry\n54 219 BlanchardVille', '37603', 0, '2019-01-09 13:52:33', '', NULL),
(86, 'modi tempore assumenda', 'Nam iure aut eveniet nulla quisquam. Quod maiores autem voluptate aperiam explicabo. Ratione dicta non nesciunt nihil dignissimos enim facere.', 213, 4, 6, 4, 306237, 0, 'Ruiz-la-Forêt', '43, place de Duval\n26210 Lefevre-la-Forêt', '27387', 0, '2019-01-09 13:52:33', '', NULL),
(87, 'fuga aliquid non', 'Quia repellat ab libero impedit impedit quasi. Qui laborum dolor ratione sed. Et optio quasi quis.', 51, 4, 6, 10, 62251, 0, 'Vasseur', '24, place Begue\n08684 OllivierBourg', '47 123', 0, '2019-01-09 13:52:33', '', NULL),
(88, 'quia suscipit rerum', 'Enim fuga dolore saepe ipsam ab sit assumenda dolor. Laudantium in aperiam et dolore qui. Consequatur ut quia labore dolores vero.', 124, 7, 4, 3, 375561, 0, 'Martel-sur-Mer', '651, avenue de Gregoire\n84 998 Baudry-sur-Hebert', '86552', 0, '2019-01-09 13:52:33', '', NULL),
(89, 'autem quo et', 'Alias ut voluptate suscipit saepe perspiciatis. Ea reiciendis ut velit et. Aperiam ex necessitatibus sed fugiat.', 250, 4, 9, 5, 500608, 0, 'Evrard', '8, boulevard Becker\n58 557 Riou', '20 258', 0, '2019-01-09 13:52:33', '', NULL),
(90, 'temporibus et doloribus', 'Natus expedita suscipit repudiandae et. Ducimus ea quia est officiis. Quam et harum cumque aut veniam eveniet sed.', 58, 8, 4, 8, 288239, 1, 'Mahenec', '93, avenue Dupont\n31283 Richard', '97650', 0, '2019-01-09 13:52:33', '', NULL),
(91, 'eos qui dolorem', 'Pariatur beatae et mollitia voluptates hic ut dignissimos. Mollitia inventore consequatur totam iste voluptatem et. Quidem ut cumque vel molestiae officia eum.', 241, 5, 8, 4, 93604, 1, 'Dupuy', '45, boulevard de Perrin\n42 747 Maurice', '35 496', 0, '2019-01-09 13:52:33', '', NULL),
(92, 'similique repellendus alias', 'Distinctio est omnis quibusdam odio cumque odit. Nulla sint neque quo. Fugit est impedit aperiam eius qui et.', 309, 9, 7, 5, 311148, 1, 'Hernandez-sur-Benoit', '43, chemin Hamon\n95 806 Perez', '48427', 0, '2019-01-09 13:52:33', '', NULL),
(93, 'iure sunt aut', 'Dolores ex excepturi ut perspiciatis veniam. Repudiandae ad ex doloremque. Rerum quia doloremque et.', 115, 3, 2, 10, 465318, 0, 'Berger', '54, rue de Raynaud\n59 776 Lebrun', '04390', 0, '2019-01-09 13:52:33', '', NULL),
(94, 'fugiat et aut', 'Modi voluptas sed consequatur. Et mollitia quo blanditiis molestiae nihil fugiat qui enim. Dolor eveniet non et maiores temporibus temporibus.', 103, 2, 8, 2, 480869, 0, 'GaillardBourg', '82, place de Foucher\n60 614 Baudry-la-Forêt', '72 621', 0, '2019-01-09 13:52:33', '', NULL),
(95, 'aut dolorem magnam', 'Eum molestiae sed qui et officiis. Non ut veritatis ipsa perspiciatis ut omnis ullam quia. Reiciendis eos ut porro quasi molestias ut consectetur ut.', 203, 7, 9, 1, 369234, 0, 'Leroux-les-Bains', '38, rue Riviere\n71 304 Nicolas', '41474', 0, '2019-01-09 13:52:33', '', NULL),
(96, 'eaque beatae enim', 'Itaque numquam placeat quasi aspernatur neque. Ad facilis nobis velit dolores maxime dolor ut impedit. Minus vel molestiae quo vitae ut rerum quia.', 76, 4, 7, 10, 110905, 0, 'Bertindan', '623, rue Marcel Mathieu\n67790 Lambert', '89236', 0, '2019-01-09 13:52:33', '', NULL),
(97, 'eum vero id', 'Voluptatibus ducimus non quam magni. Et et ut dolores omnis voluptatem. Assumenda quia eum nam voluptas mollitia eaque est.', 152, 5, 9, 8, 440347, 0, 'Nicolas', '70, place Alfred Guillon\n72 728 Martin', '47 838', 0, '2019-01-09 13:52:33', '', NULL),
(98, 'placeat placeat sint', 'Omnis consequuntur dolorum suscipit. Et ut voluptate voluptatem consequatur explicabo minus voluptatem. Non corporis corporis soluta sequi omnis a.', 269, 10, 6, 3, 117951, 1, 'Pruvost', '88, place Timothée Gaudin\n85159 Prevost', '60352', 0, '2019-01-09 13:52:33', '', NULL),
(99, 'veniam sunt placeat', 'Quo consectetur commodi velit et est voluptate veniam. Vel sint iste omnis itaque blanditiis nihil. Qui illo nesciunt aliquam itaque deserunt quia excepturi.', 89, 10, 8, 7, 57852, 0, 'Levydan', '92, chemin Bertrand\n26238 Loiseau', '96482', 0, '2019-01-09 13:52:33', '', NULL),
(100, 'accusantium dolor rerum', 'Quisquam saepe dolorem maiores ducimus numquam magni iste. Rerum fuga dicta quaerat consequuntur adipisci. Recusandae sit et quod libero sapiente fugiat.', 36, 3, 5, 7, 200354, 1, 'Maury', '54, chemin Gaillard\n50043 Paris', '95492', 0, '2019-01-09 13:52:33', '', NULL),
(101, 'occaecati veniam repellendus', 'Minima et sit aliquid eligendi id dolore et corrupti. Ratione iste perspiciatis aliquam. Ea et pariatur dolorum voluptate quos voluptas aperiam non.', 222, 6, 9, 7, 127319, 1, 'Giraud', '52, impasse Marine Mahe\n79 871 Jolyboeuf', '69 188', 0, '2019-01-09 13:52:33', '', NULL),
(102, 'temporibus in amet', 'Sit excepturi et cupiditate. Aut quod consectetur incidunt. Ut distinctio est doloremque illo asperiores numquam quos itaque.', 234, 5, 2, 1, 435682, 1, 'Allard', '22, impasse Eugène Joseph\n23962 TexierVille', '11 560', 0, '2019-01-09 13:52:33', '', NULL),
(103, 'accusantium quasi unde', 'Adipisci voluptas corporis fuga accusamus. Nobis nostrum deserunt aut ducimus exercitationem minima. Eum repudiandae rerum ut accusantium qui accusamus.', 190, 6, 5, 5, 492821, 1, 'Munoz', '377, avenue Duval\n74 346 Teixeira-sur-Dupuy', '54261', 0, '2019-01-09 13:52:33', '', NULL),
(104, 'esse iure quos', 'Praesentium ab quas corrupti quia eos mollitia aut. Est quia quam ab autem nisi. Omnis quisquam adipisci sed vel.', 190, 6, 6, 10, 52903, 0, 'GalletVille', '48, chemin de Lucas\n68 894 Bessondan', '68 214', 0, '2019-01-09 13:52:33', '', NULL),
(105, 'ut aut omnis', 'Dolorum similique et nihil reiciendis. Ipsa aut occaecati et consequuntur numquam voluptatem. Non sit est quaerat nihil ad blanditiis libero qui.', 301, 5, 9, 3, 126705, 0, 'Boutin', '8, rue Roux\n09662 Lamy', '85174', 0, '2019-01-09 13:52:33', '', NULL),
(106, 'ullam et soluta', 'Excepturi est est dicta explicabo ab quibusdam. Doloribus ex laboriosam repudiandae illum dolorem. Necessitatibus et at cum aliquam vel exercitationem.', 338, 9, 9, 1, 286593, 0, 'Brun', '11, avenue de Muller\n63425 Maillard-sur-Moreau', '70 503', 0, '2019-01-09 13:52:33', '', NULL),
(107, 'hic quod ex', 'Ducimus non iste et fugit minima aut necessitatibus. Id quasi consequatur voluptatum nulla totam amet sint ipsam. In aperiam veritatis explicabo soluta.', 162, 2, 5, 4, 356043, 0, 'Chartier', '80, chemin de Lombard\n64 539 Lambert', '04 309', 0, '2019-01-09 13:52:33', '', NULL),
(108, 'totam est dolore', 'Sit dolores cupiditate ipsa hic in perspiciatis voluptas dicta. Autem possimus voluptas velit laboriosam voluptatum. Eos cum voluptates voluptatum eum.', 102, 5, 7, 6, 55729, 1, 'Bertrand', '95, impasse Pascal\n36708 Bourgeois', '98 487', 0, '2019-01-09 13:52:33', '', NULL),
(109, 'similique nulla aut', 'Ut qui vero rem et earum vel sed est. Qui est qui ut doloremque molestias. Ut ut accusamus molestiae voluptate neque.', 196, 4, 4, 6, 353998, 1, 'Potier', '136, impasse Gilbert\n13887 Rousseau-sur-Collin', '07 404', 0, '2019-01-09 13:52:33', '', NULL),
(110, 'voluptas nihil dolores', 'Distinctio labore reiciendis laudantium esse et. Est ab molestias quis eveniet et. Minus aut ipsa est labore labore sint voluptatem.', 70, 6, 3, 7, 278010, 1, 'BretonBourg', '39, impasse Marin\n01242 ParisBourg', '85 980', 0, '2019-01-09 13:52:33', '', NULL),
(111, 'sed et sed', 'Qui eveniet nemo accusantium porro a occaecati ut. Sed voluptatem ad sapiente neque molestiae dolore similique. Necessitatibus deleniti veritatis quisquam culpa et nihil qui.', 327, 5, 4, 5, 348261, 0, 'Benard-la-Forêt', '17, avenue Augustin Guillot\n92 365 Lemonnier-sur-Masse', '39511', 0, '2019-01-09 13:52:33', '', NULL),
(112, 'earum qui vitae', 'Nesciunt exercitationem nostrum a et enim voluptatibus ut. Dolor id necessitatibus excepturi aut deserunt repudiandae. Rerum eveniet dolorem aut iure.', 306, 8, 8, 2, 170429, 1, 'Petitjeandan', '36, boulevard Le Roux\n75495 Collin', '67 712', 0, '2019-01-09 13:52:33', '', NULL),
(113, 'Duplex', NULL, 14, 4, 5, 3, 100000, 0, 'Tassin-la-Demi-Lune', '23 avenue de Lauterbourg', '69160', 0, '2019-01-10 17:04:20', '5c38ac665db59717373810.jpg', '2019-01-11 14:47:02');

-- --------------------------------------------------------

--
-- Structure de la table `property_option`
--

DROP TABLE IF EXISTS `property_option`;
CREATE TABLE IF NOT EXISTS `property_option` (
  `property_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`property_id`,`option_id`),
  KEY `IDX_24F16FCC549213EC` (`property_id`),
  KEY `IDX_24F16FCCA7C41D6F` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property_option`
--

INSERT INTO `property_option` (`property_id`, `option_id`) VALUES
(13, 1),
(13, 3),
(14, 2),
(15, 1),
(15, 2),
(15, 3),
(16, 2),
(20, 2),
(113, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(3, 'Faresse', '$2y$12$k8MZbHseUgKhwBh3fuSBq.pNEvzunP8YGLs4FnFqPN46eqwTcHe8W');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `property_option`
--
ALTER TABLE `property_option`
  ADD CONSTRAINT `FK_24F16FCC549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_24F16FCCA7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
