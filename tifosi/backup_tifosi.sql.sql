-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 01 avr. 2026 à 11:53
-- Version du serveur : 9.1.0
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--

-- --------------------------------------------------------

--
-- Structure de la table `achete`
--

DROP TABLE IF EXISTS `achete`;
CREATE TABLE IF NOT EXISTS `achete` (
  `id_client` int NOT NULL,
  `id_focaccia` int NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`id_client`,`id_focaccia`,`jour`),
  KEY `id_focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `achete`
--

INSERT INTO `achete` (`id_client`, `id_focaccia`, `jour`) VALUES
(1, 1, '2026-03-20'),
(6, 1, '2026-03-23'),
(2, 2, '2026-03-21'),
(1, 3, '2026-03-22'),
(8, 4, '2026-03-21'),
(3, 5, '2026-03-19'),
(4, 6, '2026-03-25'),
(5, 7, '2026-03-24'),
(7, 8, '2026-03-22');

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
CREATE TABLE IF NOT EXISTS `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `id_marque` int NOT NULL,
  PRIMARY KEY (`id_boisson`),
  KEY `fk_boisson_marque` (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`, `id_marque`) VALUES
(1, 'Coca-Cola Classic', 1),
(2, 'Coca-Cola Zero', 1),
(3, 'Pepsi Max', 2),
(4, 'Limonata', 3),
(5, 'Aranciata', 3),
(6, 'Orangina Original', 4),
(7, 'Perrier Nature', 5),
(8, 'Perrier Citron', 5);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `cp_client` int NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `age`, `cp_client`) VALUES
(1, 'Jean Dupont', 35, 75001),
(2, 'Marie Martin', 28, 69002),
(3, 'Pierre Durand', 42, 13001),
(4, 'Sophie Bernard', 31, 31000),
(5, 'Lucas Petit', 25, 33000),
(6, 'Emma Leroy', 38, 59000),
(7, 'Hugo Moreau', 29, 44000),
(8, 'Léa Simon', 45, 67000);

-- --------------------------------------------------------

--
-- Structure de la table `comprend`
--

DROP TABLE IF EXISTS `comprend`;
CREATE TABLE IF NOT EXISTS `comprend` (
  `id_focaccia` int NOT NULL,
  `id_ingredient` int NOT NULL,
  PRIMARY KEY (`id_focaccia`,`id_ingredient`),
  KEY `id_ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comprend`
--

INSERT INTO `comprend` (`id_focaccia`, `id_ingredient`) VALUES
(1, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 1),
(1, 2),
(5, 2),
(6, 2),
(7, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(1, 4),
(8, 4),
(1, 5),
(2, 5),
(3, 5),
(8, 5),
(1, 6),
(8, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(8, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(6, 8),
(7, 8),
(8, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(1, 10),
(5, 10),
(6, 10),
(7, 10),
(8, 10),
(2, 11),
(3, 12),
(4, 13),
(8, 13),
(4, 14),
(4, 15),
(5, 16),
(5, 17),
(6, 18),
(7, 18),
(6, 19),
(6, 20);

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

DROP TABLE IF EXISTS `contient`;
CREATE TABLE IF NOT EXISTS `contient` (
  `id_menu` int NOT NULL,
  `id_boisson` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_boisson`),
  KEY `id_boisson` (`id_boisson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contient`
--

INSERT INTO `contient` (`id_menu`, `id_boisson`) VALUES
(1, 1),
(2, 1),
(2, 4),
(5, 4),
(3, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Structure de la table `est_constitue`
--

DROP TABLE IF EXISTS `est_constitue`;
CREATE TABLE IF NOT EXISTS `est_constitue` (
  `id_menu` int NOT NULL,
  `id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_focaccia`),
  KEY `id_focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `est_constitue`
--

INSERT INTO `est_constitue` (`id_menu`, `id_focaccia`) VALUES
(1, 1),
(2, 1),
(4, 2),
(2, 3),
(5, 4),
(1, 5),
(3, 5),
(2, 6),
(4, 8);

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
CREATE TABLE IF NOT EXISTS `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_focaccia` float NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`) VALUES
(1, 'Mozaccia', 9.8),
(2, 'Gorgonzollaccia', 10.8),
(3, 'Raclaccia', 8.9),
(4, 'Emmentalaccia', 9.8),
(5, 'Tradizione', 8.9),
(6, 'Hawaïenne', 11.2),
(7, 'Américaine', 10.8),
(8, 'Paysanne', 12.8);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Base tomate'),
(2, 'Mozarella'),
(3, 'Cresson'),
(4, 'Jambon fumé'),
(5, 'Ail'),
(6, 'Artichaut'),
(7, 'Champignon'),
(8, 'Parmesan'),
(9, 'Poivre'),
(10, 'Olive noire'),
(11, 'Gorgonzola'),
(12, 'Raclette'),
(13, 'Base crème'),
(14, 'Emmental'),
(15, 'Oignon'),
(16, 'Jambon cuit'),
(17, 'Olive verte'),
(18, 'Bacon'),
(19, 'Ananas'),
(20, 'Piment');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca-Cola'),
(2, 'Pepsi'),
(3, 'San Pellegrino'),
(4, 'Orangina'),
(5, 'Perrier');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_menu` float NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id_menu`, `nom_menu`, `prix_menu`) VALUES
(1, 'Menu Classico', 14.9),
(2, 'Menu Famiglia', 24.9),
(3, 'Menu Bambino', 9.9),
(4, 'Menu Gourmet', 18.5),
(5, 'Menu Végétarien', 13.9);

-- --------------------------------------------------------

--
-- Structure de la table `paye`
--

DROP TABLE IF EXISTS `paye`;
CREATE TABLE IF NOT EXISTS `paye` (
  `id_client` int NOT NULL,
  `id_menu` int NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`id_client`,`id_menu`,`jour`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paye`
--

INSERT INTO `paye` (`id_client`, `id_menu`, `jour`) VALUES
(1, 1, '2026-03-20'),
(5, 1, '2026-03-24'),
(2, 2, '2026-03-21'),
(7, 2, '2026-03-22'),
(3, 3, '2026-03-19'),
(4, 4, '2026-03-25'),
(8, 4, '2026-03-21'),
(6, 5, '2026-03-23');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achete`
--
ALTER TABLE `achete`
  ADD CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`);

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `fk_boisson_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`);

--
-- Contraintes pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD CONSTRAINT `comprend_ibfk_1` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `comprend_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  ADD CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`);

--
-- Contraintes pour la table `est_constitue`
--
ALTER TABLE `est_constitue`
  ADD CONSTRAINT `est_constitue_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  ADD CONSTRAINT `est_constitue_ibfk_2` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`);

--
-- Contraintes pour la table `paye`
--
ALTER TABLE `paye`
  ADD CONSTRAINT `paye_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `paye_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
