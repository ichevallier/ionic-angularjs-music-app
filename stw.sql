-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 31 Octobre 2016 à 14:24
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `stw`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(128) NOT NULL DEFAULT '',
  `artiste` int(10) unsigned NOT NULL DEFAULT '0',
  `isbn` varchar(255) NOT NULL DEFAULT '',
  `annee` varchar(128) NOT NULL DEFAULT '',
  `description` text,
  `addImage` char(1) NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `alt` varchar(255) NOT NULL DEFAULT '',
  `prix` varchar(128) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `labels` int(10) unsigned NOT NULL DEFAULT '0',
  `genre` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE IF NOT EXISTS `artiste` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(128) NOT NULL DEFAULT '',
  `genre` blob NOT NULL,
  `pays` varchar(255) NOT NULL DEFAULT '',
  `musiciens` blob NOT NULL,
  `description` text,
  `facebook` varchar(255) NOT NULL DEFAULT '',
  `twitter` varchar(255) NOT NULL DEFAULT '',
  `youtube` varchar(255) NOT NULL DEFAULT '',
  `singleSRC` varchar(255) DEFAULT NULL,
  `alt` varchar(255) NOT NULL DEFAULT '',
  `multiSRC` blob NOT NULL,
  `videos` blob NOT NULL,
  `AdresseUrl` varchar(255) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `artiste`
--

INSERT INTO `artiste` (`id`, `tstamp`, `pid`, `title`, `alias`, `genre`, `pays`, `musiciens`, `description`, `facebook`, `twitter`, `youtube`, `singleSRC`, `alt`, `multiSRC`, `videos`, `AdresseUrl`, `published`) VALUES
(1, 0, 0, 'August Burns Red', 'august-burns-red', '', '0', '', 'Le groupe de Metalcore August Burns Red s''est formé en 2003 à Lancaster (USA), et signe l''année suivante chez CI Records pour son premier Ep, Looks Fragile After All. En 2005, après un changement de chanteur, le groupe signe chez Solid State et sort son premier album Thrill Seeker. Ils retournent en studio pour ré-enregistrer leur Ep Looks Fragile After All, changent à nouveau de chanteur, et sortent leur second album en 2007, Messenger, suivi par une tournée mondiale avec par exemple A Skylit Drive, Sky Eats Airplane, Greeley Estates et This Or The Apocalypse. Début 2009, pour patienter jusqu''à l''album suivant, August Burns Red sort un ep, Lost Messengers : The Outtakes, regroupant des chutes de studio et quelques morceaux rares. Mais le groupe ne patiente pas, et en juillet 2009 livre son troisième opus, Constellations. Un live voit le jour l''année suivante, tandis qu''à grand renforts de promo Facebook, August Burns Red annonce Leveler, son 4ème disque, sorti en Juin 2011.', 'https://www.facebook.com/augustburnsred', 'https://twitter.com/abrband', 'https://www.youtube.com/channel/UCzrYEofC-8z2Dj6GO14bMWw', NULL, '', '', '', 'augustburnsred.com', '1'),
(2, 0, 0, 'Amaranthe', 'amaranthe', '', '0', '', 'Olof Mörck (guitares, Dragonland et Nightrage) et Jake E. (chant clair, ex Dream Evil) créent ensemble Avalanche en 2008. L''optique du groupe est de se démarquer par le fait d''avoir trois vocalistes avec chacun des tessitures différentes. Pour compléter le chant mélodique du fondateur, Elize Ryd (chant clair féminin) et Andreas Solveström (chant guttural) sont recrutés. Le nom du groupe se transforme en Amaranthe en 2009 pour des raisons légales.\r\n\r\nGrâce à une première démo, le label Spinefarm Records signe le groupe. Leur premier album, éponyme, sort en avril 2011. Il s''agit d''un Metal moderne, quelque part entre Metalcore facile d''accès, Death Mélodique, et Techno-Pop. Ils soutiendront leur effort en tournée avec Kamelot (avec qui Elize Ryd collabore toujours ponctuellement) et Evergrey. Un second album, The Nexus, voit le jour début 2013.\r\n\r\nAndreas Solveström quitte Amaranthe en 2013 et Henrik Englund Wilhemsson (Scarpoint) le remplace. Ce nouveau line-up sort Massive Addictive fin 2014, puis la compilation Breaking Point - B-sides 2011-2015, principalement constituée de versions acoustiques.', 'https://www.facebook.com/AmarantheBand', 'https://twitter.com/amaranthemetal', 'https://www.youtube.com/channel/UCaB54U9wiuhoWVOPlLxZcsg', NULL, '', '', '', 'amaranthe.se', '1')
(3, 0, 0, 'Nervosa', 'nervosa', '', '0', '', 'No description', 'https://www.facebook.com/femaletrash', 'https://twitter.com/nervosathrash', 'https://www.youtube.com/channel/UCRjLer4QDtbyKBnq6zioZhw', NULL, '', '', '', 'nervosaofficial.com', '1'),
;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(128) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id`, `tstamp`, `title`, `alias`, `published`) VALUES
(1, 1475244105, 'Pop/Rock', 'pop-rock', '1'),
(2, 1475244115, 'Les Posts', 'les-posts', '1'),
(3, 1475244125, 'Hardcore', 'hardcore', '1'),
(4, 1475244135, 'Rock/Metal', 'rock-metal', '1');

-- --------------------------------------------------------

--
-- Structure de la table `morceaux`
--

CREATE TABLE IF NOT EXISTS `morceaux` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
--
-- Contenu de la table `morceaux`
--
INSERT INTO `morceaux` (`id`, `title`,`published`) VALUES
(1, 1, 'Indonesia', 1),
(2, 1, 'Salt and light', 1),
(4, 2, 'Burn with me', 1),
(6, 2, 'Theory of everything', 1),
(7, 3, 'Hostages', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
