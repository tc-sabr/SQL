USE Sakila;

-- Part 1a: Display first & last name of actors
SELECT 
	first_name, last_name
FROM 
	actor
;

-- Part 1b: display first & last name together in column Actor Name
SELECT 
	first_name
    , last_name
    , UPPER(CONCAT(first_name, ' ', last_name)) as 'Actor Name'
FROM
	actor
;

