/* Here's a practical step-by-step guide to implementing an incremental load using SSIS, based on a 
scenario where you need to load data for a return policy that has a 15-day window. 
The idea is to load only the orders or returns that fall within the last 15 days into a destination table.*/


--SOURCE TABLES (ORDERS)
DROP TABLE IF EXISTS ORDERS
CREATE TABLE ORDERS
(
	ORDERID     INT PRIMARY KEY,
	PRODUCTID   INT,
	QUANTITY    INT,
	ORDERDATE   DATETIME,
	RETURNDATE  DATETIME
)

--DESTINATION TABLE (VALIDRETURNS)
DROP TABLE IF EXISTS VALIDRETURNS
CREATE TABLE VALIDRETURNS
( 
	ORDERID     INT PRIMARY KEY,
	PRODUCTID   INT,
	QUANTITY    INT,
	ORDERDATE   DATETIME,
	RETURNDATE  DATETIME
)

--Populate the Source Table with Sample Data

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate, ReturnDate)
VALUES 
(1, 101, 5, '2024-09-01', '2024-09-05'),
(2, 102, 4, '2024-09-03', '2024-09-10'),
(3, 103, 3, '2024-09-05', NULL),
(4, 104, 2, '2024-09-10', '2024-09-20'),
(5, 105, 1, '2024-09-15', '2024-09-25');

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate, ReturnDate)
VALUES (6,106,6,'2024-08-01','2024-08-15')

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate, ReturnDate)
VALUES (7,107,7,'2024-09-06','2024-09-08')

SELECT *FROM ORDERS

SELECT 
	ORDERID,PRODUCTID,QUANTITY,ORDERDATE,RETURNDATE 
FROM ORDERS
WHERE RETURNDATE IS NOT NULL
AND RETURNDATE > DATEADD (DAY,-15,GETDATE())

SELECT *FROM VALIDRETURNS
