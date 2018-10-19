USE Sakila;

-- Part 3a: create column description in table actor using BLOB
ALTER TABLE actor
ADD COLUMN description BLOB AFTER last_name
;

-- Part 3b: delete description column just created
ALTER TABLE actor
DROP COLUMN description
;