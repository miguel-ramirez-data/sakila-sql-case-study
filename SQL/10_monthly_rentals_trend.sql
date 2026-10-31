-- 10. How does rental volume change month over month?

WITH monthly AS (
    SELECT DATE_TRUNC('month', rental_date)::date AS month,
           COUNT(*) AS rentals
    FROM rental
    GROUP BY DATE_TRUNC('month', rental_date)
)
SELECT TO_CHAR(month, 'YYYY-MM') AS "Month",
       rentals AS "Rentals",
       rentals - LAG(rentals) OVER (ORDER BY month) AS "Change vs Previous",
       ROUND(100.0 * (rentals - LAG(rentals) OVER (ORDER BY month))
             / LAG(rentals) OVER (ORDER BY month), 1) AS "Change %",
       SUM(rentals) OVER (ORDER BY month) AS "Running Total"
FROM monthly
ORDER BY month;
