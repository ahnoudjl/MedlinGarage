-- SCRIPT CREATION BASE DE DONNEES ET INSERTION DES TABLE
/**
* Ici l'ensemble des requetes necessaire 
* pour crehebergementer les table de base de donnee
* Gestion du garage, il suffit d'executer 
* le script pour creer toute les tables.
*
*/
-- ================ Creation DataBase ================
CREATE SCHEMA `medlin` DEFAULT CHARACTER SET utf8 ;

-- ============================================================
USE medlin;
-- ================= CREER TABLE Client ===================
CREATE TABLE Client(
   Id_Client INT AUTO_INCREMENT,
   Nom VARCHAR(20) NOT NULL,
   Prenom VARCHAR(20) NOT NULL,
   Adresse VARCHAR(65),
   Tele VARCHAR(20) NOT NULL,
   Email VARCHAR(30) NOT NULL,
   PRIMARY KEY(Id_Client),
   UNIQUE(Tele),
   UNIQUE(Email)
);
-- ============================================================

-- ================= CREER TABLE Type_Vehicule ===================
CREATE TABLE Type_Vehicule(
   Id_Type_Vehicule INT AUTO_INCREMENT,
   Titre VARCHAR(25) NOT NULL,
   PRIMARY KEY(Id_Type_Vehicule),
   UNIQUE(Titre)
);
-- ============================================================

-- ================= CREER TABLE Operation ===================
CREATE TABLE Operation(
   Id_Operation INT AUTO_INCREMENT,
   Titre VARCHAR(20) NOT NULL,
   Prix DECIMAL(10,2),
   TVA DECIMAL(6,2),
   PRIMARY KEY(Id_Operation),
   UNIQUE(Titre)
);
-- ============================================================

-- ================= CREER TABLE Piece ===================
CREATE TABLE Piece(
   Id_Piece INT AUTO_INCREMENT,
   Titre VARCHAR(25) NOT NULL,
   Prix DECIMAL(10,2),
   TVA DECIMAL(6,2),
   PRIMARY KEY(Id_Piece),
   UNIQUE(Titre)
);
-- ============================================================

-- ================= CREER TABLE Marque ===================
CREATE TABLE Marque(
   Id_Marque INT AUTO_INCREMENT,
   Titre VARCHAR(25) NOT NULL,
   PRIMARY KEY(Id_Marque),
   UNIQUE(Titre)
);
-- ============================================================

-- ================= CREER TABLE Mecanicien ===================
CREATE TABLE Mecanicien(
   Id_Mecanicien INT AUTO_INCREMENT,
   Nom VARCHAR(20) NOT NULL,
   Prenom VARCHAR(20) NOT NULL,
   Adresse VARCHAR(65),
   Tele VARCHAR(20) NOT NULL,
   Email VARCHAR(30) NOT NULL,
   Prix_heure DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(Id_Mecanicien),
   UNIQUE(Tele),
   UNIQUE(Email)
);
-- ============================================================

-- ================= CREER TABLE Prestation ===================
CREATE TABLE Prestation(
   Id_Prestation INT AUTO_INCREMENT,
   Titre VARCHAR(25) NOT NULL,
   Prix DECIMAL(10,2),
   TVA DECIMAL(10,2),
   PRIMARY KEY(Id_Prestation),
   UNIQUE(Titre)
);
-- ============================================================

