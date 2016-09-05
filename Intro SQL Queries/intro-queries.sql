SELECT first_name, count(*) countFirstName
FROM Actor
WHERE actor_id > 5
GROUP BY first_name
ORDER BY first_name;

SELECT first_name, count(*) countFirstName
FROM Actor
WHERE actor_id > 5
GROUP BY first_name
HAVING count(*) > 3
ORDER BY first_Name;

SELECT first_name, last_name, title
FROM Actor a
INNER JOIN Film_Actor fa ON a.actor_id = fa.actor_id
INNER JOIN Film f ON fa.film_id = f.film_id;

CREATE TABLE actornew 
(
  actor_id integer NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  last_update timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT actornew_pkey PRIMARY KEY (actor_id)
);

SELECT *
FROM actornew;

INSERT INTO actornew(
	    actor_id, first_name, last_name, last_update)
	VALUES(1, 'Penelope', 'Guiness', '2013-05-26 14:47:57.62');


INSERT INTO actornew(
	    actor_id, first_name, last_name, last_update)
	VALUES  (2, 'Ash', 'Ketchum', '2013-05-26 14:47:57.62'),
		(3, 'Misty', 'Waterflower', '2013-05-26 14:47:57.62'),
		(4, 'Brock', 'Harrison', '2013-05-26 14:47:57.62');

INSERT INTO actornew(
	    actor_id, first_name, last_name, last_update)
	    SELECT actor_id, first_name, last_name, last_update
	    FROM actor
	    WHERE actor_id > 4;

ALTER TABLE actornew
	ADD COLUMN "FilmCount" integer;


SELECT *
FROM actornew;

SELECT * 
FROM film;

SELECT a.actor_id, first_name, last_name, title
FROM Actor a
INNER JOIN Film_Actor fa ON a.actor_id = fa.actor_id
INNER JOIN Film f ON fa.film_id = f.film_id;

SELECT a.actor_id, count(title) FilmCount
FROM Actor a
INNER JOIN Film_Actor fa ON a.actor_id = fa.actor_id
INNER JOIN Film f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY a.actor_id;

UPDATE actornew
SET "FilmCount" = 19
WHERE "actor_id" = 2;

SELECT *
FROM actornew
ORDER BY actor_id;

UPDATE actornew
SET "FilmCount" = 
(SELECT count(title) FilmCount
FROM Actor a
INNER JOIN Film_Actor fa ON a.actor_id = fa.actor_id
INNER JOIN Film f ON fa.film_id = f.film_id
WHERE a.actor_id = actornew.actor_id -- link the two tables
GROUP BY a.actor_id),
last_update = now();

-- Remove rows with actor_id > 40
SELECT *
FROM actornew
WHERE "actor_id" > 40
ORDER BY actor_id;


-- Keep rows with filmcount > 30
-- Remove rows with filmcount <= 30
SELECT *
FROM actornew
WHERE "FilmCount" <= 30
ORDER BY actor_id;

SELECT *
FROM actornew
WHERE "actor_id" > 40 AND "FilmCount" <= 30
ORDER BY actor_id;

DELETE
FROM actornew
WHERE "actor_id" > 40 AND "FilmCount" <= 30;

SELECT *
FROM actornew
ORDER BY actor_id;