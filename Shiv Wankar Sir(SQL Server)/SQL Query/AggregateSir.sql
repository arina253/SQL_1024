Shiv Wankar Sir, [6/14/2024 10:17 PM]
/**** Script for SelectTopNRows command from SSMS  ****/
SELECT * FROM [AdventureWorks2022].[Production].[Product]

1. The ABS() function returns the absolute value of a number.
Exa - SELECT Abs(-243.5) AS AbsNum;

2. The AVG() function returns the average value of an expression.
Note: NULL values are ignored.
Syntax : AVG(expression)

SELECT AVG(ListPrice) AS AvgListPrice FROM [Production].[Product]
WHERE ListPrice > 0

3. The COUNT() function returns the number of records returned by a select query.
Note: NULL values are not counted.
 Syntax : COUNT(expression

 SELECT * FROM [Production].[Product] WHERE ProductNumber IS NULL
 SELECT * FROM [Production].[Product] WHERE Color IS NULL
 -- TOTAL ROWS -- 504
 SELECT Color AS ColorCount FROM [Production].[Product]
 SELECT COUNT(Color) AS ColorCount FROM [Production].[Product]
 SELECT COUNT(ProductNumber) AS ProductCount FROM [Production].[Product]

 -- TO FIND TOTAL NO OF RECORDS IN THE TABLE--
 SELECT COUNT(*) AS TableCount FROM [Production].[Product]
 SELECT COUNT(1) AS TableCount FROM [Production].TransactionHistory
 SELECT COUNT(1) AS TableCount FROM [Production].TransactionHistory

 4. The SUM() function calculates the sum of a set of values.
Note: NULL values are ignored.
Syntax : SUM(expression)
 SELECT * FROM [Production].[Product]
 SELECT SUM(ListPrice) TotalListPrice FROM [Production].[Product]

 5. The MIN() function returns the minimum value in a set of values.
Syntax : MIN(expression)

 SELECT MIN(ListPrice) MinListPrice FROM [Production].[Product] WHERE ListPrice <> 0
 SELECT MIN(SellStartDate) MinStartDate FROM [Production].[Product] WHERE ListPrice <> 0
 SELECT MAX(SellStartDate) MinStartDate FROM [Production].[Product] WHERE ListPrice <> 0

 SELECT MAX(ListPrice) MaxListPrice FROM [Production].[Product]

6. The MAX() function returns the maximum value in a set of values.
Syntax : Max(expression)

 SELECT MAX(ListPrice) MaxListPrice FROM [Production].[Product]


 7. The CEILING() function returns the smallest integer value that is larger than or equal to a number.
Syntax : CEILING(number)
Example : SELECT CEILING(25.1) AS CeilValue; -- Returns 26

8. The FLOOR() function returns the largest integer value that is smaller than or equal to a number.
Syntax : FLOOR(number)
Example : SELECT FLOOR(25.1) AS CeilValue; -- Returns 25

 SELECT * FROM [Production].[Product] WHERE ProductID BETWEEN 710 AND 720

 SELECT FLOOR(ListPrice) FloorValue,CEILING(ListPrice) CeilingValue FROM [Production].[Product] WHERE ProductID BETWEEN 710 AND 720

9. The ROUND() function rounds a number to a specified number of decimal places.
 Syntax : ROUND(number, decimals, operation)
 Example : SELECT ROUND(235.416, 3, 3) AS RoundValue;

 SELECT ROUND(20.32755342,3) AS RoundValue;

 10. The RAND() function returns a random number between 0 (inclusive) and 1 (exclusive).
Syntax : RAND(seed)
Example : SELECT RAND(20)

SELECT RAND(ListPrice) FROM [Production].[Product] WHERE ProductID BETWEEN 710 AND 720

SQUARE ( Number ) - Returns the square of the given number.
Example:
Select SQUARE(9) -- Returns 81

SQRT ( Number ) - SQRT stands for Square Root. This function returns the square root of the given value.
Example:
Select SQRT(81) -- Returns 

-- AGGREGATE FUNCTION --
AVG,MIN,MAX,SUM,COUNT

-- FIND THE MAX PRICE FROM THE PRODUCT TABLE AND DISPLAY MAX VALUE AND PRODUCT NAME

SELECT Color, COUNT(Color) MaxListPrice FROM [Production].[Product]
GROUP BY Color

SELECT Color, COUNT(Color) MaxListPrice FROM [Production].[Product]
GROUP BY Color

SELECT * FROM Person.Address WHERE City = 'Newark'

SELECT DISTINCT City FROM Person.Address

SELECT City,COUNT(1) FROM Person.Address
GROUP BY City

SELECT column_name(s)
FROM table_name
WHERE condition -- OPTIONAL
GROUP BY column_name(s)
ORDER BY column_name(s) -- OPTIONAL

SELECT  * FROM [Sales].[SalesOrderDetail] WHERE ProductID = 925

SELECT ProductID, CarrierTrackingNumber, MAX(UnitPrice) AS MaxUnitPrice FROM [Sales].[SalesOrderDetail]
WHERE UnitPrice>150

Shiv Wankar Sir, [6/14/2024 10:17 PM]
SELECT ProductID,MIN(UnitPrice) MinUnitPrice, MAX(UnitPrice) AS MaxUnitPrice FROM [Sales].[SalesOrderDetail]
WHERE UnitPrice > 1000
GROUP BY ProductID
HAVING MIN(UnitPrice) < 2000 AND MAX(UnitPrice) > 2000
ORDER BY ProductID  -- MAX UNIT PRICE > 1000

-- WHAT IS THE DIFFERENCE BETWEEN WHERE AND HAVING CLAUSE??
WHERE IS USED BEFORE GROUP BY CLAUSE
HAVING IS USED AFTER GROUP BY CLAUSE

WHERE IS USED TO FILTER THE RESULTS WITHOUT AGGREGATION
HAVING IS USED TO FILTER THE RESULTS WITH AGGREGATION

SIMILARITY --> BOTH ARE USED FOR FILTERING THE DATA