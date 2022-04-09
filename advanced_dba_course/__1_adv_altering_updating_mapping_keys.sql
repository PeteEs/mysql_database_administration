USE thriftshop;

SELECT *
FROM customer_purchases;

ALTER TABLE customer_purchases
DROP COLUMN customer_id;

ALTER TABLE customer_purchases
ADD COLUMN purchased_at DATETIME;

ALTER TABLE customer_purchases
ADD COLUMN purchased_amount_two DECIMAL (10,2);

ALTER TABLE customer_purchases
DROP COLUMN purchased_amount_two;

-- -----------------------------------------------------------

SELECT *
FROM inventory;

UPDATE inventory
SET number_in_stock = 0
WHERE inventory_id IN (1,9);

UPDATE inventory
SET number_in_stock = 0
WHERE item_name = 'fur coat'; -- safe update mode !

-- -----------------------------------------------------------
-- task 1:

USE mavenbearbuilders;

CREATE TABLE products(
	product_id BIGINT,
    created_at DATETIME,
	product_name VARCHAR(50),
    PRIMARY KEY (product_id)
);

DESCRIBE products;

INSERT INTO products VALUE
(1,'2012-03-19 09:00:00','The Original Mr. Fuzzy'),
(2,'2013-01-06 13:00:00','The Original Mr. Fuzzy');

UPDATE products
SET product_name = 'The Forever Love Bear'
WHERE product_id = 2;


SELECT *
FROM products;

-- -----------------------------------------------------------
-- task 2:

SELECT *
FROM order_items;

ALTER TABLE order_items
ADD COLUMN product_id BIGINT;

-- -----------------------------------------------------------
-- task 3:

UPDATE order_items
SET product_id = 1
WHERE order_item_id > 0;

SELECT *
FROM order_items;

-- -----------------------------------------------------------
-- task 4:

SELECT *
FROM order_items;

SELECT *
FROM products;

ALTER TABLE order_items
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

DESCRIBE order_items;

-- -----------------------------------------------------------
-- task 5:

SELECT *
FROM order_items;

SELECT *
FROM order_item_refunds;





















