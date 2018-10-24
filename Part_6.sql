USE Sakila;

-- Part 6a: use join to display first, last & address of staff
SELECT
	s.first_name
    , s.last_name
    , a.address
FROM
	staff AS s
LEFT JOIN address AS a ON a.address_id = s.address_id
;

-- Part 6b: use join to give total amount rung up by each staff in August 2005
SELECT
	CONCAT(s.first_name, ' ', s.last_name) AS Staff_Name
    , SUM(p.amount) AS Amount
FROM
	staff AS s
JOIN payment AS p ON p.staff_id = s.staff_id
WHERE
	YEAR(payment_date) = 2005 AND MONTH(payment_date) = 8
GROUP BY 
	Staff_Name
;

-- Part 6c: list each film & # actors listed
SELECT
	f.title
    , COUNT(fa.actor_id) AS Count
FROM
	film AS f
JOIN film_actor AS fa ON fa.film_id = f.film_id
GROUP BY
	f.title
;

-- Part 6d: # copies of Hunchback Impossible in inventory
SELECT
	f.title AS Title
    , COUNT(i.inventory_id) AS Copies
FROM
	film AS f
JOIN inventory AS i ON i.film_id = f.film_id
WHERE
	title = 'Hunchback Impossible'
GROUP BY
	Title
;

-- Part 6e: list total paid by each customer alphabetical by last name
SELECT
	c.first_name AS First_Name
    , c.last_name AS Last_Name
    , SUM(p.amount) AS 'Total Amount Paid'
FROM
	customer AS c
JOIN payment AS p ON p.customer_id = c.customer_id
GROUP BY
	c.customer_id
ORDER BY
	Last_Name
;