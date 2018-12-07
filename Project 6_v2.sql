DROP DATABASE IF EXISTS AlsAquariums;

CREATE DATABASE AlsAquariums;

USE AlsAquariums;

CREATE TABLE Customer (
	CustomerId		INT				AUTO_INCREMENT 		PRIMARY KEY,
    CustomerLName 	VARCHAR(15)		NOT NULL,
    CustomerFName 	VARCHAR(15)		NOT NULL,
    CustPhone		CHAR(10) 		NOT NULL	);
    
    
CREATE TABLE Aquarium (
	AquariumId 			INT						PRIMARY KEY,
    AquariumGallons 	SMALLINT(3)				NOT NULL,
    AquariumFinish  	ENUM('Wood','Black')	NOT NULL   );


CREATE TABLE Pump (
	PumpId				INT 					PRIMARY KEY,
    PumpType			ENUM('Salt','Fresh')	NOT NULL,
    PumpFlowRateGPM 	SMALLINT(4)				NOT NULL   );
    

CREATE TABLE Fish (
	FishId		INT						PRIMARY KEY,
    FishName	VARCHAR(20)				NOT NULL,
    FishType	ENUM('Salt','Fresh')	NOT NULL    );
    
    
CREATE TABLE `Order` (
	OrderNum		INT			AUTO_INCREMENT 		PRIMARY KEY,
    AquariumId 		INT 		REFERENCES Aquarium (AquariumId),
    PumpId 			INT 		REFERENCES Pump (PumpId),
    CustomerId   	INT			REFERENCES Customer (CustomerId)	);
    
    
CREATE TABLE OrderFish (
	OrderFishCount		TINYINT(2)			NOT NULL,
    OrderNum 		INT,
    FishId			INT,
    PRIMARY KEY (OrderNum, FishId),
    CONSTRAINT	FOREIGN KEY	FK_Order_Fish__Order
		 (OrderNum)	REFERENCES `Order` (OrderNum)
         ON DELETE RESTRICT,
	CONSTRAINT	FOREIGN KEY	FK_Order_Fish__Fish
		 (FishId)	REFERENCES Fish (FishId)
         ON DELETE RESTRICT		);
         



CREATE UNIQUE INDEX Customer_CUSTPHONE
	ON Customer (CUSTPHONE ASC);
    
DROP INDEX Customer_CUSTPHONE ON Customer;


INSERT INTO Customer
VALUES (1, 'Spiller', 'Gina', 2065556677),
	   (2, 'Morris', 'Steve', 2534447887),
       (3, 'Chavez', 'Mike', 2063334224),
       (4, 'Dean', 'Patricia', 7146069999);
       

INSERT INTO Aquarium
VALUES (1, 60, 'Wood'),
	   (2, 25, 'Wood'),
       (3, 10, 'Black'),
       (4, 18, 'Wood');
       
       
INSERT INTO Pump 
VALUES (1, 'Salt', 500),
	   (2, 'Fresh', 1000),
       (3, 'Fresh', 2000),
       (4, 'Salt', 800);
       

INSERT INTO Fish
VALUES (1, 'Freckles', 'Salt'),
	   (2, 'Spike', 'Fresh'),
       (3, 'Peach', 'Fresh'),
       (4, 'Crimson', 'Salt');
       

INSERT INTO `Order`
VALUES (1, 4, 3, 1),
       (2, 3, 2, 2),
       (3, 2, 1, 3),
       (4, 1, 4, 4);
       
       
INSERT INTO OrderFish
VALUES (5, 1, 2),
       (10, 2, 3),
       (7, 3, 4),
       (8, 4, 1);
       
       
SELECT * FROM Customer;

SELECT * FROM Aquarium;

SELECT * FROM Pump;

SELECT * FROM Fish;

SELECT * FROM `Order`;

SELECT * FROM OrderFish;

SELECT o.OrderNum, c.CustomerLName, c.CustPhone, f.FishName, p.PumpType, a.AquariumFinish
FROM `Order` o
	JOIN Aquarium a   ON o.AquariumId = a.AquariumId
    JOIN Pump p       ON o.PumpId = p.PumpId
    JOIN Customer c   ON o.CustomerId = c.CustomerId
    JOIN OrderFish of ON o.OrderNum = of.OrderNUm
    JOIN Fish f       ON of.FishId = f.FishId
WHERE CustomerLName LIKE '%a%'
ORDER BY CustomerLName ASC;


SELECT a.AquariumGallons, o.OrderNum, p.PumpFlowRateGPM
FROM Aquarium a
	JOIN `Order` o ON o.AquariumId = a.AquariumId
    JOIN Pump p ON o.PumpId = p.PumpId
WHERE AquariumGallons < 60;


    
	