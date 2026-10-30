-- 6. What are the top 3 categories by revenue?

SELECT c.name AS "Category",
       SUM(p.amount) AS "Total revenue"
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON f.film_id = fc.film_id
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c.name
ORDER BY "Total revenue" DESC
LIMIT 3;
