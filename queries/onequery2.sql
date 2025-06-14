-- First, calculate revenue per staff per store
WITH staff_revenue AS (
  SELECT s.store_id, p.staff_id, SUM(p.amount) AS revenue
  FROM payment p
  JOIN staff s ON p.staff_id = s.staff_id
  WHERE DATE_PART('year', p.payment_date) = 2017
  GROUP BY s.store_id, p.staff_id
),

-- Then, find the maximum revenue per store
max_revenue_per_store AS (
  SELECT store_id, MAX(revenue) AS max_revenue
  FROM staff_revenue
  GROUP BY store_id
)

-- Finally, join to get the staff member(s) who achieved it
SELECT sr.store_id, sr.staff_id, sr.revenue
FROM staff_revenue sr
JOIN max_revenue_per_store mr
  ON sr.store_id = mr.store_id AND sr.revenue = mr.max_revenue;
