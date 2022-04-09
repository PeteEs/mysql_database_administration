USE survey;

SELECT *
FROM salary_survey;

CREATE VIEW country_averages AS
SELECT
	country,
    COUNT(*) AS respondents,
    AVG(years_experience) AS yrs_experience,
    AVG(CASE WHEN is_manager = 'Yes' THEN 1 ELSE 0 END) AS pct_mgrs,
    AVG(CASE WHEN education_level = 'Masters' THEN 1 ELSE 0 END) AS pct_masters
FROM salary_survey
GROUP BY 1
ORDER BY 2 DESC;
    
SELECT * FROM country_averages;

-- ---------------------------------------------------
-- task 1:

USE mavenbearbuilders;

CREATE TABLE website_sessions(
	website_session_id BIGINT,
    created_at DATETIME,
    user_id BIGINT,
    is_repeat_session INT,
    utm_source VARCHAR(50),
    utm_campaign VARCHAR(50),
	utm_content VARCHAR(50),
    device_type VARCHAR(25),
    http_referer VARCHAR(50),
    PRIMARY KEY (website_session_id)
);

SELECT
	COUNT(*) AS total_records FROM website_sessions;

SELECT *
FROM website_sessions;

-- ---------------------------------------------------
-- task 2:

DROP VIEW monthly_sessions;

CREATE VIEW monthly_sessions AS
SELECT 
	YEAR(created_at) AS yr,
	MONTH(created_at) AS mo,
	utm_source,
	utm_campaign,
    COUNT(website_session_id) AS number_of_sessions
FROM website_sessions
GROUP BY
	1,2,3,4;

SELECT * FROM monthly_sessions;
































