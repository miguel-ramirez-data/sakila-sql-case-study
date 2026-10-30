-- 4. What is the monthly revenue trend in 2007?

SELECT EXTRACT(MONTH FROM payment_date) AS "Month",
       SUM(amount) AS "Monthly Revenue"
FROM payment
WHERE EXTRACT(YEAR FROM payment_date) = 2007
GROUP BY "Month"
ORDER BY "Month";
