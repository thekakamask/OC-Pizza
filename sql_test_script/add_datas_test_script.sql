USE oc_pizza;

-- Add new customer
INSERT INTO customer (first_name, name, date_of_birth, phone_number, email, client_picture, account_name, account_password)
VALUES 
('Daniel', 'Martin', '1982-06-15', '0787654321', 'daniel.martin@example.com', 'daniel_picture.jpg', 'daniel_martin', 'password999');

-- Recover id of new customer
SET @new_customer_id = LAST_INSERT_ID();

-- Add two new addresses for the new customer
INSERT INTO address (number_of_street, street, postal_code, city, additional_information)
VALUES 
(8, 'Rue Victor Hugo', 92800, 'Puteaux', 'Près du marché'),
(22, 'Rue des Lilas', 93170, 'Bagnolet', 'Quartier résidentiel');

-- Recover id of new address for Puteaux
SET @address_id_puteaux = LAST_INSERT_ID();

-- Add second address for Bagnolet and recover its id
INSERT INTO address (number_of_street, street, postal_code, city, additional_information)
VALUES 
(22, 'Rue des Lilas', 93170, 'Bagnolet', 'Quartier résidentiel');
SET @address_id_bagnolet = LAST_INSERT_ID();

-- Join client to the two new addresses
INSERT INTO customer_address (id_customer, id_address)
VALUES 
(@new_customer_id, @address_id_puteaux),
(@new_customer_id, @address_id_bagnolet);

-- Adding two commands for the new customer
-- First command (Puteaux)
INSERT INTO command (date, delivery_hours, name, payment_amount, id_customer, id_command_status, id_payment_status, id_payment_method, id_command_maker, id_delivery_man)
VALUES 
('2024-07-15', 12, 'Order 11', 37.0, @new_customer_id, 4, 3, 3, 5, 6);  -- Command Maker at Puteaux, Delivery Man at Puteaux

-- Recover id for first command
SET @new_command_id_puteaux = LAST_INSERT_ID();

-- Adding 4 pizzas for the first command 
INSERT INTO command_pizza (id_command, id_pizza, quantity_same_pizza)
VALUES 
(@new_command_id_puteaux, 1, 2),  -- 2 Margherita
(@new_command_id_puteaux, 2, 2);  -- 2 Pepperoni

-- Second command (Bagnolet)
INSERT INTO command (date, delivery_hours, name, payment_amount, id_customer, id_command_status, id_payment_status, id_payment_method, id_command_maker, id_delivery_man)
VALUES 
('2024-07-16', 14, 'Order 12', 46.0, @new_customer_id, 5, 3, 2, 3, 4);  -- Command Maker à Bagnolet, Delivery Man à Bagnolet

-- Recover id for second command
SET @new_command_id_bagnolet = LAST_INSERT_ID();

-- Adding 4 pizzas for the second command 
INSERT INTO command_pizza (id_command, id_pizza, quantity_same_pizza)
VALUES 
(@new_command_id_bagnolet, 4, 2),  -- 2 Hawaiian
(@new_command_id_bagnolet, 5, 2);  -- 2 BBQ Chicken

-- Update stock for the first command (Puteaux)
UPDATE unity_quantity_stock uqs
JOIN ingredient i ON uqs.id_ingredient = i.id_ingredient
SET uqs.amount = uqs.amount - 
  CASE
    WHEN i.name = 'Tomato Sauce' THEN 0.6 * 2 + 0.4 * 2  -- 2 Margherita (0.6l each) + 2 Pepperoni (0.4l each)
    WHEN i.name = 'Mozzarella' THEN 0.6 * 2 + 0.2 * 2  -- 2 Margherita (0.6kg each) + 2 Pepperoni (0.2kg each)
    WHEN i.name = 'Basil' THEN 10 * 2  -- 2 Margherita (10 units each)
    WHEN i.name = 'Pepperoni' THEN 0.5 * 2  -- 2 Pepperoni (0.5kg each)
  END
WHERE uqs.id_sales_point = 3 AND i.name IN ('Tomato Sauce', 'Mozzarella', 'Basil', 'Pepperoni');

-- Update stock for the second command (Bagnolet)
UPDATE unity_quantity_stock uqs
JOIN ingredient i ON uqs.id_ingredient = i.id_ingredient
SET uqs.amount = uqs.amount - 
  CASE
    WHEN i.name = 'Tomato Sauce' THEN 0.3 * 2  -- 2 Hawaiian (0.3l each)
    WHEN i.name = 'Mozzarella' THEN 0.4 * 2  -- 2 Hawaiian (0.4kg each)
    WHEN i.name = 'Ham' THEN 0.2 * 2  -- 2 Hawaiian (0.2kg each)
    WHEN i.name = 'Pineapple' THEN 1 * 2  -- 2 Hawaiian (1 unit each)
    WHEN i.name = 'BBQ Sauce' THEN 0.3 * 2  -- 2 BBQ Chicken (0.3l each)
    WHEN i.name = 'Chicken' THEN 0.5 * 2  -- 2 BBQ Chicken (0.5kg each)
    WHEN i.name = 'Onion' THEN 0.2 * 2  -- 2 BBQ Chicken (0.2kg each)
  END
WHERE uqs.id_sales_point = 2 AND i.name IN ('Tomato Sauce', 'Mozzarella', 'Ham', 'Pineapple', 'BBQ Sauce', 'Chicken', 'Onion');