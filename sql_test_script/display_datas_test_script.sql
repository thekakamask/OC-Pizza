-- Display all clients and their address
SELECT 
    c.id_customer,
    c.first_name,
    c.name AS customer_name,
    a.number_of_street,
    a.street,
    a.postal_code,
    a.city,
    a.additional_information
FROM 
    customer c
JOIN 
    customer_address ca ON c.id_customer = ca.id_customer
JOIN 
    address a ON ca.id_address = a.id_address
ORDER BY 
    c.id_customer;

-- Display all orders with customers, order statuses, payment statuses, payment methods, and pizzas
SELECT 
    co.id_command,
    co.date,
    co.delivery_hours,
    co.name AS command_name,
    co.payment_amount,
    c.first_name,
    c.name AS customer_name,
    cs.status AS command_status,
    ps.status AS payment_status,
    pm.method AS payment_method,
    p.name AS pizza_name,
    cp.quantity_same_pizza
FROM 
    command co
JOIN 
    customer c ON co.id_customer = c.id_customer
JOIN 
    command_status cs ON co.id_command_status = cs.id_command_status
JOIN 
    payment_status ps ON co.id_payment_status = ps.id_payment_status
JOIN 
    payment_method pm ON co.id_payment_method = pm.id_payment_method
JOIN 
    command_pizza cp ON co.id_command = cp.id_command
JOIN 
    pizza p ON cp.id_pizza = p.id_pizza
ORDER BY 
    co.id_command;

-- Display sales points, their commands, customers, command makers, and delivery men, sorted by sales point id
SELECT 
    sp.id_sales_point,
    sp.name AS sales_point_name,
    co.name AS command_name,
    c.first_name AS customer_first_name,
    c.name AS customer_last_name,
    cm.first_name AS command_maker_first_name,
    cm.name AS command_maker_last_name,
    dm.first_name AS delivery_man_first_name,
    dm.name AS delivery_man_last_name
FROM 
    sales_point sp
JOIN 
    employe cm ON sp.id_sales_point = cm.id_sales_point AND cm.fonction = 'Command Maker'
JOIN 
    employe dm ON sp.id_sales_point = dm.id_sales_point AND dm.fonction = 'Delivery Man'
JOIN 
    command co ON cm.id_employe = co.id_command_maker
JOIN 
    customer c ON co.id_customer = c.id_customer
ORDER BY 
    sp.id_sales_point, co.id_command;

-- Display employees and their locations
SELECT 
    e.id_employe,
    e.first_name,
    e.name AS employe_name,
    e.fonction,
    sp.name AS sales_point_name
FROM 
    employe e
JOIN 
    sales_point sp ON e.id_sales_point = sp.id_sales_point
ORDER BY 
    e.id_employe;

-- Display pizzas, their ingredients, and their receipt
SELECT 
    p.id_pizza,
    p.name AS pizza_name,
    p.receipt AS pizza_receipt,
    i.name AS ingredient_name
FROM 
    pizza p
JOIN 
    pizza_ingredient pi ON p.id_pizza = pi.id_pizza
JOIN 
    ingredient i ON pi.id_ingredient = i.id_ingredient
ORDER BY 
    p.id_pizza, i.id_ingredient;

-- Display points of sale, ingredients, and stock quantities with unit types, grouped by sales point id
SELECT 
    sp.id_sales_point,
    sp.name AS sales_point_name,
    uqs.name AS stock_name,
    uqs.limit_quantity,
    uqs.purchasing_price_per_unit,
    uqs.amount,
    ut.NAME AS unity_type,
    i.name AS ingredient_name
FROM 
    sales_point sp
JOIN 
    unity_quantity_stock uqs ON sp.id_sales_point = uqs.id_sales_point
JOIN 
    ingredient i ON uqs.id_ingredient = i.id_ingredient
JOIN 
    unity_type ut ON uqs.id_unity_type = ut.id_unity_type
ORDER BY 
    sp.id_sales_point, i.id_ingredient;

-- Display ingredients, their amounts, unit types, purchasing prices, stock names, and sales points
SELECT 
    i.id_ingredient,
    i.name AS ingredient_name,
    uqs.amount,
    ut.NAME AS unity_type,
    uqs.purchasing_price_per_unit,
    uqs.name AS stock_name,
    sp.name AS sales_point_name
FROM 
    ingredient i
JOIN 
    unity_quantity_stock uqs ON i.id_ingredient = uqs.id_ingredient
JOIN 
    unity_type ut ON uqs.id_unity_type = ut.id_unity_type
JOIN 
    sales_point sp ON uqs.id_sales_point = sp.id_sales_point
ORDER BY 
    i.id_ingredient, sp.id_sales_point;