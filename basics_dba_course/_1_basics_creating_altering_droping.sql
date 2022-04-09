CREATE SCHEMA mythirdcodeschema DEFAULT CHARACTER SET UTF8MB4;

USE myfirstcodeschema;

SELECT * FROM myfirsttable;

CREATE TABLE myfirstcodetable (
	myfirstcodetable_id BIGINT NOT NULL,
    my_character_field VARCHAR(50),
    my_text_field TEXT,
    my_created_at TIMESTAMP,
    PRIMARY KEY (myfirstcodetable_id)
);

SELECT * FROM myfirstcodetable;

/*-------------------------------------------------------------------*/

CREATE SCHEMA toms_marketing_stuff DEFAULT CHARACTER SET UTF8MB4;

USE toms_marketing_stuff;

CREATE TABLE publishers (
	publisher_id INT NOT NULL,
    publisher_name VARCHAR(65),
    PRIMARY KEY (publisher_id)
);

SELECT * FROM publishers;

DROP TABLE publisher_spend;

CREATE TABLE publisher_spend (
	publisher_spend_id INT NOT NULL,
	publisher_id INT NOT NULL,
    month DATE,
    spend DECIMAL(10,2),
    PRIMARY KEY (publisher_spend_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

SELECT * FROM publisher_spend;

DESCRIBE publisher_spend;

/*-------------------------------------------------------------------*/

USE thriftshop;

SELECT * FROM customer_purchases;

SELECT * FROM customers;

SELECT * FROM inventory;

ALTER TABLE customer_purchases
DROP COLUMN customer_id;

ALTER TABLE customer_purchases
ADD COLUMN purchase_amount DECIMAL(10,2) AFTER customer_purchase_id;

/*-------------------------------------------------------------------*/

USE candystore;

ALTER TABLE employees
DROP COLUMN hourly_wage;

ALTER TABLE employees
ADD COLUMN avg_customer_rating DECIMAL(10,1);

SELECT * FROM employees;

/*-------------------------------------------------------------------*/

DROP SCHEMA mysecondcodeschema;

DROP SCHEMA mythirdcodeschema;

USE myfirstschema;

DROP TABLE myfirsttable;

DROP SCHEMA myfirstschema;

/*-------------------------------------------------------------------*/

USE candystore;

DROP TABLE candy_products;

DROP SCHEMA candystore_old;






