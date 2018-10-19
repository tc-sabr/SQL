USE Sakila;

-- Part 6a: use join to dsiplay first, last & address of staff
SELECT
	staff.first_name
    , staff.last_name
    , address.address
FROM
	staff
LEFT JOIN address ON address.address_id = staff.address_id
;