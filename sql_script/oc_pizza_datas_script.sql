USE oc_pizza;

INSERT INTO customer (first_name, name, date_of_birth, phone_number, email, client_picture, account_name, account_password)
VALUES 
('John', 'Doe', '1980-01-01', '0612345678', 'john.doe@example.com', 'john_picture.jpg', 'john_doe', 'password123'),
('Jane', 'Smith', '1990-02-02', '0712345678', 'jane.smith@gmail.com', 'jane_picture.jpg', 'jane_smith', 'password456'),
('Alice', 'Johnson', '1975-03-03', '0623456789', 'alice.johnson@example.com', 'alice_picture.jpg', 'alice_johnson', 'password789'),
('Bob', 'Brown', '1985-04-04', '0723456789', 'bob.brown@hotmail.fr', 'bob_picture.jpg', 'bob_brown', 'password101'),
('Charlie', 'Davis', '2000-05-05', '0634567890', 'charlie.davis@yahoo.com', 'charlie_picture.jpg', 'charlie_davis', 'password202');

INSERT INTO address (number_of_street, street, postal_code, city, additional_information)
VALUES 
(10, 'Rue de Rivoli', 75001, 'Paris', 'Proche du Louvre'),
(15, 'Avenue des Champs-Élysées', 75008, 'Paris', 'Près de l\'Arc de Triomphe'),
(20, 'Boulevard Saint-Germain', 75005, 'Paris', 'Quartier Latin'),
(5, 'Avenue du Général de Gaulle', 93170, 'Bagnolet', 'Près de la mairie'),
(12, 'Rue Jean Jaurès', 92800, 'Puteaux', 'Près du centre commercial Les Quatre Temps');

INSERT INTO customer_address (id_customer, id_address)
VALUES 
(1, 1), -- john doe rue de rivoli
(2, 2), -- jane smith avenue champs elysees
(3, 3), -- alice johnson boulevard st germain
(4, 4), -- bob brown avenue general de gaulle
(5, 5), -- charlie davis rue jean jaures
(1, 3), -- john doe boulevard st germain
(5, 2);  -- charlie davis avenue champs elysees

INSERT INTO payment_method (method)
VALUES 
('money'),
('paypal'),
('credit_card');

INSERT INTO payment_status (status)
VALUES 
('in_progress'),
('cancelled'),
('validate');
       
INSERT INTO command_status (status)
VALUES 
('cancelled'),
('confirmed'),
('in_preparation'),
('in_delivery'),
('delivered');

INSERT INTO unity_type (NAME)
VALUES 
('kg'),
('l'),
('u');

INSERT INTO ingredient (name)
VALUES 
('Tomato Sauce'), -- id 1
('Mozzarella'),   -- id 2
('Pepperoni'),    -- id 3
('Vegetables'),   -- id 4
('Ham'),          -- id 5
('Pineapple'),    -- id 6
('Chicken'),      -- id 7
('Onion'),        -- id 8
('Basil'),        -- id 9
('BBQ Sauce');    -- id 10

INSERT INTO sales_point (name, is_open)
VALUES 
('Paris Centre', 1),
('Bagnolet', 1),
('Puteaux', 1),
('Paris 5', 1),
('Paris 8', 1);

INSERT INTO unity_quantity_stock (id_sales_point, id_ingredient, id_unity_type, name, amount, limit_quantity, purchasing_price_per_unit)
VALUES 
(1, 1, 2, 'Tomato Sauce Stock', 10.0, 0, 2.0),  -- Paris Centre, Tomato Sauce, 10 l
(2, 1, 2, 'Tomato Sauce Stock', 7.5, 0, 2.0),  -- Bagnolet, Tomato Sauce, 7.5 l
(3, 1, 2, 'Tomato Sauce Stock', 3.0, 0, 2.0), -- Puteaux, Tomato Sauce, 3 l
(4, 1, 2, 'Tomato Sauce Stock', 7.5, 0, 2.0), -- Paris 5, Tomato Sauce, 7.5 l
(5, 1, 2, 'Tomato Sauce Stock', 10.0, 0, 2.0),  -- Paris 8, Tomato Sauce, 10 l

