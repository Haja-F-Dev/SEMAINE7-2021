/** Creation de la database **/
CREATE DATABASE gesauto;
USE gesauto;

/** 1 - Table reparation **/
CREATE TABLE reparation
(
    rep_id INT AUTO_INCREMENT PRIMARY KEY,
    rep_lib VARCHAR (200) NOT NULL
);

/** 2 - Table entretien **/
CREATE TABLE entretien
(
    ent_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ent_lib VARCHAR (200) NOT NULL
);

/** 3 - Table vente **/
CREATE TABLE vente_pose
(
    ven_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ven_acc TINYINT CHECK (ven_acc BETWEEN 0 AND 1),
    ven_option TINYINT CHECK (ven_option BETWEEN 0 AND 1),
    pose_option TINYINT CHECK (pose_option BETWEEN 0 AND 1)
);

/** 4 - Table type_de_vente **/
CREATE TABLE type_de_vente
(
    typ_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    typ_lib VARCHAR (100) NOT NULL
);

/** 5 - Creation de la table vehicules **/
CREATE TABLE vehicule
(
    veh_id  INT AUTO_INCREMENT PRIMARY KEY,
    veh_lib VARCHAR(100) NOT NULL,
    veh_est_part TINYINT CHECK (veh_est_part BETWEEN 0 AND 1),
    veh_est_neuf TINYINT CHECK (veh_est_part BETWEEN 0 AND 1),
    rep_id INT,
    ent_id INT,
    typ_id INT,
    ven_id INT,

    FOREIGN KEY rep_id REFERENCES reparation(rep_id),
    FOREIGN KEY ent_id REFERENCES entretien(ent_id),
    FOREIGN KEY typ_id REFERENCES type_de_vente(typ_id),
    FOREIGN KEY ven_id REFERENCES vente_pose(ven_id)
);



/** 6 - Table commerciaux **/
CREATE TABLE commerciaux
(
    com_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    com_nam VARCHAR (50) NOT NULL,
    com_firstname VARCHAR (50) NOT NULL
)

/** 7 - Table particulier **/
CREATE TABLE particulier
(
    par_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    par_nam VARCHAR (50) NOT NULL,
    par_firstanme VARCHAR (50) NOT NULL,
    com_id INT NOT NULL,
    CONSTRAINT FK_com_id FOREIGN KEY (com_id)

)

/** 8 - Table professionnels **/
CREATE TABLE professionnel
(
    pro_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pro_nam VARCHAR (50) NOT NULL,
    com_id INT NOT NULL,
    CONSTRAINT FK_com_id FOREIGN KEY (com_id)
)