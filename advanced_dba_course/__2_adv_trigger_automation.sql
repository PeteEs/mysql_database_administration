USE mavenbearbuilders;

USE thriftshop;

SELECT *
FROM inventory;

CREATE TRIGGER purchaseUpdateInventory
AFTER INSERT ON customer_purchases
FOR EACH ROW
	UPDATE inventory
		-- substracting an item for each purchase
        SET number_in_stock = number_in_stock - 1
	WHERE inventory_id = NEW.inventory_id;

-- --------------------------------------------

SHOW TRIGGERS;

-- --------------------------------------------

SELECT *
FROM customer_purchases;

SELECT *
FROM purchase_summary;

CREATE TRIGGER purchaseUpdatePurchaseSummary_before
BEFORE INSERT
ON customer_purchases
FOR EACH ROW
	UPDATE purchase_summary
		SET purchases_excluding_last = (
			SELECT COUNT(customer_purchase_id)
            FROM customer_purchases WHERE customer_purchases.customer_id = purchase_summary.customer_id 
				)
	WHERE customer_id = NEW.customer_id -- where purchase_summary.customer_id MATCHES the new records' customer_id IN customer_purchases
	AND purchase_summary_id > 0; -- handle safe mode
    
CREATE TRIGGER purchaseUpdatePurchaseSummary_after
AFTER INSERT
ON customer_purchases
FOR EACH ROW
	UPDATE purchase_summary
		SET total_purchases = (
			SELECT COUNT(customer_purchase_id)
            FROM customer_purchases WHERE customer_purchases.customer_id = purchase_summary.customer_id 
				)
	WHERE customer_id = NEW.customer_id -- where purchase_summary.customer_id MATCHES the new records' customer_id IN customer_purchases
	AND purchase_summary_id > 0; -- handle safe mode
    
-- --------------------------------------------

-- task 1:

USE mavenbearbuilders;

SELECT *
FROM products;

SELECT *
FROM order_items;

SELECT
	order_item_id,
	created_at,
    website_session_id,
    product_id AS primary_product_id,
    CASE WHEN is_primary_item = 0 THEN 2 ELSE 1 END AS no_of_items
FROM order_items;

SELECT 
	order_id,
    MIN(created_at) AS created_at,
    MIN(website_session_id) AS website_session_id,
    SUM(CASE
			WHEN is_primary_item = 1 THEN product_id
            ELSE NULL
            END ) AS primary_product_id,
	COUNT(order_item_id) AS items_purchased,
	SUM(price_usd) AS price_usd,
    SUM(cogs_usd) AS cogs_usd
FROM order_items
GROUP BY 1
ORDER BY 1;

CREATE TABLE orders
SELECT 
	order_id,
    MIN(created_at) AS created_at,
    MIN(website_session_id) AS website_session_id,
    SUM(CASE
			WHEN is_primary_item = 1 THEN product_id
            ELSE NULL
            END ) AS primary_product_id,
	COUNT(order_item_id) AS items_purchased,
	SUM(price_usd) AS price_usd,
    SUM(cogs_usd) AS cogs_usd
FROM order_items
GROUP BY 1
ORDER BY 1;

SELECT *
FROM orders;

DESCRIBE orders;

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

-- --------------------------------------------

-- task 2:

DROP TRIGGER order_items_orders_trigger;

CREATE TRIGGER order_items_orders_trigger
AFTER INSERT
ON order_items
FOR EACH ROW

REPLACE INTO orders
SELECT
    order_id,
    MIN(created_at) AS created_at,
    MIN(website_session_id) AS website_session_id,
    SUM(CASE
			WHEN is_primary_item = 1 THEN product_id
            ELSE NULL
            END ) AS primary_product_id,
	COUNT(order_item_id) AS items_purchased,
	SUM(price_usd) AS price_usd,
    SUM(cogs_usd) AS cogs_usd
FROM order_items

WHERE order_id = NEW.order_id
GROUP BY 1
ORDER BY 1;

-- --------------------------------------------

-- task 2:

-- DONE

SELECT DISTINCT * FROM order_items;

SELECT DISTINCT * FROM orders;