(1, 2, 1, 'Mozzarella Stock', 5.0, 0, 5.0),  -- Paris Centre, Mozzarella, 5 kg
(2, 2, 1, 'Mozzarella Stock', 20.0, 0, 5.0),  -- Bagnolet, Mozzarella, 20 kg
(3, 2, 1, 'Mozzarella Stock', 8.0, 0, 5.0),  -- Puteaux, Mozzarella, 8 kg
(4, 2, 1, 'Mozzarella Stock', 12.0, 0, 5.0), -- Paris 5, Mozzarella, 12 kg
(5, 2, 1, 'Mozzarella Stock', 15.0, 0, 5.0), -- Paris 8, Mozzarella, 15 kg

(1, 3, 1, 'Pepperoni Stock', 5.0, 0, 15.0),  -- Paris Centre, Pepperoni, 5 kg
(2, 3, 1, 'Pepperoni Stock', 8.0, 0, 15.0),  -- Bagnolet, Pepperoni, 8 kg
(3, 3, 1, 'Pepperoni Stock', 12.0, 0, 15.0),  -- Puteaux, Pepperoni, 12 kg
(4, 3, 1, 'Pepperoni Stock', 15.0, 0, 15.0),  -- Paris 5, Pepperoni, 15 kg
(5, 3, 1, 'Pepperoni Stock', 20.0, 0, 15.0),  -- Paris 8, Pepperoni, 20 kg

(1, 4, 1, 'Vegetables Stock', 2.5, 0, 4.5),  -- Paris Centre, Vegetables, 2.5 kg
(2, 4, 1, 'Vegetables Stock', 8.0, 0, 4.5),  -- Bagnolet, Vegetables, 8 kg
(3, 4, 1, 'Vegetables Stock', 12.0, 0, 4.5), -- Puteaux, Vegetables, 12 kg
(4, 4, 1, 'Vegetables Stock', 15.0, 0, 4.5), -- Paris 5, Vegetables, 15 kg
(5, 4, 1, 'Vegetables Stock', 20.0, 0, 4.5),  -- Paris 8, Vegetables, 20 kg

(1, 5, 1, 'Ham Stock', 2.5, 0, 15.0),  -- Paris Centre, Ham, 2.5 kg
(2, 5, 1, 'Ham Stock', 20.0, 0, 15.0),  -- Bagnolet, Ham, 20 kg
(3, 5, 1, 'Ham Stock', 12.0, 0, 15.0), -- Puteaux, Ham, 12 kg
(4, 5, 1, 'Ham Stock', 8.0, 0, 15.0), -- Paris 5, Ham, 8 kg
(5, 5, 1, 'Ham Stock', 15.0, 0, 15.0),  -- Paris 8, Ham, 15 kg

(1, 6, 3, 'Pineapple Stock', 40, 0, 7.0),  -- Paris Centre, Pineapple, 40 units
(2, 6, 3, 'Pineapple Stock', 18, 0, 7.0), -- Bagnolet, Pineapple, 18 units
(3, 6, 3, 'Pineapple Stock', 25, 0, 7.0), -- Puteaux, Pineapple, 25 units
(4, 6, 3, 'Pineapple Stock', 20, 0, 7.0), -- Paris 5, Pineapple, 20 units
(5, 6, 3, 'Pineapple Stock', 18, 0, 7.0), -- Paris 8, Pineapple, 18 units

(1, 7, 1, 'Chicken Stock', 15.0, 0, 15.0),  -- Paris Centre, Chicken, 15 kg
(2, 7, 1, 'Chicken Stock', 15.0, 0, 15.0),   -- Bagnolet, Chicken, 15 kg
(3, 7, 1, 'Chicken Stock', 12.0, 0, 15.0),  -- Puteaux, Chicken, 12 kg
(4, 7, 1, 'Chicken Stock', 5.0, 0, 15.0),   -- Paris 5, Chicken, 5 kg
(5, 7, 1, 'Chicken Stock', 12.0, 0, 15.0),  -- Paris 8, Chicken, 12 kg

