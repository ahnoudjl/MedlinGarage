-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 08 déc. 2022 à 06:13
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `medlin`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Id_Client` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Adresse` varchar(65) DEFAULT NULL,
  `Tele` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_Client`, `Nom`, `Prenom`, `Adresse`, `Tele`, `Email`) VALUES
(1, 'Mohamed1', 'Mahmoud1', 'Reims, Rue 2, 25', '656944587', 'mohamed@mail.com'),
(2, 'Mohamed2', 'Mahmoud2', 'Reims, Rue 2, 25', '656945458', 'mohamed2@mail.com'),
(3, 'Mohamed3', 'Mahmoud3', 'Reims, Rue 2, 25', '656494458', 'mohamed3@mail.com'),
(4, 'Mohamed4', 'Mahmoud4', 'Reims, Rue 2, 25', '656944558', 'mohamed4@mail.com');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `Id_Marque` int(11) NOT NULL,
  `Titre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`Id_Marque`, `Titre`) VALUES
(3, 'Mercédès'),
(2, 'Peugeot'),
(1, 'Renault');

-- --------------------------------------------------------

--
-- Structure de la table `mecanicien`
--

CREATE TABLE `mecanicien` (
  `Id_Mecanicien` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Adresse` varchar(65) DEFAULT NULL,
  `Tele` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Prix_heure` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mecanicien`
--

INSERT INTO `mecanicien` (`Id_Mecanicien`, `Nom`, `Prenom`, `Adresse`, `Tele`, `Email`, `Prix_heure`) VALUES
(1, 'Mohamed1', 'Mechnique1', 'Reims, Rue 2, 25', '6546944587', 'Mechnique@mail.com', '50.00'),
(2, 'Mohamed2', 'Mechnique2', 'Reims, Rue 2, 25', '6456945458', 'Mechnique2@mail.com', '55.00'),
(3, 'Mohamed3', 'Mechnique3', 'Reims, Rue 2, 25', '6564494458', 'Mechnique3@mail.com', '70.00'),
(4, 'Mohamed4', 'Mechnique4', 'Reims, Rue 2, 25', '6546944558', 'Mechnique4@mail.com', '60.00');

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `Id_Operation` int(11) NOT NULL,
  `Titre` varchar(20) NOT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  `TVA` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operation`
--

INSERT INTO `operation` (`Id_Operation`, `Titre`, `Prix`, `TVA`) VALUES
(1, 'vidange', '50.00', '20.00'),
(2, 'système de freinage', '40.00', '20.00'),
(3, 'système électrique', '30.00', '20.00'),
(4, 'moteur', '60.00', '20.00'),
(5, 'distribution', '50.00', '20.00'),
(6, 'montage de pneus', '20.00', '20.00');

-- --------------------------------------------------------

--
-- Structure de la table `operation_reparation`
--

CREATE TABLE `operation_reparation` (
  `FK_Id_Operation` int(11) NOT NULL,
  `FK_Id_Reparation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operation_reparation`
--

INSERT INTO `operation_reparation` (`FK_Id_Operation`, `FK_Id_Reparation`) VALUES
(1, 1),
(1, 8),
(1, 12),
(2, 4),
(2, 12),
(3, 1),
(3, 6),
(3, 7),
(3, 9),
(3, 14),
(4, 2),
(4, 10),
(5, 5),
(5, 13),
(6, 3),
(6, 8),
(6, 11),
(6, 14);

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

CREATE TABLE `piece` (
  `Id_Piece` int(11) NOT NULL,
  `Titre` varchar(25) NOT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  `TVA` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `piece`
--

INSERT INTO `piece` (`Id_Piece`, `Titre`, `Prix`, `TVA`) VALUES
(1, 'plaquettes de frein', '35.00', '20.00'),
(2, 'kit tambour / garniture', '150.00', '20.00'),
(3, 'disques de frein', '30.00', '20.00'),
(4, 'filtre à habitacle', '15.00', '20.00'),
(5, 'soufflet de cardan', '30.00', '20.00'),
(6, 'filtre à air ', '20.00', '20.00'),
(7, 'Batterie', '20.00', '20.00');

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE `prestation` (
  `Id_Prestation` int(11) NOT NULL,
  `Titre` varchar(25) NOT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  `TVA` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prestation`
--

INSERT INTO `prestation` (`Id_Prestation`, `Titre`, `Prix`, `TVA`) VALUES
(1, 'équilibrage', '50.00', '20.00'),
(2, 'embrayage', '40.00', '20.00'),
(3, 'disques de frein', '30.00', '20.00'),
(4, 'plaquettes de frein', '60.00', '20.00');

-- --------------------------------------------------------

--
-- Structure de la table `prestation_reparation`
--

CREATE TABLE `prestation_reparation` (
  `FK_Id_Reparation` int(11) NOT NULL,
  `FK_Id_Prestation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prestation_reparation`
--

INSERT INTO `prestation_reparation` (`FK_Id_Reparation`, `FK_Id_Prestation`) VALUES
(1, 1),
(1, 3),
(2, 4),
(3, 2),
(4, 2),
(5, 4),
(6, 3),
(7, 3),
(8, 1),
(8, 2),
(9, 3),
(10, 4),
(11, 2),
(12, 1),
(12, 2),
(13, 3),
(14, 1),
(14, 3);

-- --------------------------------------------------------

--
-- Structure de la table `remplacement`
--

CREATE TABLE `remplacement` (
  `FK_Id_Reparation` int(11) NOT NULL,
  `FK_Id_Piece` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `remplacement`
--

INSERT INTO `remplacement` (`FK_Id_Reparation`, `FK_Id_Piece`) VALUES
(1, 1),
(2, 4),
(3, 1),
(3, 6),
(4, 2),
(5, 5),
(6, 3),
(7, 1),
(7, 7),
(8, 1),
(8, 6),
(9, 3),
(10, 4),
(11, 6),
(12, 1),
(12, 2),
(13, 5),
(14, 3),
(14, 6);

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `Id_Rendez_vous` int(11) NOT NULL,
  `Date_rendez_vous` datetime DEFAULT NULL,
  `FK_Num_matricule` varchar(9) NOT NULL,
  `FK_Id_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rendez_vous`
--

INSERT INTO `rendez_vous` (`Id_Rendez_vous`, `Date_rendez_vous`, `FK_Num_matricule`, `FK_Id_Client`) VALUES
(1, '2022-12-08 00:00:00', 'AA-001-AA', 1),
(2, '2022-12-08 00:00:00', 'AA-999-AZ', 2),
(3, '2022-12-10 00:00:00', 'AB-001-AA', 3),
(4, '2022-12-11 00:00:00', 'ZZ-999-ZZ', 4);

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

CREATE TABLE `reparation` (
  `Id_Reparation` int(11) NOT NULL,
  `Date_reparation` datetime DEFAULT NULL,
  `Kilometrage` int(11) DEFAULT NULL,
  `Nbr_heure` smallint(6) DEFAULT NULL,
  `FK_Num_matricule` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reparation`
--

INSERT INTO `reparation` (`Id_Reparation`, `Date_reparation`, `Kilometrage`, `Nbr_heure`, `FK_Num_matricule`) VALUES
(1, '2022-10-04 00:00:00', 56454, 4, 'AA-001-AA'),
(2, '2022-10-05 00:00:00', 5654, 3, 'ZZ-900-ZZ'),
(3, '2022-10-06 00:00:00', 5654, 3, 'AB-010-AA'),
(4, '2022-10-19 00:00:00', 56548, 6, 'AA-999-AZ'),
(5, '2022-10-24 00:00:00', 5654, 10, 'AB-010-AA'),
(6, '2022-10-25 00:00:00', 5654, 6, 'ZZ-999-ZZ'),
(7, '2022-10-26 00:00:00', 5654, 2, 'AB-001-AA'),
(8, '2022-10-27 00:00:00', 5645454, 4, 'AA-001-AA'),
(9, '2022-10-28 00:00:00', 5654444, 3, 'ZZ-900-ZZ'),
(10, '2022-10-29 00:00:00', 565454, 3, 'AB-010-AA'),
(11, '2022-10-30 00:00:00', 5654855, 6, 'AA-999-AZ'),
(12, '2022-11-04 00:00:00', 5654444, 10, 'AB-010-AA'),
(13, '2022-11-04 00:00:00', 5654554, 6, 'ZZ-999-ZZ'),
(14, '2022-11-06 00:00:00', 5654474, 2, 'AB-001-AA');

-- --------------------------------------------------------

--
-- Structure de la table `reparation_d_entretien`
--

CREATE TABLE `reparation_d_entretien` (
  `FK_Num_matricule` varchar(9) NOT NULL,
  `FK_Id_Reparation` int(11) NOT NULL,
  `taux_kilometrage` decimal(15,2) DEFAULT NULL,
  `nbr_annee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reparation_d_entretien`
--

INSERT INTO `reparation_d_entretien` (`FK_Num_matricule`, `FK_Id_Reparation`, `taux_kilometrage`, `nbr_annee`) VALUES
('AA-001-AA', 1, '160000.00', 7),
('AA-001-AA', 8, '160000.00', 7),
('AA-999-AZ', 4, '180000.00', 5);

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `FK_Id_Rendez_vous` int(11) NOT NULL,
  `FK_Id_Mecanicien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`FK_Id_Rendez_vous`, `FK_Id_Mecanicien`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(3, 4),
(4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE `traitement` (
  `FK_Id_Reparation` int(11) NOT NULL,
  `FK_Id_Mecanicien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`FK_Id_Reparation`, `FK_Id_Mecanicien`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(3, 4),
(4, 2),
(4, 3),
(8, 4),
(9, 1),
(9, 2),
(10, 3),
(11, 1),
(11, 4),
(12, 2),
(12, 3),
(14, 1),
(14, 2);

-- --------------------------------------------------------

--
-- Structure de la table `type_vehicule`
--

CREATE TABLE `type_vehicule` (
  `Id_Type_Vehicule` int(11) NOT NULL,
  `Titre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_vehicule`
--

INSERT INTO `type_vehicule` (`Id_Type_Vehicule`, `Titre`) VALUES
(4, '2008'),
(3, '308'),
(2, 'Captur'),
(1, 'Kangoo');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `Num_matricule` varchar(9) NOT NULL,
  `Date_circulation` date DEFAULT NULL,
  `FK_Id_Marque` int(11) NOT NULL,
  `FK_Id_Client` int(11) NOT NULL,
  `FK_Id_Type_Vehicule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`Num_matricule`, `Date_circulation`, `FK_Id_Marque`, `FK_Id_Client`, `FK_Id_Type_Vehicule`) VALUES
('AA-001-AA', '2020-12-11', 1, 1, 1),
('AA-999-AZ', '2021-02-12', 2, 2, 3),
('AB-001-AA', '2019-05-10', 1, 3, 2),
('AB-010-AA', '2018-10-05', 1, 1, 2),
('ZZ-900-ZZ', '2021-12-03', 3, 2, 4),
('ZZ-999-ZZ', '2022-12-03', 3, 4, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_Client`),
  ADD UNIQUE KEY `Tele` (`Tele`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`Id_Marque`),
  ADD UNIQUE KEY `Titre` (`Titre`);

--
-- Index pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  ADD PRIMARY KEY (`Id_Mecanicien`),
  ADD UNIQUE KEY `Tele` (`Tele`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`Id_Operation`),
  ADD UNIQUE KEY `Titre` (`Titre`);

--
-- Index pour la table `operation_reparation`
--
ALTER TABLE `operation_reparation`
  ADD PRIMARY KEY (`FK_Id_Operation`,`FK_Id_Reparation`),
  ADD KEY `FK_Id_Reparation` (`FK_Id_Reparation`);

--
-- Index pour la table `piece`
--
ALTER TABLE `piece`
  ADD PRIMARY KEY (`Id_Piece`),
  ADD UNIQUE KEY `Titre` (`Titre`);

--
-- Index pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`Id_Prestation`),
  ADD UNIQUE KEY `Titre` (`Titre`);

--
-- Index pour la table `prestation_reparation`
--
ALTER TABLE `prestation_reparation`
  ADD PRIMARY KEY (`FK_Id_Reparation`,`FK_Id_Prestation`),
  ADD KEY `FK_Id_Prestation` (`FK_Id_Prestation`);

--
-- Index pour la table `remplacement`
--
ALTER TABLE `remplacement`
  ADD PRIMARY KEY (`FK_Id_Reparation`,`FK_Id_Piece`),
  ADD KEY `FK_Id_Piece` (`FK_Id_Piece`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`Id_Rendez_vous`),
  ADD KEY `FK_Num_matricule` (`FK_Num_matricule`),
  ADD KEY `FK_Id_Client` (`FK_Id_Client`);

--
-- Index pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD PRIMARY KEY (`Id_Reparation`),
  ADD KEY `FK_Num_matricule` (`FK_Num_matricule`);

--
-- Index pour la table `reparation_d_entretien`
--
ALTER TABLE `reparation_d_entretien`
  ADD PRIMARY KEY (`FK_Num_matricule`,`FK_Id_Reparation`),
  ADD KEY `FK_Id_Reparation` (`FK_Id_Reparation`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`FK_Id_Rendez_vous`,`FK_Id_Mecanicien`),
  ADD KEY `FK_Id_Mecanicien` (`FK_Id_Mecanicien`);

--
-- Index pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD PRIMARY KEY (`FK_Id_Reparation`,`FK_Id_Mecanicien`),
  ADD KEY `FK_Id_Mecanicien` (`FK_Id_Mecanicien`);

--
-- Index pour la table `type_vehicule`
--
ALTER TABLE `type_vehicule`
  ADD PRIMARY KEY (`Id_Type_Vehicule`),
  ADD UNIQUE KEY `Titre` (`Titre`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`Num_matricule`),
  ADD KEY `FK_Id_Marque` (`FK_Id_Marque`),
  ADD KEY `FK_Id_Client` (`FK_Id_Client`),
  ADD KEY `FK_Id_Type_Vehicule` (`FK_Id_Type_Vehicule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `Id_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `Id_Marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  MODIFY `Id_Mecanicien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
  MODIFY `Id_Operation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `piece`
--
ALTER TABLE `piece`
  MODIFY `Id_Piece` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `Id_Prestation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `Id_Rendez_vous` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `reparation`
--
ALTER TABLE `reparation`
  MODIFY `Id_Reparation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `type_vehicule`
--
ALTER TABLE `type_vehicule`
  MODIFY `Id_Type_Vehicule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `operation_reparation`
--
ALTER TABLE `operation_reparation`
  ADD CONSTRAINT `operation_reparation_ibfk_1` FOREIGN KEY (`FK_Id_Operation`) REFERENCES `operation` (`Id_Operation`),
  ADD CONSTRAINT `operation_reparation_ibfk_2` FOREIGN KEY (`FK_Id_Reparation`) REFERENCES `reparation` (`Id_Reparation`);

--
-- Contraintes pour la table `prestation_reparation`
--
ALTER TABLE `prestation_reparation`
  ADD CONSTRAINT `prestation_reparation_ibfk_1` FOREIGN KEY (`FK_Id_Reparation`) REFERENCES `reparation` (`Id_Reparation`),
  ADD CONSTRAINT `prestation_reparation_ibfk_2` FOREIGN KEY (`FK_Id_Prestation`) REFERENCES `prestation` (`Id_Prestation`);

--
-- Contraintes pour la table `remplacement`
--
ALTER TABLE `remplacement`
  ADD CONSTRAINT `remplacement_ibfk_1` FOREIGN KEY (`FK_Id_Reparation`) REFERENCES `reparation` (`Id_Reparation`),
  ADD CONSTRAINT `remplacement_ibfk_2` FOREIGN KEY (`FK_Id_Piece`) REFERENCES `piece` (`Id_Piece`);

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `rendez_vous_ibfk_1` FOREIGN KEY (`FK_Num_matricule`) REFERENCES `vehicule` (`Num_matricule`),
  ADD CONSTRAINT `rendez_vous_ibfk_2` FOREIGN KEY (`FK_Id_Client`) REFERENCES `client` (`Id_Client`);

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_1` FOREIGN KEY (`FK_Num_matricule`) REFERENCES `vehicule` (`Num_matricule`);

--
-- Contraintes pour la table `reparation_d_entretien`
--
ALTER TABLE `reparation_d_entretien`
  ADD CONSTRAINT `reparation_d_entretien_ibfk_1` FOREIGN KEY (`FK_Num_matricule`) REFERENCES `vehicule` (`Num_matricule`),
  ADD CONSTRAINT `reparation_d_entretien_ibfk_2` FOREIGN KEY (`FK_Id_Reparation`) REFERENCES `reparation` (`Id_Reparation`);

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `tache_ibfk_1` FOREIGN KEY (`FK_Id_Rendez_vous`) REFERENCES `rendez_vous` (`Id_Rendez_vous`),
  ADD CONSTRAINT `tache_ibfk_2` FOREIGN KEY (`FK_Id_Mecanicien`) REFERENCES `mecanicien` (`Id_Mecanicien`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `traitement_ibfk_1` FOREIGN KEY (`FK_Id_Reparation`) REFERENCES `reparation` (`Id_Reparation`),
  ADD CONSTRAINT `traitement_ibfk_2` FOREIGN KEY (`FK_Id_Mecanicien`) REFERENCES `mecanicien` (`Id_Mecanicien`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`FK_Id_Marque`) REFERENCES `marque` (`Id_Marque`),
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`FK_Id_Client`) REFERENCES `client` (`Id_Client`),
  ADD CONSTRAINT `vehicule_ibfk_3` FOREIGN KEY (`FK_Id_Type_Vehicule`) REFERENCES `type_vehicule` (`Id_Type_Vehicule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
