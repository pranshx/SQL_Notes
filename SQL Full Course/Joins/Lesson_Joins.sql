-- 	Refer to initialize the foreign key for data
-- Selecting the orders made by George
-- 1st Way
SELECT * FROM orders 
WHERE customer_id = (SELECT id FROM customers
					WHERE last_name = 'George');

-- Cross Join > Every Row of first table cobined with every row of second 
SELECT * FROM customers, orders;

-- Inner Joins
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;
-- Inner is implict although we can specify it explicitly
SELECT * FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;
-- Opposite order
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;
-- Inner Joins End

-- Inner Joins with Group by
SELECT first_name, last_name, SUM(orders.amount) FROM customers
JOIN orders ON customers.id=orders.customer_id
GROUP BY first_name, last_name;
-- Inner Joins with Group by End

-- Left Join
SELECT * FROM customers -- Customers table will become the left table here
LEFT JOIN orders ON customers.id=orders.customer_id;

SELECT * FROM customers
LEFT JOIN orders ON customers.id=orders.customer_id
WHERE orders.amount IS NULL; -- To find customer who have never placed an order

SELECT order_date, amount, first_name, last_name FROM orders -- Give same result as inner join as every order have customer_id
LEFT JOIN customers ON orders.customer_id = customers.id;
-- Left Join End

-- Left Join with Group by
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent -- IFNULL will return 0 if value is null
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;
-- Left Join with Group by End

-- Right Join
SELECT first_name, last_name, order_date, amount -- Here Orders is Right table
FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;
-- Right Joins End

-- ON Delete Cascade
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,                                                       -- If we delete any value from customers the cooresponding
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE  -- values from orders table will automatically be deleted
    );
-- ON Delete Cascade End