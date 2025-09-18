--
-- Sauvegarde complète de la base de données
--
-- Cet script contient la structure des tables et les données d'insertion.
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Supprimer la base de données si elle existe pour un départ propre
--
DROP DATABASE IF EXISTS `tifosi`;

--
-- Création de la base de données `tifosi`
--
CREATE DATABASE IF NOT EXISTS `tifosi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tifosi`;

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE `achat` (
  `id_client` int(11) NOT NULL,
  `id_focaccia` int(11) NOT NULL,
  `jour` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(45) NOT NULL,
  `id_marque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `cp` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

CREATE TABLE `focaccia` (
  `id_focaccia` int(11) NOT NULL,
  `nom_focaccia` varchar(45) NOT NULL,
  `prix_focaccia` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `focaccia_ingredient`
--

CREATE TABLE `focaccia_ingredient` (
  `id_focaccia` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id_ingredient` int(11) NOT NULL,
  `nom_ingredient` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `nom_marque` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `id_focaccia` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu_boisson`
--

CREATE TABLE `menu_boisson` (
  `id_menu` int(11) NOT NULL,
  `id_boisson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_client` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `prix_total` decimal(4,2) NOT NULL,
  `date_paiement` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables
--

ALTER TABLE `achat`
  ADD KEY `fk_achat_client` (`id_client`),
  ADD KEY `fk_achat_focaccia` (`id_focaccia`);

ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`),
  ADD KEY `fk_boisson_marque` (`id_marque`);

ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id_focaccia`);

ALTER TABLE `focaccia_ingredient`
  ADD KEY `focaccia_ingredient_ibfk_1` (`id_focaccia`),
  ADD KEY `focaccia_ingredient_ibfk_2` (`id_ingredient`);

ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id_ingredient`);

ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `fk_menu_focaccia` (`id_focaccia`),
  ADD KEY `fk_menu_client` (`id_client`);

ALTER TABLE `menu_boisson`
  ADD KEY `menu_boisson_ibfk_1` (`id_menu`),
  ADD KEY `menu_boisson_ibfk_2` (`id_boisson`);

ALTER TABLE `paiement`
  ADD KEY `paiement_ibfk_1` (`id_client`),
  ADD KEY `paiement_ibfk_2` (`id_menu`);

--
-- AUTO_INCREMENT pour les tables
--

ALTER TABLE `boisson`
  MODIFY `id_boisson` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `focaccia`
  MODIFY `id_focaccia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `ingredient`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables
--

ALTER TABLE `achat`
  ADD CONSTRAINT `fk_achat_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `fk_achat_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`);

ALTER TABLE `boisson`
  ADD CONSTRAINT `fk_boisson_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`);

ALTER TABLE `focaccia_ingredient`
  ADD CONSTRAINT `focaccia_ingredient_ibfk_1` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE CASCADE,
  ADD CONSTRAINT `focaccia_ingredient_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON DELETE CASCADE;

ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `fk_menu_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`);

ALTER TABLE `menu_boisson`
  ADD CONSTRAINT `menu_boisson_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_boisson_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON DELETE CASCADE;

ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE,
  ADD CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE;
COMMIT;


--
-- Création du compte utilisateur et attribution des privilèges
--
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'mot_de_passe_secret_a_choisir';
GRANT ALL PRIVILEGES ON `tifosi`.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

--
-- Données de la table `marque` (Table parente de boisson)
--
INSERT INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca-cola'),
(2, 'Pepsico'),
(3, 'Monster'),
(4, 'Cristalline');


--
-- Données de la table `boisson`
--
INSERT INTO `boisson` (`id_boisson`, `nom_boisson`, `id_marque`) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 2),
(7, 'Pepsi Max Zéro', 2),
(8, 'Lipton zéro citron', 2),
(9, 'Lipton Peach', 2),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 4);

--
-- Données de la table `client`
--
INSERT INTO `client` (`id_client`, `nom_client`, `age`, `cp`) VALUES
(1, 'Jean Dupont', 30, '75001'),
(2, 'Marie Durand', 25, '69002');


--
-- Données de la table `focaccia`
--
INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`) VALUES
(1, 'Focaccia Mozaccia', 9.80),
(2, 'Focaccia Gorgonzollaccia', 10.80),
(3, 'Focaccia Raclaccia', 8.90),
(4, 'Focaccia Emmentalaccia', 9.80),
(5, 'Focaccia Tradizione', 8.90),
(6, 'Focaccia Hawaienne', 11.20),
(7, 'Focaccia Américaine', 10.80),
(8, 'Focaccia Paysanne', 12.80);

--
-- Données de la table `ingredient` (Table parente de focaccia_ingredient)
--
INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise');

--
-- Données de la table `focaccia_ingredient`
--
INSERT INTO `focaccia_ingredient` (`id_focaccia`, `id_ingredient`) VALUES
(1, 1), (1, 3), (1, 8), (1, 9), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17),
(2, 1), (2, 4), (2, 8), (2, 12), (2, 14), (2, 15), (2, 16), (2, 17),
(3, 1), (3, 5), (3, 8), (3, 12), (3, 14), (3, 15), (3, 16),
(4, 2), (4, 6), (4, 8), (4, 14), (4, 15), (4, 16), (4, 19),
(5, 1), (5, 3), (5, 8), (5, 10), (5, 14), (5, 15), (5, 16), (5, 17), (5, 18),
(6, 1), (6, 3), (6, 8), (6, 11), (6, 15), (6, 16), (6, 17), (6, 20), (6, 21),
(7, 1), (7, 3), (7, 8), (7, 11), (7, 15), (7, 16), (7, 17), (7, 22),
(8, 2), (8, 7), (8, 8), (8, 9), (8, 12), (8, 13), (8, 14), (8, 15), (8, 16), (8, 17), (8, 22), (8, 23);

--
-- Données de la table `menu`
--
INSERT INTO `menu` (`id_menu`, `id_focaccia`, `id_client`) VALUES
(1, 1, 1),
(2, 2, 2);

--
-- Données de la table `menu_boisson`
--
INSERT INTO `menu_boisson` (`id_menu`, `id_boisson`) VALUES
(1, 1),
(2, 6);

--
-- Données de la table `paiement`
--
INSERT INTO `paiement` (`id_client`, `id_menu`, `prix_total`, `date_paiement`) VALUES
(1, 1, 12.50, '2025-09-15'),
(2, 2, 10.00, '2025-09-15');

--
-- Données de la table `achat`
--
INSERT INTO `achat` (`id_client`, `id_focaccia`, `jour`) VALUES
(1, 1, '2025-09-15'),
(2, 2, '2025-09-15');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;