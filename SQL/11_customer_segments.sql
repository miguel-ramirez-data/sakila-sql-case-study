-- 11. How concentrated is demand? Customers split into quartiles by number of rentals.

WITH customer_rentals AS (
    SELECT customer_id,
           COUNT(*) AS rentals
    FROM rental
    GROUP BY customer_id
),
segmented AS (
    SELECT customer_id,
           rentals,
           NTILE(4) OVER (ORDER BY rentals DESC) AS quartile
    FROM customer_rentals
)
SELECT quartile AS "Quartile",
       COUNT(*) AS "Customers",
       MIN(rentals) AS "Min Rentals",
       MAX(rentals) AS "Max Rentals",
       ROUND(AVG(rentals), 1) AS "Avg Rentals",
       ROUND(100.0 * SUM(rentals) / SUM(SUM(rentals)) OVER (), 1) AS "Share of Rentals %"
FROM segmented
GROUP BY quartile
ORDER BY quartile;