-- ================= CREER TABLE Vehicule ===================
CREATE TABLE Vehicule(
   Num_matricule VARCHAR(9),
   Date_circulation DATE,
   FK_Id_Marque INT NOT NULL,
   FK_Id_Client INT NOT NULL,
   FK_Id_Type_Vehicule INT NOT NULL,
   PRIMARY KEY(Num_matricule),
   FOREIGN KEY(FK_Id_Marque) REFERENCES Marque(Id_Marque),
   FOREIGN KEY(FK_Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(FK_Id_Type_Vehicule) REFERENCES Type_Vehicule(Id_Type_Vehicule)
);
-- ============================================================

-- ================= CREER TABLE Rendez_vous ===================
CREATE TABLE Rendez_vous(
   Id_Rendez_vous INT AUTO_INCREMENT,
   Date_rendez_vous DATETIME,
   FK_Num_matricule VARCHAR(9) NOT NULL,
   FK_Id_Client INT NOT NULL,
   PRIMARY KEY(Id_Rendez_vous),
   FOREIGN KEY(FK_Num_matricule) REFERENCES Vehicule(Num_matricule),
   FOREIGN KEY(FK_Id_Client) REFERENCES Client(Id_Client)
);
-- ============================================================

-- ================= CREER TABLE Reparation ===================
CREATE TABLE Reparation(
   Id_Reparation INT AUTO_INCREMENT,
   Date_reparation DATETIME,
   Kilometrage INT,
   Nbr_heure SMALLINT,
   FK_Num_matricule VARCHAR(9) NOT NULL,
   PRIMARY KEY(Id_Reparation),
   FOREIGN KEY(FK_Num_matricule) REFERENCES Vehicule(Num_matricule)
);
-- ============================================================

-- ================= CREER TABLE Traitement ===================
CREATE TABLE Traitement(
   FK_Id_Reparation INT,
   FK_Id_Mecanicien INT,
   PRIMARY KEY(FK_Id_Reparation, FK_Id_Mecanicien),
   FOREIGN KEY(FK_Id_Reparation) REFERENCES Reparation(Id_Reparation),
   FOREIGN KEY(FK_Id_Mecanicien) REFERENCES Mecanicien(Id_Mecanicien)
);
-- ============================================================

-- ================= CREER TABLE operation_reparation ===================
CREATE TABLE operation_reparation(
   FK_Id_Operation INT,
   FK_Id_Reparation INT,
   PRIMARY KEY(FK_Id_Operation, FK_Id_Reparation),
   FOREIGN KEY(FK_Id_Operation) REFERENCES Operation(Id_Operation),
   FOREIGN KEY(FK_Id_Reparation) REFERENCES Reparation(Id_Reparation)
);
-- ============================================================

-- ================= CREER TABLE Remplacement ===================
CREATE TABLE Remplacement(
   FK_Id_Reparation INT,
   FK_Id_Piece INT,
   PRIMARY KEY(FK_Id_Reparation, FK_Id_Piece),
   FOREIGN KEY(FK_Id_Reparation) REFERENCES Reparation(Id_Reparation),
   FOREIGN KEY(FK_Id_Piece) REFERENCES Piece(Id_Piece)
);
-- ============================================================

-- ================= CREER TABLE prestation_reparation ===================
CREATE TABLE prestation_reparation(
   FK_Id_Reparation INT,
   FK_Id_Prestation INT,
   PRIMARY KEY(FK_Id_Reparation, FK_Id_Prestation),
   FOREIGN KEY(FK_Id_Reparation) REFERENCES Reparation(Id_Reparation),
   FOREIGN KEY(FK_Id_Prestation) REFERENCES Prestation(Id_Prestation)
);
-- ============================================================

-- ================= CREER TABLE reparation_d_entretien ===================
CREATE TABLE reparation_d_entretien(
   FK_Num_matricule VARCHAR(9),
   FK_Id_Reparation INT,
   taux_kilometrage DECIMAL(15,2),
   nbr_annee INT,
   PRIMARY KEY(FK_Num_matricule, FK_Id_Reparation),
   FOREIGN KEY(FK_Num_matricule) REFERENCES Vehicule(Num_matricule),
   FOREIGN KEY(FK_Id_Reparation) REFERENCES Reparation(Id_Reparation)
);
-- ============================================================

-- ================= CREER TABLE Tache ===================
CREATE TABLE Tache(
   FK_Id_Rendez_vous INT,
   FK_Id_Mecanicien INT,
   PRIMARY KEY(FK_Id_Rendez_vous, FK_Id_Mecanicien),
   FOREIGN KEY(FK_Id_Rendez_vous) REFERENCES Rendez_vous(Id_Rendez_vous),
   FOREIGN KEY(FK_Id_Mecanicien) REFERENCES Mecanicien(Id_Mecanicien)
);
-- ============================================================
-- ============================================================
