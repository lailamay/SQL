# 1.1

# 1: 
SELECT Name, District, Population
FROM city;

# 2:
SELECT Name AS Country, SurfaceArea AS Area, Continent AS Continent 
FROM country;

# 3:
SELECT Name, ROUND(LifeExpectancy) AS LifeSpan
FROM country;

# 4:
SELECT Name, Population
FROM country
WHERE Population >= 15000000;

# 5:
SELECT DISTINCT Language 
FROM countrylanguage;

# 6:
SELECT Name
FROM country
WHERE GNP > 200000 OR GNPOld > 200000;

# 7:
SELECT language
FROM countrylanguage
WHERE IsOfficial = 'T' AND Percentage >= 90;

# 8:
SELECT Name, GovernmentForm
FROM country
WHERE GovernmentForm IN ('Republic', 'Constitutional Monarchy');

# 9:
SELECT Name, IndepYear
From country
WHERE IndepYear BETWEEN 1900 AND 1950;

# 10:
SELECT DISTINCT Language
FROM countryLanguage
WHERE Language LIKE 'NE%';

# 11:
SELECT Name, Region, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NULL;

# 12:
SELECT DISTINCT Language
FROM countrylanguage
WHERE Language LIKE 'Y%'
ORDER BY Language ASC;


# 13:
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy >= 80
ORDER BY LifeExpectancy DESC;

# 14:
SELECT Name, District, Population
FROM city
WHERE Name = District AND Population < 40000
ORDER BY Population DESC;

# 15:
SELECT Name, SurfaceArea, Population
FROM country
WHERE Region = 'Caribbean'
 AND (Population < 100000 OR SurfaceArea < 500);


# 1.2
/*
I would create a table named postalcodes and have 4 fields inside the table. The four fields are as
follows: ID INT (11), as the primary key and "NN", postal_code CHAR (6)  and "NN",
num_households INT (8), and is_active BOOLEAN. The two columns in the table that can not be 
NULL are ID and postal_code. We need to know those two pieces of information, however we
might not know the number of households or if the postalcode is actually in use or not.
The relationship between the city and postalcodes table is one to many. One city has 
many postalcodes. Therefore, I would add one more field to the city table. 
postal_code_id CHAR (6) as a foreign key. this field would relate the two tables together.

*/






