-- Step 1: Remove film from rental, inventory, film_actor, and film tables

-- Step 1.1: Remove all rentals associated with this film
DELETE FROM rental
WHERE inventory_id IN (
    SELECT inventory_id FROM inventory WHERE film_id = 1001
);

-- Step 1.2: Remove inventory entries for this film
DELETE FROM inventory
WHERE film_id = 1001;

-- Step 1.3: Remove from film_actor table
DELETE FROM film_actor
WHERE film_id = 1001;

-- Step 1.4: Remove the film itself
DELETE FROM film
WHERE film_id = 1001;

-- Step 2: Remove records related to you as a customer, except from customer and inventory tables

-- Step 2.1: Delete rentals made by you
DELETE FROM payment_p2017_01
WHERE rental_id IN (
    SELECT rental_id FROM rental WHERE customer_id = 25
);

-- Step 2.2: Delete payments made by you
DELETE FROM rental
WHERE customer_id = 25;



-- Verify remaining data
-- SELECT * FROM customer WHERE customer_id = 25;
-- SELECT * FROM rental WHERE customer_id = 25;
-- SELECT * FROM payment WHERE customer_id = 25;
