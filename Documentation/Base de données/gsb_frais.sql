-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 06 avr. 2021 à 10:17
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb_frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

DROP TABLE IF EXISTS `comptable`;
CREATE TABLE IF NOT EXISTS `comptable` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateembauche`) VALUES
('9998', 'Dubois', 'jerome', 'jdubois', 'jedu', '52 rue hypolyte Khan', '93200', 'Lyon', '1992-02-10'),
('a45', 'Bayle', 'Alain', 'abayle', 'khas3', '13 avenye paul valery', '95200', 'Sarcelles', '2000-10-10');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('MP', 'Mise en paiement'),
('RB', 'Remboursée'),
('VA', 'Validée');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

DROP TABLE IF EXISTS `fichefrais`;
CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbjustificatifs` int(11) DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL,
  `datemodif` date DEFAULT NULL,
  `idetat` char(2) DEFAULT 'CR',
  PRIMARY KEY (`idvisiteur`,`mois`),
  KEY `idetat` (`idetat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idvisiteur`, `mois`, `nbjustificatifs`, `montantvalide`, `datemodif`, `idetat`) VALUES
('a131', '201902', 0, '170.00', '2021-04-01', 'RB'),
('a131', '201903', 0, '139.00', '2021-04-01', 'RB'),
('a131', '201904', 3, '0.00', '2019-04-05', 'CL'),
('a131', '201905', 1, '78.00', '2021-04-01', 'RB'),
('a131', '201906', 0, '0.00', '2021-04-01', 'CR'),
('a131', '202103', 1, '6826.00', '2021-04-04', 'CL'),
('a131', '202104', 1, '25.00', '2021-04-04', 'RB'),
('a131', '202105', 0, '0.00', '2021-04-01', 'CR'),
('a17', '201904', 2, '921.00', '2019-04-07', 'CL'),
('a17', '201905', 0, '0.00', '2021-04-01', 'CL'),
('a17', '202104', 0, '0.00', '2021-04-01', 'CR'),
('a55', '201901', 0, '142.00', '2019-04-07', 'RB'),
('a55', '201904', 0, '0.00', '2019-04-05', 'CL'),
('a93', '201903', 1, '0.00', '2019-02-28', 'CL'),
('a93', '201904', 0, '0.00', '2019-04-05', 'CL'),
('b13', '201904', 0, '0.00', '2019-04-07', 'CL'),
('b13', '201905', 0, '0.00', '2021-04-01', 'CR'),
('b13', '202104', 0, '0.00', '2021-04-01', 'CL'),
('b16', '201901', 0, '113.00', '2019-04-07', 'RB'),
('b16', '201902', 0, '92.00', '2019-04-07', 'RB'),
('b19', '201904', 0, '0.00', '2019-04-05', 'CL'),
('b25', '201904', 0, '0.00', '2019-04-07', 'CL'),
('b28', '201904', 0, '0.00', '2019-04-07', 'CL'),
('b34', '201901', 0, '130.00', '2019-04-07', 'RB'),
('b34', '201902', 0, '771.00', '2019-04-07', 'RB'),
('b34', '201904', 0, '0.00', '2019-04-07', 'CL'),
('b4', '201904', 0, '0.00', '2019-04-07', 'CL'),
('b50', '201904', 0, '0.00', '2019-04-07', 'CL'),
('b59', '201904', 0, '0.00', '2019-04-07', 'CL'),
('c14', '201904', 0, '0.00', '2019-04-07', 'CL'),
('c3', '201904', 0, '0.00', '2019-04-07', 'CL'),
('c54', '201904', 0, '0.00', '2019-04-07', 'CL'),
('d13', '201904', 0, '0.00', '2019-04-07', 'CL'),
('d51', '201904', 0, '0.00', '2019-04-07', 'CL'),
('e22', '201904', 0, '0.00', '2019-04-07', 'CL'),
('e24', '201904', 0, '0.00', '2019-04-07', 'CL'),
('e39', '201904', 0, '0.00', '2019-04-07', 'CL'),
('e49', '201904', 0, '0.00', '2019-04-07', 'CL'),
('e5', '201904', 0, '0.00', '2019-04-07', 'CL'),
('e52', '201904', 0, '0.00', '2019-04-07', 'CL'),
('f21', '201904', 0, '0.00', '2019-04-07', 'CL'),
('f319', '201904', 0, '0.00', '2019-04-07', 'CL'),
('f4', '201904', 0, '0.00', '2019-04-07', 'CL');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

