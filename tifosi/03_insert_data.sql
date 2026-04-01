-- =============================================
-- INSERTION DES DONNÉES DE TEST
-- Fichier: 03_insert_data.sql
-- =============================================

USE tifosi;

-- 1. MARQUES
INSERT INTO marque (nom_marque) VALUES
('Coca-Cola'),
('Pepsi'),
('San Pellegrino'),
('Orangina'),
('Perrier');

-- 2. INGREDIENTS
INSERT INTO ingredient (nom_ingredient) VALUES
('Base tomate'),
('Mozarella'),
('Cresson'),
('Jambon fumé'),
('Ail'),
('Artichaut'),
('Champignon'),
('Parmesan'),
('Poivre'),
('Olive noire'),
('Gorgonzola'),
('Raclette'),
('Base crème'),
('Emmental'),
('Oignon'),
('Jambon cuit'),
('Olive verte'),
('Bacon'),
('Ananas'),
('Piment');

-- 3. FOCACCIAS
INSERT INTO focaccia (nom_focaccia, prix_focaccia) VALUES
('Mozaccia', 9.80),
('Gorgonzollaccia', 10.80),
('Raclaccia', 8.90),
('Emmentalaccia', 9.80),
('Tradizione', 8.90),
('Hawaïenne', 11.20),
('Américaine', 10.80),
('Paysanne', 12.80);

-- 4. BOISSONS
INSERT INTO boisson (nom_boisson, id_marque) VALUES
('Coca-Cola Classic', 1),
('Coca-Cola Zero', 1),
('Pepsi Max', 2),
('Limonata', 3),
('Aranciata', 3),
('Orangina Original', 4),
('Perrier Nature', 5),
('Perrier Citron', 5);

-- 5. MENUS
INSERT INTO menu (nom_menu, prix_menu) VALUES
('Menu Classico', 14.90),
('Menu Famiglia', 24.90),
('Menu Bambino', 9.90),
('Menu Gourmet', 18.50),
('Menu Végétarien', 13.90);

-- 6. CLIENTS
INSERT INTO client (nom_client, age, cp_client) VALUES
('Jean Dupont', 35, 75001),
('Marie Martin', 28, 69002),
('Pierre Durand', 42, 13001),
('Sophie Bernard', 31, 31000),
('Lucas Petit', 25, 33000),
('Emma Leroy', 38, 59000),
('Hugo Moreau', 29, 44000),
('Léa Simon', 45, 67000);

-- 7. COMPREND (focaccia ↔ ingredient)
INSERT INTO comprend (id_focaccia, id_ingredient) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
(2, 1), (2, 11), (2, 3), (2, 5), (2, 7), (2, 8), (2, 9),
(3, 1), (3, 12), (3, 3), (3, 5), (3, 7), (3, 8), (3, 9),
(4, 13), (4, 14), (4, 3), (4, 7), (4, 8), (4, 9), (4, 15),
(5, 1), (5, 2), (5, 3), (5, 16), (5, 7), (5, 8), (5, 9), (5, 10), (5, 17),
(6, 1), (6, 2), (6, 3), (6, 18), (6, 19), (6, 20), (6, 8), (6, 9), (6, 10),
(7, 1), (7, 2), (7, 3), (7, 18), (7, 8), (7, 9), (7, 10),
(8, 13), (8, 3), (8, 4), (8, 5), (8, 6), (8, 7), (8, 8), (8, 9), (8, 10);

-- 8. EST_CONSTITUE (menu ↔ focaccia)
INSERT INTO est_constitue (id_menu, id_focaccia) VALUES
(1, 1), (1, 5),
(2, 1), (2, 3), (2, 6),
(3, 5),
(4, 2), (4, 8),
(5, 4);

-- 9. CONTIENT (menu ↔ boisson)
INSERT INTO contient (id_menu, id_boisson) VALUES
(1, 1),
(2, 1), (2, 4),
(3, 6),
(4, 7),
(5, 4);

-- 10. ACHETE (client achète focaccia)
INSERT INTO achete (id_client, id_focaccia, jour) VALUES
(1, 1, '2026-03-20'),
(1, 3, '2026-03-22'),
(2, 2, '2026-03-21'),
(3, 5, '2026-03-19'),
(4, 6, '2026-03-25'),
(5, 7, '2026-03-24'),
(6, 1, '2026-03-23'),
(7, 8, '2026-03-22'),
(8, 4, '2026-03-21');

-- 11. PAYE (client paye menu)
INSERT INTO paye (id_client, id_menu, jour) VALUES
(1, 1, '2026-03-20'),
(2, 2, '2026-03-21'),
(3, 3, '2026-03-19'),
(4, 4, '2026-03-25'),
(5, 1, '2026-03-24'),
(6, 5, '2026-03-23'),
(7, 2, '2026-03-22'),
(8, 4, '2026-03-21');
