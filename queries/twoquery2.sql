WITH film_rentals AS (
  SELECT
    f.film_id,
    f.title,
    f.rating,
    COUNT(r.rental_id) AS rental_count
  FROM film f
  JOIN inventory i ON f.film_id = i.film_id
  JOIN rental r ON r.inventory_id = i.inventory_id
  GROUP BY f.film_id
),
ranked AS (
  SELECT *,
         DENSE_RANK() OVER (ORDER BY rental_count DESC) AS rnk
  FROM film_rentals
)
SELECT
  title,
  rental_count,
  CASE
    WHEN rating = 'G' THEN 'All Ages'
    WHEN rating = 'PG' THEN '7+'
    WHEN rating = 'PG-13' THEN '13+'
    WHEN rating = 'R' THEN '17+'
    ELSE 'Unknown'
  END AS expected_age
FROM ranked
WHERE rnk <= 5;
