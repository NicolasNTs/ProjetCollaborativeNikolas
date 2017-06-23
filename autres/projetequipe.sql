DROP DATABASE IF EXISTS projetequipe;

CREATE DATABASE IF NOT EXISTS projetequipe;
USE projetequipe;
# -----------------------------------------------------------------------------
#       TABLE : MEMBRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEMBRE
 (
   ID_MEMBRE INTEGER(2) NOT NULL  ,
   NOM VARCHAR(128) NULL  ,
   PRENOM VARCHAR(128) NULL  ,
   TEL INTEGER(2) NULL  ,
   EMAIL VARCHAR(128) NULL  ,
   MOT_DE_PASSE VARCHAR(128) NULL  
   , PRIMARY KEY (ID_MEMBRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FORMATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATEUR
 (
   ID_MEMBRE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_MEMBRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETUDIANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETUDIANT
 (
   ID_MEMBRE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_MEMBRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EQUIPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EQUIPE
 (
   ID_EQUIPE INTEGER(2) NOT NULL  ,
   ID_PROJET CHAR(32) NOT NULL  ,
   ID_MEMBRE INTEGER(2) NOT NULL  ,
   DATE_CREATION DATE NULL  ,
   COMMENTAIRE VARCHAR(128) NULL  
   , PRIMARY KEY (ID_EQUIPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EQUIPE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EQUIPE_PROJET
     ON EQUIPE (ID_PROJET ASC);

CREATE  INDEX I_FK_EQUIPE_ETUDIANT
     ON EQUIPE (ID_MEMBRE ASC);

# -----------------------------------------------------------------------------
#       TABLE : SESSION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SESSION
 (
   ID_SESSION INTEGER(2) NOT NULL  ,
   LIBELLE VARCHAR(128) NULL  
   , PRIMARY KEY (ID_SESSION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PROJET
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROJET
 (
   ID_PROJET CHAR(32) NOT NULL  ,
   ID_SESSION INTEGER(2) NOT NULL  ,
   ID_MEMBRE INTEGER(2) NOT NULL  ,
   TITRE CHAR(32) NULL  ,
   DATE_CREATION CHAR(32) NULL  ,
   SUJET CHAR(32) NULL  ,
   DATE_RENDU CHAR(32) NULL  
   , PRIMARY KEY (ID_PROJET) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PROJET
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PROJET_FORMATEUR
     ON PROJET (ID_MEMBRE ASC);

CREATE  INDEX I_FK_PROJET_SESSION
     ON PROJET (ID_SESSION ASC);

# -----------------------------------------------------------------------------
#       TABLE : MEMBRE_SESSION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEMBRE_SESSION
 (
   ID_SESSION INTEGER(2) NOT NULL  ,
   ID_MEMBRE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_SESSION,ID_MEMBRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEMBRE_SESSION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEMBRE_SESSION_SESSION
     ON MEMBRE_SESSION (ID_SESSION ASC);

CREATE  INDEX I_FK_MEMBRE_SESSION_ETUDIANT
     ON MEMBRE_SESSION (ID_MEMBRE ASC);

# -----------------------------------------------------------------------------
#       TABLE : MEMBRE_EQUIPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEMBRE_EQUIPE
 (
   ID_EQUIPE INTEGER(2) NOT NULL  ,
   ID_MEMBRE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_EQUIPE,ID_MEMBRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEMBRE_EQUIPE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEMBRE_EQUIPE_EQUIPE
     ON MEMBRE_EQUIPE (ID_EQUIPE ASC);

CREATE  INDEX I_FK_MEMBRE_EQUIPE_ETUDIANT
     ON MEMBRE_EQUIPE (ID_MEMBRE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE FORMATEUR 
  ADD FOREIGN KEY FK_FORMATEUR_MEMBRE (ID_MEMBRE)
      REFERENCES MEMBRE (ID_MEMBRE) ;


ALTER TABLE ETUDIANT 
  ADD FOREIGN KEY FK_ETUDIANT_MEMBRE (ID_MEMBRE)
      REFERENCES MEMBRE (ID_MEMBRE) ;


ALTER TABLE EQUIPE 
  ADD FOREIGN KEY FK_EQUIPE_PROJET (ID_PROJET)
      REFERENCES PROJET (ID_PROJET) ;


ALTER TABLE EQUIPE 
  ADD FOREIGN KEY FK_EQUIPE_ETUDIANT (ID_MEMBRE)
      REFERENCES ETUDIANT (ID_MEMBRE) ;


ALTER TABLE PROJET 
  ADD FOREIGN KEY FK_PROJET_FORMATEUR (ID_MEMBRE)
      REFERENCES FORMATEUR (ID_MEMBRE) ;


ALTER TABLE PROJET 
  ADD FOREIGN KEY FK_PROJET_SESSION (ID_SESSION)
      REFERENCES SESSION (ID_SESSION) ;


ALTER TABLE MEMBRE_SESSION 
  ADD FOREIGN KEY FK_MEMBRE_SESSION_SESSION (ID_SESSION)
      REFERENCES SESSION (ID_SESSION) ;


ALTER TABLE MEMBRE_SESSION 
  ADD FOREIGN KEY FK_MEMBRE_SESSION_ETUDIANT (ID_MEMBRE)
      REFERENCES ETUDIANT (ID_MEMBRE) ;


ALTER TABLE MEMBRE_EQUIPE 
  ADD FOREIGN KEY FK_MEMBRE_EQUIPE_EQUIPE (ID_EQUIPE)
      REFERENCES EQUIPE (ID_EQUIPE) ;


ALTER TABLE MEMBRE_EQUIPE 
  ADD FOREIGN KEY FK_MEMBRE_EQUIPE_ETUDIANT (ID_MEMBRE)
      REFERENCES ETUDIANT (ID_MEMBRE) ;

