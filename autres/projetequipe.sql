-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 24 Juin 2017 à 01:15
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetequipe`
--

DELIMITER $$

DROP SCHEMA IF EXISTS projetequipe $$
CREATE SCHEMA IF NOT EXISTS projetequipe DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci $$
USE projetequipe $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `projet_reset` ()  BEGIN
	-- Lever temporairement les contraintes d'intégrité
	SET FOREIGN_KEY_CHECKS=0;

  -- Vider les tables en remettant les auto-incréments à 1
  TRUNCATE TABLE membre_equipe;
  TRUNCATE TABLE equipe;
  TRUNCATE TABLE membre_session;
  TRUNCATE TABLE projet;
  TRUNCATE TABLE etudiant;
  TRUNCATE TABLE formateur;
  TRUNCATE TABLE session;
  TRUNCATE TABLE membre;

	-- Remettre les contraintes d'integrite
	SET FOREIGN_KEY_CHECKS=1;

  -- Insérer, dans un bloc capturant d'éventuelles exceptions
	BEGIN
    -- Indiquer que faire si une contrainte d'intégrité est violée
	  DECLARE EXIT HANDLER FOR SQLSTATE '23000'
	  BEGIN
      -- Annuler tout
      ROLLBACK;
      -- Afficher l'erreur
      SHOW ERRORS;
	  END;

    -- Démarrer la transaction et faire les insertions
		START TRANSACTION;
    INSERT INTO membre (ID_MEMBRE, NOM, PRENOM, TEL, EMAIL, MOT_DE_PASSE, TOKEN, DATE_INSCRIPTION, EST_CONFIRME) VALUES
(1, 'FC Barcelone1', 'Barcelone1', '0101012525', 'email1@mail.com', 'MDP1','token1', '2017-02-07 00:00:00', NULL),
(2, 'FC Barcelone2', 'Barcelone2', '0201012525', 'email2@mail.com', 'MDP2','token2', '2017-03-07 00:00:00',  NULL),
(3, 'FC Barcelone3', 'Barcelone3', '0301012525', 'email3@mail.com', 'MDP3','token3', '2017-04-07 00:00:00',  NULL),
(4, 'FC Barcelone4', 'Barcelone4', '0401012525', 'email4@mail.com', 'MDP4','token4', '2017-05-07 00:00:00',  NULL),
(5, 'FC Barcelone5', 'Barcelone5', '0501012525', 'email5@mail.com', 'MDP5','token5', '2017-06-07 00:00:00',  NULL),
(6, 'FC Barcelone6', 'Barcelone6', '0601012525', 'email6@mail.com', 'MDP6','token6', '2017-07-07 00:00:00',  NULL),
(7, 'FC Barcelone7', 'Barcelone7', '0701012525', 'email7@mail.com', 'MDP7','token7', '2017-08-07 00:00:00',  NULL),
(8, 'FC Barcelone8', 'Barcelone8', '0801012525', 'email8@mail.com', 'MDP8','token8', '2017-09-07 00:00:00',  NULL),
(9, 'FC Barcelone9', 'Barcelone9', '0901012525', 'email9@mail.com', 'MDP9','token9', '2017-10-07 00:00:00',  NULL),
(10, 'FC Barcelone10', 'Barcelone10', '0101012525', 'email10@mail.com', 'MDP10','token10', '2017-11-07 00:00:00',  NULL),
(11, 'FC Barcelone11', 'Barcelone11', '0111012525', 'email11@mail.com', 'MDP11','token11', '2017-12-07 00:00:00',  NULL);

    INSERT INTO session (ID_SESSION, LIBELLE) VALUES
(1, 'session1'),
(2, 'session2');

    INSERT INTO formateur (ID_MEMBRE) VALUES
(1),
(2),
(3);
    INSERT INTO etudiant (ID_MEMBRE) VALUES
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11) ;   

	INSERT INTO projet (ID_PROJET, ID_SESSION, ID_MEMBRE, TITRE, DATE_CREATION, SUJET, DATE_RENDU) VALUES
(1, 1, 1, 'projet1', '2017-06-07 00:00:00', 'sujet1', '2017-12-07 00:00:00'),
(2, 2, 1, 'projet2', '2017-09-07 00:00:00', 'sujet1', '2018-03-07 00:00:00'),
(3, 2, 1, 'projet3', '2017-011-07 00:00:00', 'sujet1', '2018-09-07 00:00:00');

	INSERT INTO membre_session (ID_SESSION, ID_MEMBRE) VALUES
(1, 4),
(1, 5),
(2, 6),
(1, 7),
(2, 8),
(2, 9),
(1, 10),
(2, 11);

	INSERT INTO equipe (ID_EQUIPE, ID_PROJET, ID_MEMBRE, DATE_CREATION, COMMENTAIRE) VALUES
(1, 2, 11, '2018-03-07 00:00:00', 'COMMENTAIRE2'),
(2, 2, 4, '2018-03-07 00:00:00', 'COMMENTAIRE2'),
(3, 3, 5, '2018-03-07 00:00:00', 'COMMENTAIRE3'),
(4, 2, 6, '2018-04-07 00:00:00', 'COMMENTAIRE4'),
(5, 1, 7, '2018-05-07 00:00:00', 'COMMENTAIRE5'),
(6, 3, 8, '2018-06-07 00:00:00', 'COMMENTAIRE6'),
(7, 2, 9, '2018-08-07 00:00:00', 'COMMENTAIRE7'),
(8, 1, 10, '2018-07-07 00:00:00', 'COMMENTAIRE8');

	INSERT INTO membre_equipe (ID_EQUIPE, ID_MEMBRE) VALUES
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 11),
(1, 10);

    -- Valider les insertions
    COMMIT;
  END;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `ID_EQUIPE` int(2) NOT NULL,
  `ID_PROJET` char(32) NOT NULL,
  `ID_MEMBRE` int(2) NOT NULL,
  `DATE_CREATION` date DEFAULT NULL,
  `COMMENTAIRE` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`ID_EQUIPE`, `ID_PROJET`, `ID_MEMBRE`, `DATE_CREATION`, `COMMENTAIRE`) VALUES
(1, '2', 11, '2018-03-07', 'COMMENTAIRE2'),
(2, '2', 4, '2018-03-07', 'COMMENTAIRE2'),
(3, '3', 5, '2018-03-07', 'COMMENTAIRE3'),
(4, '2', 6, '2018-04-07', 'COMMENTAIRE4'),
(5, '1', 7, '2018-05-07', 'COMMENTAIRE5'),
(6, '3', 8, '2018-06-07', 'COMMENTAIRE6'),
(7, '2', 9, '2018-08-07', 'COMMENTAIRE7'),
(8, '1', 10, '2018-07-07', 'COMMENTAIRE8');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `ID_MEMBRE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`ID_MEMBRE`) VALUES
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11);

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE `formateur` (
  `ID_MEMBRE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `formateur`
--

INSERT INTO `formateur` (`ID_MEMBRE`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `ID_MEMBRE` int(2) NOT NULL,
  `NOM` varchar(128) DEFAULT NULL,
  `PRENOM` varchar(128) DEFAULT NULL,
  `TEL` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `MOT_DE_PASSE` varchar(128) DEFAULT NULL,
  `TOKEN` varchar(250) DEFAULT NULL,
  `DATE_INSCRIPTION` datetime DEFAULT NULL,
  `EST_CONFIRME` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`ID_MEMBRE`, `NOM`, `PRENOM`, `TEL`, `EMAIL`, `MOT_DE_PASSE`, `TOKEN`, `DATE_INSCRIPTION`, `EST_CONFIRME`) VALUES
(1, 'FC Barcelone1', 'Barcelone1', '0101012525', 'email1@mail.com', 'MDP1', 'token1', '2017-02-07 00:00:00', NULL),
(2, 'FC Barcelone2', 'Barcelone2', '0201012525', 'email2@mail.com', 'MDP2', 'token2', '2017-03-07 00:00:00', NULL),
(3, 'FC Barcelone3', 'Barcelone3', '0301012525', 'email3@mail.com', 'MDP3', 'token3', '2017-04-07 00:00:00', NULL),
(4, 'FC Barcelone4', 'Barcelone4', '0401012525', 'email4@mail.com', 'MDP4', 'token4', '2017-05-07 00:00:00', NULL),
(5, 'FC Barcelone5', 'Barcelone5', '0501012525', 'email5@mail.com', 'MDP5', 'token5', '2017-06-07 00:00:00', NULL),
(6, 'FC Barcelone6', 'Barcelone6', '0601012525', 'email6@mail.com', 'MDP6', 'token6', '2017-07-07 00:00:00', NULL),
(7, 'FC Barcelone7', 'Barcelone7', '0701012525', 'email7@mail.com', 'MDP7', 'token7', '2017-08-07 00:00:00', NULL),
(8, 'FC Barcelone8', 'Barcelone8', '0801012525', 'email8@mail.com', 'MDP8', 'token8', '2017-09-07 00:00:00', NULL),
(9, 'FC Barcelone9', 'Barcelone9', '0901012525', 'email9@mail.com', 'MDP9', 'token9', '2017-10-07 00:00:00', NULL),
(10, 'FC Barcelone10', 'Barcelone10', '0101012525', 'email10@mail.com', 'MDP10', 'token10', '2017-11-07 00:00:00', NULL),
(11, 'FC Barcelone11', 'Barcelone11', '0111012525', 'email11@mail.com', 'MDP11', 'token11', '2017-12-07 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `membre_equipe`
--

CREATE TABLE `membre_equipe` (
  `ID_EQUIPE` int(2) NOT NULL,
  `ID_MEMBRE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `membre_equipe`
--

INSERT INTO `membre_equipe` (`ID_EQUIPE`, `ID_MEMBRE`) VALUES
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(1, 10),
(8, 11);

-- --------------------------------------------------------

--
-- Structure de la table `membre_session`
--

CREATE TABLE `membre_session` (
  `ID_SESSION` int(2) NOT NULL,
  `ID_MEMBRE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `membre_session`
--

INSERT INTO `membre_session` (`ID_SESSION`, `ID_MEMBRE`) VALUES
(1, 4),
(1, 5),
(1, 7),
(1, 10),
(2, 6),
(2, 8),
(2, 9),
(2, 11);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `ID_PROJET` char(32) NOT NULL,
  `ID_SESSION` int(2) NOT NULL,
  `ID_MEMBRE` int(2) NOT NULL,
  `TITRE` char(32) DEFAULT NULL,
  `DATE_CREATION` datetime DEFAULT NULL,
  `SUJET` char(32) DEFAULT NULL,
  `DATE_RENDU` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`ID_PROJET`, `ID_SESSION`, `ID_MEMBRE`, `TITRE`, `DATE_CREATION`, `SUJET`, `DATE_RENDU`) VALUES
('1', 1, 1, 'projet1', '2017-06-07 00:00:00', 'sujet1', '2017-12-07 00:00:00'),
('2', 2, 1, 'projet2', '2017-09-07 00:00:00', 'sujet1', '2018-03-07 00:00:00'),
('3', 2, 1, 'projet3', '2017-11-07 00:00:00', 'sujet1', '2018-09-07 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `ID_SESSION` int(2) NOT NULL,
  `LIBELLE` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `session`
--

INSERT INTO `session` (`ID_SESSION`, `LIBELLE`) VALUES
(1, 'session1'),
(2, 'session2');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`ID_EQUIPE`),
  ADD KEY `I_FK_EQUIPE_PROJET` (`ID_PROJET`),
  ADD KEY `I_FK_EQUIPE_ETUDIANT` (`ID_MEMBRE`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`ID_MEMBRE`);

--
-- Index pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD PRIMARY KEY (`ID_MEMBRE`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`ID_MEMBRE`);

--
-- Index pour la table `membre_equipe`
--
ALTER TABLE `membre_equipe`
  ADD PRIMARY KEY (`ID_EQUIPE`,`ID_MEMBRE`),
  ADD KEY `FK_MEMBRE_EQUIPE_ETUDIANT` (`ID_MEMBRE`);

--
-- Index pour la table `membre_session`
--
ALTER TABLE `membre_session`
  ADD PRIMARY KEY (`ID_SESSION`,`ID_MEMBRE`),
  ADD KEY `I_FK_MEMBRE_SESSION_SESSION` (`ID_SESSION`),
  ADD KEY `I_FK_MEMBRE_SESSION_ETUDIANT` (`ID_MEMBRE`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`ID_PROJET`),
  ADD KEY `I_FK_PROJET_FORMATEUR` (`ID_MEMBRE`),
  ADD KEY `I_FK_PROJET_SESSION` (`ID_SESSION`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID_SESSION`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`ID_PROJET`) REFERENCES `projet` (`ID_PROJET`),
  ADD CONSTRAINT `equipe_ibfk_2` FOREIGN KEY (`ID_MEMBRE`) REFERENCES `etudiant` (`ID_MEMBRE`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`ID_MEMBRE`) REFERENCES `membre` (`ID_MEMBRE`);

--
-- Contraintes pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD CONSTRAINT `formateur_ibfk_1` FOREIGN KEY (`ID_MEMBRE`) REFERENCES `membre` (`ID_MEMBRE`);

--
-- Contraintes pour la table `membre_equipe`
--
ALTER TABLE `membre_equipe`
  ADD CONSTRAINT `membre_equipe_ibfk_1` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `equipe` (`ID_EQUIPE`),
  ADD CONSTRAINT `membre_equipe_ibfk_2` FOREIGN KEY (`ID_MEMBRE`) REFERENCES `etudiant` (`ID_MEMBRE`);

--
-- Contraintes pour la table `membre_session`
--
ALTER TABLE `membre_session`
  ADD CONSTRAINT `membre_session_ibfk_1` FOREIGN KEY (`ID_SESSION`) REFERENCES `session` (`ID_SESSION`),
  ADD CONSTRAINT `membre_session_ibfk_2` FOREIGN KEY (`ID_MEMBRE`) REFERENCES `etudiant` (`ID_MEMBRE`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`ID_MEMBRE`) REFERENCES `formateur` (`ID_MEMBRE`),
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`ID_SESSION`) REFERENCES `session` (`ID_SESSION`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
