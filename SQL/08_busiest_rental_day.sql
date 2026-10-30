-- 8. What are the busiest rental days of the week?

SELECT TO_CHAR(r.rental_date, 'Day') AS "Weekday",
       COUNT(*) AS "Rental Count"
FROM rental r
GROUP BY TO_CHAR(r.rental_date, 'Day')
ORDER BY "Rental Count" DESC;
