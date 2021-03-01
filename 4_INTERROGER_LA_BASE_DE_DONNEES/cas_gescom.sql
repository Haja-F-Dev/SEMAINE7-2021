-- Cas Gescom : les requêtes --

-- Q1. Afficher dans l'ordre alphabétique et sur une seule colonne les noms et prénoms des employés qui ont des enfants, présenter d'abord ceux qui en ont le plus. --
SELECT CONCAT(emp_lastname, ' ', emp_firstname), emp_children 
FROM employees
ORDER BY emp_children DESC

-- Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence. --
SELECT `cus_lastname`, `cus_firstname`, `cus_countries_id`
FROM `customers` 
WHERE `cus_countries_id` NOT LIKE '%FR%' 
ORDER BY `cus_countries_id` ASC

-- Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays. --
SELECT `cus_city`, `cus_countries_id`,  `cus_firstname`, `cus_countries_id`
FROM customers
ORDER BY `cus_city` ASC

-- Q4. Afficher le nom des clients dont les fiches ont été modifiées --
SELECT `cus_lastname`, `cus_update_date` 
FROM `customers`
WHERE `cus_update_date` IS NOT NULL

-- Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ? --
SELECT *
FROM `customers`
WHERE `cus_city` LIKE '%divos%'

-- Q6. Quel est le produit vendu le moins cher ? Afficher le prix, l'id et le nom du produit. --
SELECT `pro_id`, `pro_name`, `pro_price`
FROM `products` 
ORDER BY `pro_price` ASC
LIMIT 1

-- Q7. Lister les produits qui n'ont jamais été vendus
SELECT `pro_id`, `pro_ref`, `pro_name` 
FROM `products` 
WHERE `pro_id` BETWEEN 34 AND 39 OR (`pro_id` BETWEEN 41 AND 42)

-- Q8. Afficher les produits commandés par Madame Pikatchien.
SELECT *
FROM customers c 
WHERE `cus_lastname` LIKE '%Pikatchien%'

-- Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés. --
SELECT `cat_id`, `cat_name`, `pro_name`
FROM `categories` c
RIGHT JOIN products p ON c.cat_id = p.pro_cat_id
ORDER BY c.`cat_name`

-- Q10. Afficher l'organigramme hiérarchique (nom et prénom et poste des employés) du magasin de Compiègne, classer par ordre alphabétique. Afficher le nom et prénom des employés, éventuellement le poste (si vous y parvenez). --
SELECT CONCAT(`emp_lastname`, ' ', `emp_firstname`) AS 'Employé', CONCAT(`emp_lastname`, ' ', `emp_firstname`) AS 'Supérieur'
FROM `employees` e
WHERE `emp_id` = `emp_superior_id`

-- Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, le numéro de commande et de ligne de commande.
SELECT MAX(od.`ode_discount`) AS max_remise, p.`pro_id`, p.`pro_name`, orders.`ord_id` 
FROM `products` p, `orders_details` od, `orders` orders 
GROUP BY p.`pro_id`
LIMIT 1

-- Q13. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'
SELECT COUNT(c.`cus_id`)
FROM `customers`c 
RIGHT JOIN countries co ON c.`cus_countries_id` = co.cou_id
WHERE co.cou_id = 'CA'

-- Q16. Afficher le détail des commandes de 2020.
SELECT ord.ode_id, ord.ode_unit_price, ord.ode_discount, ord.ode_quantity, ord.ode_ord_id, ord.ode_pro_id, od.ord_order_date 
FROM `orders_details` ord
INNER JOIN orders od 
WHERE ord.ode_ord_id = od.ord_id
LIKE '%2020%'
ORDER BY od.ord_order_date

