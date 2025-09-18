--
-- Script d'insertion des données de test
--
-- Ce script doit être importé APRÈS le script de création de la base de données.
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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
/*!40101 SET @OLD_COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;