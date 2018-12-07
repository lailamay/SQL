# Summary Queries

# 1:
USE sakila;

SELECT DATE(rental_date) AS RentalDate,
	COUNT(*) AS RentalCount
FROM rental
GROUP BY DATE(rental_date)
HAVING RentalCount >= 300;

# 2:
SELECT 
	last_name AS LastName, first_name AS FirstName,
    DATE_FORMAT(rental_date, "%M") AS rentalMonth, 
    DATE_FORMAT(rental_date, "%Y") AS rentalYear,
    COUNT(*) AS movieCount
FROM rental
	JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY 1, 2, 3, 4
ORDER BY 1 ASC, 5 DESC;

# Check to see total movie counts
SELECT COUNT(*)
FROM rental;

# 3:
SELECT DATE_FORMAT(payment_date, "%Y") AS paymentYear, DATE_FORMAT(payment_date, "%M") AS paymentMONTH,
	ROUND(SUM(amount),2) AS paymentTotal
FROM payment
GROUP BY 1, 2
ORDER BY 1 DESC, 2 DESC;


# 4:
SELECT CONCAT(last_name, ', ', first_name) AS customerName, district,
	COUNT(payment_date) AS paymentCount, SUM(amount) AS paymentTotal
FROM customer c
	JOIN payment p ON c.customer_id = p.customer_id
    JOIN address a ON c.address_id = a.address_id
GROUP BY 1, 2
HAVING paymentTotal > 170
ORDER BY paymentCount DESC;


# 5: 
SELECT COUNT(film_id) AS filmCount, name AS category
FROM film f JOIN film_category fc USING (film_id)
		  JOIN category c ON c.category_id = fc.category_id
GROUP BY 2
HAVING filmCount >= 61
ORDER BY 1 DESC;


# Subqueries

# 6:
SELECT country_id
FROM country
WHERE country LIKE "%united%";

SELECT city
FROM city c
WHERE city LIKE "%port%"
	AND c.country_id IN (SELECT country_id
						 FROM country
						 WHERE country LIKE "%united%")
ORDER BY city;


# 7:
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customer c 
 JOIN payment p ON p.customer_id = c.customer_id
WHERE c.customer_id IN ( SELECT p.customer_id
						FROM payment p
						WHERE p.amount > 11
                        )
GROUP BY 1, 2, 3, 4
ORDER BY 4;

SELECT p.customer_id
FROM payment p
WHERE p.amount > 11;


# 8:
SELECT film_id
FROM film
WHERE length >= 184;

SELECT DISTINCT c.name AS categoryName
FROM category c
	JOIN film_category fc
    ON c.category_id = fc.category_id
WHERE fc.film_id IN (SELECT film_id
			   FROM film
			   WHERE length >= 184
               )
ORDER BY 1;


# 9:
SELECT film_id
FROM film
WHERE title = 'Alone Trip';

SELECT DISTINCT city
FROM city c 
	JOIN address a   ON c.city_id = a.city_id
    JOIN store s     ON s.address_id = a.address_id
    JOIN inventory i ON i.store_id = s.store_id
WHERE film_id IN (SELECT film_id
                  FROM film
                  WHERE title = 'Alone Trip');


# 10:
SELECT customer_id
FROM customer
WHERE email LIKE "%mor%";

SELECT city
FROM city c JOIN address a 
	ON c.city_id = a.city_id
    JOIN customer cus
    ON a.address_id = cus.address_id
WHERE customer_id IN (SELECT customer_id
                      FROM customer
                      WHERE email LIKE "%mor%"
                      );

