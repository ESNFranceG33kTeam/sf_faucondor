-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 14 Décembre 2015 à 23:26
-- Version du serveur :  5.6.26
-- Version de PHP :  5.5.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `faucondor_dev`
--

-- --------------------------------------------------------

--
-- Structure de la table `committee`
--

CREATE TABLE `committee` (
  `id` int(11) NOT NULL,
  `chair_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `committee`
--

INSERT INTO `committee` (`id`, `chair_id`, `name`, `createdat`) VALUES
(1, 11, 'G33kTeam', '2011-12-25 00:11:00'),
(3, 7, 'Animation du réseau', '2006-12-24 00:11:00'),
(6, 10, 'Recherche et Éducation', '2011-12-25 00:11:00'),
(7, 8, 'ComCom', '2013-12-22 00:11:00'),
(8, 9, 'International', '2013-12-22 00:11:00'),
(9, 12, 'Trésorerie & Partnership Management', '2013-12-22 00:11:00');

-- --------------------------------------------------------

--
-- Structure de la table `committee_user`
--

CREATE TABLE `committee_user` (
  `committee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `committee_user`
--

INSERT INTO `committee_user` (`committee_id`, `user_id`) VALUES
(1, 1),
(1, 11),
(3, 1),
(3, 7),
(6, 10);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `events`
--

INSERT INTO `events` (`id`, `name`, `start`, `end`) VALUES
(3, 'AG Lille', '2014-12-21 00:11:00', '2014-12-21 00:11:00'),
(4, 'NP Clermont', '2014-06-01 00:00:00', '0000-00-00 00:00:00'),
(5, 'AG Toulouse', '2014-02-21 00:00:00', '0000-00-00 00:00:00'),
(6, 'NP Rennes', '2013-10-01 00:00:00', '0000-00-00 00:00:00'),
(7, 'NP Nice', '2013-06-01 00:00:00', '0000-00-00 00:00:00'),
(9, 'AGM Milano', '2014-04-03 00:00:00', '0000-00-00 00:00:00'),
(10, 'NP Assas', '2014-10-10 00:00:00', '0000-00-00 00:00:00'),
(11, 'WEP Utrecht', '2014-10-16 00:00:00', '0000-00-00 00:00:00'),
(12, 'SWEP Minho', '2014-10-23 00:00:00', '0000-00-00 00:00:00'),
(13, 'AG Valenciennes', '2015-02-21 00:00:00', '0000-00-00 00:00:00'),
(14, 'NP Nancy', '2015-06-07 00:00:00', '0000-00-00 00:00:00'),
(15, 'AGM Ankara', '2015-04-16 00:00:00', '0000-00-00 00:00:00'),
(16, 'NP Montpellier', '2015-11-02 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `fo_user`
--

CREATE TABLE `fo_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `galaxy_roles` longtext COLLATE utf8_unicode_ci,
  `galaxy_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `emailgalaxy` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fo_user`
--

INSERT INTO `fo_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `firstname`, `lastname`, `address`, `city`, `zipcode`, `galaxy_roles`, `galaxy_picture`, `birthdate`, `gender`, `mobile`, `section_id`, `emailgalaxy`) VALUES
(1, 'jeremie.samson@ix.esnlille.fr', 'jeremie.samson@ix.esnlille.fr', 'jeremie.samson@ix.esnlille.fr', 'jeremie.samson@ix.esnlille.fr', 1, 'lt7sno18mxsg0sck8o84s4oowck4ksc', '$2y$13$lt7sno18mxsg0sck8o84suFf2voR628KWdijY2GfsKLpNbkdi0nMa', '2015-12-14 22:29:28', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, 'Jeremie', 'Samson', NULL, NULL, NULL, 'authenticated user,National.webmaster,Local.activeMember,Local.regularBoardMember,Local.webmaster', 'http://accounts.esn.org/sites/galaxy.esn.org/files/avatars/picture-13336.jpg', '1989-12-20', 'M', '0613303219', 223, ''),
(3, 'rl@esnlille.fr', 'rl@esnlille.fr', 'rl@esnlille.fr', 'rl@esnlille.fr', 0, 'j3m1jf10dk8oswkw0oo0s0cwo4o0ggs', '$2y$13$j3m1jf10dk8oswkw0oo0suFMExmFTg.5oHixzEWwGZQHwmCPPNWrm', '2015-12-01 21:26:30', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Tiphaine', 'Tournay', NULL, NULL, NULL, 'authenticated user,Local.activeMember,Local.regularBoardMember,Local.localRepresentative', NULL, '2015-12-02', 'F', '0612775758', 223, ''),
(4, 'president@ixesn.fr', 'president@ixesn.fr', 'president@ixesn.fr', 'president@ixesn.fr', 0, '48zx26swlbs4oc48ococsgcw04sg0sw', '$2y$13$48zx26swlbs4oc48ococse4y7DOOkxAOEWU5DRGkglBrxL9zUbT2W', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Sarah', 'Holveck', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 101, ''),
(5, 'president@esnlille.fr', 'president@esnlille.fr', 'president@esnlille.fr', 'president@esnlille.fr', 0, 'sm9po609acggckowwk0sw880wwgw4k0', '$2y$13$sm9po609acggckowwk0swuT3ViE5j40nSvvCttsSDuqQ9reUe06lC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Nassim', 'Abderrahim', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 223, ''),
(7, 'adr@ixesn.fr', 'adr@ixesn.fr', 'adr@ixesn.fr', 'adr@ixesn.fr', 0, 'l1msvr399qo88k44wc880wk0ok4oo84', '$2y$13$l1msvr399qo88k44wc880u8ytAt.YIImkO5qTkdMd6A5ouYEW2.oi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Lenny', 'Baha', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 234, ''),
(8, 'tiphaine.stolorz@gmail.com', 'tiphaine.stolorz@gmail.com', 'tiphaine.stolorz@gmail.com', 'tiphaine.stolorz@gmail.com', 0, 'o0q33d4vf1ck8g8kc8c44scgkgcgcso', '$2y$13$o0q33d4vf1ck8g8kc8c44eKsNYx50a6ccAnYsuAgxeL0cgpARsfKG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Tiphaine', 'Stolorz', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 266, ''),
(9, 'international@ixesn.fr', 'international@ixesn.fr', 'international@ixesn.fr', 'international@ixesn.fr', 0, 'i7nfhzvyv8ggosc8sgocwwco0c4sw4w', '$2y$13$i7nfhzvyv8ggosc8sgocwumUtrOlQHQFUUSIjf86Q5m/L008khRja', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Gregory', 'Elard', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 304, ''),
(10, 'education@ixesn.fr', 'education@ixesn.fr', 'education@ixesn.fr', 'education@ixesn.fr', 0, 'g4m9205o9k0gkwswgso484ogowg00sc', '$2y$13$g4m9205o9k0gkwswgso48uOCGLj46AWjejcO4WEXK3GUZLkgN2SpS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Salomé', 'Morin', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 5, ''),
(11, 'geeks@ixesn.fr', 'geeks@ixesn.fr', 'geeks@ixesn.fr', 'geeks@ixesn.fr', 0, 'akw90zisn6ogc0s4ko84wccwgg8ks8w', '$2y$13$akw90zisn6ogc0s4ko84wOVRqwWeEanY4wQmCTxF5vcScLUnbgr9C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Hassan', 'Alami', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 101, ''),
(12, 'camille.eurin@gmail.com', 'camille.eurin@gmail.com', 'camille.eurin@gmail.com', 'camille.eurin@gmail.com', 1, '84hpifp0mk4c84scog0csck4wg84404', '$2y$13$84hpifp0mk4c84scog0csOD3Ob.m1rHpz.LFj9LlGzWaTe0ILTyeW', '2015-12-01 20:23:31', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Camille', 'Eurin', NULL, NULL, NULL, 'authenticated user,Local.alumnus,National.alumnus', 'http://accounts.esn.org/sites/galaxy.esn.org/files/avatars/picture-8959.jpg', '1987-07-24', 'M', '+33680525789', 223, ''),
(13, 'mass_76@hotmail.fr', 'mass_76@hotmail.fr', 'mass_76@hotmail.fr', 'mass_76@hotmail.fr', 1, 'jbdjda1253ww808wokkssocsoo04sg0', '$2y$13$jbdjda1253ww808wokksse6odqOmoLEOl/pY4V8bhaf/.tFFu4G9a', '2015-12-01 21:14:36', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Mamadou', 'Diop', NULL, NULL, NULL, 'authenticated user,National.webmaster,Local.activeMember', 'http://accounts.esn.org/sites/galaxy.esn.org/files/avatars/picture-15687.jpg', '1991-11-02', 'M', NULL, 223, ''),
(14, 'se@esnlille.fr', 'se@esnlille.fr', 'julie.helin@ix.esnlille.fr', 'julie.helin@ix.esnlille.fr', 0, 'mel5k8wfwdw8go84g4c8k0oggk0gkgk', '$2y$13$mel5k8wfwdw8go84g4c8ku.xbv9XUzMGrzAJCFJ.RzCQl1Oit3Uxu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Julie', 'Hélin', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0633339437', 223, ''),
(16, 'aneta.cira@esnlille.fr', 'aneta.cira@esnlille.fr', 'aneta.cira@esnlille.fr', 'aneta.cira@esnlille.fr', 0, 'rbfa7hypd1c4ogw48os8s80ss0cc8gg', '$2y$13$rbfa7hypd1c4ogw48os8sualQuj/X2l/nYMVshaj2C/gWYemONuaG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Aneta', 'Cira', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0782460623', 223, ''),
(17, 'vp@esnlille.fr', 'vp@esnlille.fr', 'vp@esnlille.fr', 'vp@esnlille.fr', 0, 'mdjj6ff54sg0ogw4g408o8k0wo8o48c', '$2y$13$mdjj6ff54sg0ogw4g408ouHuhnonYGyoXZ6fU4lbOW1VwGHeAufv2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Anis', 'Roux', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0637561138', 223, ''),
(18, 'tresorier@esnlille.fr', 'tresorier@esnlille.fr', 'tresorier@esnlille.fr', 'tresorier@esnlille.fr', 0, 'f659j8fp33swo4w8wwkcwcco0k04k04', '$2y$13$f659j8fp33swo4w8wwkcwOljUEbxZl6nX3FP98THCN7Mz.s2viswO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Audrey', 'Fournier', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 223, ''),
(20, 'benjamin.makusa@gmail.com', 'benjamin.makusa@gmail.com', 'benjamin.makusa@gmail.com', 'benjamin.makusa@gmail.com', 0, 'oqd61e9a37kwc44084w888k80owg4cg', '$2y$13$oqd61e9a37kwc44084w88uErRZ3eP8vfx/TB47JZrpB9ExY3UHUn6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Benjamin', 'Makusa', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0611855959', 223, ''),
(21, 'coralie.evrard98@gmail.com', 'coralie.evrard98@gmail.com', 'coralie.evrard98@gmail.com', 'coralie.evrard98@gmail.com', 0, 'qtezor8ns2s40soo404kk48sscs8gog', '$2y$13$qtezor8ns2s40soo404kkuqHjcVvHLiVg.ysTQZ9Xzpm0Pvroq6ia', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Coralie', 'Evrard', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0682018221', 223, ''),
(22, 'fanny.cuzon@yahoo.fr', 'fanny.cuzon@yahoo.fr', 'fanny.cuzon@yahoo.fr', 'fanny.cuzon@yahoo.fr', 0, 'bnlj7ezkwzk0s0g4k4ogscoggsgkcgw', '$2y$13$bnlj7ezkwzk0s0g4k4ogsO5xcYWLAE1yA1vo.lGIToDlkldsr6AGO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Fanny', 'Cuzon', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0664541904', 223, ''),
(23, 'lille@ixesn.fr', 'lille@ixesn.fr', 'lille@ixesn.fr', 'lille@ixesn.fr', 0, '5fiuw0iua9gcs8gsw80okgkowgg4wkc', '$2y$13$5fiuw0iua9gcs8gsw80okeXUOEMO/GRnVex2IffZOVJn7Ce5l107C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Oussama', 'Belouki', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0601407730', 223, ''),
(24, 'pierre.morette@laposte.net', 'pierre.morette@laposte.net', 'pierre.morette@laposte.net', 'pierre.morette@laposte.net', 0, 'mjqzr86gflcs4cw0cwgs8gs8o4gwg4o', '$2y$13$mjqzr86gflcs4cw0cwgs8eqODBwQKgnEibimU/lCEse.bvbx78aZ.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Pierre', 'Morette', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0674973980', 223, ''),
(25, 'laetitia.briscese@gmail.com', 'laetitia.briscese@gmail.com', 'laetitia.briscese@gmail.com', 'laetitia.briscese@gmail.com', 0, '1s11s3yxkfb480kwg84oosoooosc8ok', '$2y$13$1s11s3yxkfb480kwg84ooeWsuy/5iOro.veUsSKsJ.LIa9RHy5a16', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Laëtitia', 'Briscese', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0627484152', 44, ''),
(26, 'antoniniflorian@gmail.com', 'antoniniflorian@gmail.com', 'antoniniflorian@gmail.com', 'antoniniflorian@gmail.com', 0, '6wax0r4qnjc4880gco4wkogw0cg0kg4', '$2y$13$6wax0r4qnjc4880gco4wke1K3Re0fOj1KX5G8zFoIIQ0T5yZmLKdK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Florian', 'Antonini', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0668412725', 8, ''),
(27, 'tresorier@cosmolyon.com', 'tresorier@cosmolyon.com', 'tresorier@cosmolyon.com', 'tresorier@cosmolyon.com', 0, 'fbwzpoxuqrs4kckog4kg8ogcgg0wgsg', '$2y$13$fbwzpoxuqrs4kckog4kg8eLY9oHYfu9Q1THamXihOI2pTlmFhkC4K', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Affandi', 'Sidi', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 234, ''),
(28, 'president@cosmolyon.com', 'president@cosmolyon.com', 'president@cosmolyon.com', 'president@cosmolyon.com', 0, 'j9av8mwp5woow8wkscwgc8ss8o0gk0o', '$2y$13$j9av8mwp5woow8wkscwgcufcOW1VfxJuvFqdSBJajc6SH15/V2Cli', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Barthélémy', 'Piana', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 234, ''),
(29, 'representantlocal@cosmolyon.com', 'representantlocal@cosmolyon.com', 'representantlocal@cosmolyon.com', 'representantlocal@cosmolyon.com', 0, 'bk9166xe0bccowsgsg4sog04cs8gk44', '$2y$13$bk9166xe0bccowsgsg4soer3ENbzEmQ2rw7.Jgiu/lY8tNnF8wMN.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Laura', 'Masi', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 234, ''),
(30, 'Communication@cosmolyon.com', 'communication@cosmolyon.com', 'Communication@cosmolyon.com', 'communication@cosmolyon.com', 0, '5q38es9kv3k888cc8os4cwgcc4s84k4', '$2y$13$5q38es9kv3k888cc8os4cuIQet0Vd/weV3A/MrX59tvyGYCfhnHGe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Manon', 'Garcia', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 234, ''),
(31, 'contact@cosmolyon.com', 'contact@cosmolyon.com', 'contact@cosmolyon.com', 'contact@cosmolyon.com', 0, 'x4x8d61v86s844088swo8cg0sgswgs', '$2y$13$x4x8d61v86s844088swo8ObN/Bj45ufgIuNrOhGOVo/OXNIm6ajum', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Mélanie', 'Bordonaro', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 234, ''),
(32, 'vicepresident@cosmolyon.com', 'vicepresident@cosmolyon.com', 'vicepresident@cosmolyon.com', 'vicepresident@cosmolyon.com', 0, '2916q4kk6v6scgc000g8ggcsc4k4swo', '$2y$13$2916q4kk6v6scgc000g8gefSep0pLn.qDdUW5N6ZW3EVKesxVzxC6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Perrine', 'Laurent', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 234, ''),
(33, 'vice-president@ereimsmus.org', 'vice-president@ereimsmus.org', 'vice-president@ereimsmus.org', 'vice-president@ereimsmus.org', 0, 'p0q1xx297twww84g44kcs8ksw004oc8', '$2y$13$p0q1xx297twww84g44kcsuG/ljoURBcbWjfWJxoiE2LblOM6YOWdq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Audrey', 'James', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 471, ''),
(34, 'secretaire@ereimsmus.org', 'secretaire@ereimsmus.org', 'secretaire@ereimsmus.org', 'secretaire@ereimsmus.org', 0, '5qzf4vx8bfggg80so44w8ko0os4w8c0', '$2y$13$5qzf4vx8bfggg80so44w8elXdblpmorSoiv.3HVB6bEs14sZ9rXyu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Cyrielle', 'Arcos', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 471, ''),
(35, 'tresorier@ereimsmus.org', 'tresorier@ereimsmus.org', 'tresorier@ereimsmus.org', 'tresorier@ereimsmus.org', 0, '5o79kixvxa4gs8kkk8o8ks08o0sow4k', '$2y$13$5o79kixvxa4gs8kkk8o8keDH3s1xrsvpfPhHL.1kKyhh3yjBMo2Zi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Éléonore', 'Dejonghe', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 471, ''),
(36, 'rl@ereimsmus.org', 'rl@ereimsmus.org', 'rl@ereimsmus.org', 'rl@ereimsmus.org', 0, 'nn4020khg0gckok8okck0ws8ogkccw8', '$2y$13$nn4020khg0gckok8okck0uXiLkBZVhLFLvD3QADcGly12Nj63T8Sm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Marie', 'Hennequin', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 471, ''),
(37, 'president@ereimsmus.org', 'president@ereimsmus.org', 'president@ereimsmus.org', 'president@ereimsmus.org', 0, 'hl5mnytn05c0cockk4skc4oc88wscok', '$2y$13$hl5mnytn05c0cockk4skcuc1jULdF8VK6.N4dc/xVDLNxGiPX5mba', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Marie', 'Sauvage', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 471, ''),
(38, 'j.deribaut@hotmail.fr', 'j.deribaut@hotmail.fr', 'j.deribaut@hotmail.fr', 'j.deribaut@hotmail.fr', 0, 'rghf43kqyyo0wos8co0sso04s4g80cc', '$2y$13$rghf43kqyyo0wos8co0ssePavl8btqlCpEm4.Eguea6o7ObuWTOAS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Julie', 'De Ribaut', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 101, ''),
(39, 'marjorie.autret@hotmail.com', 'marjorie.autret@hotmail.com', 'marjorie.autret@hotmail.com', 'marjorie.autret@hotmail.com', 0, 'a5ad7m7afbk8w0w48kcc0s08s0cos4g', '$2y$13$a5ad7m7afbk8w0w48kcc0eyYoX88OAaZwUqXWeoVIqof154yMtT42', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Marjorie', 'Autret', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0630273377', 101, ''),
(40, 'mika89700@gmail.com', 'mika89700@gmail.com', 'mika89700@gmail.com', 'mika89700@gmail.com', 0, 'o9u7g32bsusog40o0kswowwsg0488g8', '$2y$13$o9u7g32bsusog40o0kswouLNY8g6IAddORGrHEMWjZ14cEKeboINO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Michaël', 'Rollin', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0676060243', 101, ''),
(41, 'pierrevicente@live.com', 'pierrevicente@live.com', 'pierrevicente@live.com', 'pierrevicente@live.com', 0, '5cxo451caj4s84kc0o448cc8wsswoow', '$2y$13$5cxo451caj4s84kc0o448OLUUiQkPbD2jF5c1Ony313TU7mf.6kP6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Pierre', 'Vincente', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0689380431', 101, ''),
(42, 'siraintxus@gmail.com', 'siraintxus@gmail.com', 'siraintxus@gmail.com', 'siraintxus@gmail.com', 0, 'q765grjge5cgwgc04k4g8owgkwo4owk', '$2y$13$q765grjge5cgwgc04k4g8eN9CO7MSk4LQwM7GynG2/paX89QSxJMa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Sira', 'Inchusta Carrillo', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0782781042', 101, ''),
(43, '3sonushka0@gmail.com', '3sonushka0@gmail.com', '3sonushka0@gmail.com', '3sonushka0@gmail.com', 0, 'l0mq2ve8rsgok0kkgkwss40ggkws44c', '$2y$13$l0mq2ve8rsgok0kkgkwssu7rDQRGmkwUi51uvAfgc5kpFwGqOO7bO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Sofia', 'Kudinova', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0641202931', 101, ''),
(44, 'wassimbella5@gmail.com', 'wassimbella5@gmail.com', 'wassimbella5@gmail.com', 'wassimbella5@gmail.com', 0, '7c9pbv88ohs00so4o008so8sscggs84', '$2y$13$7c9pbv88ohs00so4o008se5aOqh6XmTn6.X5Dc0t4nq9CDXOSb7WC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Wassim', 'Bella', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 101, ''),
(45, 'cafedeslanguesluminy@gmail.com', 'cafedeslanguesluminy@gmail.com', 'cafedeslanguesluminy@gmail.com', 'cafedeslanguesluminy@gmail.com', 0, 'bprgeddkids8w04cgo4kwsk48wocskk', '$2y$13$bprgeddkids8w04cgo4kweoKQYozw4ELaETySMkCPDeEokAXzdLRO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'cafedeslanguesluminy@gmail.com', 'Iezzi', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '+33751366636', 248, ''),
(46, 'tresorerie.esnmars@gmail.com', 'tresorerie.esnmars@gmail.com', 'tresorerie.esnmars@gmail.com', 'tresorerie.esnmars@gmail.com', 0, 'i6zqwo9rkyoksk080c40wg48www8oo4', '$2y$13$i6zqwo9rkyoksk080c40weZKi2KFmZ6x6UJgG3SZvqY2aqePpVkeS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Anne', 'Poulain', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '33770172927', 248, ''),
(47, 'presidence.esnmars@gmail.com', 'presidence.esnmars@gmail.com', 'presidence.esnmars@gmail.com', 'presidence.esnmars@gmail.com', 0, '96p6vzy0j9k4goc848ggg0cs8ckcwgs', '$2y$13$96p6vzy0j9k4goc848ggguc7pDWxzgShM6X4wDq0gfxXJojrxy1AO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Daveen-Alexander', 'Wingrove', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '+33613174860', 248, ''),
(48, 'secretaire.esnmars@gmail.com', 'secretaire.esnmars@gmail.com', 'secretaire.esnmars@gmail.com', 'secretaire.esnmars@gmail.com', 0, 'dvfhosoebls0k8o4okc4s848owsg4w', '$2y$13$dvfhosoebls0k8o4okc4su.ieXI4j5RUWlIeO1GgM7.Gsik5DrAxO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Mathias', 'Bonal', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '+33635107691', 248, ''),
(49, 'replocal.esnmars@gmail.com', 'replocal.esnmars@gmail.com', 'replocal.esnmars@gmail.com', 'replocal.esnmars@gmail.com', 0, 'f181zw6evbc4k8w4ooscow0ksg04000', '$2y$13$f181zw6evbc4k8w4ooscouUJsNSL2Ja7bDa4n/RScFGlUjY2h1UYS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Rômulo', 'Duarte', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '+ 33751109701', 248, ''),
(50, 'president@esnmontpellier.fr', 'president@esnmontpellier.fr', 'president@esnmontpellier.fr', 'president@esnmontpellier.fr', 0, '8jv015nirts0cc8o48wow4og84wc08w', '$2y$13$8jv015nirts0cc8o48wowuGeO7Y6McYkwRpvT5D3Ksxh7p/A7opeG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Arlémi', 'Turpault', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0617977536', 259, ''),
(51, 'dianedorier@hotmail.fr', 'dianedorier@hotmail.fr', 'dianedorier@hotmail.fr', 'dianedorier@hotmail.fr', 0, 'hjkig83l7dsg4gs8c8040kw08sso84k', '$2y$13$hjkig83l7dsg4gs8c8040eVzLXcE1TgnVTWWWEfOI6VMCmRUE3fVG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Diane', 'Dorier', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0650089401', 259, ''),
(52, 'contact@esnmontpellier.fr', 'contact@esnmontpellier.fr', 'contact@esnmontpellier.fr', 'contact@esnmontpellier.fr', 0, '6xala31oeescowccwgo84gk844ss8o0', '$2y$13$6xala31oeescowccwgo84efajh3WRX0bJBCyahWlyRcFx/J5o2crK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Marjorie', 'Fino', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0650967791', 259, ''),
(53, 'tresorier@esnmontpellier.fr', 'tresorier@esnmontpellier.fr', 'tresorier@esnmontpellier.fr', 'tresorier@esnmontpellier.fr', 0, 'h7na0qe1a4g0ww4cc8084cowwkok48k', '$2y$13$h7na0qe1a4g0ww4cc8084OYdwlKe9NQKocXAxKiUGd25NDLPl218.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Philippine', 'Ramirez', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0618460757', 259, ''),
(54, 'vp@esnmontpellier.fr', 'vp@esnmontpellier.fr', 'vp@esnmontpellier.fr', 'vp@esnmontpellier.fr', 0, '1xrwovn7h000wscg000088cgoco0coo', '$2y$13$1xrwovn7h000wscg00008uveyHtltDkxuQu1xTqCMoroQIkl8qErO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Sofie', 'Munsters', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0631624134', 259, ''),
(57, 'test@test.com', 'test@test.com', 'test@test.com', 'test@test.com', 1, '6p3gacw8a0gskkoc0k400w4oc84wwg4', '$2y$13$6p3gacw8a0gskkoc0k400u/oXwXkqzNFabXd4VNJ9lIBs1jRzsdT2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test@test.com'),
(58, 'test@te2st.com', 'test@te2st.com', 'test@te2st.com', 'test@te2st.com', 1, 'tdj4jsav8c0sc04oc84440oss4w8400', '$2y$13$tdj4jsav8c0sc04oc8444u7hrcR8dKTC7REUX5oKpMts8MnGVrFmK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test@te2st.com'),
(59, 'totogalax@toto.com', 'totogalax@toto.com', 'toto@toto.com', 'toto@toto.com', 1, 'a7mcz6ye8t4cokwsc0csgkc8gww4sgw', '$2y$13$a7mcz6ye8t4cokwsc0csgeQOICKkAYSJbo/jFHgIWnRxaeI/YxIoy', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'totogalax@toto.com'),
(60, 'totogalax2@toto.com', 'totogalax2@toto.com', 'totogalax2@toto.com', 'totogalax2@toto.com', 1, '5eo3bfvf8g00wg8kk444ck40ckokg8c', '$2y$13$5eo3bfvf8g00wg8kk444cebdFGjB7RtJAKKdgbf2zWqdGjiXAqjbK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Test', 'azeaze', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'totogalax2@toto.com'),
(61, 'vice-president@esnnancy.fr', 'vice-president@esnnancy.fr', 'vice-president@esnnancy.fr', 'vice-president@esnnancy.fr', 0, 'dq8yy3kun3wcsg4soscgoc4skwskoko', '$2y$13$dq8yy3kun3wcsg4soscgoOS6jIx1tm9.SJDqwgEKkmGV1yB7lv92C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Azra', 'Hayat-Vautrin', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 266, 'vice-president@esnnancy.fr'),
(62, 'president@esnnancy.fr', 'president@esnnancy.fr', 'president@esnnancy.fr', 'president@esnnancy.fr', 0, 'dkojhpnl5wgkcw4444o40wg40w8wook', '$2y$13$dkojhpnl5wgkcw4444o40uB3MRE05mCloxGx8UhJeFiszUq6DluAa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Bertrand', 'Kaufmann', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 266, 'president@esnnancy.fr'),
(63, 'tresorier@esnnancy.fr', 'tresorier@esnnancy.fr', 'tresorier@esnnancy.fr', 'tresorier@esnnancy.fr', 0, 'crkqt9hghr4k0ogwocggs08so8owokk', '$2y$13$crkqt9hghr4k0ogwocggsuK.VMY.v0QTj9tGjXe1NgDjshIZ6lawa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Carole', 'Eber', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 266, 'tresorier@esnnancy.fr'),
(64, 'communication@esnnancy.fr', 'communication@esnnancy.fr', 'communication@esnnancy.fr', 'communication@esnnancy.fr', 0, 'kkr1m2biyyo04go488044cw0ocgwcw4', '$2y$13$kkr1m2biyyo04go488044OzVZZ.iT5OeKpzZSWC2FHS2xtZsicg26', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Emma', 'Mirgain', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 266, 'communication@esnnancy.fr'),
(65, 'vp-partenariats@esnnancy.fr', 'vp-partenariats@esnnancy.fr', 'vp-partenariats@esnnancy.fr', 'vp-partenariats@esnnancy.fr', 0, '1a3g6lcnos4gcko4ok808ckoc8ckgsk', '$2y$13$1a3g6lcnos4gcko4ok808On3UiNkDHMPuMjMZdV5X0.MMplMGS/.O', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Inès', 'Jelassi', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 266, 'vp-partenariats@esnnancy.fr'),
(66, 'secretariat@esnnancy.fr', 'secretariat@esnnancy.fr', 'secretariat@esnnancy.fr', 'secretariat@esnnancy.fr', 0, 'l8xi7inpe1w44wwcw8w8wokgg0s8sck', '$2y$13$l8xi7inpe1w44wwcw8w8wexsFp2OFEEQkpDz3QsuMjXkrohvYmiSO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Marie', 'Courier', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 266, 'secretariat@esnnancy.fr'),
(67, 'webmaster@esnnancy.fr', 'webmaster@esnnancy.fr', 'webmaster@esnnancy.fr', 'webmaster@esnnancy.fr', 0, 'mxj2xiycavk84004gc0wwkw8ok0c4cs', '$2y$13$mxj2xiycavk84004gc0wweqShfGIiOBjeMTMrT7NmmBvTZbzLVFry', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Rudy', 'Hoarau', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 266, 'webmaster@esnnancy.fr'),
(68, 'representant-local@esnnancy.fr', 'representant-local@esnnancy.fr', 'representant-local@esnnancy.fr', 'representant-local@esnnancy.fr', 0, '5ozclw2bv6o0o44co4444s8k0o0oo04', '$2y$13$5ozclw2bv6o0o44co4444e3cOyg.0ZXKzB/EusmUQIHzwouRQOUZ6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Tiphaine', 'Stolorz', NULL, NULL, NULL, NULL, NULL, NULL, 'F', NULL, 266, 'representant-local@esnnancy.fr'),
(69, 'griachejeremy@gmail.com', 'griachejeremy@gmail.com', 'griachejeremy@gmail.com', 'griachejeremy@gmail.com', 0, 'qol4kcu3b9cwwc8gc4wsog8okcw4gsg', '$2y$13$qol4kcu3b9cwwc8gc4wsoeEFs9pI2jf.d6cRolIpGHaC9WD9rrqLi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Jérémy', 'Griache', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0783530503', 277, 'griachejeremy@gmail.com'),
(70, 'mandalorr@gmail.com', 'mandalorr@gmail.com', 'mandalorr@gmail.com', 'mandalorr@gmail.com', 0, 'r7fb9tccb34g0ow8wwwwcs808g8k448', '$2y$13$r7fb9tccb34g0ow8wwwwce3jmysJU/LxyqfXA78WWzgZ.B4aq89u6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Julien', 'Guiller', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0686158430', 277, 'mandalorr@gmail.com'),
(71, 'mailan.le04@gmail.com', 'mailan.le04@gmail.com', 'mailan.le04@gmail.com', 'mailan.le04@gmail.com', 0, 'jhyb3xitknwwcg48kwowwkgg08sw88o', '$2y$13$jhyb3xitknwwcg48kwowweiFow038Va/VdTbtkF62JYo1IJTDnDrG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Mai Lan', 'Lê', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0601178734', 277, 'mailan.le04@gmail.com'),
(72, 'marine_rousseau@hotmail.fr', 'marine_rousseau@hotmail.fr', 'marine_rousseau@hotmail.fr', 'marine_rousseau@hotmail.fr', 0, '1zjal5vibt1c4wswcs00sksc4w0ss44', '$2y$13$1zjal5vibt1c4wswcs00seFFozTLAmW3HiHN4LIHLUF7O3h2S8lcS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Marine', 'Rousseau', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0637682597', 277, 'marine_rousseau@hotmail.fr'),
(73, 'esnorleans.rl@gmail.com', 'esnorleans.rl@gmail.com', 'esnorleans.rl@gmail.com', 'esnorleans.rl@gmail.com', 0, '4y5849u99n8cgs0ggokwg0cksw80sko', '$2y$13$4y5849u99n8cgs0ggokwguypVxvgFwRP.nA9AOHmPO1Nu2fDQaVee', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Pierre', 'Virmoux', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0665018393', 277, 'esnorleans.rl@gmail.com'),
(74, 'rl.esnassas@gmail.com', 'rl.esnassas@gmail.com', 'rl.esnassas@gmail.com', 'rl.esnassas@gmail.com', 0, '6hhhbmab9s84488c08cowc8008c404c', '$2y$13$6hhhbmab9s84488c08cowO/NSQDwOpTjqpWjS3GnAtC7rdBh2O5Ba', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Fadile', 'BHAYAT', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 479, 'rl.esnassas@gmail.com'),
(75, 'president.esn.paris@gmail.com', 'president.esn.paris@gmail.com', 'president.esn.paris@gmail.com', 'president.esn.paris@gmail.com', 0, '5saucmjbyo4kcgk4sos8g0sooc0sc8c', '$2y$13$5saucmjbyo4kcgk4sos8gu7ma9eN1I7NfZVqtdejhg4eP5JnK0OlW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Mehdi', 'Mesirdi', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'president.esn.paris@gmail.com'),
(76, 'sg.esn.paris@gmail.com', 'sg.esn.paris@gmail.com', 'sg.esn.paris@gmail.com', 'sg.esn.paris@gmail.com', 0, 'd6wq8h23o4gk0o004gokg000s8w0888', '$2y$13$d6wq8h23o4gk0o004gokgue8VjvhhLUOuFEd6RFsf7MQYlZi/yg4O', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Ouafae', 'Ben Rhazal', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 479, 'sg.esn.paris@gmail.com'),
(77, 'tresorier.esn.paris@gmail.com', 'tresorier.esn.paris@gmail.com', 'tresorier.esn.paris@gmail.com', 'tresorier.esn.paris@gmail.com', 0, '7wnb6esv1rkskcw4wswsw884080so0k', '$2y$13$7wnb6esv1rkskcw4wswswuhft8jZj89e3q3ZZjDxx0QSANAxzojz6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Pierre-Antoine', 'Lallande', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 479, 'tresorier.esn.paris@gmail.com'),
(78, 'rl.esnrennes@gmail.com', 'rl.esnrennes@gmail.com', 'rl.esnrennes@gmail.com', 'rl.esnrennes@gmail.com', 0, '3vf7rds2q5ycscgsgsgg0gswss0ggk0', '$2y$13$3vf7rds2q5ycscgsgsgg0ec.zKZyWI5d9hu5SAegCWb6/SSyaqID6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Grégory', 'ELARD', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0634124576', 304, 'rl.esnrennes@gmail.com'),
(79, 'kev.le-guen@laposte.net', 'kev.le-guen@laposte.net', 'kev.le-guen@laposte.net', 'kev.le-guen@laposte.net', 0, 'laohov3lzggwws4w8kc0cokk440swgk', '$2y$13$laohov3lzggwws4w8kc0cekSRbOTBhw0ICNWVtiGngxuqJAao5bBm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Kevin', 'LE GUEN', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0613896148', 304, 'kev.le-guen@laposte.net'),
(80, 'lise.heautot@wanadoo.fr', 'lise.heautot@wanadoo.fr', 'lise.heautot@wanadoo.fr', 'lise.heautot@wanadoo.fr', 0, 'jxvs2zf3k9wwgc4ockgkgwws8ckgogo', '$2y$13$jxvs2zf3k9wwgc4ockgkgu/4QC8peXIGxfz5zZysxSXrZsCSbICK.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Lise', 'HEAUTOT', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0642118758', 304, 'lise.heautot@wanadoo.fr'),
(81, 'esn.rennes@gmail.com', 'esn.rennes@gmail.com', 'esn.rennes@gmail.com', 'esn.rennes@gmail.com', 0, 'gn47wiwo6g0gwsggscs4kgo4s88gs08', '$2y$13$gn47wiwo6g0gwsggscs4ke9jaZSFZdzY9FQsDACIHyN/BmTPEQxgW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Lolita', 'MENSEAU', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0615579395', 304, 'esn.rennes@gmail.com'),
(82, 'president@esn-strasbourg.eu', 'president@esn-strasbourg.eu', 'president@esn-strasbourg.eu', 'president@esn-strasbourg.eu', 0, '6wuoa1xm2yo04cso4ckswc80ks84oos', '$2y$13$6wuoa1xm2yo04cso4ckswOwsQwTZr.unNlB/LiNgSaCnWZLAuzhOq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Benjamin', 'Genin', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0684880597', 347, 'president@esn-strasbourg.eu'),
(83, 'julian.risler@gmail.com', 'julian.risler@gmail.com', 'julian.risler@gmail.com', 'julian.risler@gmail.com', 0, '7quldywupgg0csg4c804kokggkk0ss8', '$2y$13$7quldywupgg0csg4c804keEtI3Ugn/UPD1dOKdHnQfHQ9zE66kBkK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Julian', 'Risler', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0684596006', 347, 'julian.risler@gmail.com'),
(84, 'contact@esn-strasbourg.eu', 'contact@esn-strasbourg.eu', 'contact@esn-strasbourg.eu', 'contact@esn-strasbourg.eu', 0, 'ekr6ue8ur8ggks4ccwssw4s0s0ok08o', '$2y$13$ekr6ue8ur8ggks4ccwsswuYWc8ZZ/5AsjEGqaFy97oasAvSBHh3E6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Manon', 'Brunot', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0641769072', 347, 'contact@esn-strasbourg.eu'),
(85, 'vice-president@esn-strasbourg.eu', 'vice-president@esn-strasbourg.eu', 'vice-president@esn-strasbourg.eu', 'vice-president@esn-strasbourg.eu', 0, 'nmb8c8dk02okc4gg00ksc8k4c44o8g8', '$2y$13$nmb8c8dk02okc4gg00kscubiyj/w.X8fzWBHr9sAjCx3YVSJD7.2C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Margaux', 'Bastien', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0618932749', 347, 'vice-president@esn-strasbourg.eu'),
(86, 'simonlabroue1991@gmail.com', 'simonlabroue1991@gmail.com', 'simonlabroue1991@gmail.com', 'simonlabroue1991@gmail.com', 0, '99eeajs7sc0sos0wskg80o4wgkgkkkk', '$2y$13$99eeajs7sc0sos0wskg80eZhnDqGamvDAzTTLQVBYTJHB.eKLqx2G', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Simon', 'Labroue', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0628075774', 347, 'simonlabroue1991@gmail.com'),
(87, 'thomas.joly@ixesn.fr', 'thomas.joly@ixesn.fr', 'thomas.joly@ixesn.fr', 'thomas.joly@ixesn.fr', 0, 'twhfo5cd0v4go4ko8ogo40s04w0wwgw', '$2y$13$twhfo5cd0v4go4ko8ogo4uJb1h2kNclsZdqdIKckSo8GzClCGgEVK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Thomas', 'Joly', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '0624641995', 347, 'thomas.joly@ixesn.fr'),
(88, 'mathilde.lafage@gmail.com', 'mathilde.lafage@gmail.com', 'mathilde.lafage@gmail.com', 'mathilde.lafage@gmail.com', 0, 'dr0xw7m7q5cg8ow0o0gwkgwkkcw0wss', '$2y$13$dr0xw7m7q5cg8ow0o0gwkeKYWOcimAkO0YUxVRHCR8Pt2MEQZaAC6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Mathilde', 'Lafage', NULL, NULL, NULL, NULL, NULL, NULL, 'F', '0685208926', 20, 'mathilde.lafage@gmail.com'),
(89, 'jeremie.ddd@gmail.com', 'jeremie.ddd@gmail.com', 'jeremie.ddd@gmail.com', 'jeremie.ddd@gmail.com', 0, '36jlpfxvtxic40ok44s0k8c4oc4gco8', '$2y$13$36jlpfxvtxic40ok44s0ku0bP2adIqPshuiELgIUrjtycDJXH8zCK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Azekk', 'aze', NULL, NULL, NULL, NULL, NULL, NULL, 'M', NULL, 8, 'jeremie.ddd@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20151027223223'),
('20151027230341'),
('20151104230533'),
('20151105224724'),
('20151105231551'),
('20151111102850'),
('20151111105552'),
('20151111111628'),
('20151111112041'),
('20151111112848'),
('20151111113140'),
('20151116145331'),
('20151123221304'),
('20151129180516'),
('20151129182618'),
('20151129190953'),
('20151129191431'),
('20151129192829'),
('20151213105902');

-- --------------------------------------------------------

--
-- Structure de la table `points`
--

CREATE TABLE `points` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `basic_action` int(11) NOT NULL,
  `bonus` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `name`, `role`, `level`) VALUES
(1, 'WPA', 'webmaster', 'National'),
(3, 'localBoardMember', 'regularBoardMember', 'Local'),
(4, 'Webmaster', 'webmaster', 'Local'),
(5, 'projectCoordinator', 'projectCoordinator', 'National'),
(6, 'NationalBoardMember', 'regularBoardMember', 'National'),
(7, 'RL', 'localRepresentative', 'Local'),
(8, 'NR', 'nationalRepresentative', 'National'),
(11, 'Président', 'president', 'National'),
(12, 'activeMember', 'activeMember', 'Local'),
(13, 'Activity', 'activity', 'Local'),
(14, 'Alumnus', 'Alumnus', 'Local'),
(15, 'cardManager', 'cardManager', 'Local'),
(16, 'exchangeability', 'exchangeability', 'Local'),
(17, 'pr', 'pr', 'Local'),
(18, 'secretary', 'secretary', 'Local'),
(19, 'socialerasmus', 'socialerasmus', 'Local'),
(20, 'treasurer', 'treasurer', 'Local'),
(21, 'vicePresident', 'vicePresident', 'Local'),
(22, 'ALCoordinator', 'ALCoordinator', 'National'),
(23, 'alumnus', 'alumnus', 'National'),
(24, 'cardManager', 'cardManager', 'National'),
(25, 'EducationOfficer', 'EducationOfficer', 'National'),
(26, 'exchangeability', 'exchangeability', 'National'),
(27, 'Vice NR', 'nationalViceRepresentative', 'National'),
(28, 'PR', 'pr', 'National'),
(29, 'secretary', 'secretary', 'National'),
(30, 'socialerasmus', 'socialerasmus', 'National'),
(31, 'Treasurer', 'treasurer', 'National'),
(32, 'VP', 'vicePresident', 'National'),
(33, 'SCV', 'serviceCivique', 'Local'),
(34, 'National SCV', 'serviceCivique', 'National'),
(35, 'CA', 'Administrator', 'National'),
(36, 'President', 'president', 'Local');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `joindate` datetime NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` int(11) NOT NULL,
  `latitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `section`
--

INSERT INTO `section` (`id`, `name`, `joindate`, `code`, `country`, `street`, `city`, `website`, `facebook`, `longitude`, `latitude`) VALUES
(1, ' ESN Pau-Bayonne ', '2014-06-05 00:00:00', 'FR-PAUB-UPA', 'FR', 'Maison de l’étudiant – Domaine Universitaire, avenue de l’Université, BP576 - 64012  Cedex', 'Pau', 'http://pau-bayonne.ixesn.fr/', '', 0, 0),
(2, 'AEP-ESN Padova', '2015-11-15 17:19:05', 'IT-PADO-ESN', 'IT', 'AEP-ESN\nGalleria Tito Livio 7\n35123', 'Padova', 'http://www.esnpadova.it', 'http://www.facebook.com/esnpadova', 12, 45),
(3, 'ASE ESN Verona', '2015-11-15 17:19:05', 'IT-VERO-ESN', 'IT', 'ASE ESN \nC/o Facoltà di Lingue e Letterature Straniere  \nVia San Francesco, 22\n37129', 'Verona', 'http://www.ase-esnverona.it/', '', 11, 45),
(4, 'ASE-UC/ESN Coimbra', '2015-11-15 17:19:05', 'PT-COIM-ASE', 'PT', 'Casa da Lusofonia/International Student House - Rua do Arco da Traição, n3, 3001-401', 'Coimbra', 'http://www.esncoimbra.org', 'https://www.facebook.com/ESNCOIMBRA', -8, 40),
(5, 'Autour du Monde - ESN Nantes', '2013-01-01 00:00:00', 'FR-NANT-AUT', 'FR', 'Autour du Monde - ESN , 13 Avenue de l''Hôtel Dieu - 44000  -', 'Nantes', 'www.esn-nantes.org', 'https://www.facebook.com/autourdumonde', 0, 0),
(6, 'Buddy System Zlin', '2015-11-15 17:19:05', 'CZ-ZLIN-ESN', 'CZ', 'Buddy System Zlin\nNamesti T.G.Masaryka 5555\n76001', 'Zlín', 'http://www.buddysystem.utb.cz/', 'https://www.facebook.com/BuddySystemZlin?fref=ts', 0, 0),
(7, 'ESN  Jönköping', '2015-11-15 17:19:05', 'SE-JONK-ESN', 'SE', 'ESN  , att: IA Gjuterigatan 3C,  553 18 , Sweden', 'Jönköping', 'http://www.jonkopingsstudentkar.se', '', 14, 58),
(8, 'ESN - COMPIEGNE UTC', '2013-01-01 00:00:00', 'FR-COMP-UTC', 'FR', 'ESN - COMPIEGNE UTC\nrue Roger Coutollenc\n60200', 'Compiègne', 'http://compiegne.ixesn.fr/', 'http://www.facebook.com/groups/149310408480145/', 3, 49),
(9, 'ESN - New Bulgarian University', '2015-11-15 17:19:05', 'BG-SOFI-NBU', 'BG', 'ESN - New Bulgarian University, Montevideo 21 Str., PC - 1618', 'Sofia', 'nbu.esnbg.org', '', 23, 43),
(10, 'ESN - UCD Dublin', '2015-11-15 17:19:05', 'IE-DUBL-UCD', 'IE', 'ESN UCD\nInternational Office,\nUCD Belfield\n 4\nIreland', 'Dublin', 'http://esnucd.org', 'https://www.facebook.com/ucdesn', -6, 53),
(11, 'ESN A.U.R.E. Camerino', '2015-11-15 17:19:05', 'IT-CAME-AUR', 'IT', 'ESN A.U.R.E. \nc/o UNICAM - Ufficio Mobilità e Relazioni Internazionali\nVia Pieragostini 18\n62032  (MC)\nItaly', 'Camerino', 'http://www.esncamerino.it/', 'https://www.facebook.com/esnaure.camerino', 13, 43),
(12, 'ESN AGH Cracow', '2015-11-15 17:19:05', 'PL-KRAK-AGH', 'PL', 'Erasmus Student Network\nul. Reymonta 13a\n30-059', 'Kraków', 'www.esn.agh.edu.pl', 'https://www.facebook.com/esnagh?fref=ts', 20, 50),
(13, 'ESN AKDENIZ', '2015-11-15 17:19:05', 'TR-ANKA-AKD', 'TR', 'Akdeniz University Dumlupınar Boulevard 07058 Campus Rectorate Building 6th Floor, ANTALYA', 'Antalya', 'akdeniz.esnturkey.org', 'facebook.com/esnakdeniz', 0, 0),
(14, 'ESN AKE Karlsruhe', '2015-11-15 17:19:05', 'DE-KARL-AKE', 'DE', 'AK Erasmus\nGeb. 20.13, R. 007\nKaiserstr. 12\n76131', 'Karlsruhe', 'www.ak-erasmus.de', 'https://www.facebook.com/erasmus.ka?fref=ts', 8, 49),
(15, 'ESN AKI-Deggendorf', '2015-11-15 17:19:05', 'DE-DEGG-AKI', 'DE', 'AKI Club International e.V. \nTHD - Technische Hochschule \nEdlmairstraße 6 und 8\n94469', 'Deggendorf', 'http://www.aki-deggendorf.de/', 'https://www.facebook.com/AKIDeg/', 13, 49),
(16, 'ESN AON', '2015-11-15 17:19:05', 'PL-WARS-DEF', 'PL', 'Al. gen. Antoniego Chruściela "Montera", 103, blok 101/143a\n00-910, ', 'Warsaw', 'aon.esn.pl', 'https://www.facebook.com/pages/ESN-AON/167900966600410', 0, 0),
(17, 'ESN ASE Bucharest', '2015-11-15 17:19:05', 'RO-BUCH-ESN', 'RO', 'Piata Romana, 6, 00010374, The  Academy of Economic', 'Bucharest', 'www.ase-bucharest.esn.ro', 'https://www.facebook.com/pages/ESN-ASE-Bucharest/410154642439075', 26, 44),
(18, 'ESN ASE Catania', '2015-11-15 17:19:05', 'IT-CATA-ASE', 'IT', 'ESN ASE \nCorso Margherito 177 \n95030 Maniace ()\nItaly', 'Catania', 'http://www.esncatania.it ', 'http://www.facebook.com/profile.php?id=1624152898', 0, 0),
(19, 'ESN ASE Chieti Pescara', '2015-11-15 17:19:05', 'IT-PESC-ASE', 'IT', 'Viale Pindaro 42, 65127 , Italy\nc/o AULA A.S.E.', 'Pescara', 'www.esnchietipescara.eu', 'http://www.facebook.com/profile.php?id=100002035102097', 0, 0),
(20, 'ESN ASER Toulouse 1', '2013-01-01 00:00:00', 'FR-TOUL-ASE', 'FR', 'Association ASER-ESN - SRI - Universite  1 Capitole - 2 rue du Doyen Marty, 31042 ', 'Toulouse', 'http://toulouse.ixesn.fr/', 'http://www.facebook.com/home.php?#!/profile.php?id=100000507060008', 1, 44),
(21, 'ESN ASSI Parma', '2015-11-15 17:19:06', 'IT-PARM-ASI', 'IT', 'ESN ASSI Parma\nVia Università, 12 - Atrio delle Colonne\n43121', 'Parma ', 'www.assi.unipr.it/', 'https://www.facebook.com/esn.assi.parma', 10, 45),
(22, 'ESN ATEITH', '2015-11-15 17:19:06', 'GR-THES-TEI', 'GR', 'P.O BOX 141, 574 00 ', 'Thessaloniki', 'http://ateith.esngreece.gr/', 'https://www.facebook.com/EsnAteiThessaloniki', 0, 0),
(23, 'ESN AUA Athens', '2015-11-15 17:19:06', 'GR-ATHE-AUA', 'GR', 'Iera Odos 75, Botanikos, ', 'Athens', 'http://aua.esngreece.gr', 'www.facebook.com/pages/ESN-AUA-Athens/265827233432722', 0, 0),
(24, 'ESN AUBG', '2015-11-15 17:19:06', 'BG-BLAG-AUB', 'BG', 'c/o Mariya Handzhiyska, 1 Georgi Izmerliev Square, 2700 ', 'Blagoevgrad', 'http://aubg.esnbg.org', '', 0, 0),
(25, 'ESN AUTH', '2015-11-15 17:19:06', 'GR-THES-AUT', 'GR', 'c/o ESN AUTH\nEgnatias and Tritis Septemvriou Corner, Upper Student Restaurant of Aristotle University (opposite the concierge office), 54637, , Greece\n', 'Thessaloniki', 'http://auth.esngreece.gr', 'https://www.facebook.com/ESNAUTH', 23, 41),
(26, 'ESN Aalto', '2015-11-15 17:19:06', 'FI-HELS-TKY', 'FI', 'ESN Aalto ry, Otakaari 11, 02150 Espoo', 'Espoo and Helsinki', 'http://www.esnaalto.org', 'https://www.facebook.com/EsnAaltoOfficial', 25, 60),
(27, 'ESN Aarhus', '2015-11-15 17:19:06', 'DK-AARH-ESN', 'DK', 'ESN , c/o Studenterhus Århus, Nordre Ringgade 3, DK-8000  C', 'Aarhus', 'http://www.studenterhusaarhus.dk', 'https://www.facebook.com/ESNAARHUS', 10, 56),
(28, 'ESN Agder', '2015-11-15 17:19:06', 'NO-KGAR-AGD', 'NO', 'ESN Agder v/ STA\nServiceboks 422\n4604', 'Kristiansand', 'agder.esn.no', 'http://www.facebook.com/esnagder', 8, 58),
(29, 'ESN Aix-En-Provence', '2013-01-01 00:00:00', 'FR-PROV-AIX', 'FR', '', 'Aix-en-Provence', 'http://aix.ixesn.fr/', 'http://www.facebook.com/ESNAix', 0, 0),
(30, 'ESN Alcala', '2015-11-15 17:19:06', 'ES-ALCA-ESN', 'ES', 'Erasmus Student Network - Universidad de Alcala - Plaza de San Diego s/n, 28801 ', 'Alcala de Henares - Madrid', 'http://www.esn-uah.org', 'http://facebook.com/esn.alcala', -3, 40),
(31, 'ESN Ales', '2013-01-01 00:00:00', 'FR-ALES-ESN', 'FR', 'AIMA - Ecole des mines d'', 6 avenue de Clavières, 30319 , France', 'Alès', 'http://www.mines-ales.fr/~aima', '', 4, 44),
(32, 'ESN Algarve', '2015-11-15 17:19:06', 'PT-FARO-UAL', 'PT', 'Campus Penha – Escola Superior de Gestão, Hotelaria e Turismo – 8005- 139, ', 'Faro', '', 'https://www.facebook.com/pages/Candidate-Section-ESN-Algarve/234530293416078?fref=ts', 0, 0),
(33, 'ESN Almeria', '2015-11-15 17:19:06', 'ES-ALME-ESN', 'ES', 'Calle Sacramento s/n, La Canada de San Urbano, 04120, Despacho 2.31, Edificio CAE (Asociacion erasmus)', 'Almeria', 'www.esnalmeria.org', 'www.facebook.com/ESNALMERIA', 0, 0),
(34, 'ESN Amiens', '2015-02-18 00:00:00', 'FR-AMIE-ESN', 'FR', 'ESN \nUniversité de Picardie Jules Verne-DAI\nChemin du Thil, 80000 \n80000', 'Amiens', 'http://amiens.ixesn.fr/', '', 0, 0),
(35, 'ESN Anadolu', '2015-11-15 17:19:06', 'TR-ESKI-ANA', 'TR', 'ESN Anadolu, Anadolu Üniversitesi, Öğrenci Merkezi Oda : 318      Tepebaşı/Eskişehir', 'Eskisehir', 'http://anadolu.esnturkey.org', 'https://www.facebook.com/anadoluesn', 31, 40),
(36, 'ESN Ankara University ', '2015-11-15 17:19:06', 'TR-ANKA-ESN', 'TR', ' University Rectorate , Dögol Street 06100 Tandoğan /  /', 'Ankara', 'http://ankarauni.esnturkey.org', 'https://www.facebook.com/esnankara?fref=ts', 0, 0),
(37, 'ESN Antwerpen', '2015-11-15 17:19:06', 'BE-ANTW-ESN', 'BE', 'ESN , Rodestraat 14 (R-009), 2000 ', 'Antwerpen', 'www.esnantwerp.org', 'http://www.facebook.com/esn.antwerp', 4, 51),
(38, 'ESN Arel', '2015-11-15 17:19:06', 'TR-ISTA-ARE', 'TR', 'Arel Erasmus Student Club,  Arel University, 34500 , Turkey', 'Istanbul', '', 'https://www.facebook.com/arel.esn', 0, 0),
(39, 'ESN Athens AUEB', '2015-11-15 17:19:06', 'GR-ATHE-ESN', 'GR', 'ESN  AUEB\nEvelpidon Street 29 1st floor\n11362', 'Athens', 'http://aueb.esnathens.gr/', 'http://www.facebook.com/esnathens', 24, 38),
(40, 'ESN Atilim', '2015-11-15 17:19:06', 'TR-ANKA-ATI', 'TR', 'ESN Atilim\nKızılcaşar Köyü\nİncek Gölbaşı /TÜRKİYE \n06836', 'Ankara', '', 'https://www.facebook.com/pages/ESN-Atilim/196235270526712?ref=hl', 0, 0),
(41, 'ESN Audicee Tours', '2013-01-01 00:00:00', 'FR-TOUR-ESN', 'FR', 'Direction des Relations Internationales, université François Rabelais, 60 rue du plat d’Etain BP 12050 37020 TOURS CEDEX', 'Tours', 'http://tours.ixesn.fr/', '', 0, 0),
(42, 'ESN Augsburg', '2015-11-15 17:19:07', 'DE-AUGS-ESN', 'DE', 'ERASMUS Student Network\nESN Auxchange  e.V.\nSalomon-Idler-Straße 2\n86159', 'Augsburg', '', 'https://www.facebook.com/EsnAuxchangeAugsburg', 0, 0),
(43, 'ESN Aveiro', '2015-11-15 17:19:07', 'PT-AVEI-ESN', 'PT', 'Gabinete de Relações Internacionais \n(International Office)\nEdifício Novo da Reitoria, Piso 0\nCampus Universitário de Santiago\n3810-193 \nPortugal', 'Aveiro', 'www.esnaveiro.org', 'https://www.facebook.com/esnaveiro', 0, 0),
(44, 'ESN Avignon', '2013-01-01 00:00:00', 'FR-AVIG-ESN', 'FR', 'ESN  c/o Association Echanges, 74 rue Louis Pasteur, 84000 ', 'Avignon', 'http://avignon.ixesn.fr', 'http://facebook.com/asso.echanges', 0, 0),
(45, 'ESN BFI Vienna', '2015-11-15 17:19:07', 'AT-WIEN-UAS', 'AT', 'ESN BFI \nWohlmutstraße 22\n1020', 'Vienna', 'bfivienna.esnaustria.org', 'https://www.facebook.com/pages/ESN-BFI-Vienna/281903842113?fref=ts', 16, 48),
(46, 'ESN BKF', '2015-11-15 17:19:07', 'HU-BUPE-BKF', 'HU', 'Nagy Lajos király útja 1-9 (room F 001/B), H-1148', 'Budapest', 'www.bkf.esn.hu', '', 0, 0),
(47, 'ESN BME', '2015-11-15 17:19:07', 'HU-BUPE-BME', 'HU', 'ESN BME\nMűegyetem rakpart. 3., 3rd floor 83.\n1111 ', 'Budapest', 'www.esn.bme.hu', 'http://www.facebook.com/esnbme', 19, 47),
(48, 'ESN BOKU Wien', '2015-11-15 17:19:07', 'AT-WIEN-BOK', 'AT', 'ESN BOKU \nÖH Boku, Referat für Internationales \nPeter-Jordan-Straße 76\n1190', 'Wien', 'http://boku.esnaustria.org/', '', 16, 48),
(49, 'ESN BTH', '2015-11-15 17:19:07', 'SE-KARL-BTH', 'SE', 'c/o Daniel Sanchez de Nova, Minervavägen 22A Room 1, 37141 ', 'Karlskrona', 'www.esnbth.org', 'www.facebook.com/EsnBth', 0, 0),
(50, 'ESN BUDDY SYSTEM HK ', '2015-11-15 17:19:07', 'CZ-HRKR-ESN', 'CZ', 'ESN BUDDY SYSTEM HK\nHradecká 1249\n500 03 \n50003', 'Hradec Králové', 'www.buddyhk.cz', 'http://www.facebook.com/ESNBuddySystemHK', 16, 50),
(51, 'ESN Bahcesehir', '2015-11-15 17:19:07', 'TR-ISTA-BAH', 'TR', 'Çırağan Caddesi 34353 Beşiktaş / ISTANBUL | Tel: 0 212 381 00', 'Istanbul', 'http://bahcesehir.esnturkey.org', '', 29, 41),
(52, 'ESN Bangor', '2015-11-15 17:19:07', 'GB-BANG-ESN', 'GB', 'ESN ,\n Students'' Union,\nBryn Haul, Victoria Drive,\n\nLL57 1DH\nUnited', 'Bangor', 'bangor.esnuk.org', 'https://www.facebook.com/ESN-Bangor-Erasmus-International-Exchange-Society-544768135608189/timeline/', 0, 0),
(53, 'ESN Barcelona UB', '2015-11-15 17:19:07', 'ES-BARC-ESN', 'ES', '', 'Barcelona', 'http://www.esn-ub.org/', 'https://www.facebook.com/pages/ESN-Universitat-de-Barcelona/212111578846925', 2, 41),
(54, 'ESN Barcelona UPF', '2015-11-15 17:19:07', 'ES-BARC-POM', 'ES', 'ESN  UPF\nOffice 20.1E08\nRamon Trias Fargas, 25-27 (Jaume I building) \n08005', 'Barcelona', 'http://esnupf.org/', 'https://www.facebook.com/groups/897383623621592/?fref=ts', 0, 0),
(55, 'ESN Bari', '2015-11-15 17:19:07', 'IT-BARI-ESN', 'IT', 'ESN \nVia Carulli 5\n70100', 'Bari', 'http://www.erasmusbari.eu', 'Esn Erasmus Bari', 17, 41),
(56, 'ESN Basel', '2015-11-15 17:19:07', 'CH-BASE-ESN', 'CH', 'ESN , c/o Mobility Office, Universität , Petersgraben 1, 4003 ', 'Basel', 'http://www.basel.esn.ch/', '', 8, 48),
(57, 'ESN Bayreuth', '2015-11-15 17:19:07', 'DE-BAYR-ESN', 'DE', 'ISN \nInternational Office, Universitätsstr.30\n 95447', 'Bayreuth', 'http://bayreuth.esn-germany.de/', '', 12, 50),
(58, 'ESN BelUPgrade', '2015-11-15 17:19:07', 'YU-BELG-UPG', 'YU', 'ESN BelUPgrade\nBranislava Nušića 34\nLeštane\n11306', 'Belgrade', 'belupgrade.esn.rs', 'https://www.facebook.com/ESNBelUPgrade?hc_location=stream', 0, 0),
(59, 'ESN Bergamo', '2015-11-15 17:19:08', 'IT-BERG-ESN', 'IT', 'c/o Ufficio Relazioni Internazionali Università degli Studi di , Via San Bernardino 72/e, stanza 11. \n24122 ', 'Bergamo', 'www.esnbergamo.it', '', 0, 0),
(60, 'ESN Bergen', '2015-11-15 17:19:08', 'NO-BERG-ESN', 'NO', 'ESN , Nygårdsgaten 1B, ', 'Bergen', 'http://www.bergen.esn.no', 'https://www.facebook.com/pages/ESN-Bergen/526823784016079?fref=ts', 5, 60),
(61, 'ESN Bern', '2015-11-15 17:19:08', 'CH-BERN-ESN', 'CH', 'Universität \nInternationales Büro, Erasmus Student Network\nHochschulstrasse 4\n3012', 'Bern', 'www.bern.esn.ch', 'http://www.facebook.com/groups/109751405781934/', 7, 47),
(62, 'ESN Besançon', '2013-01-01 00:00:00', 'FR-BESA-AEI', 'FR', 'UFR SLHS, Université de Franche-Comté, 30 rue Mégevand, 25000 ', 'Besançon', 'http://www.erasmus-besancon.com/', 'http://www.facebook.com/esn.besancon', 6, 47),
(63, 'ESN Bilkent', '2015-11-15 17:19:08', 'TR-BILK-ESN', 'TR', 'Office of Exchange Programs Bilkent University Registrar''s Office\nMain Campus \n 06800 Bilkent,   TURKEY\n06800', 'Ankara', 'http://bilkent.esnturkey.org', 'http://www.facebook.com/esnbilkent', 33, 40),
(64, 'ESN Bocconi Milano', '2015-11-15 17:19:08', 'IT-BOCC-ESN', 'IT', 'ESN Bocconi \nVia Rutilia 19/20\n20141', 'Milano', 'http://www.esnbocconi.it/', '', 0, 0),
(65, 'ESN Bochum', '2015-11-15 17:19:08', 'DE-BOCH-ESN', 'DE', 'c/o International Office\nRuhr-Universität \nUniversitätsstr. 150 \n44780', 'Bochum', 'http://bochum.esn-germany.de/ ', '', 7, 51),
(66, 'ESN Bogazici', '2015-11-15 17:19:08', 'TR-ISTA-BOG', 'TR', 'Bogazici University South Campus, 1st Men Dormitory, Network Of International Students, 34394\n', 'Istanbul', 'bogazici.esnturkey.org', '', 0, 0),
(67, 'ESN Bologna', '2015-11-15 17:19:08', 'IT-BOLO-ESN', 'IT', 'Via delle Belle Arti 50, 40126 , Italy\nOpen every Monday and Wednesday from 7:00 p.m. till 9:00 p.m.', 'Bologna', 'http://www.esnbologna.org', 'http://www.facebook.com/AssociazioneErasmusEsnBologna', 11, 45),
(68, 'ESN Bonn', '2015-11-15 17:19:08', 'DE-BONN-ESN', 'DE', 'ESN  e.V.\nc/o Dezernat Internationales Universität \nPoppelsdorfer Allee 53\n53115', 'Bonn', '', '', 7, 51),
(69, 'ESN Boras', '2015-11-15 17:19:08', 'SE-BORA-ESN', 'SE', 'c/o Studentkåren i \nAllégatan 1\n50332', 'Borås', 'www.esnboras.org', 'https://www.facebook.com/ESNBoras', 0, 0),
(70, 'ESN Bordeaux', '2015-06-06 00:00:00', 'FR-BORD-ESN', 'FR', '27 avenue Paul Bert 33400, ', 'Talence', '', '', 0, 0),
(71, 'ESN Bragança', '2015-11-15 17:19:08', 'PT-BRAG-ESN', 'PT', 'Campus de Stª Apolónia, Instituto Politécnico de , edificio Centro Académico,  Gabinete ESN \n5300', 'Bragança', '', 'https://www.facebook.com/pages/ESN-Bragan%C3%A7a/733334166685222?fref=ts', 0, 0),
(72, 'ESN Brasov', '2015-11-15 17:19:08', 'RO-BRAS-ESN', 'RO', 'Calea Codrului, 26, Sinaia,106100', 'Brasov', 'http://brasov.esn.ro/', 'http://www.facebook.com/esn.brasov', 0, 0),
(73, 'ESN Braunschweig', '2015-11-15 17:19:08', 'DE-BRAU-ISN', 'DE', 'International Student Network \nc/o International Office\n38106', 'Braunschweig', 'braunschweig.esn-germany.de', 'https://www.facebook.com/groups/isnbs/', 11, 52),
(74, 'ESN Brescia', '2015-11-15 17:19:08', 'IT-BRES-ESN', 'IT', 'ES – ESN  - Sala delle associazioni\nVia Valotti 3\n25133', 'Brescia', 'http://www.esnbrescia.it/', '', 0, 0),
(75, 'ESN Bristol', '2015-11-15 17:19:08', 'GB-BRIS-ESN', 'GB', 'Shailini Vora/ESN \n3 Dowry Road\nBS8 4PR', 'Bristol', 'bristol.esnuk.org', 'https://www.facebook.com/esn.bristol?fref=ts', 0, 0),
(76, 'ESN Buddynetwork TU Wien', '2015-11-15 17:19:08', 'AT-WIEN-TUN', 'AT', 'ESN Buddynetwork TU Wien\nWiedner Hauptstrasse 8-10\n1040 Wien\n1040', 'Vienna', 'www.buddynetwork.at', '', 16, 48),
(77, 'ESN CAG', '2015-11-15 17:19:08', 'TR-MERS-CAG', 'TR', 'ESN CAG\nA. Yasar Baybogan Kampusu, Adana- Karayolu Uzeri, 33800 Yenice\n33800', 'Mersin', '', '', 39, 41),
(78, 'ESN CIRC', '2015-11-15 17:19:09', 'SE-GOTE-CIR', 'SE', 'Chalmers Studentkår, CIRC, Teknologgränd 2, 412 58 GÖTEBORG', 'Goteborg', 'http://www.circ.chalmers.se/', '', 12, 58),
(79, 'ESN CULS Prague', '2015-11-15 17:19:09', 'CZ-PRAG-CUL', 'CZ', 'ESN CULS Prague, z. s.\nKolej JIH\nKamycka 1280\n16500', 'Praha', 'www.esnculs.cz', 'https://www.facebook.com/pages/ESN-CULS-Prague/201421116719548?fref=ts', 0, 0),
(80, 'ESN Cadiz', '2015-11-15 17:19:09', 'ES-CADI-ESN', 'ES', 'ESN \nFacultad Ciencias Económicas y Empresariales\nAvenida Duque de Nájera, 8\n11002', 'Cádiz', 'www.esncadiz.org', 'http://www.facebook.com/erasmuscadiz', -6, 37),
(81, 'ESN Cagliari', '2015-11-15 17:19:09', 'IT-CAGL-ESN', 'IT', 'Via San Giorgio 12,  (CA) \n09100', 'Cagliari', 'www.esncagliari.org', 'https://www.facebook.com/groups/405508546326152/?fref=ts', 9, 39),
(82, 'ESN Canakkale', '2015-11-15 17:19:09', 'TR-CANA-ESN', 'TR', 'ESN , inönü caddesi , 175, 17100, ', 'Canakkale', '', '', 0, 0),
(83, 'ESN Cardiff', '2015-11-15 17:19:09', 'GB-CARD-ESN', 'GB', 'ESN ,\n University Students'' Union,\nPark Place,\n\nCF10', 'Cardiff', 'cardiff.esnuk.org', 'https://www.facebook.com/ESNCardiff14?fref=ts', -3, 51),
(84, 'ESN Carlos III Madrid', '2015-11-15 17:19:09', 'ES-MADR-CA3', 'ES', 'C/ Madrid 126, despacho 16.S.05. CP: 28903.', 'Getafe, Madrid.', 'http://www.esnuc3m.es', 'https://www.facebook.com/esn.uc3m', -4, 40),
(85, 'ESN Castellanza', '2015-11-15 17:19:09', 'IT-CAST-ESN', 'IT', 'ESN \nc/o Università Carlo Cattaneo, Ufficio Relazioni Internazionali\nC.so Matteotti 22\n21053', 'Castellanza', 'http://www.esncastellanza.it/', '', 9, 46),
(86, 'ESN Catanzaro', '2015-11-15 17:19:09', 'IT-CTNZ-ESN', 'IT', 'ESN  - Università Magna Graecia di \nc/o Consulta Degli Studenti\nViale Europa\n88100', 'Catanzaro', 'http://www.esncatanzaro.com/', '', 17, 39),
(87, 'ESN City London', '2015-11-15 17:19:09', 'GB-LOND-ESN', 'GB', 'ESN City,\nCity University Students'' Union,\nNorthampton Square,\nLondon\nEC1V 0HB\nUnited', 'London ', 'city.esnuk.org', 'https://www.facebook.com/esncitylondon', 0, 0),
(88, 'ESN Cluj-Napoca', '2015-11-15 17:19:09', 'RO-CLUJ-ESN', 'RO', 'Diana-Maria Vranău\n22, Ciprian Porumbescu Street, , Cluj County\nRomania\n400338', 'Cluj-Napoca', 'http://cluj-napoca.esn.ro/', 'https://www.facebook.com/ESN.clujnapoca?fref=ts', 24, 47),
(89, 'ESN Collegium Civitas', '2015-11-15 17:19:09', 'PL-WARS-COC', 'PL', 'ESN Collegium Civitas, ul. Pl. Defilad 1, 00-901 ', 'Warsaw', 'http://www.cc.esn.pl', 'https://www.facebook.com/ESNCC', 21, 52),
(90, 'ESN Comenius University', '2015-11-15 17:19:09', 'SK-BRAT-COM', 'SK', 'ESN Comenius University\nOddelenie medzinárodných vzťahov Rektorát UK\nŠafárikovo námestie 6 P.O.BOX 440\n814 99', 'Bratislava ', 'cu.esn.sk', 'https://www.facebook.com/EsnCuBratislava?fref=ts', 17, 48),
(91, 'ESN Copenhagen', '2015-11-15 17:19:09', 'DK-COPE-ESN', 'DK', '', 'Copenhagen', 'http://esn-cph.dk', 'https://www.facebook.com/groups/esncph/', 13, 56),
(92, 'ESN Corvinus', '2015-11-15 17:19:09', 'HU-BUPE-COR', 'HU', 'ESN Corvinus\n8 Fővám Square\nOffice E.7\n1093', 'Budapest', 'http://corvinus.esn.hu/', 'http://www.facebook.com/esncorvinus', 19, 47),
(93, 'ESN Cosenza', '2015-11-15 17:19:09', 'IT-COSE-ESN', 'IT', 'Centro Studi Internaz. Omega – Esn \nc/o Università della Calabria \n87036 Arcavacata di Rende (CS)\nItaly', 'Cosenza', 'http://www.esncosenza.com', 'https://www.facebook.com/EsnCosenzaOfficialPage', 16, 39),
(94, 'ESN Covilha', '2015-11-15 17:19:09', 'PT-COVI-ESN', 'PT', 'Rua Sr. da Paciência, nº39, 6200-158 \n6200', 'Covilhã', 'www.esn-covilha.org', 'https://www.facebook.com/esncovilhaofficial', 0, 0),
(95, 'ESN Craiova ', '2015-11-15 17:19:09', 'RO-CRAI-ESN', 'RO', 'str. A. I. Cuza nr.13, 200585, Craiova, Romania', 'Craiova ', 'http://craiova.esn.ro/', 'https://www.facebook.com/pages/ESN-Craiova/869366426431267?ref=hl ', 0, 0),
(96, 'ESN Cukurova', '2015-11-15 17:19:09', 'TR-ADAN-ESN', 'TR', 'ESN Cukurova\nCukurova University International Office\n01330', 'Adana', 'https://www.facebook.com/CukurovaESN', '', 0, 0),
(97, 'ESN DTU', '2015-11-15 17:19:10', 'DK-LYNG-DTU', 'DK', 'Anker Engelunds Vej 1, 2800', 'Kongens Lyngby', 'http://www.esn-dtu.dk/', 'https://www.facebook.com/ESNDTU', 0, 0),
(98, 'ESN DUTH', '2015-11-15 17:19:10', 'GR-KOMO-ESN', 'GR', 'ESN DUTH, Erasmus Office, Administration Building, \n University Campus, \nGR-69100', 'Komotini', 'http://duth.esngreece.gr', 'http://www.facebook.com/esnduth', 0, 0),
(99, 'ESN Debrecen', '2015-11-15 17:19:10', 'HU-DEBR-ESN', 'HU', '4010 , Pf. 77.', 'Debrecen', 'http://debrecen.esn.hu', 'https://www.facebook.com/ESNDebrecen', 0, 0),
(100, 'ESN Delft', '2015-11-15 17:19:10', 'NL-DELF-ESN', 'NL', 'Rotterdamseweg 139A103, 2628AL , the', 'Delft', 'http://esn-delft.nl', 'https://www.facebook.com/groups/404249766409259/?fref=ts ', 0, 0),
(101, 'ESN Dijon', '2013-01-01 00:00:00', 'FR-DIJO-ESN', 'FR', 'Bureau 108, Maison de l''Etudiant, Esplanade Erasme, Université de Bourgogne 21000 ', 'Dijon', 'http://dijon.ixesn.fr/', 'https://www.facebook.com/esn.insidijon', 5, 47),
(102, 'ESN Dokuz Eylul', '2015-11-15 17:19:10', 'TR-IZMI-DEU', 'TR', 'Inter-National Students Club, Dokuz Eylul Universitesi, Dış İlişkiler Koordinatorlugu, Cumhuriyet Bulvarı No:144 Alsancak / Izmir 35210', 'İzmir', '', 'https://www.facebook.com/pages/ESN-Dokuz-Eylul/372938016174054?ref=hl', 0, 0),
(103, 'ESN Dortmund', '2015-11-15 17:19:10', 'DE-DORT-ESN', 'DE', 'ESN \nReferat Internationales\nEmil-Figge-Straße 61\n44227', 'Dortmund', 'http://dortmund.esn-germany.de/', 'www.facebook.com/DORTMUND.ESN', 7, 52),
(104, 'ESN Dubrovnik', '2015-11-15 17:19:10', 'HR-DUBR-ESN', 'HR', 'c/o Toni Šimunović, Lapadska obala 7, 20000 ', 'Dubrovnik', 'https://www.facebook.com/EsnDubrovnik', 'https://www.facebook.com/EsnDubrovnik?fref=ts', 0, 0),
(105, 'ESN Duesseldorf', '2015-11-15 17:19:10', 'DE-DUES-ESN', 'DE', 'Erasmus Student Network  e.V.\nHeinrich-Heine-Universität c/o International Office\nBuilding 21.02\n40204', 'Düsseldorf', 'www.esnduesseldorf.de', 'https://www.facebook.com/pages/ESN-Duesseldorf/639747486104833', 7, 51),
(106, 'ESN Dundalk', '2015-11-15 17:19:10', 'IE-DUND-DIT', 'IE', 'Sports & Societies Office, \n Institute of Technology', 'Dundalk', '', 'https://www.facebook.com/ESNDundalk', 0, 0),
(107, 'ESN EBS', '2015-11-15 17:19:10', 'EE-TALL-EBS', 'EE', 'ESN EBS, Lauteri 3, 10114 Tallin, Estonia', 'Tallinn', 'http://www.ebsikas.ee', '', 25, 59),
(108, 'ESN EDC', '2013-01-01 00:00:00', 'FR-PARI-EDC', 'FR', '70, galerie des Damiers –  La Défense 1 – 92415 Courbevoie Cedex', 'Paris', '', '', 0, 0),
(109, 'ESN ELTE', '2015-11-15 17:19:10', 'HU-BUPE-ELT', 'HU', '', 'Budapest', 'http://elte.esn.hu/', 'www.facebook.com/esnelte', 19, 47),
(110, 'ESN EPF Lausanne', '2015-11-15 17:19:10', 'CH-LAUS-XEP', 'CH', 'AGEPoly - Xchange, \nP.a. AGEPoly, \nCase postale 16 - Esplanade 13, \nCH-1015 ', 'Lausanne', 'epfl.esn.ch', 'www.facebook.com/xchange.esnepfl', 7, 47),
(111, 'ESN ESAN Ancona', '2015-11-15 17:19:10', 'IT-ANCO-ESA', 'IT', 'c/o Claudio Baldi, Via Marche 1 A/b, 60015 ', 'Ancona', 'www.esnancona.it', 'https://www.facebook.com/esnancona', 0, 0),
(112, 'ESN ESC Troyes', '2013-01-01 00:00:00', 'FR-TROY-ESC', 'FR', 'ESN ESC , c/o MOYARD Pauline, 217 avenue Pierre Brosolette, 10000 ', 'Troyes', 'www.get-formation.fr', 'https://www.facebook.com/EsnTroyes', 0, 0),
(113, 'ESN EU Bratislava', '2015-11-15 17:19:10', 'SK-BRAT-EUB', 'SK', 'ESN EU \nDolnozemska cesta 1\nE9.12\n85235', 'Bratislava', 'eu.esn.sk', '', 0, 0),
(114, 'ESN EYE Lodz', '2015-11-15 17:19:11', 'PL-LODZ-EYE', 'PL', 'ESN-EYE Lodz\nŻwirki 36\n90-924', 'Łódź', 'www.esn-eye.org', 'http://www.facebook.com/ESNEYElodz', 19, 52),
(115, 'ESN Eger', '2015-11-15 17:19:11', 'HU-EGER-ESN', 'HU', 'Eszterházy tér 1., 3300, ', 'Eger', 'eger.esn.hu', '', 0, 0),
(116, 'ESN Elche', '2015-11-15 17:19:11', 'ES-ELCH-ESN', 'ES', 'Gabriel y Galan 8, 03202 ', 'Elche', 'www.esnelche.org', '', 0, 0),
(117, 'ESN EoT Hildesheim', '2015-11-15 17:19:11', 'DE-HILD-EOT', 'DE', 'ESN \nUniversität  \nUniversitätsplatz 1\n31141', 'Hildesheim', 'erasmus-on-tour.org', 'https://www.facebook.com/#!/pages/Erasmus-on-Tour-Uni-Hildesheim/185954231425006', 0, 0),
(118, 'ESN ErasMons', '2015-11-15 17:19:11', 'BE-MONS-ESN', 'BE', 'Eras, Rue du Faubourg 318, 6110 Montigny-le-Tilleul', 'Mons', '', 'https://www.facebook.com/ESNErasMons', 0, 0),
(119, 'ESN Existanbul', '2015-11-15 17:19:11', 'TR-ISTA-EXI', 'TR', 'ESN Existanbul\n Üniversitesi, Merkez Kampüs, Uluslararası Akademik İlişkiler Binası,\nErasmus Ofisi 34452 Beyazıt, Fatih-Istanbu\n34452', 'İstanbul', 'http://existanbul.esnturkey.org', 'http://www.facebook.com/esn.existanbul', 0, 0),
(120, 'ESN FH Wien WKW', '2015-11-15 17:19:11', 'AT-WIEN-WKW', 'AT', 'Erasmus Student Network FH Wien WKW\nCentre for International Education & Mobility\nWähringer Gürtel 97 / Raum B105\n1180', 'Vienna', 'http://fhwien-wkw.esnaustria.org/', 'https://www.facebook.com/esn.fhwien?fref=ts', 16, 48),
(121, 'ESN FINT', '2015-11-15 17:19:11', 'FI-TAMP-TAM', 'FI', 'ESN FINT\nKalevantie 5, Linna Building Room: 1004, 33014 University of \n33014', 'Tampere', 'www.esnfint.org', 'http://www.facebook.com/groups/255456267830862/', 24, 61),
(122, 'ESN Ferrara', '2015-11-15 17:19:11', 'IT-FERR-ESN', 'IT', 'ESN \nvicolo della Pace 13\nCopparo\n44034', 'Ferrara', 'www.esnferrara.it', '', 0, 0),
(123, 'ESN Finnmark', '2015-11-15 17:19:11', 'NO-ALTA-ESN', 'NO', 'ESN Finnmark\nFollumsvei 31\n9509', 'Alta', 'https://www.facebook.com/ESNFinnmark?fref=ts', '', 23, 70),
(124, 'ESN Firat', '2015-11-15 17:19:11', 'TR-ELAZ-ESN', 'TR', 'ESN FIRAT\nFIRAT UNIVERSITY\nINTERNATIONAL RELATIONS OFFICE\n23119\n\nTURKEY', 'ELAZIĞ', 'http://firat.esnturkey.org', 'http://www.facebook.com/esnelazig', 0, 0),
(125, 'ESN Florentia', '2015-11-15 17:19:11', 'IT-FLOR-ESN', 'IT', 'ESN Florentia c/o Java Center\nVia Pietrapiana angolo Via Fiesolana (nei pressi di piazza Salvemini), \nOARARIO: Lunedì 15:30 - 18:30\n50100 \nITALY\n', 'Firenze', 'www.esnflorentia.it', 'https://www.facebook.com/esn.florentia.fan.page?ref=ts&fref=ts', 0, 0),
(126, 'ESN Foggia', '2015-11-15 17:19:11', 'IT-FOGG-ESN', 'IT', 'ESN \nVia Antonio Gramsci 89/91\n71100', 'Foggia', 'http://www.facebook.com/ESNFOGGIA', 'http://www.facebook.com/ESNFOGGIA', 0, 0),
(127, 'ESN Frankfurt (Oder)', '2015-11-15 17:19:11', 'DE-FRAN-ESN', 'DE', 'Interstudis e.V.\nEuropa-Universität Viadrina\nGroße Scharrnstr. 59\n15230 Frankfurt (Oder)\nDE', 'Frankfurt (Oder)', 'http://www.interstudis.eu/', '', 15, 52),
(128, 'ESN Frankfurt am Main', '2015-11-15 17:19:11', 'DE-FRMA-UNI', 'DE', 'Hermes Club e.V.\nGoethe-Universität Frankfurt\nCampus Westend, Norbert-Wollheim-Platz 1\n60323 Frankfurt am', 'Frankfurt/Main', 'http://unifrankfurt.esngermany.org/', 'https://www.facebook.com/esn.Frankfurt.am.Main?fref=ts', 9, 50),
(129, 'ESN Fribourg', '2015-11-15 17:19:11', 'CH-FRIB-ESN', 'CH', 'Av. de l''Europe 20\nBureau', '1700 Fribourg', 'http://fribourg.esn.ch/', 'http://www.facebook.com/index.php?lh=3ab9750d5acb59ed9af4f9f6b2d217af&eu=ptNRGuga7YkbObFpXkaH4g#!/profile.php?id=100001539819834', 7, 47),
(130, 'ESN GCU', '2015-11-15 17:19:11', 'GB-GLAS-CAL', 'GB', 'ESN GCU,\nGCU Students'' Association,\n70 Cowcaddens Road,\n\nG4 0BA\nUnited', 'Glasgow', 'gcu.esnuk.org', 'https://www.facebook.com/ESNGCU?fref=ts', -4, 56),
(131, 'ESN Galway', '2015-11-15 17:19:11', 'IE-GALW-ESN', 'IE', 'c/o Eimhin McEvoy, Societies Office, NUI , ', 'Galway', 'https://www.facebook.com/ESNGalway', 'https://www.facebook.com/groups/576643639023202/', 0, 0),
(132, 'ESN Gandia UPV', '2015-11-15 17:19:11', 'ES-GAND-UPV', 'ES', 'Sala de Asociaciones, Campus de Gandia - UPV , Calle Paranimf 1, 46730 Grao de Gandia (Valencia)', 'Grao de Gandia (Valencia)', 'https://www.facebook.com/pages/ESN-Gandia-UPV/139733566091415?fref=ts', '', 0, 0),
(133, 'ESN Gazi', '2015-11-15 17:19:11', 'TR-ANKA-GAZ', 'TR', 'Gazi Universitesi Rektorlugu 06500 Teknikokullar, ', 'Ankara', 'http://gazi.esnturkey.org', '', 0, 0),
(134, 'ESN Gdansk (Politechnika)', '2015-11-15 17:19:12', 'PL-GDAN-POL', 'PL', 'ESN  (Politechnika)\n"Bratniak" room 213\nSiedlicka 4\n80-222 \nPoland', 'Gdansk', 'http://gdansk.esn.pl', '', 19, 54),
(135, 'ESN Gelisim', '2015-11-15 17:19:12', 'TR-ISTA-GEL', 'TR', 'Sht. Pyd. Er. Murat Sengoz Street. No:8, Avcilar -  / Turkey\n(Fine Arts Faculty, 2nd floor)\n\nPostal Code:34315', 'Istanbul', 'http://dio.gelisim.edu.tr/', 'https://www.facebook.com/EsnGelisim', 0, 0),
(136, 'ESN Gent', '2015-11-15 17:19:12', 'BE-GENT-ESN', 'BE', 'ESN , Therminal, Hoveniersberg 24, 9000 Ghent', 'Gent', 'www.esngent.org', 'http://www.facebook.com/esn.gent', 4, 51),
(137, 'ESN Genève', '2015-11-15 17:19:12', 'CH-GENE-UNI', 'CH', 'ESN \nc/o CUAE, Uni Mail\nBd du Pont-d''Arve 40\n1211', 'Genève', 'geneva.esn.ch', 'http://www.facebook.com/groups/esn.geneve/', 6, 46),
(138, 'ESN Globe and Co Nancy', '2013-01-01 00:00:00', 'FR-NANC-GLO', 'FR', 'ESN Globe and Co , 28 rue Désilles , 54000 ', 'Nancy', 'https://www.facebook.com/GlobeAndCo', '', 6, 49),
(139, 'ESN Granada', '2015-11-15 17:19:12', 'ES-GRAN-ESN', 'ES', 'C/Verónica de la Magdalena, 23 3º floor, 18002, ', 'Granada', 'www.esngranada.org', 'www.facebook.com/groups/163391017057574/', -4, 37),
(140, 'ESN Groningen', '2015-11-15 17:19:12', 'NL-GRON-WIN', 'NL', 'ESN \nPelsterstraat 23\n9711 KH', 'Groningen', 'www.esn-groningen.nl', 'http://www.facebook.com/groningen.esn', 7, 53),
(141, 'ESN Gyõr', '2015-11-15 17:19:12', 'HU-GYOR-ESN', 'HU', 'Széchenyi István Egyetem, International Project Center, Egyetem tér 1. IPC, 9026 Gyõr', 'Gyor', 'http://sze.esn.hu/', 'https://www.facebook.com/gyor.esn', 18, 48),
(142, 'ESN HEC Liege', '2015-11-15 17:19:12', 'BE-LIEG-HEC', 'BE', 'ESN HEC Liege, Rue Louvrex 14, 4000 ', 'Liège', 'http://esn.hec-ulg.be/', '', 6, 51),
(143, 'ESN HELGA', '2015-11-15 17:19:12', 'FI-HELS-KAN', 'FI', 'ESN HELGA\nC/o Haaga-Helia UAS\nRatapihantie 13\n00520', 'Helsinki', 'www.esn-helga.com', 'https://www.facebook.com/ESNHELGA', 25, 60),
(144, 'ESN HELMo', '2015-11-15 17:19:12', 'BE-LIEG-HEL', 'BE', '41 Mont Saint Martin, 4000 ', 'Liege', 'http://www.helmo.be/international/EN/esn.php', 'https://www.facebook.com/erasmus.helmo', 0, 0),
(145, 'ESN HEPL', '2015-11-15 17:19:12', 'BE-LIEG-HEP', 'BE', 'c/o Bureau des Relations Internationales, Avenue Montesquieu 6, 4101 Seraing', 'Liege', 'www.esnhepl.be', 'www.facebook.com/erasmus.hepl', 0, 0),
(146, 'ESN HTW Chur', '2015-11-15 17:19:12', 'CH-CHUR-HTW', 'CH', 'ESN HTW , c/o International Office, Comercialstrasse 24, 7000 ', 'Chur', 'https://www.facebook.com/ESNChur', '', 0, 0),
(147, 'ESN HTW Dresden', '2015-11-15 17:19:12', 'DE-DRES-HTW', 'DE', 'ESN HTW \nFriedrich-List-Platz 1\n01069', 'Dresden', 'http://faranto.esn-germany.de/', 'http://www.facebook.com/Faranto.eV', 14, 51),
(148, 'ESN Hacettepe', '2015-11-15 17:19:12', 'TR-ANKA-HAC', 'TR', ' Hacettepe University, European Union Office, Rectors Building Ninth Floor, Beytepe/ 06800', 'Ankara', 'hacettepe.esnturkey.org', 'https://www.facebook.com/profile.php?id=100008308118813&fref=ts', 0, 0),
(149, 'ESN Haderslev', '2015-11-15 17:19:12', 'DK-HADE-ESN', 'DK', 'Lembckesvej 3-7, 6100 ', 'Haderslev', 'http://www.esnhaderslev.dk/', 'https://www.facebook.com/ESNCampusHaderslev?ref=ts&fref=ts', 0, 0),
(150, 'ESN Halle (Saale)', '2015-11-15 17:19:13', 'DE-HALL-ESN', 'DE', 'ESN Halle (Saale)\nBeesener Straße 226\n06110 Halle (Saale)\nDE', 'Halle (Saale)', 'http://halle.esn-germany.de/de', '', 0, 0),
(151, 'ESN Hamburg', '2015-11-15 17:19:13', 'DE-HAMB-HAR', 'DE', 'ESN \nAm Schwarzenberg-Campus 4\n21073', 'Hamburg', 'http://hamburg.esn-germany.de/de', '', 10, 54),
(152, 'ESN Hannover', '2015-11-15 17:19:13', 'DE-HANN-ESN', 'DE', 'ESN \nWelfengarten 1\nPostfach 188\n30167', 'Hannover', 'hannover.esn-germany.de', '', 10, 52),
(153, 'ESN Haskoli Islands', '2015-11-15 17:19:13', 'IS-REJK-HAS', 'IS', 'Sæmundargotu 2, 101, ', 'Reykjavik', 'http://student.is ', '', 0, 0),
(154, 'ESN Hasselt', '2015-11-15 17:19:13', 'BE-DIEP-ESN', 'BE', 'ESN , Agoralaan gebouw D, 3590 Diepenbeek', 'Hasselt', 'http://esnhasselt.be/', 'https://www.facebook.com/esnhasselt', 0, 0),
(155, 'ESN Heidelberg', '2015-11-15 17:19:13', 'DE-HEID-ESN', 'DE', 'ESN  e.V.\nIm Neuenheimer Feld 267\n69120', 'Heidelberg', 'http://heidelberg.esn-germany.de/', 'www.facebook.com/esn.heidelberg', 0, 0),
(156, 'ESN Heriot-Watt', '2015-11-15 17:19:13', 'GB-EDIN-HER', 'GB', 'ESN Heriot-Watt,\nHeriot-Watt University Student Union,\n,\nMidlothian\nEH14 4AS\nUnited', 'Edinburgh', 'hw.esnuk.org', 'https://www.facebook.com/ESNHW?fref=ts', 0, 0),
(157, 'ESN Hertfordshire', '2015-11-15 17:19:13', 'GB-HERT-ESN', 'GB', 'ESN Hertfordshire,\nEuropean & Study Abroad Office MO16,\nDe Havilland Campus,\n\nAL10 9AB\nUnited', 'Hatfield', 'http://herts.esnuk.org', 'http://www.facebook.com/esnhertfordshire', 0, 0),
(158, 'ESN Huelva', '2015-11-15 17:19:13', 'ES-HULV-ESN', 'ES', 'Avda. Fuerzas Armadas S/N, Campus del Carmen. 21071, ', 'Huelva', 'www.esnhuelva.es', 'https://www.facebook.com/esnhuelva', 0, 0),
(159, 'ESN IAC TURKU', '2015-11-15 17:19:13', 'FI-TURK-IAC', 'FI', 'ESN-IAC\nB107\nTurun Ammatikorkeakoulu, Lemminkäisenkatu 30, 20520 ', 'Turku', 'http://www.esn-iac.fi', '', 22, 60),
(160, 'ESN IAU', '2015-11-15 17:19:13', 'TR-ISTA-AYD', 'TR', 'Besyol Mah. Inonu Cad. No:40. 34295 Sefakoy / Kucukçekmece, ', 'Istanbul', 'http://erasmus.aydin.edu.tr', '', 0, 0),
(161, 'ESN IBS', '2015-11-15 17:19:13', 'HU-BUPE-IBS', 'HU', 'c/o Agnes HERINGER, Tarogato ut 2-4, 1021 ', 'Budapest', 'http://ibs.esn.hu', '', 0, 0),
(162, 'ESN IBU ', '2015-11-15 17:19:13', 'TR-BOLU-IBU', 'TR', 'Abant İzzet Baysal Universitesi Golkoy Kampusu, Erasmus Ofisi, 14280 ', 'Bolu', 'http://ibu.esnturkey.org', '', 0, 0),
(163, 'ESN ICHEC', '2015-11-15 17:19:13', 'BE-BRUS-HEC', 'BE', 'Rue au Bois, n°365A, 1050 Woluwe-Saint-Pierre', 'Brussels', 'http://www.esnichec.org/', 'http://www.facebook.com/esnichecbrussels?ref=ts&fref=ts', 0, 0),
(164, 'ESN INHolland Diemen', '2015-11-15 17:19:13', 'NL-DIEM-INH', 'NL', 'Wildenborch 6 (room Y1.04),\n1112 XB', 'Diemen', 'http://esndiemen.nl', '', 5, 52),
(165, 'ESN INHolland Haarlem', '2015-11-15 17:19:14', 'NL-HAAR-ESN', 'NL', 'Bijdorplaan 15,\n2015 CG', 'Haarlem', 'http://esnhaarlem.nl', '', 5, 52),
(166, 'ESN INHolland Rotterdam', '2015-11-15 17:19:14', 'NL-ROTT-INH', 'NL', 'Posthumalaan 90 (room 0.309)\n3072 AG', 'Rotterdam', 'http://esnrotterdam.nl/', 'https://www.facebook.com/RotterdamINHollandESN', 4, 52),
(167, 'ESN INTO Tampere', '2015-11-15 17:19:14', 'FI-TAMP-INT', 'FI', 'International Students Club ESN INTO \nKorkeakoulunkatu 10 FI-33720', 'Tampere', 'http://www.esninto.org', 'http://www.facebook.com/groups/5174353093/', 24, 61),
(168, 'ESN ISLB', '2015-11-15 17:19:14', 'LT-VILN-ISLB', 'LT', 'Laisves Ave. 58, LT-05120', 'Vilnius', 'http://islb.esnlithuania.org', 'http://www.facebook.com/pages/ISLB/126079124089968', 0, 0),
(169, 'ESN ISM', '2015-11-15 17:19:14', 'LT-VILN-ISM', 'LT', 'Arklių g. 18, LT-01305, Vilnius', 'Vilnius / Kaunas', 'http://ism.esnlithuania.org', 'https://www.facebook.com/ESN.ISM', 0, 0),
(170, 'ESN ITU', '2015-11-15 17:19:14', 'TR-ISTA-ITU', 'TR', 'ESN ITU\nİTÜ Avrupa Birliği Merkezi, Erasmus Ofisi, Ayazağa Kampüsü, Otomasyon Binası (metro üstü), \nMaslak/İstanbul\n34469', 'ISTANBUL', 'http://esnturkey.org/itu/', 'https://www.facebook.com/esnitu?fref=ts', 29, 41),
(171, 'ESN IUE', '2015-11-15 17:19:14', 'TR-IZMI-IUE', 'TR', 'Sakarya Caddesi No:156, Balçova, 35330, ', 'Izmir', '', '', 0, 0),
(172, 'ESN IULM MILANO', '2015-11-15 17:19:14', 'IT-MILA-IUL', 'IT', 'ESN IULM\nc/o Ufficio Affari Internazionali, 4° piano, Università IULM\nVia Carlo Bo 1\n20143', 'Milano', 'http://www.esniulm.it', 'https://www.facebook.com/esniulm?fref=ts', 9, 45),
(173, 'ESN IZU', '2015-11-15 17:19:14', 'TR-IZMI-ESN', 'TR', 'Gürsel Aksel Bulvarı n.14, 35350, ', 'Izmir', 'http://izu.esnturkey.org', 'https://www.facebook.com/IzuInsc', 0, 0),
(174, 'ESN Iasi', '2015-11-15 17:19:14', 'RO-IASI-ESN', 'RO', 'Romania, , Blvd Carol I, no 11, Departamentul de Relatii Internationale, Cod Postal: 700506\n', 'Iasi', 'www.esn.ro', 'https://www.facebook.com/esn.iasi?ref=hl', 28, 47),
(175, 'ESN Imperial', '2015-11-15 17:19:14', 'GB-LOND-IMP', 'GB', 'ESN Imperial,\nImperial College Union,\nPrince Consort Road,\n\nSW7 2BB\nUnited', 'London', 'https://imperial.esnuk.org', 'https://www.facebook.com/erasmusimperial?fref=ts', 0, 0),
(176, 'ESN Ingolstadt', '2015-11-15 17:19:14', 'DE-INGO-ESN', 'DE', 'Auf der Schanz 49, 85049, ', 'Ingolstadt', 'http://ingolstadt.esngermany.org/', '', 0, 0),
(177, 'ESN Innsbruck', '2015-11-15 17:19:14', 'AT-INNS-ESN', 'AT', 'ESN \nc/o Ref. für Internationales\nJosef-Hirn-Straße 7/2\n6020', 'Innsbruck', 'innsbruck.esnaustria.org', 'http://www.facebook.com/pages/ESN-Innsbruck/154937465776', 11, 47),
(178, 'ESN Ioannina ', '2015-11-15 17:19:14', 'GR-IOAN-ESN', 'GR', 'ESN , University of , P.O. box 1186 GR 45110 ', 'Ioannina', 'http://ioannina.esngreece.gr', 'https://www.facebook.com/pages/ESN-Ioannina', 21, 40),
(179, 'ESN Isik', '2015-11-15 17:19:14', 'TR-ISTA-ISK', 'TR', 'ESN Isik\nIşık Üniversitesi Şile kampüsü, Üniversite Sokak\nDış Kapı No:2 Şile\n 34980', 'İstanbul', '', '', 29, 41),
(180, 'ESN Jaen', '2015-11-15 17:19:14', 'ES-JAEN-ESN', 'ES', 'Campus Las Lagunillas Edificio Bachiller Perez de Moya C-2 Despacho 303', 'Jaén', 'www.esnjaen.org', 'http://www.facebook.com/esn.jaen', -4, 38),
(181, 'ESN Jelgava', '2015-11-15 17:19:14', 'LV-JELG-LLU', 'LV', 'ESN , Ruta Kļava, 2 Liela Street, , LV-3001', 'Jelgava', '', 'www.facebook.com/Erasmusjelgava', 0, 0),
(182, 'ESN Jena', '2015-11-15 17:19:15', 'DE-JENA-ESN', 'DE', 'ESN \nc/o Int.Ro - Haus auf der Mauer\nJohannisplatz 26\n07743', 'Jena', 'www.esn-jena.de', 'www.facebook.com/ESNJena', 12, 51),
(183, 'ESN Joensuu (ESN ISYY)', '2015-11-15 17:19:15', 'FI-JOEN-JYY', 'FI', 'Yliopistokatu 7 (Haltia building, 2nd floor), 80100 ', 'Joensuu', 'http://esnjoensuu.fi', 'https://www.facebook.com/ESNJoensuu?fref=ts', 30, 63),
(184, 'ESN Jyväskylä', '2015-11-15 17:19:15', 'FI-JYVA-JYY', 'FI', 'ESN \nc/o Claudia Thomayer\nTaitoniekantie 9 D 715\n40740', 'Jyväskylä', 'www.esnjyvaskyla.com', 'https://www.facebook.com/groups/155719097886267/', 26, 62),
(185, 'ESN KAPA Athens', '2015-11-15 17:19:15', 'GR-ATHE-KAP', 'GR', 'ESN KAPA \n2nd floor, Student Residence *in Greek: Φοιτητική Εστία (Fititikí Estía) \nUniversity Campus 2-4 Ymittou av.\n15771', 'Athens', 'http://esnkapa.org/athens/', 'http://www.facebook.com/pages/ESN-Kapa-Athens/91663481753', 24, 38),
(186, 'ESN KJF', '2015-11-15 17:19:15', 'HU-SZEK-KOD', 'HU', 'Fürdő utca 1., 8000, Székesfehérvár', 'Székesfehérvár/Budapest', 'kjf.esn.hu', 'https://www.facebook.com/esnkjf?fref=ts', 0, 0),
(187, 'ESN KK', '2015-11-15 17:19:15', 'LT-KAUN-KK1', 'LT', 'ESN KK \nPramonės pr. 20 -224  \nLT-50468 ', 'Kaunas', 'http://kk.esnlithuania.org', 'http://www.facebook.com/group.php?gid=379936046412', 24, 55),
(188, 'ESN KTU', '2015-11-15 17:19:15', 'LT-KAUN-ESN', 'LT', 'ESN KTU\nLT-51392', 'Kaunas', 'http://ktu.esnlithuania.org/', 'https://www.facebook.com/ESN.KTU', 24, 55),
(189, 'ESN KUK', '2015-11-15 17:19:16', 'LT-KLAI-ESN', 'LT', 'Klaipėdos universiteto Tarptautinių Ryšių Skyrius\nH. Manto st., 84, \nLT-92294, ', 'Klaipeda', 'http://kuk.esnlithuania.org', 'https://www.facebook.com/esnkuk.klaipeda', 0, 0),
(190, 'ESN KULBrussels', '2015-11-15 17:19:16', 'BE-BRUS-EHS', 'BE', 'Stormstraat 2 \n1000', 'Brussels', 'www.esnhubrussels.com', 'http://www.facebook.com/groups/esnhubrussels/', 4, 51),
(191, 'ESN Kadir Has', '2015-11-15 17:19:16', 'TR-KHAS-ESN', 'TR', 'Kadir Has Caddesi\n34083', 'Istanbul', '', '', 29, 41),
(192, 'ESN Kaiserslautern', '2015-11-15 17:19:16', 'DE-KAIS-ESN', 'DE', 'STEP e.V.; Technische Universität ; Fachbereich Wirtschaftswissenschaften; International Office; Gottlieb-Daimler-Str. 42/414; 67663 ;', 'Kaiserslautern', 'http://www.uni-kl.de/step', '', 8, 49),
(193, 'ESN Kalmar', '2015-11-15 17:19:16', 'SE-KALM-ESN', 'SE', 'ESN \nLinnégatan 5\n392 34', 'Kalmar', 'esnkalmar.org', 'http://www.facebook.com/#!/pages/ESN-Kalmar/120823584610866', 16, 57),
(194, 'ESN Karatekin', '2015-11-15 17:19:16', 'TR-CANK-ESN', 'TR', 'Cumhuriyet Mah,. S.p.Ustegmen Erdem Ozturk Sok, No. 12, Merkez / , 18100 Merkez, , Turkey\n', 'Cankiri', 'http://karatekin.esnturkey.org', '', 0, 0),
(195, 'ESN King''s', '2015-11-15 17:19:16', 'GB-KING-ESN', 'GB', 'ESN King''s,\nKing''s College  Students'' Union,\nMacAdam Building,\nSurrey Street,\n\nWC2R 2NS\nUnited', 'London', 'kings.esnuk.org', 'https://www.facebook.com/kingserasmus.soc?fref=ts', 0, 0),
(196, 'ESN Kisa', '2015-11-15 17:19:16', 'FI-KUOP-KIS', 'FI', 'ESN Kisa\nYliopistonranta 3\n70211', 'Kuopio', '', 'https://www.facebook.com/ESNKISA', 0, 0),
(197, 'ESN Klagenfurt', '2015-11-15 17:19:16', 'AT-KLAG-ESN', 'AT', 'ÖH Uni  c/o Referat Entrée, Universitätsstrasse 65-67, 9020 ', 'Klagenfurt', 'http://www.entree.at', 'http://www.facebook.com/entree.klagenfurt', 14, 47),
(198, 'ESN Kocaeli', '2015-11-15 17:19:16', 'TR-KOCA-ESN', 'TR', ' Universitesi Umuttepe Kampusu/ Uluslararasi İliskiler Birimi, 41380 ', 'Kocaeli', '', '', 0, 0),
(199, 'ESN Košice', '2015-11-15 17:19:16', 'SK-KOSI-ESN', 'SK', 'ESN Kosice, Srobárova 2, 040 01 Kosice', 'Kosice - Stare Mesto', 'kosice.esn.sk', '', 21, 49),
(200, 'ESN Koźmiński Warsaw', '2015-11-15 17:19:16', 'PL-WARS-KOZ', 'PL', 'Koźmiński University, Erasmus Student Network Jagellońska 57/59, , POLAND', 'Warsaw', 'http://www.kozminski.esn.pl', '', 21, 52),
(201, 'ESN Kranj', '2015-11-15 17:19:16', 'SI-KRAN-ESN', 'SI', 'ESN \nKidriceva 55/A\n4000', 'Kranj', 'http://www.facebook.com/ESNKRANJ', 'ESN Kranj', 14, 46),
(202, 'ESN Kufstein', '2015-11-15 17:19:16', 'AT-KUFS-ESN', 'AT', 'ESN-, Fachhochschule  c/o ESN-, Andreas-Hofer-Strasse 7, 6330 ', 'Kufstein', 'http://www.fh-kufstein.ac.at/inte/en/_i.php?m=esn/activity.php', '', 12, 48),
(203, 'ESN Kultur', '2015-11-15 17:19:17', 'TR-ISTA-KUL', 'TR', 'ESN Kultur, Bakırköy - Ataköy, Yenibosna, Bahçelievler, Kultur, $', 'Istanbul', 'http://kultur.esnturkey.org', '', 29, 41),
(204, 'ESN Köln', '2015-11-15 17:19:17', 'DE-KOLN-ESN', 'DE', 'ESN , International Office\nUniversität zu \nUniversitätsstraße 22a\n50939', 'Köln', 'koeln.esn-germany.de', 'https://www.facebook.com/esn.koeln?ref=hl', 0, 0),
(205, 'ESN L''Aquila', '2015-11-15 17:19:17', 'IT-AQUI-ESN', 'IT', 'Aquilasmus - ESN L''Aquila\nVia Giovanni di Vincenzo, 16/B\n67100 L''Aquila\nItaly', 'L’Aquila', 'http://www.esnlaquila.it', 'https://www.facebook.com/pages/Aquilasmus-ESN-LAquila/246144552225895?fref=ts', 13, 42),
(206, 'ESN LEI Greifswald', '2015-11-15 17:19:17', 'DE-GREI-ESN', 'DE', 'LEI  n.V.\nc/o International Office Ernst-Moritz-Arndt Universität\nDomstraße 8\n17489', 'Greifswald', 'http://greifswald.esn-germany.de/', 'https://www.facebook.com/LEI.Greifswald06', 13, 54),
(207, 'ESN LEI Rostock', '2015-11-15 17:19:17', 'DE-ROST-ESN', 'DE', 'LEI \nc/o Akademisches Auslandsamt\nKröpeliner Straße 29\n18055', 'Rostock', 'http://www.lei-rostock.org/', '', 12, 54),
(208, 'ESN LEU', '2015-11-15 17:19:17', 'LT-VILN-LEU', 'LT', 'ESN LEU\nTaraso Ševčenkos g. 31\n03111', 'Vilnius', '', 'https://www.facebook.com/pages/ESN-LEU/205995032906297?ref=hl&ref_type=bookmark', 0, 0),
(209, 'ESN LUT', '2015-11-15 17:19:17', 'PL-LUBL-LUT', 'PL', 'ESN LUT, Nadbystrzycka, 42A, 20-501 ', 'Lublin', 'http://www.lut.esn.pl/', '', 0, 0),
(210, 'ESN La Rochelle', '2013-01-01 00:00:00', 'FR-ROCH-ESN', 'FR', '12 Rue Léonce Vieljeux, 17000, ', 'La Rochelle', 'www.larochelle.ixesn.fr', 'https://www.facebook.com/asso.islr', 0, 0),
(211, 'ESN Landau', '2015-11-15 17:19:17', 'DE-LAND-IPA', 'DE', '76829 ', 'Landau in der Pfalz', 'http://landau.esngermany.org/', '', 0, 0),
(212, 'ESN Lapland', '2015-11-15 17:19:17', 'FI-ROVA-LYY', 'FI', 'Lapin yliopiston ylioppilaskunta / ESN Ahkiomaantie 17 B, 96300 ', 'Rovaniemi', 'http://www.esnlapland.com/', 'https://www.facebook.com/pages/ESN-Lapland-Section-Rovaniemi/393380987420546', 26, 66),
(213, 'ESN Lappeenranta', '2015-11-15 17:19:17', 'FI-LAPP-ESN', 'FI', 'Laserkatu 10, 53850, ', 'Lappeenranta', 'http://www.esnlappeenranta.fi', 'https://www.facebook.com/group.php?gid=133421663369120', 28, 61),
(214, 'ESN Larissa', '2015-11-15 17:19:17', 'GR-LARI-ESN', 'GR', 'Erasmus office, 41110, ', 'Larissa', 'http://larissa.esngreece.gr', 'https://www.facebook.com/esnlarissa?fref=ts', 0, 0),
(215, 'ESN Lazarski Warsaw', '2015-11-15 17:19:17', 'PL-WARS-LAZ', 'PL', 'ESN Lazarski \nŚwieradowska 43\nroom 100\n02-663', 'Warsaw', 'lazarski.esn.pl', 'http://www.facebook.com/pages/ESN-%C5%81azarski/201582339868314', 21, 52),
(216, 'ESN Le Mans', '2013-01-01 00:00:00', 'FR-MANS-ESN', 'FR', 'chez Napias Gael, 65 avenue Rubillard, 72000 ', 'Le Mans', 'http://lemans.ixesn.fr', '', 0, 0),
(217, 'ESN Leeds', '2015-11-15 17:19:17', 'GB-LEED-ESN', 'GB', '31 Lovell park hill\nLS7 1DF', 'Leeds', 'http://leeds.esnuk.org/', 'https://www.facebook.com/ESNLeeds/timeline/', 0, 0),
(218, 'ESN Leeuwarden', '2015-11-15 17:19:18', 'NL-LEEU-ESN', 'NL', 'Rengerslaan 10,\n8917 DD', 'Leeuwarden', 'http://esn-leeuwarden.com', '', 6, 53),
(219, 'ESN Leiria', '2015-11-15 17:19:18', 'PT-LEIR-ESN', 'PT', 'Campus 2, Morro do Lena - Alto do Vieiro, . Apartado 4137 | 2411-901, , Portugal\n4137', 'Leiria', '', '', 0, 0),
(220, 'ESN Leoben', '2015-11-15 17:19:18', 'AT-LEOB-ESN', 'AT', 'Franz-Josef-Straße 18, 8700 ', 'Leoben', 'http://esn.oeh-leoben.at', '', 0, 0),
(221, 'ESN Leuven', '2015-11-15 17:19:18', 'BE-LEUV-ESN', 'BE', 'ESN \nVesaliusstraat 34\n3000', 'Leuven', 'www.esnleuven.be', 'https://www.facebook.com/esnleuven', 0, 0),
(222, 'ESN Liberec', '2015-11-15 17:19:18', 'CZ-LIBE-ESN', 'CZ', 'ESN , Koleje Harcov\n17. listopadu 584\n 15 46015\n46015', 'Liberec', 'http://www.esn-liberec.cz/', 'http://www.facebook.com/pages/ESN-Liberec/266923716703692', 0, 0),
(223, 'ESN Lille', '2013-01-01 00:00:00', 'FR-LILL-ESL', 'FR', 'ESN Lille\nMaison des étudiants, cité scientifique\n59650', 'Villeneuve d''ascq', 'www.esnlille.fr/satellite', 'http://www.facebook.com/pages/ESN-Lille/168987826524957', 0, 0),
(224, 'ESN Linköping', '2015-11-15 17:19:18', 'SE-LINK-ESN', 'SE', 'ESN \nKårallen\ns Universitet\n58183', 'Linköping', 'www.esnlinkoping.org', '', 16, 58),
(225, 'ESN Linz', '2015-11-15 17:19:18', 'AT-LINZ-ESN', 'AT', 'ESN \nÖH REFI\nAltenbergerstraße 69\n4040', 'Linz', 'esnlinz.org', 'https://www.facebook.com/ESN.Linz', 14, 48),
(226, 'ESN Lisboa', '2015-11-15 17:19:18', 'PT-LISB-ESN', 'PT', 'Travessa dos Inglesinhos nº 52, Bairro Alto, \n1200-223', 'Lisboa', 'http://esnlisboa.org/', 'https://www.facebook.com/ErasmusStudentNetworkLisboa', -9, 39),
(227, 'ESN Liverpool  ', '2015-11-15 17:19:18', 'GB-LIVE-ESN', 'GB', 'ESN \n28 Denstone Ave\nAintree\nL106LH', 'Liverpool', 'http://liverpool.esnuk.org', 'https://www.facebook.com/esnliverpool?fref=ts', 0, 0),
(228, 'ESN Ljubljana', '2015-11-15 17:19:18', 'SI-LJUB-ESN', 'SI', 'ŠOU v Ljubljani\nKersnikova 4\n1000 \nSI', 'Ljubljana', 'www.esn-ljubljana.si', 'http://www.facebook.com/pages/ESN-Ljubljana/259192217448556', 15, 46),
(229, 'ESN Ljubljana University', '2015-11-15 17:19:18', 'SI-LJUB-FDV', 'SI', 'Kardeljeva ploščad 5, ', 'Ljubljana', '', '', 0, 0),
(230, 'ESN Louvain-la-Neuve', '2015-11-15 17:19:18', 'BE-LLNE-ESN', 'BE', 'ESN Louvain-la-Neuve, Place des Doyens 1, office A', 'Louvain-La-Neuve', 'http://esnlln.org', 'https://www.facebook.com/pages/ESN-LLN/137435553013900?fref=ts', 5, 51),
(231, 'ESN Lugano', '2015-11-15 17:19:19', 'CH-LUGA-ESN', 'CH', 'Università della Svizzera italiana, via G. Buffi 13, 6900 ', 'Lugano', 'http://lugano.esn.ch/', 'https://www.facebook.com/pages/ESN-Lugano/309256505771855', 0, 0),
(232, 'ESN Lund', '2015-11-15 17:19:19', 'SE-LUND-ESN', 'SE', 'Sandgatan 2\n223 50', 'Lund', 'http://www.esnlund.org', 'http://www.facebook.com/groups/ESNLund', 13, 56),
(233, 'ESN Luxembourg', '2015-11-15 17:19:19', 'LU-LUXE-ESN', 'LU', '162a avenue de la Faiencerie, 1511 ', 'Luxembourg', 'esn.lu', 'https://www.facebook.com/esnluxembourg', 0, 0),
(234, 'ESN Lyon', '2013-01-01 00:00:00', 'FR-LYON-ESN', 'FR', 'ESN Cosmo\n25, Rue Jaboulay\n69007', 'Lyon', 'http://lyon.ixesn.fr/', 'https://www.facebook.com/ESNCosmoLyon?fref=ts', 5, 46),
(235, 'ESN MESA München', '2015-11-15 17:19:19', 'DE-MUNI-MES', 'DE', 'MESA , c/o Referat Internationale Angelegenheiten\nGeschwister-Scholl-Platz 1, D-80539 Munich', 'München', 'http://mesa.esn-germany.de', 'https://www.facebook.com/pages/Erasmus-Student-Network-MESA-Munich/1443779672527299?ref=aymt_homepage_panel', 12, 48),
(236, 'ESN METU', '2015-11-15 17:19:19', 'TR-ANKA-MET', 'TR', 'ESN METU\n	 	 International Cooperations Office Solmaz Izdemir Hall, Main Library Building \nMiddle East Technical University Universiteler Mah. Dumlupinar Blv. No:1 \n06800', 'Ankara', 'metu.esnturkey.org', 'https://www.facebook.com/#!/groups/222979244431753/', 0, 0),
(237, 'ESN MONS''ters', '2015-11-15 17:19:19', 'BE-MONS-UCL', 'BE', 'c/o Marchesani Enrico, Chaussee de Binche 151, B-7000 ', 'Mons', 'online as soon as possible', '', 0, 0),
(238, 'ESN MRU Vilnius', '2015-11-15 17:19:19', 'LT-VILN-MRU', 'LT', 'ESN MRU \nMykolas Romeris University\nAteities str. 20 \n05268', 'Vilnius', 'http://mru.esnlithuania.org/', 'http://www.facebook.com/esn.mru.vilnius', 25, 55),
(239, 'ESN MU', '2015-11-15 17:19:19', 'TR-ISTA-MAL', 'TR', 'Marmara Egitim Koyu 34857 Maltepe, Istanbul', 'Turkey', '', '', 0, 0),
(240, 'ESN Macerata', '2015-11-15 17:19:19', 'IT-MACE-ESN', 'IT', 'Associazione “MacErasmus” - ESN \nc/o Centro Rapporti Internazionali – Università di \nVia della Pescheria Vechia\n62100', 'Macerata', 'http://www.esnmacerata.it', 'http://www.facebook.com/esn.macerasmus', 13, 43);
INSERT INTO `section` (`id`, `name`, `joindate`, `code`, `country`, `street`, `city`, `website`, `facebook`, `longitude`, `latitude`) VALUES
(241, 'ESN Madeira', '2015-11-15 17:19:19', 'PT-FUNC-ESN', 'PT', 'ESN Madeira\nRua do Poço Barral, n.º 4, casa C, freguesia de São Martinho,\n9000-154', 'Funchal', 'www.esnmadeira.org', 'https://www.facebook.com/ESNMadeira', 0, 0),
(242, 'ESN Maleventum', '2015-11-15 17:19:19', 'IT-BENE-ESN', 'IT', 'Ufficio Relazioni Internazionali \nUniversità degli Studi del Sannio, complesso di S.Agostino\nVia G. De Nicastro, n. 13\n82100', 'Benevento', 'http://www.esnmaleventum.it', '', 15, 41),
(243, 'ESN Malmö', '2015-11-15 17:19:19', 'SE-MALM-INT', 'SE', 'Studentkåren \nBassängkajen 8\n211 18', 'Malmö', 'http://esnmalmo.org', 'https://www.facebook.com/pages/ESN-Malm%C3%B6/211265365580653?ref=aymt_homepage_panel', 13, 56),
(244, 'ESN Malta', '2015-11-15 17:19:19', 'MT-MALT-ESN', 'MT', '‘Student’s House’, University of Malta, Tal-Qroqq, , MSD 2080', 'Msida', 'www.esnmalta.org', 'https://www.facebook.com/esnmalta', 14, 36),
(245, 'ESN Mannheim', '2015-11-15 17:19:20', 'DE-MANN-ESN', 'DE', 'ESN \nParkring 39\n68159', 'Mannheim', 'www.visum-mannheim.de', '', 8, 49),
(246, 'ESN Maribor', '2015-11-15 17:19:20', 'SI-MARI-ESN', 'SI', 'ESN \nSlomškov trg 15\n2000', 'Maribor', 'http://esn-mb.org/', 'http://www.facebook.com/#!/erasmus.maribor', 16, 47),
(247, 'ESN Marmara', '2015-11-15 17:19:20', 'TR-ISTA-MAR', 'TR', 'ESN Marmara, Marmara University LLP / Erasmus Unit, Goztepe Campus, 34722 Kadikoy/', 'Istanbul', 'http://marmara.esnturkey.org/', '', 29, 41),
(248, 'ESN Marseille', '2014-10-09 00:00:00', 'FR-MARS-ESN', 'FR', 'ERASMUS STUDENT NETWORK \nCIELL, Faculté des Sciences de Luminy - Case 901\n163, Avenue de Luminy\n13009', 'MARSEILLE', 'marseille.ixesn.fr', 'https://www.facebook.com/pages/Erasmus-Marseille/1451833478409285?fref=ts', 0, 0),
(249, 'ESN Med Uni Wien', '2015-11-15 17:19:20', 'AT-WIEN-MUN', 'AT', 'HochschülerInnenschaft an der Medizinischen Universität Wien, NAKH, Ebene 6M, Währinger Gürtel 18-20, 1090 Wien', 'Vienna', 'http://www.uv-medizin.at', '', 16, 48),
(250, 'ESN Mersin', '2015-11-15 17:19:20', 'TR-MERS-ESN', 'TR', ' Universitesi Yenisehir Kampusu Dis Iliskiler Sube Mudurlugu, Yenisehir 33169, , Turkey', 'Mersin', '', '', 0, 0),
(251, 'ESN Messina', '2015-11-15 17:19:20', 'IT-MESS-ESN', 'IT', 'ESN \nc/o Centro Servizi Sociali dell''E.r.s.u. di  (Casa dello Studente)\nvia Ghibellina, II piano\n98100', 'Messina', 'http://www.esn-messina.it/', 'http://www.facebook.com/home.php?ref=logo#!/profile.php?id=618019848', 16, 38),
(252, 'ESN Metropolia', '2015-11-15 17:19:20', 'FI-HELS-MET', 'FI', 'Street address\nLeiritie 1\nVantaa\nFINLAND\n Metropolia University of Applied Sciences\nPO Box 4071\nFI-00079 Metropolia\nFinland', 'Helsinki', 'http://esn.metropolia.fi', 'http://www.facebook.com/ESNMetropolia/', 25, 60),
(253, 'ESN Milano Statale', '2015-11-15 17:19:20', 'IT-MILA-STA', 'IT', 'ESN  Statale\nVia Festa del Perdono 7\n20122', 'Milano', 'http://www.esnmilanostatale.it', 'https://www.facebook.com/esnmilanostatale', 9, 45),
(254, 'ESN Milano-Bicocca', '2015-11-15 17:19:20', 'IT-MILA-BIC', 'IT', 'ESN -Bicocca\nPiazza Ateneo Nuovo 1\n20100', 'Milano', 'www.esnbicocca.it', 'https://www.facebook.com/esn.milanobicocca', 9, 46),
(255, 'ESN Minho', '2015-11-15 17:19:20', 'PT-MINH-UOM', 'PT', '', 'Braga & Guimarães', 'www.esnminho.org', 'https://www.facebook.com/esnminho', 0, 0),
(256, 'ESN Miskolc', '2015-11-15 17:19:20', 'HU-MISK-ESN', 'HU', 'ESN , -Egyetemváros, Diákiroda, 3515 ', 'Miskolc', 'http://miskolc.esn.hu/', '', 21, 48),
(257, 'ESN Modena ENEA', '2015-11-15 17:19:20', 'IT-MODE-ESN', 'IT', 'ESN MODENA ENEA\nVia Ganaceto, 44\n41121', 'Modena', 'http://www.esnmodena.it', 'https://www.facebook.com/profile.php?id=1472312411', 11, 45),
(258, 'ESN Molde', '2015-11-15 17:19:20', 'NO-MOLD-ESN', 'NO', 'ESN , Høgskolen i , Postboks 2110, 6402 , Norway', 'Molde', 'www.molde.esn.no', 'https://www.facebook.com/pages/ESN-Molde/587688597924242', 7, 63),
(259, 'ESN Montpellier', '2014-02-01 00:00:00', 'FR-MONT-ESN', 'FR', 'ESN Montpellier\n Maison de l''étudiant Espace Richter, \n Rue Vendémiaire Bâtiment B, CS 19519\n34960', 'Montpellier cedex 2', 'http://montpellier.ixesn.fr/', 'https://www.facebook.com/esnmtp', 0, 0),
(260, 'ESN Murcia', '2015-11-15 17:19:21', 'ES-MURC-ESN', 'ES', 'ESN \nAulario de La Merced, 2ª Planta\nCampus de La Merced, 30001', 'Murcia', 'http://www.esnmurcia.es', 'www.facebook.com/esnmurcia.es', -1, 38),
(261, 'ESN Málaga', '2015-11-15 17:19:21', 'ES-MALA-ESN', 'ES', 'ESN \nFacultad de Ciencias Económicas y Empresariales de \n(Pabellón de gobierno adjunto) Calle Ejido 6\n29071', 'Málaga', 'www.esn-malaga.org', 'http://www.facebook.com/#!/esnmalaga', 0, 0),
(262, 'ESN NASE Udine', '2015-11-15 17:19:21', 'IT-TAVA-ESN', 'IT', 'ESN NASE Udine \nSede Legale c/o Baracetti\nPiazza Giuseppe Garibaldi 27\n33010 Tavagnacco (UD)\nIT', 'Tavagnacco (UD)', 'www.esnnaseudine.it', 'http://www.facebook.com/esnnaseudine/', 0, 0),
(263, 'ESN NTU', '2015-11-15 17:19:21', 'GB-NOTT-NTU', 'GB', 'Nottingham Trent Students'' Union, ESN NTU, Shakespeare Street, NG1 4GH,', ' Nottingham', '', '', 0, 0),
(264, 'ESN NTUA Athens', '2015-11-15 17:19:21', 'GR-NTUA-ESN', 'GR', 'ESN NTUA , c/o Charalambous Alexios-Tryfonas, Zalogou 6, N. Psychiko 15451, Attica, Greece.', 'Athens', 'http://ntua.esngreece.gr', 'http://www.facebook.com/groups/99226227987/', 24, 38),
(265, 'ESN NUPS', '2015-11-15 17:19:21', 'HU-BUPE-NUP', 'HU', 'ESN NUPS Section Office, 1118 Menesi ut 5., Koll. ep. 208, ', 'Budapest', '', '', 0, 0),
(266, 'ESN Nancy', '2013-01-01 00:00:00', 'FR-NANC-ESN', 'FR', 'ESN  \nFaculté de Droit Bureau BR01\n13 Place Carnot\n54000', 'Nancy', 'http://nancy.ixesn.fr/', 'http://fr-fr.facebook.com/Esnnancy', 6, 49),
(267, 'ESN Napoli', '2015-11-15 17:19:21', 'IT-NAPO-ESN', 'IT', 'ESN \nUfficio c/o Università degli studi "Parthenope"\nVia Ammiraglio Ferdinando Acton 38\n\nItaly', 'Napoli', 'http://www.esnnapoli.it', '', 14, 41),
(268, 'ESN Neuchâtel ', '2015-11-15 17:19:21', 'CH-NEUC-ESN', 'CH', 'Bâtiment principal, Université de Neuchâtel, Service immatriculation et mobilité (SIM), Bureau de la mobilité, 2000 Neuchâtel', ' Neuchâtel ', 'http://neuchatel.esn.ch', 'http://www.facebook.com/esn.neuchatel.3', 7, 47),
(269, 'ESN Nice', '2013-01-01 00:00:00', 'FR-NICE-ESN', 'FR', '18 Rue Dalpozzo', 'Nice', 'http://nice.ixesn.fr/', 'http://www.facebook.com/ESN.Nice', 0, 0),
(270, 'ESN Nicosia', '2015-11-15 17:19:21', 'CY-NICO-ESA', 'CY', 'ESN \nProdromou Avenue, 121\nCapital Impact, 1st Floor, Office 12 \n1306', 'Nicosia', 'http://esncy.org', 'https://www.facebook.com/esnnicosia?fref=ts', 0, 0),
(271, 'ESN Nis', '2015-11-15 17:19:22', 'YU-SERB-ESN', 'YU', 'ESN \nBulevar Dr Zorana Djindjica 27/12\n18000', 'Nis', '', 'https://www.facebook.com/nis.esn', 0, 0),
(272, 'ESN Novi Sad', '2015-11-15 17:19:22', 'YU-NOVI-SAD', 'YU', 'ESN Novi Sad\nFruškogorska 8\nNovi Sad\n21000', 'Novi SAd ', 'http://novisad.esn.rs/', 'https://www.facebook.com/esn.novisad', 20, 45),
(273, 'ESN Odense', '2015-11-15 17:19:22', 'DK-ODEN-ESN', 'DK', 'ESN , Campusvej 55, 5230  M', 'Odense', 'http://esnodense.dk', 'https://www.facebook.com/esnodense', 10, 55),
(274, 'ESN Okan', '2015-11-15 17:19:22', 'TR-ISTA-OKA', 'TR', 'ESN Okan\nErasmus Office, Okan Universitesi Tuzla Kampusu, Akfirat, Tuzla\n34959', 'ISTANBUL', 'http://okan.esnturkey.org', 'https://www.facebook.com/Okan.ESN', 0, 0),
(275, 'ESN Olsztyn ', '2015-11-15 17:19:22', 'PL-OLSZ-UWM', 'PL', 'ESN \nul. Oczapowskiego 2\n10-719', 'Olsztyn', 'http://uwm.esn.pl/', 'https://www.facebook.com/ESN.UWM', 20, 54),
(276, 'ESN Olten', '2015-11-15 17:19:22', 'CH-OLTE-ESN', 'CH', 'c/o Fachschaft Wirtschaft , Riggenbachstrasse 16, 4600 ', 'Olten', '', '', 0, 0),
(277, 'ESN Orleans', '2013-01-01 00:00:00', 'FR-ORLE-ESN', 'FR', 'Erasmus Student Network Orléans\nMaison de l''Étudiant\nRue de Tours\n45072 Orléans cedex', 'Orleans', 'http://orleans.ixesn.fr', '', 2, 48),
(278, 'ESN Osijek', '2015-11-15 17:19:22', 'HR-OSIJ-ESN', 'HR', 'ESN \nIstarska 5\n31000', 'Osijek', 'https://www.facebook.com/ESNOsijek?fref=ts', 'https://www.facebook.com/ESNOsijek', 0, 0),
(279, 'ESN Oslo', '2015-11-15 17:19:22', 'NO-OSLO-UNI', 'NO', 'ESN \nBlindern, Villa Eika, 2nd floor\nUniversity of \n0317', 'Oslo', 'http://oslo.esn.no', 'https://www.facebook.com/osloesn?fref=ts', 0, 0),
(280, 'ESN Oviedo', '2015-11-15 17:19:22', 'ES-OVIE-ESN', 'ES', 'Av/ Fernández Ladreda nº 48 (Hotel de Asociaciones)\n33011', 'Oviedo', '', 'http://www.facebook.com/profile.php?id=100001992841569', 0, 0),
(281, 'ESN Oxford Brookes', '2015-11-15 17:19:22', 'GB-OXFO-BRO', 'GB', 'ESN  Brookes,\n Brookes Students'' Union,\nJohn Henry Brookes Building,\nHeadington Campus,\nGipsy Lane,\n\nOX3 0BP\nUnited', 'Oxford', 'brookes.esnuk.org', 'https://www.facebook.com/esn.oxfordbrookes?fref=ts', 0, 0),
(282, 'ESN PB Bialystok', '2015-11-15 17:19:22', 'PL-BIAL-ESN', 'PL', 'ESN PB Bialystok\nZwierzyniecka 12 pok. 9\n15-333', 'Białystok', 'http://pb.esn.pl/en', 'https://www.facebook.com/pages/ESN-PB/182315565138657', 23, 53),
(283, 'ESN PEP Perugia', '2015-11-15 17:19:23', 'IT-PERU-PEP', 'IT', 'ESN PEP \nPiazza Fortebraccio 4\n06122', 'Perugia', 'http://www.perugiaerasmusproject.eu', '', 12, 43),
(284, 'ESN PEU ', '2015-11-15 17:19:23', 'SK-BRAT-PEU', 'SK', 'ESN PEU\nTomášikova 20\n821 02', 'Bratislava', 'peu.esn.sk', 'https://www.facebook.com/groups/285914714772023/', 0, 0),
(285, 'ESN PK Cracow', '2015-11-15 17:19:23', 'PL-KRAK-POL', 'PL', 'ESN PK , Warszawska 24, 31-155 ', 'Cracow', 'http://www.esn.pk.edu.pl', '', 20, 50),
(286, 'ESN PW Warsaw', '2015-11-15 17:19:23', 'PL-WARS-WPW', 'PL', 'ESN PW \nWaryńskiego 12 street\nroom A104\n00-631', 'Warsaw', 'www.pw.esn.pl', '', 21, 52),
(287, 'ESN PWr', '2015-11-15 17:19:23', 'PL-WROC-PWR', 'PL', 'ESN PWr\nul. Wróblewskiego 27\n51-627', 'Wrocław', 'http://pwr.esn.pl/', 'www.facebook.com/esnpwr', 0, 0),
(288, 'ESN Palermo', '2015-11-15 17:19:23', 'IT-PALE-ESN', 'IT', '', 'Palermo', 'http://www.esnpalermo.com', 'https://www.facebook.com/esn.palermo?fref=ts', 13, 38),
(289, 'ESN Panteion', '2015-11-15 17:19:23', 'GR-ATHE-PAN', 'GR', 'ESN Panteion\n136 Syggrou Ave.\nOffice B10- second floor- "D.E.S.Koi." building\n17671', 'Athens', 'http://panteion.esngreece.gr/', 'https://www.facebook.com/pages/ESN-Panteion-Athens/339105192780569?fref=ts', 0, 0),
(290, 'ESN Pardubice', '2015-11-15 17:19:23', 'CZ-PARD-ESN', 'CZ', 'ESN \nStudentská 95\n532 10', 'Pardubice', 'http://buddy.upce.cz/', '', 0, 0),
(291, 'ESN Pavia', '2015-11-15 17:19:23', 'IT-PAVI-ESN', 'IT', 'ST.E.P. ESN   c/o Ufficio Mobilità Studentesca  Università degli Studi di Pavia Via Sant''Agostino 1 27100 Pavia - Italy\n27100', 'PAVIA', 'www.esnpavia.org', 'http://www.facebook.com/esnpavia', 9, 45),
(292, 'ESN Pilsen', '2015-11-15 17:19:23', 'CZ-PILS-UWB', 'CZ', 'ESN , Bolevecka 30, 306 14, , Czech', 'Pilsen', 'http://www.esn.zcu.cz', 'http://www.facebook.com/ESNPilsen', 13, 50),
(293, 'ESN Pisa', '2015-11-15 17:19:23', 'IT-PISA-ESN', 'IT', 'ESN \nVia Fermi 8\n56126', 'Pisa', 'http://www.esnpisa.it', '', 10, 44),
(294, 'ESN Plovdiv', '2015-11-15 17:19:24', 'BG-PLOV-ESN', 'BG', 'ESN , Bul. Vasil Aprilov 15-A, 4002, , Bulgaria\n', 'Plovdiv', 'http://plovdiv.esnbg.org/', 'https://www.facebook.com/plovdiv.esnbg.org', 0, 0),
(295, 'ESN Plymouth', '2015-11-15 17:19:24', 'GB-PLYM-ESN', 'GB', 'ESN \nC/O UPSU\nDrake Circus\nPL4 8AA', 'Plymouth', '', 'https://www.facebook.com/Erasmus-Student-Network-Plymouth-379607922183449/timeline/', 0, 0),
(296, 'ESN Politecnico Milano ', '2015-11-15 17:19:24', 'IT-MILA-POL', 'IT', 'ESN Politecnico \nVia Golgi, 42\n20133', 'Milano', 'http://www.esnpolimi.it/site/', 'www.facebook.com/esnpolimi', 9, 45),
(297, 'ESN Porto', '2015-11-15 17:19:24', 'PT-PORT-ESN', 'PT', 'Praça Gomes Teixeira SN\nReitoria da Universidade do \nRoom 500\n4099-002', 'Porto', 'www.esnporto.org', 'http://www.facebook.com/ErasmusStudentNetworkPorto', -9, 41),
(298, 'ESN Potsdam', '2015-11-15 17:19:24', 'DE-POTS-LEI', 'DE', 'ESN  e.V.\nc/o Universität \nAugust-Bebel-Straße 89\n14482', 'Potsdam', 'http://potsdam.esngermany.org/home-eng.html', 'http://www.facebook.com/esn.lei.potsdam', 13, 52),
(299, 'ESN Poznan', '2015-11-15 17:19:24', 'PL-POZN-ESN', 'PL', 'ESN , \nul. Jana Pawła II 28\n60-995', 'Poznań', 'http://www.esnpoznan.pl/', 'http://www.facebook.com/ESNPOZNAN', 17, 52),
(300, 'ESN Presov', '2015-11-15 17:19:24', 'SK-PRES-UNI', 'SK', 'Ul. 17. novembra 13, 08001, ', 'Presov', 'www.facebook.com/esnpresov', 'www.facebook.com/esnpresov', 0, 0),
(301, 'ESN Primorska', '2015-11-15 17:19:24', 'SI-KOPE-PRI', 'SI', 'Študentska Organizacija Univeze na Primorskem\nESN Primorska\nGortanov trg 15\nSI-6000', 'Koper', '/', 'http://www.facebook.com/pages/ESN-Primorska/151858257339', 14, 46),
(302, 'ESN RGU', '2015-11-15 17:19:24', 'GB-ABER-ESN', 'GB', 'ESN RGU\nRGU Student Union,\n60 Schoolhill,\n\nAB10 1JQ\nUnited', 'Aberdeen', 'rgu.esnuk.org', 'https://www.facebook.com/esnaberdeen', 0, 0),
(303, 'ESN Reggio Calabria', '2015-11-15 17:19:24', 'IT-RECA-ESN', 'IT', 'c/o Ufficio Relazioni Internazionali Università “Mediterranea” \nVia Salita Melissari, Feo di Vito, 89124, ', 'Reggio Calabria', 'http://www.esnreggiocalabria.org', 'https://www.facebook.com/EsnReggioCalabria', 16, 38),
(304, 'ESN Rennes', '2013-01-01 00:00:00', 'FR-RENN-ESN', 'FR', 'UEB-CMI\n5, boulevard Laënnec,\n35000', 'Rennes', 'http://rennes.ixesn.fr', 'http://www.facebook.com/esn.rsf', 0, 0),
(305, 'ESN Rey Juan Carlos', '2015-11-15 17:19:24', 'ES-MADR-RJC', 'ES', 'ESN URJC - Camino del Molino s/n,  Fuenlabrada - Madrid', '', 'http://www.esnurjc.org', 'http://www.facebook.com/groups/29410679201/', -4, 40),
(306, 'ESN Reykjavik', '2015-11-15 17:19:25', 'IS-REJK-ESN', 'IS', 'ESN \nHáskólinn í (Uni. of Rvk)\nMenntavegur 1\n101 Reykjavík\nIceland', 'Reykjavik', 'http://www.esnreykjavik.com', 'http://www.facebook.com/ESNReykjavik', -22, 64),
(307, 'ESN Riga', '2015-11-15 17:19:25', 'LV-RIGA-ESN', 'LV', 'ESN \nUniversity of Latvia\n19 Raiņa boulevard, room 151\nLV-1586', 'Riga', 'http://esn.lv', 'https://www.facebook.com/ESN.Riga', 24, 57),
(308, 'ESN Rijeka', '2015-11-15 17:19:25', 'HR-RIJE-ESN', 'HR', 'Trg braće Mažuranića 10 \n51000', 'Rijeka', 'https://www.facebook.com/esn.ri', 'http://www.facebook.com/esn.ri', 0, 0),
(309, 'ESN Rimini', '2015-11-15 17:19:25', 'IT-RIMI-ESN', 'IT', 'Eramus Student Network  \nVia Sigismondo 65\n47921', 'Rimini', 'http://www.esnrimini.org', 'https://www.facebook.com/esnrimini', 13, 44),
(310, 'ESN Roma ASE', '2015-11-15 17:19:25', 'IT-ROMA-ASE', 'IT', 'ESN  ASE\nc/o Facoltà di Economia\nVia del Castro Laurenziano 9/c\n00161', 'Roma', 'http://www.esn-roma.it/', '', 13, 42),
(311, 'ESN Roma LUISS', '2015-11-15 17:19:25', 'IT-ROMA-LUI', 'IT', 'Viale di Trasone 56,\n00199 Roma\nITALY\n\n', 'Rome', 'http://esnromaluiss.it/', '', 0, 0),
(312, 'ESN Roma Tre', '2015-11-15 17:19:25', 'IT-ROMA-TRE', 'IT', 'ESN  Tre \nVia Ostiense 159 \n00154', 'Roma', 'http://www.esnroma3.com/', 'https://www.facebook.com/esnroma3?fref=ts', 12, 42),
(313, 'ESN Rotterdam', '2015-11-15 17:19:25', 'NL-ROTT-ESN', 'NL', 'ESN \nBuregemeester Oudlaan 50\nPO Box  1738\n3062 PA', 'Rotterdam', 'esn-rotterdam.nl', 'http://www.facebook.com/esn.rotterdam', 5, 52),
(314, 'ESN Rouen', '2015-06-06 00:00:00', 'FR-ROUE-ESN', 'FR', 'eROUENsmus, SRI – Université de Rouen, 24 bis rue Boutrolle, Place Colbert', 'Mont-Saint-Aignan', 'http://erouensmus.blogspot.fr/', '', 0, 0),
(315, 'ESN SFS Krems', '2015-11-15 17:19:25', 'AT-KREM-ESN', 'AT', 'ESN SFS  z.H. Nicole Dvorak\nPiaristengasse 1\n3500', 'Krems', 'http://krems.esnaustria.org/', 'https://www.facebook.com/studentsforstudents', 0, 0),
(316, 'ESN SGGW Warsaw', '2015-11-15 17:19:25', 'PL-WARS-SGG', 'PL', 'Biuro Współpracy Międzynarodowej CPE SGGW\nul. Nowoursynowska 166\n02-787 Warszawa', 'Warsaw', 'http://sggw.esn.pl', '', 21, 52),
(317, 'ESN SGH Warsaw', '2015-11-15 17:19:26', 'PL-WARS-SEC', 'PL', 'ESN SGH , ul. Rakowiecka 24 pokoj 212 A, 01/02/521 ', 'Warsaw', 'http://www.sgh.esn.pl/', '', 21, 52),
(318, 'ESN SMK', '2015-11-15 17:19:26', 'LT-VILN-SMK', 'LT', 'c/o Indre Puzaite, Nemuno str. 2, Klaipeda,  LT-91199', 'Vilnius and Klaipeda', '', 'https://www.facebook.com/ESNSMK?fref=ts', 0, 0),
(319, 'ESN SOUM', '2015-11-15 17:19:26', 'SI-MARI-SOU', 'SI', 'ESN SOUM\nGosposvetska cesta 83\n2000 ', 'Maribor', 'http://www.esn.si/', '', 16, 47),
(320, 'ESN STUBA', '2015-11-15 17:19:27', 'SK-BRAT-STU', 'SK', 'ESN STUBA\nRektorat STU\nVazovova 5\n81243', 'Bratislava', 'stuba.esn.sk', '', 0, 0),
(321, 'ESN SU', '2015-11-15 17:19:27', 'SE-STOC-SUS', 'SE', 'ESN SU\nc/O Giulia Neulen\nStupvägen 45\n19142', 'Sollentuna', 'www.esnsu.org', '', 0, 0),
(322, 'ESN SUA', '2015-11-15 17:19:27', 'SK-NTRA-ESN', 'SK', 'ESN SUA, International Relations Office\nSlovak University of Agriculture in ,\nTr. A. Hlinku 2,  949 76 , Slovakia\n949 76', 'Nitra', 'sua.esn.sk', 'https://www.facebook.com/pages/ESN-SUA-Nitra/471873242834519?fref=ts', 0, 0),
(323, 'ESN SUT Gliwice', '2015-11-15 17:19:27', 'PL-GLIW-SUT', 'PL', 'Politechnika Śląska\nul.Akademicka 2A\n44-100 \nNIP: 631-020-07-36', 'Gliwice', 'www.sut.esn.pl', 'https://www.facebook.com/erasmusgliwice', 0, 0),
(324, 'ESN SWPS Warsaw', '2015-11-15 17:19:27', 'PL-WARS-SWP', 'PL', 'ESN SWPS , \nChodakowska 19/31, \n03-815 ', 'Warsaw', 'http://www.swps.esn.pl ', 'https://www.facebook.com/EsnSwps?fref=ts', 21, 52),
(325, 'ESN SZIE', '2015-11-15 17:19:27', 'HU-GODO-SZI', 'HU', 'Pater Karoly u. 1., 2100 ', 'Godollo', 'http://szie.esn.hu/', 'http://www.facebook.com/ESNSZIE', 0, 0),
(326, 'ESN Sabanci', '2015-11-15 17:19:27', 'TR-ISTA-SAB', 'TR', 'Sabancı Üniversitesi Orta Mahalle, Üniversite Caddesi No: 27 34956 Tuzla-İstanbul', 'Istanbul', 'http://sabanci.esnturkey.org/', '', 0, 0),
(327, 'ESN Salamanca', '2015-11-15 17:19:27', 'ES-SALA-ESN', 'ES', 'Casa del estudiante (campus Unamuno)', 'Salamanca', 'www.esnsalamanca.org', 'http://www.facebook.com/profile.php?id=100001676163129', 0, 0),
(328, 'ESN Salento LISA', '2015-11-15 17:19:28', 'IT-LECC-LIS', 'IT', 'Università del Salento, Palazzo Codacci Pisanelli, Aula A8, Piazza Arco di Trionfo 1, 73100 , Italy', 'Lecce', 'www.erasmuslecce.it', '', 0, 0),
(329, 'ESN Salerno ', '2015-11-15 17:19:28', 'IT-SALE-ESN', 'IT', 'ESN  c/o Accademia Leonardo\nPiazza Umberto I, n° 1\n84121  -', 'Salerno', 'http://www.esnsalerno.it', 'https://www.facebook.com/pages/Erasmus-Student-Network-Salerno/248979371913073', 0, 0),
(330, 'ESN Santiago', '2015-11-15 17:19:28', 'ES-SANT-ESN', 'ES', 'ESN Santiago\nCasa Jimena y Elisa, Casa Reais, 8\nPrimera Planta, OFICINA DE RELACIONES EXTERIORES DE LA UNIVERSIDAD DE SANTIAGO DE COMPOSTELA\n15706', 'Santiago De Compostela', 'www.esnsantiago.com', 'http://www.facebook.com/esnsantiago', 0, 0),
(331, 'ESN Sarajevo', '2015-11-15 17:19:28', 'BA-SARA-ESN', 'BA', 'ESN (Lana Beciragic)\nHamdije Kapidzica 8\n71000', 'Sarajevo ', '', 'http://www.facebook.com/esnsarajevo?fref=ts', 18, 44),
(332, 'ESN Sassari', '2015-11-15 17:19:28', 'IT-SASS-ESN', 'IT', 'ESN \nC/O Ufficio Ricerca e Relazioni Internazionali \nVia Largo Macao 32\n07100', 'Sassari', 'http://www.esnsassari.eu', '', 9, 41),
(333, 'ESN Selcuk', '2015-11-15 17:19:28', 'TR-KONY-SEL', 'TR', 'ESN Selcuk\nSelçuk Üniversitesi , Alaeddin Keykubat Yerleşkesi \nERASMUS+ KURUM KOORDİNATÖRLÜĞÜ Erasmus house (Misafirhane yanı) \n42003', 'Konya', 'http://esnturkey.org/selcuk/', 'https://www.facebook.com/esnselcuk?ref_type=bookmark', 0, 0),
(334, 'ESN Semmelweis', '2015-11-15 17:19:28', 'HU-SEMM-ESN', 'HU', 'Nagy Lilla Nikoletta\nESN Semmelweis\nFalu Tamás utca 28.\n2364', 'Ócsa', 'http://semmelweis.esn.hu/', 'http://www.facebook.com/esn.semmelweis', 0, 0),
(335, 'ESN Sevilla', '2015-11-15 17:19:29', 'ES-SEVI-ESN', 'ES', 'Universidad de . \nAvda. Ciudad jardín 20 (Oficina de Relaciones Internacionales de la US), 41005, , España', 'Sevilla', 'esnsevilla.org', 'https://www.facebook.com/esnsevilla', -6, 37),
(336, 'ESN Sibiu', '2015-11-15 17:19:29', 'RO-SIBI-ESN', 'RO', 'XIII, 40A, 557085 Cristian, ', 'Sibiu', '', 'facebook.com/Erasmus.Student.Network.Sibiu', 0, 0),
(337, 'ESN Siena GES', '2015-11-15 17:19:29', 'IT-SIEN-GES', 'IT', 'Gruppo Erasmus  - ESN \nVia Banchi di Sotto 55 \n53100', 'Siena', 'http://www.gruppoerasmussiena.it', '', 11, 43),
(338, 'ESN Skopje', '2015-11-15 17:19:29', 'MK-SKOP-ESN', 'MK', 'ESN \nPartizanski odredi 143/48\n1000', 'Skopje', '', 'https://www.facebook.com/pages/ESN-Skopje/138792322835225', 21, 42),
(339, 'ESN Skövde', '2015-11-15 17:19:29', 'SE-SKOV-ESN', 'SE', 'Södra Trängallén 2, Hus A, \n541 46', 'Skövde', '', '', 14, 58),
(340, 'ESN Sofia University ', '2015-11-15 17:19:29', 'BG-SOFI-ESN', 'BG', 'ESN  University, 125 Tzarigradsko shose Blvd , building 3, room 107 ,  1113', 'Sofia', 'su.esnbg.org', '', 23, 43),
(341, 'ESN Southampton', '2015-11-15 17:19:29', 'GB-SOUT-ESN', 'GB', 'ESN ,\nUniversity of  Students'' Union,\nUniversity Road,\n\nSO17 1BJ\nUnited', 'Southampton', 'soton.esnuk.org', 'https://www.facebook.com/Erasmus-Society-ESN-Southampton-114646790280/timeline/', -1, 51),
(342, 'ESN Split', '2015-11-15 17:19:29', 'HR-SPLI-ESN', 'HR', 'Livanjska 5\n21000', 'Split', 'https://www.facebook.com/pages/ESN-Split/249221911881127', 'www.facebook.com/pages/ESN-Split/249221911881127', 0, 0),
(343, 'ESN St Gallen', '2015-11-15 17:19:29', 'CH-SGAL-ESN', 'CH', 'Guisanstrasse 9\n9010', 'St. Gallen', 'http://www.ressortinternational.ch/portfolio/buddysystem/', '', 9, 47),
(344, 'ESN St Petersburg SFTU', '2015-11-15 17:19:30', 'RU-STPB-LTU', 'RU', 'SFTU, student department of international cooperation, Institutsky per. 5, 194021 , Russian', 'Saint Petersburg', '', 'https://www.facebook.com/esnsftu', 0, 0),
(345, 'ESN Steyr', '2015-11-15 17:19:30', 'AT-STEY-ESN', 'AT', 'Fachhochschule , c/o ESN ,  4400', 'Steyr', 'steyr.esnaustria.org', 'https://www.facebook.com/ESN-Steyr-122634954736522/timeline/', 14, 48),
(346, 'ESN Stockholm KTH', '2015-11-15 17:19:30', 'SE-STOC-KTH', 'SE', 'Drottning Kristinas Väg 15-19\n10044', 'Stockholm', 'ths.kth.se', 'https://www.facebook.com/THSInternational', 18, 59),
(347, 'ESN Strasbourg', '2013-01-01 00:00:00', 'FR-STRA-ESN', 'FR', 'ESN \n34 rue Baldner\n67100', 'Strasbourg', 'http://strasbourg.ixesn.fr/', 'http://www.facebook.com/group.php?gid=137949702889059', 0, 0),
(348, 'ESN Strathclyde', '2015-11-15 17:19:30', 'GB-GLAS-STR', 'GB', 'ESN Strathclyde,\nUniversity of Strathclyde Students'' Association,\n90 John Street,\n\nG1 1JH\nUnited', 'Glasgow', 'https://strathclyde.esnuk.org', 'https://www.facebook.com/EsnStrathclyde?fref=ts', 0, 0),
(349, 'ESN Szeged', '2015-11-15 17:19:30', 'HU-SZEG-ESN', 'HU', 'ESN , Petőfi Sándor sugárút 3., 6722 ', 'Szeged', 'http://szeged.esn.hu', 'https://www.facebook.com/groups/638440086211326/', 20, 46),
(350, 'ESN Södertörn', '2015-11-15 17:19:30', 'SE-HUDD-ESN', 'SE', 'ESN Södertörn\nAlfred Nobels Allé 9 \n14189', 'Huddinge', 'http://esnsodertorn.org', 'Http://www.facebook.com/ESNsodertorn', 0, 0),
(351, 'ESN TEDU', '2015-11-15 17:19:30', 'TR-ANKA-TED', 'TR', 'ESN TEDU\nZiya Gökalp Caddesi No:48\n06631', 'ANKARA', 'http://tedu.esnturkey.org/', 'https://www.facebook.com/pages/ESN-TEDU/615290701911188?fref=ts', 0, 0),
(352, 'ESN TEI Athens', '2015-11-15 17:19:31', 'GR-ATHE-TEI', 'GR', 'ESN TEI \nMilou 1 & Agiou Spyridonos Str. (1st floor)\nAegaleo \n12243', 'Athens', 'teiath.esngreece.gr', 'https://www.facebook.com/ESNTeiofAthens', 24, 38),
(353, 'ESN TEI of Crete', '2015-11-15 17:19:31', 'GR-HERA-TEI', 'GR', 'ESN TEI of Crete, c/o Giannis Mitsakos , 71303 ,', 'Heraklion', 'http://teicrete.esngreece.gr', 'http://www.facebook.com/#!/profile.php?id=100001441383867', 25, 35),
(354, 'ESN TEI of Piraeus', '2015-11-15 17:19:31', 'GR-ATHE-PIR', 'GR', 'Petrou Ralli & Thivon 250, 122 44\nTEI  - Office: A015/Erasmus', 'Piraeus', 'http://esn.teipir.gr', 'https://www.facebook.com/esateipir', 0, 0),
(355, 'ESN TEI of Western Macedonia', '2015-11-15 17:19:31', 'GR-KOZA-TEI', 'GR', 'c/o Erasmus Office, KOILA, 50100 ', 'Kozani', 'http://teiwm.esngreece.gr', 'https://www.facebook.com/EsnWM', 0, 0),
(356, 'ESN TU Dresden', '2015-11-15 17:19:31', 'DE-DRES-TUN', 'DE', 'ERASMUS-Initiative TU  e.V.\nc/o Akademisches Auslandsamt\nStrehlener Straße 22\n01069', 'Dresden', 'http://tu-dresden.esn-germany.de/', 'http://www.facebook.com/erasmus.dresden', 14, 51),
(357, 'ESN TU Graz', '2015-11-15 17:19:31', 'AT-GRAZ-TUN', 'AT', 'HTU-, Referat für Internationales,\nRechbauerstraße 12,\nA-8010 ', 'Graz', 'http://esn.htu.tugraz.at/', 'https://www.facebook.com/grazesn', 15, 47),
(358, 'ESN TU IC', '2015-11-15 17:19:31', 'EE-TALL-TLU', 'EE', ' University Student Union, International Club (ESN TU IC)\nNarva mnt. 29\n10120', 'Tallinn', 'http://www.esindus.ee/?div=24-39', '', 25, 59),
(359, 'ESN TUC', '2015-11-15 17:19:31', 'GR-CHAN-ESN', 'GR', 'Kounoupidiana, 73100, ', 'Chania', 'tuc.esngreece.gr', 'www.facebook.com/esn.tuc', 0, 0),
(360, 'ESN TUMi München', '2015-11-15 17:19:31', 'DE-MUNI-TUM', 'DE', 'TUM International Center \nESN TUMi \nArcisstr. 21\n80333', 'München', '', 'https://www.facebook.com/groups/14220357130/', 12, 48),
(361, 'ESN TUT IC', '2015-11-15 17:19:32', 'EE-TALL-TUT', 'EE', 'ESN TUT IC\na Tehnikaülikool, Rahvusvaheliste suhete osakond\nEhitajate tee 5\n19086', 'Tallinn', 'http://ic.tipikas.ee/', 'https://www.facebook.com/esntutic', 25, 59),
(362, 'ESN Tallinn', '2015-11-15 17:19:32', 'EE-TALL-ESN', 'EE', 'Raekoja Plats 16\n 3rd floor, 6* from downstairs\n10146', 'Tallinn ', 'www.esn.ee/tallinn', 'http://www.facebook.com/groups/44436462512/ , https://www.facebook.com/esntallinn', 25, 59),
(363, 'ESN Tartu', '2015-11-15 17:19:32', 'EE-TART-ESN', 'EE', 'ESN , Raatuse 22, 51009 ', 'Tartu', 'http://esn.ee/tartu', 'www.facebook.com/esn.tartu', 27, 58),
(364, 'ESN Tbilisi ISU', '2015-11-15 17:19:32', 'GE-TBIL-ISU', 'GE', 'Sundukiani street 13, 0102 ', 'Tbilisi', 'www.esn.ge', 'https://www.facebook.com/ESNTbilisiISU', 0, 0),
(365, 'ESN Tbilisi UNI ', '2015-11-15 17:19:32', 'GE-TBIL-UNI', 'GE', '3 Ilia Chavchavadze Avenue, 0179 ', 'Tbilisi', '', 'http://www.facebook.com/pages/ESN-Tbilisi-Universal', 0, 0),
(366, 'ESN Teiste', '2015-11-15 17:19:32', 'GR-LAMI-ESN', 'GR', 'ESN Teiste\n35100', 'Lamia', 'http://esnteiste.esngreece.gr/', '', 0, 0),
(367, 'ESN Teramo', '2015-11-15 17:19:32', 'IT-TERA-ESN', 'IT', 'Associazione Studenti Erasmus  - ESN \nc/o Università degli Studi di \nFacoltà di Giurisprudenza \nvia Balzarini 1, Colleparco, \n64100', 'Teramo', 'http://esnteramo.eu', 'https://www.facebook.com/esnerasmusteramo', 14, 43),
(368, 'ESN Timisoara', '2015-11-15 17:19:32', 'RO-TIMI-ESN', 'RO', 'Aleea Studentilor, no. 2, Căminul 13, Room 015, 300551 ', 'Timisoara', 'www.esn.ro', 'https://www.facebook.com/esntimisoara?fref=ts', 0, 0),
(369, 'ESN Trabzon', '2015-11-15 17:19:32', 'TR-TRAB-ESN', 'TR', 'Karadeniz Teknik Üniversitesi, Dış İlişkiler, Erasmus+ Ofisi, Rektörlük\n61080', 'Trabzon', '', '', 0, 0),
(370, 'ESN Trento', '2015-11-15 17:19:32', 'IT-TREN-ESN', 'IT', 'ESN \nVia Inama n.5\n38122', 'Trento', 'esntrento.it', 'https://www.facebook.com/esn.trento', 11, 46),
(371, 'ESN Trieste', '2015-11-15 17:19:32', 'IT-TRIE-ESN', 'IT', 'ESN \npiazzale Europa 1\nBuilding A, Int. 246\n34100', 'Trieste', 'http://www.esntrieste.it/', 'http://www.facebook.com/esntrieste', 0, 0),
(372, 'ESN Trondheim', '2015-11-15 17:19:32', 'NO-TRON-ESN', 'NO', 'ESN \nCO: \nDet internasjonale huset på Gløshaugen campus O. S. Bragstads plass 3 NO-7491 \n7491', 'Trondheim', 'www.trondheim.esn.no', 'http://www.facebook.com/esntrondheim', 10, 63),
(373, 'ESN Twente', '2015-11-15 17:19:32', 'NL-ENSC-TWE', 'NL', 'ESN Twente\nDrienerlolaan 5\nBastille 319\n7522NB', 'Enschede', 'http://esntwente.nl/', '', 7, 52),
(374, 'ESN Télécom Bretagne', '2013-01-01 00:00:00', 'FR-BRET-TEL', 'FR', 'ESN Télécom Bretagne - ESNT Bretagne, Technopole Brest Iroise, 29280 ', 'Plouzane', 'http://telecom-bretagne.ixesn.fr', '', -5, 48),
(375, 'ESN UA', '2015-11-15 17:19:33', 'ES-ALIC-ESN', 'ES', 'Hotel de Asociaciones de la Universidad de . Aulario número I. Campus de San Vicente del Raspeig, 03690 San Vicente del Raspeig, ', 'Alicante', 'www.esnalicante.org', 'https://www.facebook.com/esn.alicante?fref=ts', 0, 0),
(376, 'ESN UAB Barcelona', '2015-11-15 17:19:33', 'ES-BARC-UAB', 'ES', 'Edificio de Estudiantes - UAB - Bellaterra ,  Placa Civica, 8193  Cerdanyola del Valles - ', 'Barcelona', 'http://esnuab.org', 'https://www.facebook.com/ESNUAB', 2, 42),
(377, 'ESN UACEG', '2015-11-15 17:19:33', 'BG-SOFI-UAC', 'BG', 'Yordan Donev, ESN UACEG, Center for International Relations and Mobility, University of Architecture, Civil Engineering and Geodesy, 1 Hristo Smirnenski Blvd, 1046, ', 'Sofia', 'uaceg.esnbg.org', 'https://www.facebook.com/esnuacegpage', 0, 0),
(378, 'ESN UACS', '2015-11-15 17:19:33', 'MK-SKOP-UAC', 'MK', 'Bul. Treta Makedonska Brigada No.60, 1000 ', 'Skopje', 'www.esn.mk', '', 0, 0),
(379, 'ESN UAM Madrid', '2015-11-15 17:19:33', 'ES-MADR-UAM', 'ES', 'Erasmus Student Network UAM\nEdifio Plaza Mayor UAM, Isla B, Planta 1, Local 161\nCalle Einstein, s/n, Campus Universitario de Cantoblanco, Universidad Autónoma de \n28049', 'Madrid', 'www.esnuam.org', 'http://www.facebook.com/profile.php?id=100001031055243', -4, 41),
(380, 'ESN UAM Poznan', '2015-11-15 17:19:33', 'PL-POZN-UAM', 'PL', 'ESN UAM Poznan\nal. Niepodleglosci 26, room 115\n61-714 Poznan', 'Poznan ', 'http://www.uam.esn.pl', 'https://www.facebook.com/ESN.UAM.Poznan', 17, 52),
(381, 'ESN UAX', '2015-11-15 17:19:33', 'ES-VICA-ESN', 'ES', 'Universidad Alfonso X, Oficina A269,\n Relaciones Internacionales, \nAvenida de la Universidad nº1,\n Villanueva de la Cañada, 28691', 'Villanueva de la Cañada ', 'www.esnuax.org', 'https://www.facebook.com/esnuax?ref=aymt_homepage_panel', 0, 0),
(382, 'ESN UCLM', '2015-11-15 17:19:33', 'ES-UCLM-ESN', 'ES', 'Pabellón de Gobierno Pza. De la Universidad, 2, 02071, ', 'Albacete', 'http://www.esnuclm.org', 'http://www.facebook.com/profile.php?id=100000280160973', 0, 0),
(383, 'ESN UCLan', '2015-11-15 17:19:33', 'GB-PRES-ESN', 'GB', 'ESN UCLan,\nUCLan Students’ Union,\nFylde Road,\n,\nLancashire\nPR1 7BY\nUnited Kingdom', 'Preston', 'uclan.esnuk.org', 'https://www.facebook.com/profile.php?id=100010180781964&fref=ts', 0, 0),
(384, 'ESN UCM Madrid', '2015-11-15 17:19:33', 'ES-MADR-UCM', 'ES', 'ESN UCM , Escuela de Estadistica - Oficina Erasmus, Av. Puerta de Hierro s/n, 28040 ', 'Madrid', 'http://www.esnucm.org', 'https://www.facebook.com/groups/esnucm2015/', -4, 40),
(385, 'ESN UCM Trnava', '2015-11-15 17:19:33', 'SK-TRNA-ESN', 'SK', 'Námestie J. Herdu 2, 917 01 ', 'Trnava', 'ucm.esn.sk', 'https://www.facebook.com/esnucmtrnava', 0, 0),
(386, 'ESN UCT Prague', '2015-11-15 17:19:34', 'CZ-PRAG-ICT', 'CZ', 'ESN UCT Prague\nZahraniční oddělení\nTechnická 5\n16628', 'Praha 6', 'www.esnuct.cz', 'www.facebook.com/esnuct', 0, 0),
(387, 'ESN UCTM', '2015-11-15 17:19:34', 'BG-SOFI-CTM', 'BG', 'Center for International Relations and Mobility, University of Chemical Technology and Metallurgy, Sv. Kliment Ohridski, blv. 8, , Bulgaria', 'Sofia', '', 'https://www.facebook.com/esnuctmpage', 0, 0),
(388, 'ESN UE Katowice', '2015-11-15 17:19:34', 'PL-KATO-ACE', 'PL', 'ESN UE , ul. 1 Maja 50,  40-287 ', 'Katowice', 'http://www.esn.ue.katowice.pl', 'https://www.facebook.com/esnuekatowice', 19, 50),
(389, 'ESN UE Poznan', '2015-11-15 17:19:34', 'PL-POZN-UEP', 'PL', 'ESN UE Poznan/ Dział ds. Badań Naukowych i Współpracy z Zagranicą\nUniwersytet Ekonomiczny w Poznaniu\nal. Niepodległości 10\n61-875', 'al. Niepodległości 10, Poznań', 'uepoznan.esn.pl', '', 17, 52),
(390, 'ESN UE Wroclaw', '2015-11-15 17:19:34', 'PL-WROC-UE1', 'PL', 'ESN UE WROCLAW, Komandorska Street 118/120, 53-345 ', 'Wroclaw', 'http://uewroclaw.esn.pl/', 'https://www.facebook.com/esn.ue.wroclaw', 0, 0),
(391, 'ESN UE-Varna', '2015-11-15 17:19:34', 'BG-VARN-ESN', 'BG', 'ESN  University of Economics, 77, “Kniaz Boris I”, blvd, 9002 ', 'Varna', 'http://varna.esnbg.org/', 'https://www.facebook.com/groups/321924427973859/', 28, 43),
(392, 'ESN UEA', '2015-11-15 17:19:34', 'GB-UEA-NOR', 'GB', 'ESN UEA,\nUnion of UEA Students,\nUnion House,\nUniversity of East Anglia,\n\nNR4 7TJ\nUnited', 'Norwich', 'uea.esnuk.org', 'https://www.facebook.com/uea.esn', 1, 53),
(393, 'ESN UEK Cracow', '2015-11-15 17:19:34', 'PL-KRAK-ACE', 'PL', 'ESN UEK Cracow\nUniwersytet Ekonomiczny w ie \nRakowicka 27\n31510', 'Krakow', 'http://uek.esn.pl', 'https://www.facebook.com/esnuek', 20, 50),
(394, 'ESN UEX', '2015-11-15 17:19:34', 'ES-BADA-ESN', 'ES', 'Erasmus Student Network ESN UEx, \nFacultad de Ciencias (Antiguo Rectorado), Universidad de Extremadura\nAvenida de Hélvas s/n\n06006', 'Badajoz', 'www.esnuex.org', 'https://www.facebook.com/esnuexbacc', 0, 0),
(395, 'ESN UG Gdansk', '2015-11-15 17:19:34', 'PL-GDAN-UNG', 'PL', 'ESN UG , ul. Armii Krajowej 110, pok. 219, 81-824 Sopot', 'Gdansk', 'http://ug.esn.pl', 'http://www.facebook.com/ESN.UG.Gdansk', 19, 54),
(396, 'ESN UJ Cracow', '2015-11-15 17:19:34', 'PL-KRAK-UNJ', 'PL', 'ESN UJ , Collegium Novum, Golebia 24 room 030, 31-007 ', 'Cracow', 'http://www.esn-uj.com', 'http://www.facebook.com/esnujkrakow', 20, 50),
(397, 'ESN UKF', '2015-11-15 17:19:34', 'SK-NITR-UKF', 'SK', 'ESN UKF\nŠD \nUl. Boženy Slančíkovej 1\n949 01', 'Nitra', 'http://ukf.esn.sk/', 'https://www.facebook.com/pages/ESN-UKF-Nitra/133962646704128?ref=tn_tnmn', 0, 0),
(398, 'ESN UKSW Warsaw', '2015-11-15 17:19:34', 'PL-WARS-UKS', 'PL', 'Dział Współpracy Międzynarodowej\nUKSW\nDewajtis 5\n01-815 Warsaw\nPOLAND', 'Warszawa', 'http://www.uksw.esn.pl ', 'facebook.com/like.esn.uksw', 21, 52),
(399, 'ESN UL Lodz', '2015-11-15 17:19:34', 'PL-LODZ-UNL', 'PL', 'ESN UŁ Łódź, ul. Kopcińskiego 8/12,  90-232 Łódź', 'Łódź (Lodz)', 'http://www.lodz.esn.pl', 'http://www.facebook.com/esnul', 19, 52),
(400, 'ESN ULg', '2015-11-15 17:19:35', 'BE-LIEG-ESN', 'BE', 'ESN-ULg, \n24 Place du XX Août\n4000', 'Liege', '(en cours de maintenance) https://www.facebook.com/esn.ulg?fref=ts', '', 6, 51),
(401, 'ESN UMB BB', '2015-11-15 17:19:35', 'SK-BANS-UMB', 'SK', 'ESN UMB BB\nTajovského 51\nŠD3\n97401', 'Banská Bystrica', 'www.umb.esn.sk', 'https://www.facebook.com/pages/ESN-UMB-in-Banska-BystricaSlovakia/350032881446?ref=hl', 0, 0),
(402, 'ESN UMCS Lublin', '2015-11-15 17:19:35', 'PL-LUBL-UMC', 'PL', 'Uniwersytet Marii Curie-Skłodowskiej w ie\nPl. M. Curie-Skłodowskiej 5\n20-031 \n7120103692\n', 'Lublin', 'http://umcs.esn.pl/', 'http://www.facebook.com/pages/ESN-UMCS-Lublin/164581296929371', 23, 51),
(403, 'ESN UMK Torun', '2015-11-15 17:19:35', 'PL-TORU-UMK', 'PL', 'ESN UMK Torun\nul. Jurija Gagarina 33 room 714a\n87-100', 'Toruń', 'http://umk.esn.pl/', 'https://pl-pl.facebook.com/ESNTorun', 19, 53),
(404, 'ESN UNIZA', '2015-11-15 17:19:35', 'SK-RUZO-UNZ', 'SK', 'Žilinská univerzita\nOddelenie pre zahraničné vzťahy a styk s verejnosťou\nUniverzitná 1\n010 26', 'Žilina', 'http://uniza.esn.sk/', '', 19, 49),
(405, 'ESN UNWE', '2015-11-15 17:19:35', 'BG-UNW-ESN', 'BG', '', 'Sofia', 'http://unwe.esnbg.org/', 'https://www.facebook.com/ESNUNWE', 0, 0),
(406, 'ESN UOC', '2015-11-15 17:19:35', 'GR-HERA-UOC', 'GR', 'Voutes University Campus, 71003, ,Crete', 'Heraklion', 'esngreece.gr/uoc', 'http://www.facebook.com/esnuoc', 0, 0),
(407, 'ESN UOM Thessaloniki', '2015-11-15 17:19:35', 'GR-THES-ESN', 'GR', 'Egnatia 156\nUniversity of Macedonia\nESN UOM \n54006', 'Thessaloniki', 'uom.esngreece.gr', 'http://www.facebook.com/EsnUomThessaloniki', 23, 41),
(408, 'ESN UOPA', '2015-11-15 17:19:35', 'GR-PATR-ESN', 'GR', 'University of , Students’ Residence, Internal Offices of Residence, (next the Students’ Movie Club)\n', 'Patras', 'uopa.esngreece.gr', 'https://www.facebook.com/pages/ESN-UOPA/230903497075345?fref=ts', 0, 0),
(409, 'ESN UP OLOMOUC', '2015-11-15 17:19:35', 'CZ-OLOM-UPA', 'CZ', 'ESN UP OLOMOUC\nOndřej Kantor\nKřižkovského 8\n779 00', 'Olomouc', 'http://esnup.upol.cz', 'https://www.facebook.com/ESNUPOlomouc', 17, 50),
(410, 'ESN UP Wroclaw', '2015-11-15 17:19:35', 'PL-WROC-UPW', 'PL', 'ESN UP Wroclaw\nul. C.K.Norwida 25\n50-375', 'Wrocław', 'up.esn.pl', 'https://www.facebook.com/esnwuels', 17, 51),
(411, 'ESN UPC Barcelona ', '2015-11-15 17:19:35', 'ES-BARC-UPC', 'ES', 'C/ Diagonal 647 ETSEIB, 08028 ', 'Barcelona', 'http://www.esn-upc.org', '', 2, 41),
(412, 'ESN UR', '2015-11-15 17:19:35', 'BG-RUSE-ESN', 'BG', 'c/o Svilena Georgieva\nInternational Cooperation and Mobility Department\n8 Studentska street, 7017 ', 'Ruse', 'http://ruse.esnbg.org', 'http://www.facebook.com/erasmusclubuniversityofruse', 0, 0),
(413, 'ESN US Szczecin', '2015-11-15 17:19:35', 'PL-SZCZ-ESN', 'PL', 'ESN US \nul. Cukrowa 8, pokój 216\n71-004', 'Szczecin', 'szczecin.esn.pl', 'http://www.facebook.com/?ref=logo#!/pages/ESN-US-Szczecin/135654146471969', 14, 53),
(414, 'ESN UTAA', '2015-11-15 17:19:36', 'TR-ANKA-UTA', 'TR', 'Bahcekapı Quarted Okul Street No:11 06790 Etimesgut/ANKARA', 'Ankara', 'http://intoffice.thk.edu.tr/?lang=en', '', 0, 0),
(415, 'ESN UW Warsaw', '2015-11-15 17:19:36', 'PL-WARS-UNW', 'PL', 'ESN UW , ul. Krakowskie Przedmieście 26/28 room 210, 00-927 ', 'Warsaw', 'http://uw.esn.pl', 'https://pl-pl.facebook.com/like.esn.uw', 21, 52),
(416, 'ESN UWr', '2015-11-15 17:19:36', 'PL-WROC-UWR', 'PL', 'ESN UWr\nul. Partynicka 7c/6a\n53-031', 'Wrocław', 'uwr.esn.pl', '', 0, 0),
(417, 'ESN Uludag', '2015-11-15 17:19:36', 'TR-BURS-ULU', 'TR', 'Uludag Universitesi Rektorluk Uluslararası Gliskiler Ofisi 16059 Gorukle/-Turkey', 'Bursa', 'intoffice.uludag.edu.tr ', '', 0, 0),
(418, 'ESN Uni Graz', '2015-11-15 17:19:36', 'AT-GRAZ-UNI', 'AT', 'ESN Uni \nDr-Robert-Graf-Straße 21/8\n8010', 'Graz', 'http://unigraz.esnaustria.org/', 'https://www.facebook.com/esn.graz', 15, 47),
(419, 'ESN Uni Helsinki', '2015-11-15 17:19:36', 'FI-HELS-HYY', 'FI', 'ESN Uni , c/o HYY, Mannerheimintie 5 A, 00100 , Finland', 'Helsinki', 'http://esnunihelsinki.org/', 'https://www.facebook.com/uni.helsinki.ESN', 25, 60),
(420, 'ESN Uni Lausanne', '2015-11-15 17:19:36', 'CH-LAUS-XUL', 'CH', 'ESN Uni , CP 7792 , 1002  ', 'Lausanne', 'http://unil.esn.ch/', 'https://www.facebook.com/xchangeesn.unilausanne?fref=ts', 7, 47),
(421, 'ESN Uni Oulu', '2015-11-15 17:19:36', 'FI-OULU-OYY', 'FI', 'ESN  ry\nPentti Kaiteran katu 1\n90014', 'Oulu', 'esnoulu.org', 'https://www.facebook.com/esnoulu', 25, 65),
(422, 'ESN Uni Salzburg', '2015-11-15 17:19:36', 'AT-SALZ-UNI', 'AT', 'ESN Uni \nz.H. Gregor Milicic\nSchiffmanngasse 29\n5020', 'Salzburg', 'http://salzburg.esnaustria.org/', '', 0, 0),
(423, 'ESN Uni Turku', '2015-11-15 17:19:36', 'FI-TURK-TYY', 'FI', 'Rehtorinpellonkatu 4-6 B, 20500 , Finland', 'Turku', 'www.esnuniturku.fi', 'http://www.facebook.com/esnuniturku', 22, 60),
(424, 'ESN Uni Wien', '2015-11-15 17:19:36', 'AT-WIEN-UNI', 'AT', 'ESN Uni Wien\nUniversitätsring 1 \nz. Hd. International Office \n1010', 'Wien ', 'http://www.esnuniwien.com', 'http://www.facebook.com/esn.uniwien', 16, 48),
(425, 'ESN UniBuc', '2015-11-15 17:19:36', 'RO-BUCH-UNI', 'RO', 'ESN UniBuc\nFacultatea de Matematica si Informatica, sala M10\nStr. Academiei nr.14, sector 1, 010014\n, Romania\n', 'Bucharest', 'http://unibucharest.esn.ro', 'http://www.facebook.com/Erasmus.Student.Network.UniBuc', 0, 0),
(426, 'ESN UniPi', '2015-11-15 17:19:36', 'GR-PIRA-ESN', 'GR', 'ESN UniPi\nAGIAS PARASKEVIS 79\nDASOS CHAIDARIOU\n12462', 'DASOS CHAIDARIOY', 'http://unipi.esngreece.gr/', 'https://www.facebook.com/esnunipi', 0, 0),
(427, 'ESN Unicatt Milano', '2015-11-15 17:19:37', 'IT-MILA-UCA', 'IT', 'ESN Unicatt Milano\nvia Cesare Pavese 9\n20017', 'Rho', 'www.esnunicattolica.it', 'http://www.facebook.com/esnunicatt.milano?fref=ts', 0, 0),
(428, 'ESN Ural Federal', '2015-11-15 17:19:37', 'RU-EKAT-ESN', 'RU', 'room i-529, 19 Mira st., 620002,,Russian Federation\n', ' Ekaterinburg', '', 'https://www.facebook.com/pages/ISO-urfu/577042279015789', 0, 0),
(429, 'ESN Usti', '2015-11-15 17:19:37', 'CZ-USTI-ESN', 'CZ', 'ESN Usti\nPasteurova 3544/1\n40096', 'Ústí nad Labem', 'http://www.esn-usti.cz/', 'https://www.facebook.com/esnusti', 0, 0),
(430, 'ESN Utrecht', '2015-11-15 17:19:37', 'NL-UTRE-ESN', 'NL', 'ESN \nAchter Sint Pieter 25\n3512 HR \n3531 GH', 'Utrecht', 'http://esn-utrecht.nl', 'http://www.facebook.com/esn.utrecht', 5, 52),
(431, 'ESN UwB Bialystok', '2015-11-15 17:19:37', 'PL-BIAL-UWB', 'PL', 'ESN UwB Bialystok\nDom Studenta nr 3\nul. Pogodna 65\n15-365', 'Białystok', 'uwb.esn.pl', 'https://www.facebook.com/ESNUwB?fref=ts', 0, 0),
(432, 'ESN VDA', '2015-11-15 17:19:37', 'LT-VILN-VDA', 'LT', 'Maironio g. 6, LT-01124, ', 'Vilnius', '', '', 0, 0),
(433, 'ESN VDK', '2015-11-15 17:19:37', 'LT-VILN-VDK', 'LT', 'ESN VDK\nKauno street, 34\nLT-03202', 'Vilnius', 'www.facebook.com/esnvdk', 'https://www.facebook.com/esnvdk', 0, 0),
(434, 'ESN VGTU', '2015-11-15 17:19:38', 'LT-VILN-VGTU', 'LT', 'ESN VGTU\nSauletekio al. 11, SRC 212\nLT-10223', 'Vilnius', 'http://vgtu.esnlithuania.org/', 'https://www.facebook.com/EsnVgtu?fref=ts', 25, 55),
(435, 'ESN VMU', '2015-11-15 17:19:38', 'LT-KAUN-VMU', 'LT', 'Vytautas Magnus University\nK. Donelaičio g. 58\n44248', 'Kaunas ', 'vmu.esnlithuania.org', 'http://www.facebook.com/ESN.VMU', 24, 55),
(436, 'ESN VSE Prague', '2015-11-15 17:19:38', 'CZ-PRAG-VSE', 'CZ', 'ESN VSE Prague\nNam. Winstona Curchilla 4\n13067', 'Prague ', 'buddy.vse.cz', 'http://www.facebook.com/groups/148488145228702/', 14, 50),
(437, 'ESN VSEMVS', '2015-11-15 17:19:38', 'SK-BRAT-VSE', 'SK', 'Železničná 14, 821 07,  4', 'Bratislava', 'www.vsemvs.esn.sk', '', 0, 0),
(438, 'ESN VSMU Bratislava', '2015-11-15 17:19:38', 'SK-BRAT-VSM', 'SK', 'c/o Erasmus Office, Venturska 3, 813 01 ', 'Bratislava', '', '', 0, 0),
(439, 'ESN VSTE Budweis', '2015-11-15 17:19:38', 'CZ-CBUD-VST', 'CZ', 'ESN VŠTE Budweis\nVysoká škola technická a ekonomická v Českých Budějovicích\nOkružní 517/10\n37001', 'České Budějovice', 'www.esnvste.cz', 'http://www.facebook.com/esnvstebudweis', 0, 0),
(440, 'ESN VU Amsterdam', '2015-11-15 17:19:38', 'NL-AMST-VUN', 'NL', 'ESN VU \nDe Boelelaan 1105\nMain building 0D-wing attn. ESN VU \n1081HV', 'Amsterdam', 'http://esnvuamsterdam.nl', 'www.facebook.com/esnvuamsterdam', 5, 52),
(441, 'ESN VUB EHB Brussels', '2015-11-15 17:19:38', 'BE-BRUS-ESN', 'BE', 'International Office - ESN , Pleinlaan 2, 1050 ', 'Brussels', 'www.esnbrussels.org', 'https://www.facebook.com/esnbxl', 4, 51),
(442, 'ESN Vaasa', '2015-11-15 17:19:38', 'FI-VAAS-ESN', 'FI', 'ESN \nC/o Petri Hautamäki\nVarisselänkatu 34 As. 3 \n65200', 'Vaasa', 'www.ESNVaasa.net', 'www.facebook.com/esnvaasa', 0, 0),
(443, 'ESN Valencia UPV', '2015-11-15 17:19:38', 'ES-VALE-UPV', 'ES', 'ESN  UPV\nCamí de Vera s/n, Casa del Alumne, Ed. 4K, UPV, \n46022', 'Valencia', 'www.esnvalenciaupv.es', 'http://www.facebook.com/esnValenciaUPV', 0, 39),
(444, 'ESN Valenciennes', '2013-01-01 00:00:00', 'FR-VALE-ESN', 'FR', 'ESN \nBât. Watteau, IUT\nCampus Mont Houy, UVHC\n59300', 'Valenciennes', 'http://valenciennes.ixesn.fr', 'https://www.facebook.com/esnvalenciennes', 0, 0),
(445, 'ESN Valladolid', '2015-11-15 17:19:39', 'ES-VALL-ESN', 'ES', 'ESN \nFacultad de Ciencias Económicas y Empresariales\nAvenida Valle de Esgueva, 6  47011', 'Valladolid', 'http://www.esnuva.org', 'https://www.facebook.com/esn.valladolid', -5, 42),
(446, 'ESN Valmiera', '2015-11-15 17:19:39', 'LV-VALM-ESN', 'LV', 'ESN \nCēsu iela 4\nLV-4201', 'Valmiera', '', 'https://www.facebook.com/ESNValmiera', 0, 0),
(447, 'ESN Veliko Tarnovo', '2015-11-15 17:19:39', 'BG-VETA-ESN', 'BG', 'ESN \nEuropean Integration and Mobility Office\nSt. Cyril and St. Methodius University of \n2 Teodosii Tarnovski Street, 5003 ', 'Veliko Tarnovo', 'tarnovo.esnbg.org', 'https://www.facebook.com/esnvt?fref=ts', 26, 43),
(448, 'ESN Venezia Meet a Mate', '2015-11-15 17:19:39', 'IT-VENE-MAM', 'IT', 'Dorsoduro 3246\n30123', 'VENEZIA', 'esnvenezia.it', 'Esn Venezia MeetAmate', 0, 0),
(449, 'ESN Veszprém', '2015-11-15 17:19:39', 'HU-VESZ-ESN', 'HU', 'University of Pannonia, PEHOK International Relations Student Office\nEgyetem u. 10\n \n8200\nHungary', 'Veszprém', 'http://veszprem.esn.hu/', '', 18, 47),
(450, 'ESN Vigo', '2015-11-15 17:19:39', 'ES-VIGO-ESN', 'ES', 'ESN \nLocal de asociaciones 3, Edificio Miralles, Plaza Miralles\nCampus Universitario Lagoas Marcosende s/n \n36310', 'Vigo', 'http://esnvigo.org/satellite4/', 'http://www.facebook.com/esnvigo', 0, 0),
(451, 'ESN Vilnius University', '2015-11-15 17:19:39', 'LT-VILN-ESN', 'LT', 'ESN  University\nUniversiteto str. 3\nObservatorijos Kiemelis\n01513', 'Vilnius', 'vu.esnlithuania.org', 'http://www.facebook.com/esnvilniusuniversity', 25, 55),
(452, 'ESN Växjö', '2015-11-15 17:19:39', 'SE-VAXJ-ESN', 'SE', 'ESN  (VIS)\nLinnéstudenterna\nBox 5015\n350 05', 'Växjö', 'www.visesn.org', 'http://www.facebook.com/vaxjo.international.students', 15, 57),
(453, 'ESN VŠB-TU Ostrava', '2015-11-15 17:19:39', 'CZ-OSTR-VSB', 'CZ', 'ESN VSB-TU \nStudentska 1770/1\n700 32 -Poruba\nCzech Republic', 'Ostrava', 'http://escvsb.cz', 'http://www.facebook.com/escvsb', 0, 0),
(454, 'ESN WUM Warsaw', '2015-11-15 17:19:39', 'PL-WARS-ACM', 'PL', 'ESN WUM , ul. Oczki 5, 00-927 ', 'Warsaw', 'http://wum.esn.pl', 'http://www.facebook.com/home.php#!/groups/238667592836052/', 21, 52),
(455, 'ESN We.G ', '2015-11-15 17:19:39', 'GR-PATR-TEI', 'GR', 'Megalou Aleksandrou 1, Koukouli  263 34', 'Patras', 'http://weg.esngreece.gr/', 'https://www.facebook.com/pages/ESN-WeG-Patras/408011046023934', 0, 0),
(456, 'ESN Westminster', '2015-11-15 17:19:39', 'GB-LOND-WES', 'GB', 'ESN Westminster,\nUniversity of Westminster Students'' Union,\n309 Regent Street,\n\nW1B 2HW\nUnited', 'London', 'westminster.esnuk.org', 'https://www.facebook.com/esnwestminster?fref=ts', 0, 0),
(457, 'ESN Wien WU', '2015-11-15 17:19:40', 'AT-WIEN-WUW', 'AT', 'Kapellengasse 3, 3463 Eggendorf', 'Vienna', 'http://www.esnwuwien.com', 'facebook.com/esnwienwu', 0, 0),
(458, 'ESN Winterthur', '2015-11-15 17:19:40', 'CH-WINT-ESN', 'CH', 'ESN , Theaterstrasse 3, CH-8400 ', 'Winterthur', 'http://www.esn.ch/winterthur', '', 9, 48),
(459, 'ESN Wismar ', '2015-11-15 17:19:40', 'DE-WISM-ESN', 'DE', 'Philipp-Müller-Straße 14', 'Wismar', 'www.hs-wismar.de/wer/studenten/studentische-vertretungen/asta/', 'https://www.facebook.com/groups/142437715805416/ ', 0, 0),
(460, 'ESN Worldtop Clermont-Ferrand', '2013-01-01 00:00:00', 'FR-CLER-WOR', 'FR', '33 Cours Sablon , F 63000, Clermont-Ferrand', 'Clermond-Ferrand', 'http://worldtop.ixesn.fr', '', 0, 0),
(461, 'ESN Wädenswil', '2015-11-15 17:19:40', 'CH-WAED-ESN', 'CH', 'ESN \nGrüental, Postfach\n8820', 'Wädenswil', 'www.winterthur.esn.ch', '', 9, 47),
(462, 'ESN YTU', '2015-11-15 17:19:40', 'TR-ISTA-YIL', 'TR', 'c/o İbrahim Aktaş, European Union Office - Davutpaşa Campus / 34220 Esenler - İstanbul /', 'Istanbul', 'esnytu.org', 'https://www.facebook.com/esnytupage', 29, 41),
(463, 'ESN Yasar', '2015-11-15 17:19:40', 'TR-IZMI-YAS', 'TR', 'ESN Yasar\nSelçuk Yaşar Kampüsü, Üniversite Cad. Ağaçlı Yol 37-39, 35100 Bornova/İzmir\n35100', 'Izmir', '', 'https://www.facebook.com/esn.yasar?fref=ts', 0, 0),
(464, 'ESN Yeditepe', '2015-11-15 17:19:40', 'TR-YEDI-ESN', 'TR', 'ESN Yeditepe\nİnönü Mah. Kayışdağı Cad.  26 Ağustos Yerleşimi\n34755', 'İSTANBUL', '', '', 29, 41),
(465, 'ESN ZSKF', '2015-11-15 17:19:40', 'HU-BUPE-ZSK', 'HU', 'HU-1039 , Kelta str. 2. -', 'Budapest', '', 'https://www.facebook.com/pages/ESN-ZsKF/103504329826867?fref=ts', 0, 0),
(466, 'ESN Zadar', '2015-11-15 17:19:40', 'HR-ZADA-ESN', 'HR', 'Ured za međunarodnu suradnju, Sveučilište u Zadru, Mihovila Pavlinovića bb, 23 000 ', 'Zadar', 'http://www.facebook.com/pages/ESN-Zadar/173555852729165', 'http://www.facebook.com/pages/ESN-Zadar/173555852729165', 0, 0),
(467, 'ESN Zagreb', '2015-11-15 17:19:40', 'HR-ZAGR-ESN', 'HR', 'ESN \nUred za medunarodnju suradnju\nZvonimirova 8\n10000', 'Zagreb', 'www.esnzagreb.com', 'https://www.facebook.com/erasmusstudentnetworkzagreb', 0, 0),
(468, 'ESN Zaragoza', '2015-11-15 17:19:40', 'ES-ZARA-ESN', 'ES', 'Facultad de Ciencias, edificio de Matemáticas, C/ Pedro Cerbuna 12, 50009, ', 'Zaragoza', 'www.esnzaragoza.org', 'http://www.facebook.com/profile.php?id=100001263498688', 0, 0),
(469, 'ESN Zurich ETH', '2015-11-15 17:19:41', 'CH-ZURI-ETH', 'CH', 'ESN \nCAB E13\nUniversitätstrasse 6\n8001', 'Zürich', 'http://zurich.esn.ch', '', 9, 47),
(470, 'ESN Zurich Uni', '2015-11-15 17:19:41', 'CH-ZURI-UNI', 'CH', 'ESN Zürich\nCAB E 13\nUniversitätstrasse 6\n8001', 'Zurich', '', '', 9, 47),
(471, 'ESN eREIMSmus ', '2013-01-01 00:00:00', 'FR-REIM-ESN', 'FR', 'ESN emus\nCampus Croix-Rouge\n57 rue Pierre Taittinger\n51100', 'REIMS', '', 'www.facebook.com/ereimsmus.eu', 0, 0),
(472, 'ESN en UV', '2015-11-15 17:19:41', 'ES-VALE-ESN', 'ES', 'ESN en UV\nUniversidad de  - Avda. Tarongers, s/n \nAulario Sur, Acceso Central, Despacho S12\n46022', 'Valencia', 'www.esnuv.es', 'http://www.facebook.com/esn.uv', 0, 0),
(473, 'ESN Åbo Akademi ', '2015-11-15 17:19:41', 'FI-TURK-AAU', 'FI', 'ESN Åbo Akademi\nFänriksgatan 3, entrance B, second floor, room B225\n20500', 'Turku', 'esnabo.org', 'http://www.facebook.com/groups/19534003480/', 22, 60),
(474, 'ESN Ås', '2015-11-15 17:19:41', 'NO-AS-ESN', 'NO', 'P.O. Boks 1207, 1432, ', 'Ås', 'http://www.as.esn.no/', 'https://www.facebook.com/esniaas?fref=ts', 0, 0),
(475, 'ESN Óbuda University', '2015-11-15 17:19:41', 'HU-BUPE-OBU', 'HU', 'ESN Óbuda University\nTavaszmező utca  17. A\n1084', 'Budapest', 'http://obuda.esn.hu/', 'https://www.facebook.com/esn.obuda', 0, 0),
(476, 'ESN Örebro', '2015-11-15 17:19:41', 'SE-OREB-ESN', 'SE', 'ESN \nFakultetsgatan 1\n702 18', 'Örebro', 'esn-orebro.org', '', 15, 59),
(477, 'ESN ŠU', '2015-11-15 17:19:41', 'LT-SUSA-ESN', 'LT', 'ESN ŠU\nDubijos st. \n1B\n77158', 'Šiauliai', '', 'https://www.facebook.com/pages/ESN-%C5%A0U/490155704345814', 23, 56),
(478, 'ESN-Luleå', '2015-11-15 17:19:41', 'SE-LULE-ESN', 'SE', 'LURC\nInternational Office\n University of Technology\n971 87', 'Luleå', 'http://www.lurc.se/', 'https://www.facebook.com/LURC.ESNLulea', 0, 0),
(479, 'ESN-Paris Assas', '2013-01-01 00:00:00', 'FR-PARI-ASS', 'FR', 'Association ESN Assas, Université  II Pantéon Assas, 12 Place du pantéon 75005, ', 'Paris', 'http://assas.ixesn.fr', 'https://www.facebook.com/esnassas', 0, 0);
INSERT INTO `section` (`id`, `name`, `joindate`, `code`, `country`, `street`, `city`, `website`, `facebook`, `longitude`, `latitude`) VALUES
(480, 'ESN-SDU', '2015-11-15 17:19:41', 'TR-ISPA-SDU', 'TR', 'ESN-SDU\nSuleyman Demirel University Erasmus Office\nBati Campus, Cunur\n32260', 'Isparta', 'http://sdu.esnturkey.org/', '', 0, 0),
(481, 'ESN-Samsun', '2015-11-15 17:19:41', 'TR-SAMS-ESN', 'TR', 'ESN-\nInternational Relations Office  Ondokuz Mayis University\n55200', 'Samsun', 'http://erasmus.omu.edu.tr/genel-bilgiler/esn-samsun/', 'https://www.facebook.com/pages/Esn-Samsun', 0, 0),
(482, 'ESN-UTAD', '2015-11-15 17:19:42', 'PT-VILA-UTA', 'PT', 'ESN UTAD, \nUniversidade de Trás-os-Montes e Alto Douro \nQuinta de Prados 5001-801 ', 'Vila Real', 'www.esnutad.org', 'http://www.facebook.com/ESNUTAD', 0, 0),
(483, 'ESN-UÉvora', '2015-11-15 17:19:42', 'PT-EVOR-ESN', 'PT', 'Rua Diogo Cão nº21 \n7000-872\n\nPT', 'Évora', 'www.esn.uevora.pt', 'http://www.facebook.com/pages/Erasmus-Student-Network-U%C3%89vora/328543522960', -8, 39),
(484, 'GEG-ESN Genova', '2015-11-15 17:19:42', 'IT-GENO-ESN', 'IT', 'GEG (Gruppo Erasmus )\nVia Emanuele Brignole 2\nc/o Facoltà di Scienze Politiche\n16125  (ITALY)\n', 'Genova', 'http://www.esngenova.it', 'Gruppo Erasmus Genova', 9, 44),
(485, 'I*ESN Maynooth', '2015-11-15 17:19:42', 'IE-MAYN-ESN', 'IE', 'MU International Society, Student Union Building,  University, , County Kildare', 'Maynooth', '', '', 0, 0),
(486, 'I*ESN Tilburg', '2015-11-15 17:19:42', 'NL-TILB-ESN', 'NL', 'I*ESN \nHeuvelring 102\n5038 CL', 'Tilburg', '', 'http://www.facebook.com/iesntilburg', 5, 52),
(487, 'IC CUNI', '2015-11-15 17:19:42', 'CZ-PRAG-CUN', 'CZ', 'Vorsilska 144/1\n 1\n11643', 'Prague', 'www.ic-cuni.cz', 'https://www.facebook.com/CharlesUniversityInternationalClub', 0, 0),
(488, 'ISC CTU in Prague', '2015-11-15 17:19:42', 'CZ-PRAG-CTU', 'CZ', 'International Student Club CTU in Prague, o.s.\nZikova 4,  166 36  6\n166 36', 'Praha', 'http://ctu.esn-cz.cz/', 'https://www.facebook.com/isc.ctu.prague', 14, 50),
(489, 'ISC MU Brno', '2015-11-15 17:19:42', 'CZ-BRNO-ISC', 'CZ', 'International Student Club MU \nKomenského nám. 2\n602 00 \nCzech', 'Brno', 'http://isc.muni.cz/', 'http://www.facebook.com/ISCMUBrno', 17, 49),
(490, 'ISC Mendelu Brno', '2015-11-15 17:19:42', 'CZ-MZLU-ESN', 'CZ', 'ISC Mendelu \nMendelova univerzita v Brně\nZemědělská 1\n613 00', 'Brno', 'www.iscmendelu.cz', 'https://www.facebook.com/iscmendelu', 17, 49),
(491, 'ISC OU', '2015-11-15 17:19:42', 'CZ-OSTR-ISC', 'CZ', 'ISC OU\nMlýnská 5\n70103', 'Ostrava', 'http://isc.osu.cz/', 'https://www.facebook.com/isc.ostrava?fref=ts', 18, 50),
(492, 'ISC VUT Brno', '2015-11-15 17:19:42', 'CZ-BRNO-VUT', 'CZ', 'ISC VUT \nFaculty of Business and Management \nKolejní 2906/4 \n612 00', 'Brno', 'http://isc.vutbr.cz/satellite/', 'http://www.facebook.com/pages/ISC-VUT-Brno/167163492185', 17, 49),
(493, 'ISN Amsterdam', '2015-11-15 17:19:42', 'NL-AMST-ISN', 'NL', 'Nieuwe Achtergracht 170\n1018 WV', 'Amsterdam', 'http://isn-amsterdam.nl', 'https://www.facebook.com/pages/ISN-Amsterdam/359885487498322?fref=ts', 5, 52),
(494, 'ISN Leiden', '2015-11-15 17:19:43', 'NL-LEID-ESN', 'NL', 'ISN \nKaiserstraat 25\n2311GN', 'Leiden', 'http://isnleiden.com', 'https://www.facebook.com/pages/ISN-Leiden-Official/194378563956363', 4, 52),
(495, 'ISN Maastricht', '2015-11-15 17:19:43', 'NL-MAAS-ESN', 'NL', 'ISN \nPO Box 616\n6200 MD', 'Maastricht', 'isn-maastricht.nl', 'www.facebook.com/ISNMaastricht', 6, 51),
(496, 'ISN St Poelten', '2015-11-15 17:19:43', 'AT-STPO-ESN', 'AT', 'FH St. Pölten, International Student Network, Matthias Corvinus-Straße 15, 3100 St. Pölten', 'St Poelten', 'http://www.isn-stpoelten.at', '', 16, 48),
(497, 'IxESN Wageningen', '2015-11-15 17:19:43', 'NL-WAGE-ESN', 'NL', 'IxESN Wageningen\nStadsbrink 373\n6706 AA \n6706 AA', 'Wageningen ', 'ixesn-wageningen.nl ', 'http://www.facebook.com/#!/group.php?gid=132892985413', 6, 52),
(498, 'PTE ESN', '2015-11-15 17:19:43', 'HU-PECS-ESN', 'HU', 'Vasvári Pál u. 4. H-7622 ', 'Pecs', 'http://pecs.esn.hu/', '', 0, 0),
(499, 'ESN Sceaux', '2015-11-01 00:00:00', 'FR-SCEA-ESN', 'FR', '', '', '', '', 0, 0),
(500, 'ESN Belfort-Montbéliard', '2015-11-01 00:00:00', 'FR-BELF-ESN', 'FR', '', 'Belfort', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `section_events`
--

CREATE TABLE `section_events` (
  `section_id` int(11) NOT NULL,
  `events_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `section_events`
--

INSERT INTO `section_events` (`section_id`, `events_id`) VALUES
(5, 16),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(20, 7),
(20, 9),
(20, 10),
(20, 11),
(20, 12),
(20, 13),
(20, 14),
(20, 15),
(20, 16),
(29, 3),
(29, 4),
(29, 5),
(29, 6),
(29, 7),
(29, 9),
(29, 10),
(29, 11),
(29, 12),
(29, 13),
(29, 14),
(29, 15),
(31, 3),
(31, 5),
(31, 11),
(31, 14),
(34, 13),
(34, 14),
(34, 15),
(34, 16),
(44, 3),
(44, 4),
(44, 5),
(44, 6),
(44, 7),
(44, 9),
(44, 10),
(44, 11),
(44, 12),
(44, 13),
(44, 14),
(44, 15),
(44, 16),
(62, 3),
(62, 4),
(62, 5),
(62, 6),
(62, 7),
(62, 9),
(62, 10),
(62, 11),
(62, 12),
(62, 13),
(62, 14),
(62, 15),
(62, 16),
(70, 14),
(70, 16),
(101, 3),
(101, 4),
(101, 5),
(101, 6),
(101, 7),
(101, 9),
(101, 10),
(101, 11),
(101, 12),
(101, 13),
(101, 14),
(101, 15),
(101, 16),
(108, 12),
(108, 13),
(108, 14),
(108, 15),
(108, 16),
(314, 14),
(314, 16),
(499, 16),
(500, 16);

-- --------------------------------------------------------

--
-- Structure de la table `user_post`
--

CREATE TABLE `user_post` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user_post`
--

INSERT INTO `user_post` (`user_id`, `post_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 6),
(1, 12),
(1, 32),
(3, 3),
(3, 7),
(3, 12),
(4, 6),
(4, 11),
(5, 3),
(5, 12),
(5, 36),
(7, 12),
(7, 14),
(8, 3),
(8, 12),
(9, 3),
(9, 7),
(10, 12),
(10, 18),
(11, 4),
(11, 12),
(12, 14),
(12, 23),
(13, 12),
(14, 3),
(14, 12),
(14, 19),
(16, 3),
(16, 12),
(16, 33),
(17, 3),
(17, 12),
(17, 21),
(17, 35),
(18, 3),
(18, 12),
(18, 20),
(20, 3),
(20, 12),
(21, 3),
(21, 12),
(22, 3),
(22, 12),
(23, 3),
(23, 12),
(23, 18),
(24, 3),
(24, 12),
(25, 3),
(25, 7),
(25, 12),
(26, 3),
(26, 7),
(26, 12),
(27, 3),
(27, 12),
(27, 20),
(28, 3),
(28, 12),
(29, 7),
(29, 12),
(30, 3),
(30, 12),
(31, 3),
(31, 12),
(31, 18),
(32, 3),
(32, 12),
(32, 21),
(33, 3),
(33, 12),
(33, 21),
(34, 3),
(34, 12),
(34, 18),
(35, 3),
(35, 12),
(35, 20),
(36, 3),
(36, 7),
(36, 12),
(37, 3),
(37, 12),
(37, 36),
(38, 3),
(38, 12),
(38, 21),
(39, 3),
(39, 12),
(39, 20),
(40, 3),
(40, 4),
(40, 12),
(41, 3),
(41, 12),
(41, 36),
(42, 3),
(42, 12),
(42, 18),
(43, 3),
(43, 12),
(43, 17),
(44, 3),
(44, 7),
(44, 12),
(45, 3),
(45, 12),
(46, 3),
(46, 12),
(46, 20),
(47, 3),
(47, 12),
(47, 36),
(48, 3),
(48, 12),
(48, 18),
(49, 3),
(49, 7),
(49, 12),
(50, 3),
(50, 12),
(50, 36),
(51, 3),
(51, 7),
(51, 12),
(52, 3),
(52, 12),
(52, 18),
(53, 3),
(53, 12),
(53, 20),
(54, 3),
(54, 12),
(54, 21),
(61, 3),
(61, 12),
(61, 21),
(62, 3),
(62, 12),
(62, 36),
(63, 3),
(63, 12),
(63, 20),
(64, 3),
(64, 12),
(64, 17),
(64, 21),
(65, 3),
(65, 12),
(65, 21),
(66, 3),
(66, 12),
(66, 18),
(67, 3),
(67, 4),
(67, 12),
(68, 3),
(68, 7),
(68, 12),
(69, 3),
(69, 12),
(69, 20),
(70, 3),
(70, 12),
(70, 36),
(71, 3),
(71, 12),
(71, 18),
(72, 3),
(72, 12),
(72, 21),
(73, 3),
(73, 7),
(73, 12),
(74, 3),
(74, 7),
(74, 12),
(75, 3),
(75, 12),
(75, 36),
(76, 3),
(76, 12),
(76, 18),
(77, 3),
(77, 12),
(77, 20),
(78, 3),
(78, 7),
(78, 12),
(79, 3),
(79, 12),
(79, 20),
(80, 3),
(80, 12),
(80, 18),
(81, 3),
(81, 12),
(81, 36),
(82, 3),
(82, 12),
(82, 36),
(83, 3),
(83, 12),
(83, 20),
(84, 3),
(84, 12),
(84, 18),
(85, 3),
(85, 12),
(85, 21),
(86, 3),
(86, 12),
(86, 21),
(87, 3),
(87, 6),
(87, 7),
(87, 12),
(87, 32),
(88, 3),
(88, 7),
(88, 12),
(89, 3),
(89, 12),
(89, 36);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `committee`
--
ALTER TABLE `committee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D2F2C2378CA3C745` (`chair_id`);

--
-- Index pour la table `committee_user`
--
ALTER TABLE `committee_user`
  ADD PRIMARY KEY (`committee_id`,`user_id`),
  ADD KEY `IDX_1ABDE46AED1A100B` (`committee_id`),
  ADD KEY `IDX_1ABDE46AA76ED395` (`user_id`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fo_user`
--
ALTER TABLE `fo_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9A3C4A6192FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_9A3C4A61A0D96FBF` (`email_canonical`),
  ADD KEY `IDX_9A3C4A61D823E37A` (`section_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_27BA8E2978CED90B` (`from_id`),
  ADD KEY `IDX_27BA8E2930354A65` (`to_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `section_events`
--
ALTER TABLE `section_events`
  ADD PRIMARY KEY (`section_id`,`events_id`),
  ADD KEY `IDX_19CFA56CD823E37A` (`section_id`),
  ADD KEY `IDX_19CFA56C9D6A1065` (`events_id`);

--
-- Index pour la table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`user_id`,`post_id`),
  ADD KEY `IDX_200B2044A76ED395` (`user_id`),
  ADD KEY `IDX_200B20444B89032C` (`post_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `committee`
--
ALTER TABLE `committee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `fo_user`
--
ALTER TABLE `fo_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT pour la table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `committee`
--
ALTER TABLE `committee`
  ADD CONSTRAINT `FK_D2F2C2378CA3C745` FOREIGN KEY (`chair_id`) REFERENCES `fo_user` (`id`);

--
-- Contraintes pour la table `committee_user`
--
ALTER TABLE `committee_user`
  ADD CONSTRAINT `FK_1ABDE46AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fo_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1ABDE46AED1A100B` FOREIGN KEY (`committee_id`) REFERENCES `committee` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fo_user`
--
ALTER TABLE `fo_user`
  ADD CONSTRAINT `FK_9A3C4A61D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);

--
-- Contraintes pour la table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `FK_27BA8E2930354A65` FOREIGN KEY (`to_id`) REFERENCES `fo_user` (`id`),
  ADD CONSTRAINT `FK_27BA8E2978CED90B` FOREIGN KEY (`from_id`) REFERENCES `fo_user` (`id`);

--
-- Contraintes pour la table `section_events`
--
ALTER TABLE `section_events`
  ADD CONSTRAINT `FK_19CFA56C9D6A1065` FOREIGN KEY (`events_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_19CFA56CD823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_post`
--
ALTER TABLE `user_post`
  ADD CONSTRAINT `FK_200B20444B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_200B2044A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fo_user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
