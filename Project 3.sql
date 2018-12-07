# 1.1

# 1:
SELECT c.Name, cl.Language, cl.Percentage
FROM countrylanguage cl
	JOIN country c
    ON cl.CountryCode = c.Code
WHERE cl.Percentage > 90
ORDER BY cl.Percentage ASC;

# 2:
SELECT Name, Language, Percentage
FROM country, countrylanguage
WHERE (CountryCode = Code) AND
	Percentage > 90
ORDER BY Percentage ASC;

# 3:
SELECT ci.Name AS City, c.Name AS Country
FROM city ci
	JOIN country c
    ON c.Code = ci.CountryCode
    JOIN countrylanguage cl
    ON cl.CountryCode = c.Code
WHERE cl.Language = 'Spanish' AND cl.Percentage >= 75
ORDER BY Country, City;

# 4:
SELECT c.Name, cl.Language, c.Population
FROM city c
	JOIN countrylanguage cl
    USING(CountryCode)
WHERE c.Population > 900000
ORDER BY c.Population DESC;

# 5:
SELECT c.Name, cl.Language, c.Population
FROM city c
	NATURAL JOIN countrylanguage cl
WHERE c.Population > 900000
ORDER BY c.Population DESC;

# 6: Outer Join
SELECT c.Name, cl.Language
FROM city c
	 LEFT OUTER JOIN countrylanguage cl
     ON c.CountryCode = cl.CountryCode;
    
# 7: Outer Join
SELECT c.Name, cl.Language
FROM countrylanguage cl
	LEFT OUTER JOIN city c
    USING(CountryCode); 
    
# 8: Union
SELECT c.Name AS CountryName, 'Small' AS Size
FROM country c
WHERE c.Population < 1000000
UNION
SELECT c.Name AS CountryName, 'Medium' AS Size
FROM country c
WHERE c.Population >= 1000000 AND c.Population < 3000000
UNION
SELECT c.Name AS CountryName, 'Large' AS Size
FROM country c
WHERE c.Population >= 3000000
ORDER BY CountryName ASC;

# 9: Self Join
SELECT DISTINCT CONCAT(e.first_name, ' ', e.last_name) AS Employee,
	   CONCAT(mgrs.first_name, ' ', mgrs.last_name) AS '1st_Level Mgr',
       CONCAT(mgrs2.first_name, ' ',mgrs2.last_name) AS '2nd Level Mgr'
FROM employees e
	JOIN employees mgrs
    ON e.manager_id = mgrs.employee_id
    JOIN employees mgrs2 
    ON mgrs2.employee_id = mgrs.manager_id
ORDER BY e.last_name, e.first_name;



# 10: Cross Join
SELECT CONCAT(e1.first_name, ' ', e1.last_name) AS emp1,
 CONCAT(e2.first_name, ' ', e2.last_name) AS emp2
FROM employees e1 
CROSS JOIN employees e2
WHERE CONCAT(e1.first_name, ' ', e1.last_name) != CONCAT(e2.first_name, ' ', e2.last_name)
ORDER BY e1.last_name, e1.first_name;



# 11:
SELECT c.first_name, c.last_name, ci.city, a.district, a.postal_code
FROM customer c 
 JOIN address a ON a.address_id = c.address_id
 JOIN city ci ON ci.city_id = a.city_id
 JOIN country co ON co.country_id = ci.country_id
WHERE co.country = 'CHINA';


# 12: 
SELECT DISTINCT f.title, f.length
FROM film f
	JOIN film_actor fa 
    ON f.film_id = fa.film_id
    JOIN actor a
    ON a.actor_id = fa.actor_id
WHERE a.last_name = 'Johansson';


# 13:
SELECT f.title
FROM film f
	JOIN film_category fc
    ON f.film_id = fc.film_id
    JOIN category cat
    ON cat.category_id = fc.category_id
    JOIN language lan
    ON f.language_id = lan.language_id
WHERE lan.name = 'English'
 AND cat.name = 'Drama';
 
 
 # 1.2
 
 /*
 I would create a new table called Attractions. The relationship between 
 the Attractions table and city table is one to many. One attratction can 
 be in more than one city. I would use the PK in city table to create a 
 FK in Attractions table; That would be the first field. city_ID INT (11) and 
 it's "NN". Then three more fields: name CHAR (40) and it's "NN", 
 pop_rating ENUM (1,2,3,4,5,6,7,8,9,10) and it could be NULL, 
 opening_year DATE and it's "NN".
 */
 
  


    