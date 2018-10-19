USE Sakila;

-- Part 4a: list last names of actors and how many have that last name
SELECT
	last_name AS 'Last Name'
	, COUNT(last_name) AS Count
FROM
	actor
GROUP BY
	last_name
;

-- Past 4b: list last name count only for quantity greater than two
SELECT
	last_name AS 'Last Name'
	, COUNT(last_name) AS Count
FROM
	actor
GROUP BY
	last_name
HAVING
	Count >= 2
;

-- Part 4c: correct GROUCHO WILLIAMS to HARPO WILLIAMS
UPDATE 
	actor
SET
	first_name = 'HARPO'
WHERE 
	first_name = 'GROUCHO' AND last_name = 'WILLIAMS'
;

-- Part 4d: first name is HARPO change to GROUCHO
UPDATE 
	actor
SET
	first_name = 'GROUCHO'
WHERE 
	first_name = 'HARPO' AND last_name = 'Williams'
;