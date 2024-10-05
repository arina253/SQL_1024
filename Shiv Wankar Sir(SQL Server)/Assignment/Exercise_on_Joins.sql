--Exercise 4-1: Writing Inner Joins

/*1. The HumanResources.Employee table does not contain the employee names. Join that table to the 
Person.Person table on the BusinessEntityID column. Display the job title, birth date, first name, 
and last name.*/

SELECT *FROM [HumanResources].[Employee]
SELECT * FROM [Person].[Person]

SELECT
E.JOBTITLE,E.BIRTHDATE,P.FIRSTNAME,P.LASTNAME
FROM HUMANRESOURCES.EMPLOYEE AS E
JOIN PERSON.PERSON AS P
ON E.BUSINESSENTITYID = P.BUSINESSENTITYID


 
/*2. The customer names also appear in the Person.Person table. Join the Sales.Customer table to the 
Person.Person table. The BusinessEntityID column in the Person.Person table matches the 
PersonID column in the Sales.Customer table. Display the CustomerID, StoreID, and TerritoryID*/
columns along with the name columns.*/

SELECT *FROM [Person].[Person]
SELECT *FROM [Sales].[Customer]

SELECT 
C.CUSTOMERID,C.STOREID,C.TERRITORYID,P.FIRSTNAME + ' '+ P.MIDDLENAME + ' ' + P.LASTNAME AS NAME
FROM [Person].[Person] AS P
INNER JOIN [Sales].[Customer] AS C
ON P.BUSINESSENTITYID = C.PERSONID



/*3. Extend the query written in question 2 to include the Sales.SalesOrderHeader table. Display the 
SalesOrderID column along with the columns already specified. The Sales.SalesOrderHeader
table joins the Sales.Customer table on CustomerID. */

SELECT *FROM [Sales].[SalesOrderHeader]
SELECT *FROM [Person].[Person]
SELECT *FROM [Sales].[Customer]

SELECT 
C.CUSTOMERID,C.STOREID,C.TERRITORYID,P.FIRSTNAME,P.MIDDLENAME,P.LASTNAME,SH.SALESORDERID
FROM [Person].[Person] AS P
INNER JOIN [Sales].[Customer] AS C
ON P.BUSINESSENTITYID = C.PERSONID
INNER JOIN [Sales].[SalesOrderHeader] AS SH
ON C.CUSTOMERID = SH.CUSTOMERID


/*4. Write a query that joins the Sales.SalesOrderHeader table to the Sales.SalesPerson table. Join the BusinessEntityID column from the Sales.SalesPerson table to the 
SalesPersonID column in the Sales.SalesOrderHeader table. Display the SalesOrderID along with 
the SalesQuota and Bonus.*/

SELECT *FROM [Sales].[SalesOrderHeader]
SELECT *FROM [Sales].[SalesPerson]

SELECT 
SH.SALESORDERID,SP.SALESQUOTA,SP.BONUS
FROM [SALES].[SALESORDERHEADER] AS SH
JOIN [SALES].[SALESPERSON] AS SP
ON SH.SALESPERSONID = SP.BUSINESSENTITYID



/*5. Add the name columns to the query written in question 4 by joining on the Person.Person table. 
See whether you can figure out which columns will be used to write the join. 
HINT - You can join the Person.Person table on the SalesOrderHeader table or the Sales.SalesPerson
table.*/

SELECT *FROM [Sales].[SalesOrderHeader]
SELECT *FROM [Sales].[SalesPerson]
SELECT *FROM [PERSON].[PERSON]

/*ALTER TABLE [Sales].[SalesPerson] ADD NAME NVARCHAR(50)
SELECT SP.NAME,SP.SALESQUOTA,SP.BONUS
FROM [PERSON].[PERSON] AS P
JOIN [Sales].[SalesPerson] AS SP
ON SP.BUSINESSENTITYID = P.BUSINESSENTITYID*/

SELECT 
P.FIRSTNAME + ' ' + P.LASTNAME + ' ' + P.MIDDLENAME AS NAME, SH.SALESORDERID,SP.SALESQUOTA,SP.BONUS
FROM [Sales].[SalesOrderHeader] AS SH
JOIN [SALES].[SALESPERSON] AS SP
ON SH.SALESPERSONID = SP.BUSINESSENTITYID
JOIN [PERSON].[PERSON] AS P
ON SP.BUSINESSENTITYID = P.BUSINESSENTITYID



/*6. The catalog description for each product is stored in the Production.ProductModel table. Display 
the columns that describe the product from the Production.Product table, such as the color and 
size along with the catalog description for each product.*/

SELECT *FROM [Production].[ProductModel]
SELECT *FROM [PRODUCTION].[PRODUCT]

SELECT
P.COLOR,P.SIZE,PM.CATALOGDESCRIPTION,P.NAME
FROM PRODUCTION.PRODUCTMODEL AS PM
JOIN PRODUCTION.PRODUCT AS P
ON PM.NAME = P.NAME



/*7. Write a query that displays the names of the customers along with the product names that they 
have purchased. Hint: Five tables will be required to write this query! 

Sales.Customer, Person.Person, Sales.SalesOrderHeader,  Sales.SalesOrderDetail, Production.Product*/

SELECT  *FROM SALES.CUSTOMER
SELECT *FROM PERSON.PERSON
SELECT *FROM SALES.SALESORDERHEADER
SELECT *FROM SALES.SALESORDERDETAIL
SELECT *FROM PRODUCTION.PRODUCT

