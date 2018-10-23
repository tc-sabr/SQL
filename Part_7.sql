USE Sakila;

-- Part 7a: display titles of movies starting with K & Q with language English

SELECT
	title
FROM 
	film AS f
WHERE
	title LIKE 'Q%' OR
    title LIKE 'K%' AND 
    language_id IN
	(
    SELECT 
		language_id
    FROM 
		language AS l
    WHERE 
		name LIKE 'English'
	)
;

-- Part 7b: display actors' name who appear in film Alone Trip
SELECT
	first_name
    , last_name
FROM
	actor
WHERE
	actor_id IN 
    (
    SELECT
		actor_id
	FROM
		film_actor AS fa
	WHERE
		film_id IN
        (
        SELECT
			film_id
		FROM
			film AS f
		WHERE
			title = 'Alone Trip'
		)
	)
;

-- Part 7c: collect name and email addresses of Canadian customers using joins

SELECT
	c.first_name
    , c.last_name
    , c.email
FROM
	customer AS c
LEFT JOIN address AS a ON a.address_id = c.address_id
LEFT JOIN city AS ci ON ci.city_id = a.city_id
LEFT JOIN country AS co ON co.country_id = ci.country_id
WHERE
	country = 'Canada'
;

-- Part 7d: identify movies categorized as family films

SELECT
	f.title
FROM
	film AS f
LEFT JOIN film_category AS fc ON fc.film_id = f.film_id
LEFT JOIN category AS c ON c.category_id = fc.category_id
WHERE
	name = 'family'
;

-- Part 7e: display most frequently rented movies in descending order

SELECT
	f.title AS 'Film Title'
    , COUNT(r.rental_id) AS Count
FROM
	film AS f
LEFT JOIN inventory AS i ON i.film_id = f.film_id
LEFT JOIN rental AS r ON r.inventory_id = i.inventory_id
GROUP BY
	f.title
ORDER BY
	Count DESC
;

-- Part 7f: display sales in dollar for each store

SELECT
	s.store_id AS Store_Number
    , SUM(p.amount) AS 'Total Sales'
FROM
	store AS s
LEFT JOIN staff AS st ON st.store_id = s.store_id
LEFT JOIN payment AS p ON p.staff_id = st.staff_id
GROUP BY
	Store_Number
;

-- Part 7g: display each store id, city and country

SELECT
	s.store_id AS 'Store ID'
    , c.city AS 'City'
    , co.country AS 'Country'
FROM
	store AS s
LEFT JOIN address AS a ON a.address_id = s.address_id
LEFT JOIN city AS c ON c.city_id = a.city_id
LEFT JOIN country AS co ON co.country_id = c.country_id
;

-- Part 7h: list top 5 genres in gross revenue in descending order

SELECT
	c.name AS Genre
    , SUM(p.amount) AS Gross_Revenue
FROM
	category AS c
LEFT JOIN film_category AS fc ON fc.category_id = c.category_id
LEFT JOIN inventory AS i ON i.film_id = fc.film_id
LEFT JOIN rental AS r ON r.inventory_id = i.inventory_id
LEFT JOIN payment AS p ON p.staff_id = r.staff_id
GROUP BY
	Genre
ORDER BY
	Gross_Revenue DESC
LIMIT 5
;