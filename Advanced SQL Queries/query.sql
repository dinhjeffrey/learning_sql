-- where release_year is 2006 and rental_duration is 6 days
SELECT *
FROM film
WHERE release_year=2006
AND rental_duration=6;

-- where release_year is 2006 or rental_duration is 6 days
SELECT *
FROM film
WHERE release_year=2006
OR rental_duration=6;

-- where release_year is 2006 and rental_duration is not 6 days
SELECT *
FROM film
WHERE release_year=2006
AND NOT rental_duration=6;

-- where rental_duration is between 2 and 6 days
SELECT *
FROM film
WHERE rental_duration>=2
AND rental_duration<=6;

SELECT *
FROM film
WHERE rental_duration BETWEEN 2 AND 6;

-- where length is equal to 160 minutes or rental_duration is between 2 and 6 days
SELECT *
FROM film
WHERE length=160 
OR rental_duration BETWEEN 2 AND 6;

-- while converting length of movie from minute to hour
SELECT film_id, title, length,
round((length/60.0), 2) length_in_hour_round
FROM film;

-- where the length of the movie is over 2 hours
SELECT film_id, title, length,
round((length/60.0), 2) length_in_hour_round
FROM film
WHERE length > 120;

-- while converting rental_rate to nearest higher integer 
SELECT film_id, title, rental_rate,
ceiling(rental_rate) rental_rate_new
FROM film;

-- Find area of the store with diameter 500 feet
/*
Area of Circle = PI * (radius)^2
Area of Circle = PI * (diameter/2)^2
*/
SELECT PI() * (500/2)^2 AS AreaOfCircle;

-- while combining first_name and last_name in single column
SELECT first_name, last_name,
first_name || ' ' || last_name AS full_name
FROM Actor;

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM Actor;

-- with extra column which will list the initials of the actor
SELECT first_name, last_name,
LEFT(first_name, 1) || LEFT(last_name, 1) AS Initials
FROM Actor;

-- where the length of the name is of 4 characters
SELECT first_name, last_name
FROM Actor
WHERE LENGTH(first_name) = 4
AND LENGTH(last_name) = 4;

-- while converting all the last name in the upper case
SELECT first_name, last_name,
UPPER(last_name) AS UpperLast
FROM Actor;

-- while replacing character a with character @ in column first_name
SELECT first_name,
REPLACE(first_name, 'a', '@') AS new_first_name
FROM Actor;

-- Retrieve all the rows  
SELECT *
FROM rental;

-- while displaying rental duration in days and hours
SELECT return_date - rental_date AS Duration
FROM rental;

-- where rental duration of movie is over 3 days
SELECT return_date - rental_date AS Duration
FROM rental
WHERE EXTRACT(days FROM return_date - rental_date) > 3;

-- where rental duration of movie is over 100 hours
SELECT return_date - rental_date AS Duration, EXTRACT(epoch FROM return_date - rental_date)/3600 AS Epoch
FROM rental
WHERE EXTRACT(epoch FROM return_date - rental_date)/3600 > 100;

-- while adding an extra column with fix return date as 7 days from rental
SELECT rental_date,
rental_date + interval '7 day' AS new_return_date
FROM rental;

-- Display the number of total rentals in history
SELECT COUNT(*)
FROM rental;

-- Display the first ever rental and the latest rental
SELECT MIN(rental_date) AS FirstDate,
MAX(rental_date) AS LastDate
FROM rental;

-- Find out total rental payment collected from customers
SELECT SUM(amount) AS Total_payment
FROM payment;

-- Code 1: SELECT 30 !
SELECT 30 ! AS Answer;

SELECT CAST(30 AS bigint) ! AS new_ans; -- CAST uses bigint data type

-- Code 2: SELECT ROUND (4,5)
SELECT ROUND(4,5) AS ans;

SELECT ROUND(CAST(4 AS numeric), 5) AS new_ans; -- ROUND uses numeric data type

SELECT ROUND(4.0,5) AS ans; -- 4.0 is numeric data type, don't need to cast 

-- Code 3: SELECT SUBSTR('4321', 2); 
SELECT SUBSTR('4321', 2) AS ans; -- read all following numbers starting on position 2. '4321' is of data type varchar
SELECT SUBSTR(CAST('4321' AS text), 2) AS new_ans; -- SUBSTR uses text data type

-- Code 1: SELECT text 'Plural' || 'sight';
SELECT text 'Plural' || 'sight' AS MyAnswer; -- text

-- Code 2: SELECT @ '-4.5' AS "abs";
SELECT @ '-5.5' AS MyAnswer; -- double precision

SELECT @ '-5.5e500' AS MyAnswer; -- error: too large for double precision

-- Code 3: SELECT 1.2 AS "numeric" UNION SELECT 1;
SELECT 1.2 AS MyAnswer UNION SELECT 1; -- numeric

-- TRANSACTIONS

CREATE TABLE "Accounts"
(
"ID" integer,
"Name" character varying,
"Amount" integer
);

INSERT INTO "Accounts" ("ID", "Name", "Amount")
VALUES(1, 'Beth', 100);
INSERT INTO "Accounts" ("ID", "Name", "Amount")
VALUES(2, 'Troy', 200);
INSERT INTO "Accounts" ("ID", "Name", "Amount")
VALUES(3, 'Pinal', 300); 

SELECT *
FROM "Accounts";

TRUNCATE "Accounts";

UPDATE "Accounts"
SET "Amount" = "Amount" - 100
WHERE "Name" = 'Beth';

UPDATE "Accounts"
SET "Amount" = "Amount" + 100
WHERE "Name" = 'Troy';

-- Combining withdraw and deposit to create transactions
BEGIN;

	UPDATE "Accounts"
	SET "Amount" = "Amount" - 100
	WHERE "Name" = 'Beth';

SAVEPOINT FirstUpdate;

	SELECT *
	FROM "Accounts";

	-- Incorrect Update
	UPDATE "Accounts"
	SET "Amount" = "Amount" + 100
	WHERE "Name" = 'Pinal'

	SELECT *
	FROM "Accounts";

-- Rollback
ROLLBACK TO FirstUpdate;

	SELECT *
	FROM "Accounts";

	Update "Accounts"
	SET "Amount" = "Amount" + 100
	WHERE "Name" = 'Troy'

COMMIT;




































































