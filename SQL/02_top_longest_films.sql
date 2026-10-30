-- 2. What are the top 10 longest films in the catalog?

SELECT title AS "Title", length AS "Length"
FROM film
ORDER BY "Length" DESC
LIMIT 10;
