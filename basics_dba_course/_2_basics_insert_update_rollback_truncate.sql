USE thriftshop;

SELECT * FROM inventory;

INSERT INTO inventory VALUES
(10,'wolf skin hat',1);

INSERT INTO inventory VALUES
(11,'fur fox skin',1),
(12,'plaid button up shirt',8),
(13,'flannel zebra jammies',6);

INSERT INTO inventory (inventory_id, item_name) VALUES
(14,'wolf skin sneakers');

INSERT INTO inventory VALUES
(15,'item that will not exist',2);

SELECT * FROM inventory;

UPDATE inventory
SET number_in_stock = 0
WHERE inventory_id = 9;

UPDATE inventory
SET number_in_stock = 0
WHERE inventory_id IN (1,9);

UPDATE inventory
SET number_in_stock = 0
WHERE item_name = 'fur coat';

USE candystore;

SELECT * FROM employees;

INSERT INTO employees VALUES
(7,'Charles','Munger','2020-03-15','Clerk',5.00),
(8,'William','Gates','2020-03-15','Clerk',5.00);

UPDATE employees
SET avg_customer_rating = 4.8
WHERE employee_id = 1;

UPDATE employees
SET avg_customer_rating = 4.6
WHERE employee_id = 2;

UPDATE employees
SET avg_customer_rating = 4.75
WHERE employee_id = 3;

UPDATE employees
SET avg_customer_rating = 4.9
WHERE employee_id = 4;

UPDATE employees
SET avg_customer_rating = 4.75
WHERE employee_id = 5;

UPDATE employees
SET avg_customer_rating = 4.2
WHERE employee_id = 6;

/*
UPDATE employees
SET avg_customer_rating = CASE 
		WHEN employee_id = 1 THEN 4.50
		WHEN employee_id = 2 THEN 4.50
		END
WHERE employee_id IN (1,2);
*/

/* --------------------------------------------------- */

USE thriftshop;

SELECT * FROM inventory;

SELECT @@autocommit;

SET autocommit = OFF;

DELETE FROM inventory
WHERE inventory_id = 7;

ROLLBACK;

COMMIT;

SET autocommit = ON;

/* --------------------------------------------------- */

USE thriftshop;

SELECT * FROM customers;

SELECT @@autocommit;

SET autocommit = OFF;

DELETE FROM customers
WHERE customer_id BETWEEN 1 AND 6;

ROLLBACK;

TRUNCATE TABLE customers;

SET autocommit = ON;

/* --------------------------------------------------- */

USE candystore;

SELECT * FROM customer_reviews;

SELECT * FROM employees;

DELETE FROM employees
WHERE employee_id = 4;

TRUNCATE TABLE customer_reviews;

