DROP TABLE IF EXISTS `fraisforfait`;
CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

DROP TABLE IF EXISTS `lignefraisforfait`;
CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idfraisforfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvisiteur`,`mois`,`idfraisforfait`),
  KEY `idfraisforfait` (`idfraisforfait`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idvisiteur`, `mois`, `idfraisforfait`, `quantite`) VALUES
('a131', '201902', 'ETP', 13),
('a131', '201902', 'KM', 66),
('a131', '201902', 'NUI', 65),
('a131', '201902', 'REP', 26),
('a131', '201903', 'ETP', 7),
('a131', '201903', 'KM', 7),
('a131', '201903', 'NUI', 77),
('a131', '201903', 'REP', 48),
('a131', '201904', 'ETP', 1),
('a131', '201904', 'KM', 20),
('a131', '201904', 'NUI', 3),
('a131', '201904', 'REP', 4),
('a131', '201905', 'ETP', 0),
('a131', '201905', 'KM', 0),
('a131', '201905', 'NUI', 0),
('a131', '201905', 'REP', 0),
('a131', '201906', 'ETP', 0),
('a131', '201906', 'KM', 0),
('a131', '201906', 'NUI', 0),
('a131', '201906', 'REP', 0),
('a131', '202103', 'ETP', 1),
('a131', '202103', 'KM', 66),
('a131', '202103', 'NUI', 65),
('a131', '202103', 'REP', 26),
('a131', '202104', 'ETP', 85),
('a131', '202104', 'KM', 85),
('a131', '202104', 'NUI', 85),
('a131', '202104', 'REP', 85),
('a131', '202105', 'ETP', 0),
('a131', '202105', 'KM', 0),
('a131', '202105', 'NUI', 0),
('a131', '202105', 'REP', 0),
('a17', '201904', 'ETP', 892),
('a17', '201904', 'KM', 3),
('a17', '201904', 'NUI', 2),
('a17', '201904', 'REP', 4),
('a17', '201905', 'ETP', 0),
('a17', '201905', 'KM', 0),
('a17', '201905', 'NUI', 0),
('a17', '201905', 'REP', 0),
('a17', '202104', 'ETP', 0),
('a17', '202104', 'KM', 0),
('a17', '202104', 'NUI', 0),
('a17', '202104', 'REP', 0),
('a55', '201901', 'ETP', 13),
('a55', '201901', 'KM', 62),
('a55', '201901', 'NUI', 65),
('a55', '201901', 'REP', 2),
('a55', '201904', 'ETP', 12),
('a55', '201904', 'KM', 300),
('a55', '201904', 'NUI', 27),
('a55', '201904', 'REP', 9),
('a93', '201903', 'ETP', 6),
('a93', '201903', 'KM', 81),
('a93', '201903', 'NUI', 77),
('a93', '201903', 'REP', 332),
('a93', '201904', 'ETP', 2),
('a93', '201904', 'KM', 20),
('a93', '201904', 'NUI', 30),
('a93', '201904', 'REP', 25),
('b13', '201904', 'ETP', 30),
('b13', '201904', 'KM', 50),
('b13', '201904', 'NUI', 60),
('b13', '201904', 'REP', 40),
('b13', '201905', 'ETP', 0),
('b13', '201905', 'KM', 0),
('b13', '201905', 'NUI', 0),
('b13', '201905', 'REP', 0),
('b13', '202104', 'ETP', 0),
('b13', '202104', 'KM', 0),
('b13', '202104', 'NUI', 0),
('b13', '202104', 'REP', 0),
('b16', '201901', 'ETP', 45),
('b16', '201901', 'KM', 23),
('b16', '201901', 'NUI', 30),
('b16', '201901', 'REP', 15),
('b16', '201902', 'ETP', 27),
('b16', '201902', 'KM', 30),
('b16', '201902', 'NUI', 15),
('b16', '201902', 'REP', 20),
('b19', '201904', 'ETP', 78),
('b19', '201904', 'KM', 89),
('b19', '201904', 'NUI', 6),
('b19', '201904', 'REP', 8),
('b25', '201904', 'ETP', 50),
('b25', '201904', 'KM', 30),
('b25', '201904', 'NUI', 20),
('b25', '201904', 'REP', 15),
('b28', '201904', 'ETP', 50),
('b28', '201904', 'KM', 30),
('b28', '201904', 'NUI', 40),
('b28', '201904', 'REP', 35),
('b34', '201901', 'ETP', 20),
('b34', '201901', 'KM', 30),
('b34', '201901', 'NUI', 50),
('b34', '201901', 'REP', 30),
('b34', '201902', 'ETP', 678),
('b34', '201902', 'KM', 78),
('b34', '201902', 'NUI', 5),
('b34', '201902', 'REP', 10),
('b34', '201904', 'ETP', 50),
('b34', '201904', 'KM', 40),
('b34', '201904', 'NUI', 50),
('b34', '201904', 'REP', 29),
('b4', '201904', 'ETP', 89),
('b4', '201904', 'KM', 50),
('b4', '201904', 'NUI', 50),
('b4', '201904', 'REP', 45),
('b50', '201904', 'ETP', 80),
('b50', '201904', 'KM', 60),
('b50', '201904', 'NUI', 50),
('b50', '201904', 'REP', 40),
('b59', '201904', 'ETP', 70),
('b59', '201904', 'KM', 60),
('b59', '201904', 'NUI', 50),
('b59', '201904', 'REP', 40),
('c14', '201904', 'ETP', 80),
('c14', '201904', 'KM', 120),
('c14', '201904', 'NUI', 70),
('c14', '201904', 'REP', 40),
('c3', '201904', 'ETP', 80),
('c3', '201904', 'KM', 40),
('c3', '201904', 'NUI', 30),
('c3', '201904', 'REP', 15),
('c54', '201904', 'ETP', 50),
('c54', '201904', 'KM', 40),
('c54', '201904', 'NUI', 0),
('c54', '201904', 'REP', 0),
('d13', '201904', 'ETP', 100),
('d13', '201904', 'KM', 80),
('d13', '201904', 'NUI', 80),
('d13', '201904', 'REP', 50),
('d51', '201904', 'ETP', 60),
('d51', '201904', 'KM', 49),
('d51', '201904', 'NUI', 60),
('d51', '201904', 'REP', 40),
('e22', '201904', 'ETP', 60),
('e22', '201904', 'KM', 50),
('e22', '201904', 'NUI', 40),
('e22', '201904', 'REP', 15),
('e24', '201904', 'ETP', 60),
('e24', '201904', 'KM', 50),
('e24', '201904', 'NUI', 50),
('e24', '201904', 'REP', 35),
('e39', '201904', 'ETP', 80),
('e39', '201904', 'KM', 60),
('e39', '201904', 'NUI', 50),
('e39', '201904', 'REP', 39),
('e49', '201904', 'ETP', 40),
('e49', '201904', 'KM', 68),
('e49', '201904', 'NUI', 70),
('e49', '201904', 'REP', 50),
('e5', '201904', 'ETP', 12),
('e5', '201904', 'KM', 562),
('e5', '201904', 'NUI', 6),
('e5', '201904', 'REP', 27),
('e52', '201904', 'ETP', 8),
('e52', '201904', 'KM', 678),
('e52', '201904', 'NUI', 60),
('e52', '201904', 'REP', 40),
('f21', '201904', 'ETP', 9),
('f21', '201904', 'KM', 60),
('f21', '201904', 'NUI', 59),
('f21', '201904', 'REP', 40),
('f319', '201904', 'ETP', 100),
('f319', '201904', 'KM', 120),
('f319', '201904', 'NUI', 60),
('f319', '201904', 'REP', 50),
('f4', '201904', 'ETP', 80),
('f4', '201904', 'KM', 120),
('f4', '201904', 'NUI', 60),
('f4', '201904', 'REP', 40);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

