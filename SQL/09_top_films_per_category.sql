-- 9. What are the 3 most rented films in each category?

WITH film_rentals AS (
    SELECT c.name AS category,
           f.title,
           COUNT(r.rental_id) AS rentals
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON f.film_id = fc.film_id
    JOIN inventory i ON i.film_id = f.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
    GROUP BY c.name, f.title
),
ranked AS (
    SELECT category,
           title,
           rentals,
           DENSE_RANK() OVER (PARTITION BY category ORDER BY rentals DESC) AS rank_in_category
    FROM film_rentals
)
SELECT category AS "Category",
       rank_in_category AS "Rank",
       title AS "Title",
       rentals AS "Rentals"
FROM ranked
WHERE rank_in_category <= 3
ORDER BY "Category", "Rank", "Title";
