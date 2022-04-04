USE mavenfuzzyfactorymini;

SELECT * FROM orders_mini;

SELECT * FROM order_items_mini
WHERE order_id = 9994;

SELECT * FROM orders_mini
WHERE order_id = 9994;

SELECT * FROM order_item_refunds_mini;

/* -------------------------------------------- */

USE onlinelearningschool;

SELECT * FROM courses;

SELECT * FROM course_ratings;

SELECT * FROM course_ratings_summaries;

/* -------------------------------------------- */

USE mavenfuzzyfactorymini;

SELECT * FROM website_pageviews_non_normalized;

CREATE TABLE website_pageviews_normalized
SELECT
	website_pageview_id,
    created_at,
    website_session_id,
    pageview_url
FROM website_pageviews_non_normalized;

SELECT * FROM website_pageviews_normalized;

SELECT * FROM website_pageviews_non_normalized
WHERE website_session_id = 20;

CREATE TABLE website_session_normalized
SELECT DISTINCT
	website_session_id,
    session_created_at,
    user_id,
    is_repeat_session,
    utm_source,
    utm_content,
    device_type,
    http_referer
FROM website_pageviews_non_normalized;

/* ---------------------*/
SELECT * FROM website_session_normalized;
SELECT * FROM website_pageviews_normalized;
/* ---------------------*/

/* ----------------------------------------------------*/

USE onlinelearningschool;

SELECT * FROM course_ratings;

SELECT * FROM course_ratings_summaries;

SELECT * FROM courses;

CREATE TABLE course_ratings_normalized
SELECT
	rating_id,
	course_id,
    star_rating
FROM course_ratings;

/* ----------------------------------------------------*/