(1, 8, 1, 'Onion Stock', 15.0, 0, 15.0),  -- Paris Centre, Onion, 15 kg
(2, 8, 1, 'Onion Stock', 12.0, 0, 15.0),  -- Bagnolet, Onion, 12 kg
(3, 8, 1, 'Onion Stock', 8.0, 0, 15.0), -- Puteaux, Onion, 8 kg
(4, 8, 1, 'Onion Stock', 2.5, 0, 15.0), -- Paris 5, Onion, 2.5 kg
(5, 8, 1, 'Onion Stock', 12.0, 0, 15.0),  -- Paris 8, Onion, 12 kg

(1, 9, 3, 'Basil Stock', 20, 0, 20.0),  -- Paris Centre, Basil, 20 units
(2, 9, 3, 'Basil Stock', 18, 0, 20.0),   -- Bagnolet, Basil, 18 units
(3, 9, 3, 'Basil Stock', 25, 0, 20.0),  -- Puteaux, Basil, 25 units
(4, 9, 3, 'Basil Stock', 40, 0, 20.0),  -- Paris 5, Basil, 40 units
(5, 9, 3, 'Basil Stock', 20, 0, 20.0),  -- Paris 8, Basil, 20 units

(1, 10, 2, 'BBQ Sauce Stock', 10.0, 0, 10.0),  -- Paris Centre, BBQ Sauce, 10 l
(2, 10, 2, 'BBQ Sauce Stock', 3.0, 0, 10.0),  -- Bagnolet, BBQ Sauce, 3 l
(3, 10, 2, 'BBQ Sauce Stock', 7.5, 0, 10.0), -- Puteaux, BBQ Sauce, 7.5 l
(4, 10, 2, 'BBQ Sauce Stock', 10.0, 0, 10.0), -- Paris 5, BBQ Sauce, 10 l
(5, 10, 2, 'BBQ Sauce Stock', 7.5, 0, 10.0); -- Paris 8, BBQ Sauce, 7.5 l

INSERT INTO pizza (name, picture, selling_price, receipt)
VALUES 
('Margherita', 'margherita.jpg', 8.5, '0.6l of Tomato sauce, 0.6kg of Mozzarella, 10 unit of Basil'),
('Pepperoni', 'pepperoni.jpg', 10.0, '0.4l of Tomato sauce, 0.2kg of Mozzarella, 0.5kg of Pepperoni'),
('Vegetarian', 'vegetarian.jpg', 9.5, '0.5l of Tomato sauce, 0.5kg of Mozzarella, 0.7kg of Vegetables'),
('Hawaiian', 'hawaiian.jpg', 11.0, '0.3l Tomato sauce, 0.4kg of Mozzarella, 0.2kg of Ham, 1 unit of Pineapple'),
('BBQ Chicken', 'bbq_chicken.jpg', 12.0, '0.3l BBQ sauce, 0.2kg of Mozzarella, 0.5kg of Chicken, 0.2kg of Onion');

INSERT INTO pizza_ingredient (id_pizza, id_ingredient, amount_by_pizza)
VALUES 
-- Margherita: Tomato Sauce, Mozzarella, Basil
(1, 1, 0.6),
(1, 2, 0.6),
(1, 9, 10.0),
-- Pepperoni: Tomato Sauce, Mozzarella, Pepperoni
(2, 1, 0.4),
(2, 2, 0.2),
(2, 3, 0.5),
-- Vegetarian: Tomato Sauce, Mozzarella, Vegetables
(3, 1, 0.5),
(3, 2, 0.5),
(3, 4, 0.7),
-- Hawaiian: Tomato Sauce, Mozzarella, Ham, Pineapple
(4, 1, 0.3),
(4, 2, 0.4),
(4, 5, 0.2),
(4, 6, 1.0),
-- BBQ Chicken: BBQ Sauce, Mozzarella, Chicken, Onion
(5, 10, 0.3),
(5, 2, 0.2),
(5, 7, 0.5),
(5, 8, 0.2);

