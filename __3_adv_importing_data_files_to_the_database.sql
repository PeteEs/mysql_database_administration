CREATE DATABASE myfirstschema DEFAULT CHARACTER SET utf8mb3;

USE myfirstschema;

CREATE TABLE myfirstcodetable (
	myfirstcodetable_id BIGINT NOT NULL,
    my_character_field VARCHAR(50),
    my_text_field TEXT,
    my_created_at TIMESTAMP,
    PRIMARY KEY (myfirstcodetable_id)
);

SELECT *
FROM myfirstcodetable;

DESCRIBE myfirstcodetable;

-- ----------------------------------------

USE thriftshop;

SELECT * FROM inventory;

INSERT INTO thriftshop.inventory VALUES
(10,'wolf skin hat',1);

INSERT INTO thriftshop.inventory VALUES
(11,'fur fox skin',1),
(12,'plaid button up shirt',8),
(13,'flannel zebra jammies',6);

INSERT INTO thriftshop.inventory (inventory_id, item_name) VALUES
(14,'wolf skin sneakers');

-- ----------------------------------------

SELECT *
FROM inventory;

DELETE FROM inventory
WHERE inventory_id = 7;

SELECT @@autocommit;

SET @@autocommit = OFF;
SET @@autocommit = ON;

DELETE FROM inventory
WHERE inventory_id = 8;

ROLLBACK;

COMMIT;

-- ----------------------------------------

CREATE SCHEMA survey;

USE survey;

CREATE TABLE salary_survey (
	country VARCHAR(120),
    years_experience BIGINT,
    employment_status VARCHAR(120),
    job_title VARCHAR(120),
    is_manager VARCHAR(5),
    education_level VARCHAR(120)
);

SELECT *
FROM salary_survey;

-- ----------------------------------------
-- task 1:

CREATE SCHEMA mavenbearbuilders;

USE mavenbearbuilders;

CREATE TABLE order_items (
	order_item_id BIGINT,
    created_at TIMESTAMP,
    order_id BIGINT,
    price_usd DECIMAL(10,2),
    cogs_usd DECIMAL(10,2),
    website_session_id BIGINT
);

SELECT *
FROM order_items;

ALTER TABLE order_items
ADD PRIMARY KEY (order_item_id);

DESCRIBE order_items;

-- ----------------------------------------
-- task 2:

CREATE TABLE order_item_refunds (
	order_item_refund_id BIGINT,
    created_at TIMESTAMP,
    order_item_id BIGINT,
    order_id BIGINT,
    refund_amount_usd DECIMAL(10,2),
    PRIMARY KEY (order_item_refund_id)
);

SELECT *
FROM order_item_refunds;

ALTER TABLE order_item_refunds
ADD FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id);

DESCRIBE order_item_refunds;

-- ----------------------------------------
-- task 3:

SELECT *
FROM order_items;

SELECT *
FROM order_item_refunds;

DELETE FROM order_item_refunds
WHERE order_item_id IN (131,132,145,151,153);

-- ----------------------------------------
-- task 4:

SELECT *
FROM order_items;

SELECT *
FROM order_item_refunds;


-- ----------------------------------------






