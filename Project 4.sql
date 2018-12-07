# 1.1

# 1: This query fails because ID number 1 already exists. We are adding another 1.
INSERT INTO city
	   (ID, Name, CountryCode, District, Population)
VALUES (1  , Foo,    ABW,         Whee,   100000);


# 2: ZZZ is not in Country table and thus cannot be added to countrylanguage, due to foreign key constraint
INSERT INTO countrylanguage
	   (CountryCode, Language, IsOfficial, Percentage)
VALUES ( 'ZZZ',     'Zebraese',    'T',        34.2);


# 3: Code is a PK in the country table. CountryCode in coutnrylanguage needs to be deleted before deleting 
# Code in country table.
DELETE FROM country
WHERE Code = 'ABW';



# 4: Continent's data type is ENUM which means every cell in that column needs to be filled with
# one of the 7 choices in ENUM and Minionland is not one of them. 
UPDATE country
SET Continent = 'Minionland'
WHERE Code = 'ABW';


# 5: Population can not be NULL. Its data type is INT (11) which means there has to be number there.
INSERT INTO city
VALUES (DEFAULT, 'Whoville', 'ABW', 'DistrictX', NULL);



# 1.2:

# 6:
INSERT INTO city
	   (ID   , Name, CountryCode, District, Population)
VALUES (4080  , 'Impact' ,  'USA',      'Texas' ,     43);



# 7: using PK
DELETE FROM city
WHERE ID = '4080';


# 8: 
INSERT INTO city
VALUES (NULL,'Impact', 'USA'  , 'Texas'   , 43),
       (NULL,'Greenville', 'USA', 'Idaho', 500),
       (NULL,'Cheese', 'USA'  , 'Minnesota', 800),
       (NULL,'Steak', 'USA',   'Philly', 1000),
       (NULL,'Coffee', 'USA', 'Washington', 1500);
       
       
# 9:
UPDATE city
SET Population = 44
WHERE ID = 4081;



# 10:
UPDATE city
SET Population = Population + 1
WHERE ID = 4081;



# 2.1

# 11: 
VIN Number = CHAR(17)

# 12:
MSRP = INT(5) UNSIGNED

# 13:
Estimated MPG, City = TINYINT(2) UNSIGNED

# 14:
Consumer Rating = DECIMAL(2,1)

# 15:
Sold = ENUM('Y','N')

# 16: I looked at makes of cars and came up with a number a little longer than the longest make
# in case newer makes have longer names
Make = VARCHAR(18)

# 17:
Color = ENUM('White', 'Silver', 'Black', 'Yellow', 'Red', 'Green', 'Blue')

# 18:
Options = SET('Stereo Upgrade', 'Roof Rack', 'Mud Gaurds', 'Wheel Upgrade', 'Nav System')

# 19: 
Sales Ratio = DOUBLE(3,1)

# 20:
Purchase Date = DATETIME('yyyy-mm-dd hh:mm:ss')

