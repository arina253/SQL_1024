
--JOINS

--WHENEVER WE NEED TO SELECT COLUMNS FROM TABLES OF SAME/DIFFERENT  DATABASE, WE NEED JOIN.

SELECT TOP 5 *FROM DBO.CUSTOMERS
SELECT TOP 5 *FROM DBO.PRODUCTS
SELECT TOP 5 *FROM DBO.SALES

--We distribute data in various tables.

--SALEID,NAME OF THE PRODUCT, NAME OF THE CUSTOMER
SELECT SALEID,PRODUCTID,CUSTOMERID,SALEPRICE FROM DBO.SALES

SALESID ----> SALES
PRODUCT NAME -----> PRODUCTS
CUST NAME --------> CUSTOMER
SALES PRICE -------> SALES

--WHAT IS MEAN BY JOIN?
--JOIN IS USED TO RETRIEVE/FETCH/SELECT THE DATA FROM MULTIPLE TABLE (2 OR MORE)
--THE TWO TABLES USED IN JOIN MUST HAVE COMMON COLUMN BETWEEN THEM.(IT SHOULD HOLD THE COMMON DATA)
--WE NEED TO CHANGE DATATYPE IF DATATYPE IS DIFFERENT.
--THE TWO COLUMNS USED IN JOIN SHOULD HAVE THE SAME DATATYPE.
--MOST OF THE TIME PRIMARY KEY OF ONE TABLE AND FOREIGN KEY OF SECOND TABLE(THIS 2 COULUMN USED FOR JOIN)

--NOTE: TO JOIN THE TWO TABLE IT IS NOT COMPULSORY TO HAVE FK RELATIONSHIP.

--COMMON SYNTAX FOR JOIN

SELECT    COLUMNLIST
FROM      LEFTTABLENAME
JOIN_TYPE RIGHTTABLENAME
ON        JOINCONDITION          -------> TWO COMMON COLUMNS

--SALEID,NAME OF THE PRODUCT, NAME OF THE CUSTOMER

SELECT SALEID,PRODUCTNAME,SALEPRICE
FROM DBO.SALES
INNER JOIN DBO.PRODUCTS
ON SALES.PRODUCTID = PRODUCTS.PRODUCTID

--ON TABLENAME.COMMON COLUMN FIRST TABLE = TABLENAME.COMMON COLUMN SECOND TABLE

--USE OF ALIAS IN CASE OF LONG TABLE NAME
SELECT S.SALEID,S.PRODUCTID,P.PRODUCTNAME,S.SALEPRICE
FROM DBO.SALES AS S
INNER JOIN DBO.PRODUCTS AS P
ON S.PRODUCTID = P.PRODUCTID

--HIGHEST PRICE FOR THE MONITOR
SELECT MAX(SALEPRICE),PRODUCTID FROM DBO.SALES 
WHERE PRODUCTID = 3
GROUP BY PRODUCTID

SELECT MAX(S.SALEPRICE),P.PRODUCTNAME
FROM DBO.SALES AS S
INNER JOIN DBO.PRODUCTS AS P
ON S.PRODUCTID = P.PRODUCTID
WHERE P.PRODUCTNAME = 'MONITOR'
GROUP BY P.PRODUCTNAME

SELECT TOP 10*FROM [ADVENTUREWORKS2022].[PERSON].[EMAILADDRESS]
SELECT TOP 10 *FROM DBO.CUSTOMERS

--BASED ON THE DOMAIN FETCH THE DATA

