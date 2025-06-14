-- Insert the film
INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
VALUES (
    'Inception',
    'A mind-bending thriller about dreams within dreams.',
    2010,
    1,            -- Assuming 1 is English
    14,           -- 2 weeks
    4.99,
    148,
    19.99,
    'PG-13'
);

eded)

-- Insert actors
INSERT INTO actor (first_name, last_name) VALUES ('Leonardo', 'DiCaprio');
INSERT INTO actor (first_name, last_name) VALUES ('Joseph', 'Gordon-Levitt');
INSERT INTO actor (first_name, last_name) VALUES ('Elliot', 'Page');

-- Link actors to the film in film_actor
INSERT INTO film_actor (actor_id, film_id) VALUES (201, 1001);
INSERT INTO film_actor (actor_id, film_id) VALUES (202, 1001);
INSERT INTO film_actor (actor_id, film_id) VALUES (203, 1001);

-- Add the film to inventory at store_id = 1
INSERT INTO inventory (film_id, store_id) VALUES (1001, 1);
