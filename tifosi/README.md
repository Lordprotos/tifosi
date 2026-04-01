# 🍕 Base de données Tifosi

Restaurant de Street-Food italien - Gestion des focaccias, boissons et menus.

## 📋 Prérequis

- MySQL / MariaDB
- phpMyAdmin (optionnel)

## 🚀 Installation

### Méthode 1 : Scripts séparés

Exécutez les scripts dans l'ordre suivant :

```sql
-- 1. Créer la base et l'utilisateur
source 01_create_database.sql

-- 2. Créer les tables
source 02_create_tables.sql

-- 3. Insérer les données de test
source 03_insert_data.sql
```

### Méthode 2 : Restaurer le backup complet

```sql
source backup_tifosi.sql
```

## 👤 Connexion

| Paramètre | Valeur |
|-----------|--------|
| Utilisateur | tifosi |
| Mot de passe | tifosi123 |
| Base de données | tifosi |

## 📊 Structure de la base

### Tables principales (6)

| Table | Description |
|-------|-------------|
| client | Clients du restaurant |
| focaccia | Les différentes focaccias |
| ingredient | Les ingrédients disponibles |
| menu | Les menus proposés |
| boisson | Les boissons disponibles |
| marque | Les marques de boissons |

### Tables de liaison (5)

| Table | Relation |
|-------|----------|
| achete | client ↔ focaccia |
| paye | client ↔ menu |
| comprend | focaccia ↔ ingredient |
| est_constitue | menu ↔ focaccia |
| contient | menu ↔ boisson |

## 📁 Fichiers du projet

| Fichier | Description |
|---------|-------------|
| `01_create_database.sql` | Création de la base et de l'utilisateur |
| `02_create_tables.sql` | Création des tables et relations |
| `03_insert_data.sql` | Insertion des données de test |
| `backup_tifosi.sql` | Backup complet (structure + données) |