-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 21 avr. 2023 à 16:26
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sp_bertrand`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `valideCategorie` tinyint(4) NOT NULL,
  `id_comptabilite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `categorie`, `valideCategorie`, `id_comptabilite`) VALUES
(1, 'Alimentation ou Supermarché', 1, 2),
(2, 'Tabac', 1, 2),
(3, 'Divertissement', 1, 2),
(4, 'Assurances', 1, 2),
(5, 'Habillement ou Chaussures', 1, 2),
(6, 'Animaux', 1, 2),
(7, 'Cadeaux offerts', 1, 2),
(8, 'Coiffeur ou Esthéthique', 1, 2),
(9, 'Internet ou TV ou Téléphone', 1, 2),
(10, 'Sports ou Loisirs ou Culture', 1, 2),
(11, 'Education ou Formation', 1, 2),
(12, 'Impôts', 1, 2),
(13, 'Enfants', 1, 2),
(14, 'Transports', 1, 2),
(15, 'Restauration ou Hotel', 1, 2),
(16, 'Logement ou immobilier', 1, 2),
(17, 'Santé', 1, 2),
(18, 'Charges', 1, 2),
(19, 'Services divers', 1, 2),
(20, 'Remboursement de prêt', 1, 2),
(21, 'Autres dépenses', 1, 2),
(22, 'Revenu professionnel', 1, 1),
(23, 'Revenu mobilier', 1, 1),
(24, 'Revenu foncier', 1, 1),
(25, 'Vente', 1, 1),
(26, 'Autres revenu', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `comptabilite`
--

CREATE TABLE `comptabilite` (
  `id_comptabilite` int(11) NOT NULL,
  `operation` tinyint(4) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `comptabilite`
--

INSERT INTO `comptabilite` (`id_comptabilite`, `operation`, `type`) VALUES
(1, 1, 'Crédit'),
(2, -1, 'Débit');

-- --------------------------------------------------------

--
-- Structure de la table `modespaiement`
--

CREATE TABLE `modespaiement` (
  `id_modePaiement` int(11) NOT NULL,
  `mode_Paiement` varchar(50) NOT NULL,
  `valideModesPaiement` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `modespaiement`
--

INSERT INTO `modespaiement` (`id_modePaiement`, `mode_Paiement`, `valideModesPaiement`) VALUES
(1, 'Espèces', 1),
(2, 'Carte bancaire', 1),
(3, 'Chèque', 1),
(4, 'Virement', 1),
(5, 'Portefeuille électronique', 1),
(6, 'Paiement mobile', 1);

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id_transaction` int(11) NOT NULL,
  `dates` date NOT NULL,
  `montant` float NOT NULL,
  `valideTransaction` tinyint(4) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_modePaiement` int(11) NOT NULL,
  `operation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id_transaction`, `dates`, `montant`, `valideTransaction`, `id_categorie`, `id_modePaiement`, `operation`) VALUES
(89, '2023-04-13', 10, 1, 1, 1, 1),
(90, '2023-03-30', 10, 1, 1, 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`),
  ADD KEY `id_comptabilite` (`id_comptabilite`);

--
-- Index pour la table `comptabilite`
--
ALTER TABLE `comptabilite`
  ADD PRIMARY KEY (`id_comptabilite`);

--
-- Index pour la table `modespaiement`
--
ALTER TABLE `modespaiement`
  ADD PRIMARY KEY (`id_modePaiement`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_categorie` (`id_categorie`),
  ADD KEY `id_modePaiement` (`id_modePaiement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `comptabilite`
--
ALTER TABLE `comptabilite`
  MODIFY `id_comptabilite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `modespaiement`
--
ALTER TABLE `modespaiement`
  MODIFY `id_modePaiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`id_comptabilite`) REFERENCES `comptabilite` (`id_comptabilite`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`id_modePaiement`) REFERENCES `modespaiement` (`id_modePaiement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
