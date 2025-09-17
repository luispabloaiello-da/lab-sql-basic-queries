-- Setting the working database
USE sakila;

-- Display all available tables in the Sakila database.
SHOW TABLES;

-- Retrieve all the data from the tables actor, film and customer.
select * from sakila.actor;
select * from sakila.film;
select * from sakila.customer;
select * from sakila.language;
select * from sakila.staff;
select * from store;
select * from sakila.rental;
select * from sakila.inventory;
select * from sakila.rental;
select * from sakila.actor;

-- 3.1 Titles of all films from the film table
select title from sakila.film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
select name as language from sakila.language as l
	where l.language_id in (
select distinct language_id from sakila.film as f);

-- 3.3 List of first names of all employees from the staff table
select first_name from sakila.staff;

-- Retrieve unique release years.
select distinct release_year as year from sakila.film;

-- 5.1 Determine the number of stores that the company has.
select count(store_id) from sakila.store;

-- 5.2 Determine the number of employees that the company has.
select count(*) from sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
select count(distinct(inventory_id)) AS Rented, ((select count(film_id) from sakila.inventory) - count(distinct(inventory_id))) as Available from sakila.rental;

select count(film_id) from sakila.inventory;

-- 5.4 Determine the number of distinct last names of the actors in the database.
select COUNT(distinct(last_name)) from sakila.actor;

-- Retrieve the 10 longest films.
select * from sakila.film order by length DESC limit 10;

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * FROM sakila.actor WHERE first_name LIKE 'SCARLETT%';
-- SELECT *, LOWER(A2), UPPER(A3) FROM bank.district

-- BONUS:

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT * FROM sakila.film WHERE length > 100 and title LIKE '%ARMAGEDDON%';

-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT * FROM sakila.film WHERE special_features LIKE '%Behind the Scenes%';




