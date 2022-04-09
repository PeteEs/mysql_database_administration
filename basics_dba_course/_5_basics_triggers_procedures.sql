USE candystore;

USE thriftshop;

SELECT * FROM inventory;

DESCRIBE inventory;

INSERT INTO inventory VALUES
(14, 'fur fox skin', 1);

SELECT * FROM inventory;

INSERT INTO inventory(inventory_id, item_name) VALUES(16,'hot new product');

DELETE FROM inventory
WHERE inventory_id = 14;

/* ----------------------------- */

USE sloppyjoes;

SELECT * FROM customer_orders;

SELECT * FROM menu_items;

SELECT * FROM staff;

UPDATE customer_orders
SET order_total = 0
WHERE order_id IN (3,8,12,16,19);

/* ----------------------------- */

USE thriftshop;

SELECT * FROM inventory;

/* ----------------------------- */

SELECT * FROM inventory;

-- changing the delimiter
DELIMITER //
-- creating the procedure
CREATE PROCEDURE sp_selectAllInventory()
BEGIN
	SELECT * FROM inventory;
END //
-- changing the delimiter back to the default
DELIMITER ;
    
CALL sp_selectAllInventory();
    
DROP PROCEDURE IF EXISTS sp_selectAllInventory;
    
USE sloppyjoes;
    
SELECT
	staff_id,
    COUNT(order_id) AS orders_served
FROM customer_orders
GROUP BY staff_id;
    
DELIMITER //
CREATE PROCEDURE sp_staffOrdersServed()
BEGIN

	SELECT
		staff_id,
		COUNT(order_id) AS orders_served
	FROM customer_orders
	GROUP BY staff_id;
    
END //
DELIMITER ;
    
CALL sp_staffOrdersServed();

/* --------------------------------------- */

USE thriftshop;

CREATE TRIGGER purchaseUpdateInventory
AFTER INSERT ON customer_purchases
FOR EACH ROW
	UPDATE inventory
		-- substracting an item for each purchase
        SET number_in_stock = number_in_stock - 1
	WHERE inventory_id = NEW.inventory_id;
    
INSERT INTO customer_purchases VALUES
(13,NULL,3,NULL), -- inventory_id = 3, velour jumpsuit
(14,NULL,4,NULL)  -- inventory_id = 4, house slippers
;

SELECT * FROM inventory;

/* ------------------------------------------- */
    
USE sloppyjoes;

CREATE TRIGGER ordersUpdateStaff
AFTER INSERT ON customer_orders
FOR EACH ROW
	UPDATE staff
		SET orders_served = orders_served + 1
	WHERE staff.staff_id = NEW.staff_id;




