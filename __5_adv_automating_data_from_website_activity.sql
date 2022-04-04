USE mavenbearbuilders;

SELECT *
FROM website_sessions;

CREATE TABLE website_pageviews
(
	website_pageview_id BIGINT,
	created_at DATETIME,
    website_session_id BIGINT,
    pageview_url VARCHAR(100),
	PRIMARY KEY (website_pageview_id),
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id)
);

DESCRIBE website_sessions;
DESCRIBE website_pageviews;