SELECT 
P.FIRSTNAME + ' ' + P.MIDDLENAME + ' ' + P.LASTNAME AS NAMEOFCUSTOMER, PR.NAME
FROM SALES.CUSTOMER AS C
JOIN PERSON.PERSON AS P
ON C.PERSONID = P.BUSINESSENTITYID
JOIN SALES.SALESORDERHEADER AS SH
ON P.BUSINESSENTITYID = SH.CUSTOMERID
JOIN SALES.SALESORDERDETAIL AS SD
ON SH.SALESORDERID = SD.SALESORDERID
JOIN PRODUCTION.PRODUCT AS PR
ON SD.PRODUCTID = PR.PRODUCTID
WHERE P.FIRSTNAME + ' ' + P.MIDDLENAME + ' ' + P.LASTNAME IS NOT NULL





--Exercise 4-2: Writing Outer Joins

/*1. Write a query that displays all the products along with the SalesOrderID even if an order has never 
been placed for that product. Join to the Sales.SalesOrderDetail table using the ProductID
column. */

SELECT *FROM SALES.SALESORDERDETAIL
SELECT *FROM PRODUCTION.PRODUCT


SELECT PR.NAME, SD.SALESORDERID
FROM PRODUCTION.PRODUCT AS PR
LEFT JOIN SALES.SALESORDERDETAIL AS SD
ON PR.PRODUCTID = SD.PRODUCTID



/*2. Change the query written in question 1 so that only products that have not been ordered show up 
in the query. */

SELECT PR.NAME, SD.SALESORDERID
FROM PRODUCTION.PRODUCT AS PR
LEFT JOIN SALES.SALESORDERDETAIL AS SD
ON PR.PRODUCTID = SD.PRODUCTID
WHERE SD.SALESORDERID IS NULL



/*3. Write a query that returns all the rows from the Sales.SalesPerson table joined to the 
Sales.SalesOrderHeader table along with the SalesOrderID column even if no orders match. 
Include the SalesPersonID and SalesYTD columns in the results.*/

SELECT *FROM SALES.SALESPERSON
SELECT *FROM SALES.SALESORDERHEADER

SELECT 
SH.[SALESORDERID],SH.[SALESPERSONID],SP.SALESYTD
FROM [SALES].[SALESPERSON] AS SP 
LEFT JOIN SALES.SALESORDERHEADER AS SH
ON SH.SALESPERSONID = SP.BUSINESSENTITYID


/*4. Change the query written in question 3 so that the salesperson’s name also displays from the 
Person.Person table. */

SELECT *FROM SALES.SALESPERSON
SELECT *FROM SALES.SALESORDERHEADER
SELECT *FROM PERSON.PERSON

SELECT 
P.FIRSTNAME + ' ' + P.MIDDLENAME + ' ' + P.LASTNAME AS SALESPERSONNAME,
SH.[SALESORDERID],SH.[SALESPERSONID],SP.SALESYTD
FROM [SALES].[SALESPERSON] AS SP 
LEFT JOIN SALES.SALESORDERHEADER AS SH
ON SH.SALESPERSONID = SP.BUSINESSENTITYID
JOIN [PERSON].[PERSON] AS P
ON SH.SALESPERSONID = P.BUSINESSENTITYID



/*5. The Sales.SalesOrderHeader table contains foreign keys to the Sales.CurrencyRate and 
Purchasing.ShipMethod tables. Write a query joining all three tables, making sure it contains all 
rows from Sales.SalesOrderHeader. Include the CurrencyRateID, AverageRate, SalesOrderID, and 
ShipBase columns. */

SELECT *FROM [SALES].[SALESORDERHEADER]
SELECT *FROM [SALES].[CURRENCYRATE]
SELECT *FROM [PURCHASING].[SHIPMETHOD]

SELECT
CR.CURRENCYRATEID,CR.AVERAGERATE,SH.SALESORDERID,PS.SHIPBASE
FROM SALES.CURRENCYRATE AS CR
RIGHT JOIN [SALES].[SALESORDERHEADER] AS SH
ON  CR.CURRENCYRATEID = SH.CURRENCYRATEID 
JOIN PURCHASING.SHIPMETHOD AS PS
ON SH.SHIPMETHODID = PS.SHIPMETHODID



/*6. Write a query that returns the BusinessEntityID column from the Sales.SalesPerson table along 
with every ProductID from the Production.Product table.*/

SELECT *FROM SALES.SALESPERSON
SELECT *FROM PRODUCTION.PRODUCT







/*7. From the Products table display ProductId, name, ProductNumber, color, weight column.
  If color is not assigned, display the 'No Color' value and for weight not mentioned use default as 25.00*/

  SELECT *FROM PRODUCTION.PRODUCT
  
  SELECT
  PRODUCTID, NAME, PRODUCTNUMBER, COLOR, WEIGHT FROM 
  PRODUCTION.PRODUCT

  SELECT
  PRODUCTID, NAME, PRODUCTNUMBER, ISNULL(COLOR,'NO COLOR'), ISNULL(WEIGHT,25.00)
  FROM PRODUCTION.PRODUCT


  ------------------------------------------------------------------------------------------------------------------------------------------------------------------

  --CLASSWORK
  SELECT *FROM SALES.CUSTOMER

SELECT *FROM PERSON.PERSON

SELECT *FROM SALES.CUSTOMER WHERE CUSTOMER ID IN (SELECT CUSTOMERID FROM SALES.SALESORDERDETAIL WHERE CUSTOMERID IS NULL)
SELECT *FROM SALES.SALESORDERHEADER WHERE CUSTOMERID IS NULL
SELECT *FROM PERSON.PERSON
SELECT *FROM SALES.STORE

SELECT C.CUSTOMERID,C.PERSONID
FROM SALES.CUSTOMER C
JOIN PERSON.PERSON P
ON C.PERSONID = P.BUSINESSENTITYID

