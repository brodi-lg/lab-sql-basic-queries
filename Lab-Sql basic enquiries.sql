USE sakila;

-- 1. Retrieve the tables
SHOW TABLES;


-- 2. Retrieve all the data from the tables `actor`, `film` and `customer`.

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3. Retrieve the following columns columns
SELECT title FROM film;

SELECT name AS language 
FROM language;

DESCRIBE staff;
SELECT first_name 
FROM staff;

-- 4. Retrieve unique release years.
SELECT *
FROM film;
SELECT DISTINCT release_year
FROM film
ORDER BY release_year;

--  5. Counting records for database insights:
-- Determine the number of stores that the company has
SELECT * 
FROM store;
DESCRIBE store;
SELECT DISTINCT store_id AS store_count 
FROM store;

-- Determine the number of employees that the company has.
SELECT * 
FROM staff;
DESCRIBE staff;
SELECT DISTINCT staff_id AS employees
FROM staff;

-- Determine how many films are available for rent and how many have been rented
SELECT *
FROM rental, inventory;

-- how many films are availebl for rent 
SELECT COUNT(DISTINCT i.film_id) AS available_for_rent
FROM inventory i
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

-- how many films have been rented
SELECT COUNT(DISTINCT i.film_id) AS rented_films
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE r.rental_id <= 2032;


-- the number of distinct last names of actors
SELECT * FROM actor;
SELECT COUNT(DISTINCT last_name) AS distinct_last_names
FROM actor;

-- 6. retrieve the ten longest films

SELECT *
FROM film;
SELECT title, length 
FROM film 
ORDER BY length DESC
LIMIT 10;

-- 7. filter first name by "Scarlett"
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'SCARLETT';

-- BONUS: all movies titled armageddon and length more than 100
SELECT title, length
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- BONUS: films that have behind the scenes
SELECT COUNT(*) AS films_with_behind_the_scenes
FROM film_text
WHERE description LIKE '%Behind the Scenes%';
