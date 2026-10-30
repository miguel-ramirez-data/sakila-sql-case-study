-- 1. How many films exist per category?

SELECT c.name AS "Category", COUNT(f.film_id) AS "Films count"
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name
ORDER BY "Films count" DESC;