SELECT DISTINCT EMAILADDRESSID,EMAILADDRESS
FROM [ADVENTUREWORKS2022].[PERSON].[EMAILADDRESS]
WHERE SUBSTRING(E.EMAILADDRESS

SELECT C.FIRSTNAME,C.LASTNAME,C.CITY
FROM DBO.CUSTOMERS C
INNER JOIN [ADVENTUREWORKS2022].[PERSON].[EMAILADDRESS] E
ON C.EMAIL = E.EMAILADDRESS

SELECT SUBSTRING(EMAIL,CHARINDEX('@', EMAIL),LEN(EMAIL)-CHARINDEX('@',EMAIL))+1 FROM DBO.CUSTOMERS

--WE HAVE TO GIVE FULL DATABASE NAME WHILE JOINING TABLES FROM DIFFERENT DATABASE.
--EG: [ADVENTUREWORKS2022].[PERSON].[EMAILADDRESS]

--HAVING AND WHERE ARE USED TO FILTER TABLE.
--JOIN TO FETCH DATA FROM MULTIPLE TABLE
--IN A RELATIONAL DATABASE,DATA IS DISTRIBUTED IN MULTIPLE LOGICAL TABLES.


SELECT S.SALEID,S.PRODUCTID,P.PRODUCTNAME,C.FIRSTNAME,C.LASTNAME,C.CITY,S.SALEPRICE
FROM DBO.SALES AS S
INNER JOIN DBO.PRODUCTS AS P
ON S.PRODUCTID = P.PRODUCTID
INNER JOIN DBO.CUSTOMERS C
ON S.CUSTOMERID = C.CUSTOMERID

--WE CAN USE MULTIPLE JOINS IN A SINGLE QUERY.

SELECT *FROM DBO.EMPLOYEE
SELECT *FROM DBO.DEPARTMENT

--ID,NAME,GENDER,SALARY,DEPT NAME,LOCATION

SELECT E.ID,E.NAME,E.GENDER,E.SALARY,D.DEPARTMENTNAME,D.LOCATION 
FROM DBO.EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.DEPARTMENTID = D.ID

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--SIR

SELECT * FROM dbo.Products
SELECT * FROM dbo.Sales
SELECT TOP 5 * FROM dbo.Customers

-- SALEID, NAME OF THE PRODUCT, NAME OF THE CUSTOMER,SALE PRICE
SELECT SaleID,ProductID,CustomerID,SalePrice  FROM dbo.Sales

SALESID			--> SALES
PRODUCT NAME	--> PRODUCTS
CUST NAME		--> CUSTOMER
SALES PRICE		--> SALES

--> WHAT IS MEAN BY JOIN
--> JOIN IS USED TO RETIRIVE/FETCH/SELECT THE DATA FROM MULTIPLE TABLE (2 OR MORE)
--> THE TWO TABLES USED IN JOIN MUST HAVE COMMON COLUMN BETWEEN THEM (IT SHOULD HOLD THE COMMON DATA)
--> THE TWO COLUMN USED IN JOIN SHOULD HAVE THE SAME DATATYPE
--> MOST OF THE TIME PRIMARY OF THE ONE TABLE AND FOREIGN KEY OF SECOND TABLE (THIS 2 COLUMN USED FOR JOIN)

NOTE --> TO JOIN THE TWO TABLE IT IS NOT COMPULSORY TO HAVE FK RELATIONSHIP

COMMON SYNTAX FOR JOIN

SELECT     ColumnList
FROM       LeftTableName
JOIN_TYPE  RightTableName
ON         JoinCondition			--> TWO COMMON COLUMNS

-- SALEID, NAME OF THE PRODUCT, NAME OF THE CUSTOMER,SALE PRICE

SELECT S.SaleID, S.ProductID, P.ProductName, C.FirstName,C.LastName,C.City, S.SalePrice
FROM dbo.Sales AS S
INNER JOIN dbo.Products AS P
ON S.ProductID = P.ProductID
INNER JOIN dbo.Customers C
ON S.CustomerID = C.CustomerID

-- ON TABLENAME.COMMON COLUMN FIRST TABLE = TABLENAME.COMMON COLUMN SECOND TABLE
-- HIGHEST PRICE FOR THE MONITOR
SELECT MAX(SalePrice), ProductID  FROM dbo.Sales
WHERE ProductID = 3
GROUP BY ProductID

SELECT MAX(S.SalePrice), P.ProductName
FROM dbo.Sales AS S
INNER JOIN dbo.Products AS P
ON S.ProductID = P.ProductID
WHERE P.ProductName = 'MONITOR'
GROUP BY P.ProductName

SELECT TOP 10 * FROM [AdventureWorks2022].[Person].[EmailAddress]
SELECT  * FROM dbo.Customers
SELECT DISTINCT EmailAddressID,EmailAddress
FROM [AdventureWorks2022].[Person].[EmailAddress] E
WHERE SUBSTRING(E.EmailAddress,CHARINDEX('@',E.EmailAddress),(LEN(E.EmailAddress)-CHARINDEX('@',E.EmailAddress))+1)
='@yahoo.com'

SELECT DISTINCT C.FirstName, C.LastName, C.City,E.EmailAddressID,E.EmailAddress
FROM dbo.Customers C
INNER JOIN [AdventureWorks2022].[Person].[EmailAddress] E
ON (SUBSTRING(C.Email,CHARINDEX('@',C.Email),(LEN(C.Email)-CHARINDEX('@',C.Email))+1)) = 
(SUBSTRING(E.EmailAddress,CHARINDEX('@',E.EmailAddress),(LEN(E.EmailAddress)-CHARINDEX('@',E.EmailAddress))+1))
WHERE LEFT(C.FirstName,1) = 'S'

SELECT SUBSTRING(Email,CHARINDEX('@',Email),(LEN(Email)-CHARINDEX('@',Email))+1) FROM dbo.Customers

SELECT * FROM dbo.Employee
SELECT * FROM dbo.Department

-- ID, NAME, GENDER,SALARY, DEPT NAME, LOCATION
SELECT * FROM dbo.Employee

SELECT E.ID,E.Name,E.Gender,E.Salary,D.DepartmentName,D.Location
FROM dbo.Employee E
LEFT JOIN Department D
ON E.DepartmentId = D.ID





