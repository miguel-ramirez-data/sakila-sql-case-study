-- 12. Which customers rent most often? Average days between consecutive rentals.

WITH rental_gaps AS (
    SELECT customer_id,
           rental_date,
           rental_date - LAG(rental_date) OVER (
               PARTITION BY customer_id ORDER BY rental_date
           ) AS gap
    FROM rental
    WHERE rental_date < '2006-01-01'   -- 2005 activity; Feb 2006 is a separate small batch
),
customer_gaps AS (
    SELECT customer_id,
           COUNT(*) AS rentals,
           ROUND(AVG(EXTRACT(EPOCH FROM gap) / 86400)::numeric, 2) AS avg_days_between
    FROM rental_gaps
    GROUP BY customer_id
)
SELECT c.first_name || ' ' || c.last_name AS "Customer",
       cg.rentals AS "Rentals (2005)",
       cg.avg_days_between AS "Avg Days Between Rentals"
FROM customer_gaps cg
JOIN customer c ON c.customer_id = cg.customer_id
ORDER BY "Avg Days Between Rentals", "Rentals (2005)" DESC
LIMIT 10;
