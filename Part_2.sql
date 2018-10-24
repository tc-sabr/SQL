USE Sakila;

-- Part 2a: find ID, first name, last name when only knowing first name is Joe
SELECT
	actor_id
    , first_name
    , last_name
FROM
	actor
WHERE
	first_name LIKE 'Joe'
;

-- Part 2b: find actors whose last name contains GEN
SELECT
	first_name
    , last_name
FROM
	actor
WHERE
	last_name LIKE '%GEN%'
;

-- Part 2c: fins actors whose last name contains LI and order last name then first name
SELECT
	first_name
    , last_name
FROM
	actor
WHERE
	last_name LIKE '%LI%'
ORDER BY
	last_name
    , first_name
;

-- Part 2d: use in to display id and country of Afghanistan, Bangladesh, and China
SELECT
	country_id
    , country
FROM
	country
WHERE 
	country IN ('Afghanistan', 'Bangladesh', 'China')
;