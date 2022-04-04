/*
1) Import the recent order_items and order_item_refunds data into the database. 
Verify the order summary trigger you created previously still works. 
If not, recreate it.                                                                     
-- 17.order_items_2014_Mar          -- 19.order_item_refunds_2014_Mar                                                                    
-- 18.order_items_2014_Apr          -- 20.order_item_refunds_2014_Apr
*/ 

USE mavenbearbuilders;

SELECT *
FROM order_items;

SELECT *
FROM orders;

SELECT *
FROM order_item_refunds;

/*
2) Import the website_sessions and website_pageviews data for March and April.
-- 21.website_sessions_2014_Mar     -- 23.website_pageviews_2014_Mar                                                                   
-- 22.website_sessions_2014_Apr     -- 24.website_pageviews_2014_Apr
*/

SELECT *
FROM website_sessions;

SELECT *
FROM website_pageviews;

/*
3) The company is adding chat support to the website. 
You’ll need to design a database plan to track which customers and sessions 
utilize chat, and which chat representatives serve each customer.
*/

CREATE TABLE users (
	user_id BIGINT,
	created_at DATETIME,
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (user_id)
);

CREATE TABLE support_members (
	support_member_id BIGINT,
	created_at DATETIME,
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (support_member_id)
);

CREATE TABLE chat_sessions (
	chat_session_id BIGINT,
    created_at DATETIME,
    user_id BIGINT,
    support_member_id BIGINT,
    website_session_id BIGINT,
    PRIMARY KEY (chat_session_id)
);

CREATE TABLE chat_messages (
	chat_message_id BIGINT,
    created_at DATETIME,
    chat_session_id BIGINT,
    user_id BIGINT,
    support_member_id BIGINT,
    message_text VARCHAR(200),
    PRIMARY KEY (chat_message_id)
);

/*
4) Based on your tracking plan for chat support, 
create an EER diagram that incorporates your new tables 
into the existing database schema. Include table relationships.
*/

-- DONE
    
/*
5) Create the tables from your chat support tracking plan in the database. 
Include relationships to existing tables where applicable.  
*/

-- DONE

/*
6) Using the new tables, create a stored procedure that will allow 
the CEO to pull a count of chats handled by chat representative 
for a given time period, with a simple CALL statement that includes two dates. 
*/

SELECT 
	support_members.support_member_id,
	COUNT(chat_sessions.chat_session_id) AS no_of_chats
FROM chat_sessions
	LEFT JOIN support_members
		ON chat_sessions.support_member_id = support_members.support_member_id
GROUP BY
	1;
	
DROP PROCEDURE support_member_chat;
    
DELIMITER //

CREATE PROCEDURE support_member_chat
(IN supportmemberid BIGINT, IN date1 DATE, IN date2 DATE)
BEGIN
	SELECT
		COUNT(chat_session_id) AS chats
	FROM chat_sessions
    WHERE DATE(created_at) BETWEEN date1 AND date2
		AND support_member_id = supportmemberid;
END //

DELIMITER ;

CALL support_member_chat(1,'2014-01-01','2014-01-31');


/*
7) The potential acquirers need some data. Create two Views, one detailing 
monthly order volume and revenue, the other showing monthly website traffic. 
Create a new User, with access just to these Views.
*/

CREATE VIEW mothly_orders_revenue AS
SELECT
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(order_id) AS oders,
    SUM(price_usd) AS revenue
FROM orders
GROUP BY
	1,2;

SELECT *
FROM mothly_orders_revenue;

CREATE VIEW mothly_website_sessions AS
SELECT
	YEAR(created_at) AS yr,
    MONTH(created_at) AS mo,
    COUNT(website_session_id) AS sessions
FROM website_sessions
GROUP BY
	1,2;

SELECT *
FROM mothly_website_sessions;

/*
8) The potential acquirers are commissioning a third-party security study. 
Your CEO wants to get in front of it. Provide her with a list of your 
top data security threats and anything you think you could do to mitigate risk. 
*/

-- DONE


