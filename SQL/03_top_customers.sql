-- 3. Who are the top 10 customers by total spending?

SELECT c.customer_id, c.first_name, c.last_name,
       SUM(p.amount) AS "Total spent", COUNT(p.payment_id) AS "Payments Count"
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY "Total spent" DESC
LIMIT 10;
