USE mavenmovies;

SELECT *
FROM rental;

SELECT *
FROM rental
WHERE customer_id = 135;

-- -------------------------------------------------------

DELIMITER //

CREATE PROCEDURE customer_rentals
(IN custid BIGINT)
BEGIN
	SELECT *
	FROM rental
	WHERE customer_id = custid;
END //

DELIMITER ;

CALL customer_rentals(135);

-- -------------------------------------------------------

DELIMITER //

CREATE PROCEDURE customer_rentals_w_total
(IN custid BIGINT, OUT total_rentals BIGINT)
BEGIN
	SELECT
		COUNT(rental_id) INTO total_rentals
	FROM rental
    WHERE customer_id = custid;
    
    SELECT *
    FROM rental
    WHERE customer_id = custid;
END //

DELIMITER ;

CALL customer_rentals_w_total(135,@totalrrr);

SELECT @totalrrr;

-- -------------------------------------------------------

CREATE EVENT mysecondevent
	ON SCHEDULE EVERY 5 second
    DO
		INSERT INTO sillytable VALUES
        (NOW());

-- -------------------------------------------------------
-- task 1:

USE mavenbearbuilders;

SELECT *
FROM orders;

DELIMITER //

CREATE PROCEDURE order_performance
(IN date1 DATETIME, IN date2 DATETIME)
BEGIN
	SELECT 
		COUNT(order_id) AS total_orders,
        SUM(price_usd) AS revenue
	FROM orders
    WHERE created_at > date1
    AND created_at < date2;
END //

DELIMITER ;

CALL order_performance('2013-11-01','2013-12-31')





























