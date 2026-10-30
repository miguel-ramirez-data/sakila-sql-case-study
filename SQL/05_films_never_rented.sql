-- 5. Which films have never been rented?

SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.rental_id IS NULL
GROUP BY f.film_id, f.title
ORDER BY f.title;
