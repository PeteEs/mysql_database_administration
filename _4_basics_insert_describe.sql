USE mavenmoviesmini;

SELECT * FROM inventory_non_normalized;

DESCRIBE inventory_non_normalized;

INSERT INTO film (film_id, title, description, release_year, rental_rate, rating)
SELECT DISTINCT film_id, title, description, release_year, rental_rate, rating
FROM mavenmoviesmini.inventory_non_normalized;