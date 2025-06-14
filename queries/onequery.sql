WITH staff_revenue AS (
  SELECT
    s.store_id,
    p.staff_id,
    SUM(p.amount) AS revenue
  FROM payment p
  JOIN staff s ON p.staff_id = s.staff_id
  WHERE DATE_PART('year', p.payment_date) = 2017
  GROUP BY s.store_id, p.staff_id
),
ranked_staff AS (
  SELECT *,
         RANK() OVER (PARTITION BY store_id ORDER BY revenue DESC) AS rnk
  FROM staff_revenue
)
SELECT store_id, staff_id, revenue
FROM ranked_staff
WHERE rnk = 1;
