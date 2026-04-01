-- =============================================
-- CRÉATION DES TABLES
-- Fichier: 02_create_tables.sql
-- =============================================

USE tifosi;

-- Table client
CREATE TABLE client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom_client VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    cp_client INT NOT NULL
) ENGINE=InnoDB;

-- Table marque
CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

-- Table ingredient
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom_ingredient VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

-- Table focaccia
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom_focaccia VARCHAR(45) NOT NULL,
    prix_focaccia FLOAT NOT NULL
) ENGINE=InnoDB;

-- Table boisson
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(45) NOT NULL,
    id_marque INT NOT NULL
) ENGINE=InnoDB;

-- Table menu
CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom_menu VARCHAR(45) NOT NULL,
    prix_menu FLOAT NOT NULL
) ENGINE=InnoDB;

-- Table achete (client ↔ focaccia)
CREATE TABLE achete (
    id_client INT NOT NULL,
    id_focaccia INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_focaccia, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
) ENGINE=InnoDB;

-- Table paye (client ↔ menu)
CREATE TABLE paye (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    jour DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
) ENGINE=InnoDB;

-- Table comprend (focaccia ↔ ingredient)
CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
) ENGINE=InnoDB;

-- Table est_constitue (menu ↔ focaccia)
CREATE TABLE est_constitue (
    id_menu INT NOT NULL,
    id_focaccia INT NOT NULL,
    PRIMARY KEY (id_menu, id_focaccia),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
) ENGINE=InnoDB;

-- Table contient (menu ↔ boisson)
CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
) ENGINE=InnoDB;

-- Clé étrangère boisson → marque
ALTER TABLE boisson
ADD CONSTRAINT fk_boisson_marque 
FOREIGN KEY (id_marque) REFERENCES marque(id_marque);
