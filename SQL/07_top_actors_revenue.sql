-- 7. Which actors have generated the most revenue through their films?

SELECT a.first_name || ' ' || a.last_name AS "Actor Name",
       SUM(p.amount) AS "Total Revenue"
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY "Actor Name"
ORDER BY "Total Revenue" DESC
LIMIT 10;