INSERT INTO employe (first_name, name, phone_number, email, date_of_birth, fonction, id_sales_point)
VALUES 
('Emma', 'Williams', '0712345678', 'emma.williams@example.com', '1985-01-15', 'Command Maker', 1),
('Liam', 'Smith', '0612345670', 'liam.smith@example.com', '1991-06-12', 'Delivery Man', 1),
('Olivia', 'Brown', '0612345679', 'olivia.brown@example.com', '1990-02-20', 'Command Maker', 2),
('Noah', 'Jones', '0612345671', 'noah.jones@example.com', '1993-07-14', 'Delivery Man', 2),
('Ava', 'Miller', '0612345680', 'ava.miller@example.com', '1988-03-25', 'Command Maker', 3),
('Elijah', 'Davis', '0612345681', 'elijah.davis@example.com', '1992-04-30', 'Delivery Man', 3),
('Sophia', 'Wilson', '0612345682', 'sophia.wilson@example.com', '1987-05-10', 'Command Maker', 4),
('James', 'Moore', '0612345683', 'james.moore@example.com', '1989-08-19', 'Delivery Man', 4),
('Isabella', 'Taylor', '0612345684', 'isabella.taylor@example.com', '1994-09-20', 'Command Maker', 5),
('Benjamin', 'Anderson', '0612345685', 'benjamin.anderson@example.com', '1995-10-21', 'Delivery Man', 5);

INSERT INTO command_maker (id_employe)
SELECT id_employe FROM employe WHERE fonction = 'Command Maker';

INSERT INTO delivery_man (id_employe)
SELECT id_employe FROM employe WHERE fonction = 'Delivery Man';

INSERT INTO command (date, delivery_hours, name, payment_amount, id_customer, id_command_status, id_payment_status, id_payment_method, id_command_maker, id_delivery_man, id_address)
VALUES 
('2023-07-01', 14, 'Order 1', 28.0, 1, 1, 2, 2, 1, 2, 1),  -- John Doe, Rue de Rivoli, Paris Centre
('2023-07-02', 13, 'Order 2', 8.5, 2, 2, 1, 3, 9, 10, 2),   -- Jane Smith, Avenue des Champs-Élysées, Paris 8
('2023-07-03', 15, 'Order 3', 21.5, 3, 3, 3, 1, 7, 8, 3),  -- Alice Johnson, Boulevard Saint-Germain, Paris 5
('2023-07-04', 14, 'Order 4', 21.0, 4, 4, 3, 2, 5, 6, 4),  -- Bob Brown, Avenue du Général de Gaulle, Bagnolet
('2023-07-05', 13, 'Order 5', 10.0, 5, 5, 3, 3, 3, 4, 5),  -- Charlie Davis, Rue Jean Jaurès, Puteaux
('2023-07-06', 13, 'Order 6', 11.5, 1, 1, 3, 1, 1, 2, 3),  -- John Doe, Boulevard Saint-Germain, Paris Centre
('2023-07-07', 15, 'Order 7', 20.0, 2, 2, 3, 2, 9, 10, 2), -- Jane Smith, Avenue des Champs-Élysées, Paris 8
('2023-07-08', 14, 'Order 8', 24.5, 3, 5, 3, 1, 7, 8, 3),  -- Alice Johnson, Boulevard Saint-Germain, Paris 5
('2023-07-09', 13, 'Order 9', 18.5, 4, 4, 3, 1, 5, 6, 4),  -- Bob Brown, Avenue du Général de Gaulle, Bagnolet
('2023-07-10', 14, 'Order 10', 19.50, 5, 5, 3, 2, 3, 4, 5); -- Charlie Davis, Rue Jean Jaurès, Puteaux

INSERT INTO command_pizza (id_command, id_pizza, quantity_same_pizza)
VALUES 
-- Order 1: 1x Margherita, 1x Pepperoni, 1x Vegetarian
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
-- Order 2: 1x Margherita
(2, 1, 1),
-- Order 3: 2x Pepperoni, 1x Margherita
(3, 2, 2),
(3, 1, 1),
-- Order 4: 2x Vegetarian, 1x Margherita
(4, 3, 2),
(4, 1, 1),
-- Order 5: 1x Pepperoni
(5, 2, 1),
-- Order 6: 1x Vegetarian, 1x Margherita
(6, 3, 1),
(6, 1, 1),
-- Order 7: 1x Hawaiian, 1x Margherita
(7, 4, 1),
(7, 1, 1),
-- Order 8: 1x BBQ Chicken, 1x Hawaiian
(8, 5, 1),
(8, 4, 1),
-- Order 9: 1x Pepperoni, 1x Margherita
(9, 2, 1),
(9, 1, 1),
-- Order 10: 1x BBQ Chicken, 1x Margherita
(10, 5, 1),
(10, 1, 1);