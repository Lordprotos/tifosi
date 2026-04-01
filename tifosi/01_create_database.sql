-- =============================================
-- CRÉATION DE LA BASE DE DONNÉES ET UTILISATEUR
-- Fichier: 01_create_database.sql
-- =============================================

-- Créer la base de données
CREATE DATABASE IF NOT EXISTS tifosi 
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Créer l'utilisateur tifosi avec mot de passe
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123';

-- Donner tous les droits à l'utilisateur sur la base tifosi
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

-- Appliquer les privilèges
FLUSH PRIVILEGES;
