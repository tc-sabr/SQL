USE Sakila;

-- Part 8a: create a view for top five gross revenue by genre

CREATE VIEW `top_five_genres` AS SELECT
	c.`name` AS Genre
    , SUM(p.`amount`) AS Gross_Revenue
FROM
	`category` AS c
LEFT JOIN `film_category` AS fc ON fc.`category_id` = c.`category_id`
LEFT JOIN `inventory` AS i ON i.`film_id` = fc.`film_id`
LEFT JOIN `rental` AS r ON r.`inventory_id` = i.`inventory_id`
LEFT JOIN `payment` AS p ON p.`staff_id` = r.`staff_id`
GROUP BY
	Genre
ORDER BY
	Gross_Revenue DESC
LIMIT 5
;

-- Part 8b: display the view just created

SELECT * FROM `top_five_genres`;

-- Part 8c: write a query to delete top_five_genre view

DROP VIEW top_five_genres;
