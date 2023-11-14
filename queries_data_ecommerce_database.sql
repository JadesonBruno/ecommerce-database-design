-- Queries in the Ecommerce Database

-- List all products in stock at a specific location
SELECT p.product_name, s.location, p.quantity
FROM products p
JOIN stocks s ON p.stock_id = s.id
WHERE s.location = 'Aisle 1';

-- Find products with low stock
SELECT product_name, quantity
FROM products
WHERE quantity <= 20;

-- Calculate total sales revenue for a given period
SELECT SUM(p.price * op.quantity) AS total_revenue
FROM orders o
JOIN orders_products op ON o.id = op.order_id
JOIN products p ON op.product_id = p.id
WHERE o.order_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Find the customers who placed the most orders
SELECT CONCAT(c.first_name, ' ', c.middle_name, ' ', c.last_name) AS complete_name, COUNT(o.id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total_orders DESC;

-- Get the list of suppliers for a specific product
SELECT s.company_name, ps.quantity
FROM suppliers s
JOIN products_suppliers ps ON s.id = ps.supplier_id
JOIN products p ON ps.product_id = p.id
WHERE p.product_name = 'NVIDIA GEFORCE RTX 4090 TI GPU';

-- List all sellers of a specific product
SELECT s.company_name, ps.quantity
FROM sellers s
JOIN products_sellers ps ON s.id = ps.seller_id
JOIN products p ON ps.product_id = p.id
WHERE p.product_name = 'APPLE MACBOOK AIR';

-- Find the most rated products
SELECT product_name, evaluation
FROM products
ORDER BY evaluation DESC;

-- Calculate the number of orders by payment type
SELECT payment_type, COUNT(o.payment_id) AS total_payments
FROM payments p
LEFT JOIN orders o ON p.id = o.payment_id
GROUP BY payment_type;

-- Find total value in sales by payment type
SELECT p.payment_type, SUM(pr.price * op.quantity) AS total_gasto
FROM payments p
LEFT JOIN orders o ON p.id = o.payment_id
JOIN orders_products op ON o.id = op.order_id
JOIN products pr ON op.product_id = pr.id  
GROUP BY p.payment_type;

-- Find orders that are still in progress
SELECT order_description, order_date, order_status
FROM orders
WHERE order_status = 'In Progress';

-- Find customers who haven't placed an order yet
SELECT c. id, CONCAT(c.first_name, ' ', c.middle_name, ' ', c.last_name) AS complete_name, c.email, c.phone
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;