DROP DATABASE IF EXISTS AlsAquariums;

CREATE DATABASE AlsAquariums;

USE AlsAquariums;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
	CustomerId		INT				AUTO_INCREMENT 		PRIMARY KEY,
    CustomerLName 	VARCHAR(15)		NOT NULL,
    CustomerFName 	VARCHAR(15)		NOT NULL,
    CustPhone		CHAR(10) 		NOT NULL	);
    
INSERT INTO Customer
VALUES (1, 'Spiller', 'Gina', 2065556677),
	   (2, 'Morris', 'Steve', 2534447887),
       (3, 'Chavez', 'Mike', 2063334224),
       (4, 'Dean', 'Patricia', 7146069999);
       
SELECT * FROM Customer;
#---------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS Aquarium;

CREATE TABLE Aquarium (
	AquariumId 			INT						PRIMARY KEY,
    AquariumGallons 	SMALLINT(3)				NOT NULL,
    AquariumFinish  	ENUM('Wood','Black')	NOT NULL   );
    

INSERT INTO Aquarium
VALUES (1, 60, 'Wood'),
	   (2, 25, 'Wood'),
       (3, 10, 'Black'),
       (4, 18, 'Wood');  
       
SELECT * FROM Aquarium;

# --------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS Pump;

CREATE TABLE Pump (
	PumpId				INT 					PRIMARY KEY,
    PumpType			ENUM('Salt','Fresh')	NOT NULL,
    PumpFlowRateGPM 	SMALLINT(4)				NOT NULL   );
    

INSERT INTO Pump 
VALUES (1, 'Salt', 500),
	   (2, 'Fresh', 1000),
       (3, 'Fresh', 2000),
       (4, 'Salt', 800);
       
SELECT * FROM Pump;

# ---------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Aquarium;
DROP TABLE IF EXISTS Pump;
DROP TABLE IF EXISTS Fish;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS OrderFish;

DROP DATABASE IF EXISTS AlsAquariums;