DROP TABLE IF EXISTS `lignefraishorsforfait`;
CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idvisiteur` (`idvisiteur`,`mois`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idvisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(101, 'a93', '201903', 'veriff', '2019-02-24', '678.00'),
(117, 'a17', '201905', 'Taxi_Gare', '2019-04-02', '30.00'),
(121, 'a17', '201905', '0', '2019-04-01', '40.00'),
(123, 'a17', '201905', '0', '2019-04-01', '50.00'),
(124, 'a17', '201905', '0', '2019-04-02', '67.00'),
(129, 'b19', '201904', 'Taxi', '2019-04-03', '40.00'),
(134, 'a17', '201904', 'REFUSERtaxi', '2019-04-02', '67.00'),
(135, 'a17', '201904', 'Parking', '2019-04-03', '20.00'),
(136, 'a93', '201904', 'Parking', '2019-04-03', '23.00'),
(137, 'a55', '201904', 'Restaurant', '2019-04-01', '40.00'),
(138, 'a55', '201904', 'medecin', '2019-04-03', '60.00'),
(140, 'b25', '201904', 'Taxi_gare', '2019-03-29', '40.00'),
(141, 'b28', '201904', 'Repas_Gare', '2019-03-27', '15.00'),
(142, 'b34', '201904', 'Taxi', '2019-03-26', '50.00'),
(143, 'b4', '201904', 'Uber', '2019-03-29', '56.00'),
(144, 'b50', '201904', 'Taxi', '2019-03-27', '60.00'),
(145, 'b59', '201904', 'Ticket_metro', '2019-04-03', '10.00'),
(146, 'c14', '201904', 'Parking', '2019-03-27', '30.00'),
(147, 'd13', '201904', 'SNCF_TGV', '2019-03-31', '70.00'),
(148, 'd51', '201904', 'Ticket_metro', '2019-04-02', '4.00'),
(149, 'e22', '201904', 'Repas_matin', '2019-04-02', '5.00'),
(150, 'e24', '201904', 'Parking', '2019-03-28', '23.00'),
(151, 'e39', '201904', 'Achat', '2019-04-01', '30.00'),
(152, 'e49', '201904', 'Uber_Location', '2019-04-03', '30.00'),
(153, 'e5', '201904', 'Achat de fleurs', '2019-04-03', '27.00'),
(154, 'e52', '201904', 'TAXI', '2019-04-07', '40.00'),
(155, 'f21', '201904', 'Parking', '2019-04-03', '30.00'),
(156, 'f319', '201904', 'Ticket_metro', '2019-03-29', '4.00'),
(157, 'f4', '201904', 'TGV', '2019-04-02', '67.00'),
(163, 'a131', '201905', 'SNCF_TGV', '2019-04-02', '78.00'),
(164, 'a131', '201906', '9', '2019-02-04', '55.00'),
(165, 'a131', '201906', 'REFUSERTaxi', '2019-04-01', '50.00'),
(166, 'a131', '201906', 'Refuser-Taxi', '2019-04-01', '67.00'),
(167, 'a131', '202105', 'zrrfzz', '2021-03-03', '32.00'),
(168, 'a131', '202105', 'hugo', '2021-03-31', '789.00'),
(169, 'b13', '202104', 'dqdsq', '2021-01-02', '580.00'),
(170, 'b13', '201905', 'Ticket_metro', '2019-04-04', '5.00'),
(171, 'a131', '202104', 'bbb', '2021-05-03', '21.00'),
(172, 'a131', '202104', 'abc', '2021-04-04', '10.00'),
(173, 'a131', '202104', 'abc', '2021-02-02', '30.00'),
(174, 'a131', '202104', 'azertyhujik', '2021-03-18', '789.00'),
(175, 'a131', '202103', 'abc', '2019-02-24', '6668.00'),
(176, 'a131', '202104', 'azet', '2021-03-20', '789.00');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateembauche`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21'),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11'),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10'),
('f319', 'Claude', 'Bayle', 'bclaude', 'cb5tq', '14 route de la mer', '13012', 'Allauh', '1998-12-01'),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01'),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idetat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idvisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idfraisforfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
