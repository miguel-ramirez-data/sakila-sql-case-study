-- 13. What are the top 5 categories in each store, and what share of the store's rentals do they represent?

WITH store_category AS (
    SELECT i.store_id,
           c.name AS category,
           COUNT(*) AS rentals
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film_category fc ON fc.film_id = i.film_id
    JOIN category c ON c.category_id = fc.category_id
    GROUP BY i.store_id, c.name
),
ranked AS (
    SELECT store_id,
           category,
           rentals,
           ROUND(100.0 * rentals / SUM(rentals) OVER (PARTITION BY store_id), 1) AS share_pct,
           RANK() OVER (PARTITION BY store_id ORDER BY rentals DESC) AS rank_in_store
    FROM store_category
)
SELECT store_id AS "Store",
       rank_in_store AS "Rank",
       category AS "Category",
       rentals AS "Rentals",
       share_pct AS "Share of Store %"
FROM ranked
WHERE rank_in_store <= 5
ORDER BY "Store", "Rank";
