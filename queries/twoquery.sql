SELECT
  f.title,
  COUNT(r.rental_id) AS rental_count,
  CASE
    WHEN f.rating = 'G' THEN 'All Ages'
    WHEN f.rating = 'PG' THEN '7+'
    WHEN f.rating = 'PG-13' THEN '13+'
    WHEN f.rating = 'R' THEN '17+'
    ELSE 'Unknown'
  END AS expected_age
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;
