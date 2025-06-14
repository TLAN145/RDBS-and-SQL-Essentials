-- 1. Update film rental duration and rate
UPDATE film
SET rental_duration = 21,   -- 3 weeks
    rental_rate = 9.99
WHERE title = 'Inception';

-- 2. Find a customer with at least 10 rentals and 10 payments
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT r.rental_id) >= 10 AND COUNT(DISTINCT p.payment_id) >= 10;

-- 3. Update customer info (DO NOT update the address table, only reuse an existing address_id)
UPDATE customer
SET first_name = 'Temirlan',
    last_name = 'Askar',
    email = 'temirlan.askar@example.com',
    address_id = 10,
    create_date = CURRENT_DATE
WHERE customer_id = 25;
