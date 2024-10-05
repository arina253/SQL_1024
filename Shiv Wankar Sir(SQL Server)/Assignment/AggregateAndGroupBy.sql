--Exercise 5-1: Using Aggregate Functions 

--1. Write a query to determine the number of customers in the Sales.Customer table
SELECT
COUNT(1)AS CUSTOMERCOUNT
FROM SALES.CUSTOMER
 

--*2. Write a query that lists the total number of products ordered. Use the OrderQty column of the 
--Sales.SalesOrderDetail table and the SUM function.
SELECT *FROM SALES.SALESORDERDETAIL
SELECT
COUNT(PRODUCTID)AS TOTALPRODUCT,SUM(ORDERQTY)
FROM SALES.SALESORDERDETAIL 
GROUP BY PRODUCTID


3. Write a query to determine the price of the most expensive product ordered. Use the UnitPrice
column of the Sales.SalesOrderDetail table. 
SELECT
MAX(UNITPRICE)
FROM SALES.SALESORDERDETAIL


4. Write a query to determine the average freight amount in the Sales.SalesOrderHeader table.
SELECT *FROM SALES.SALESORDERHEADER
SELECT
AVG(FREIGHT)
FROM SALES.SALESORDERHEADER
 
--5. Write a query using the Production.Product table that displays the minimum, maximum, and 
average ListPrice. 
SELECT *FROM PRODUCTION.PRODUCT
SELECT
MIN(LISTPRICE) AS MINLISTPRICE,
MAX(LISTPRICE) AS MAXLISTPRICE,
AVG(LISTPRICE) AS AVGLISTPRICE
FROM PRODUCTION.PRODUCT


--Exercise 5-2: Using the GROUP BY Clause

1. Write a query that shows the total number of items ordered for each product. Use the 
Sales.SalesOrderDetail table to write the query.
SELECT *FROM SALES.SALESORDERDETAIL
SELECT 
COUNT(ORDERQTY)NOOFOITEMSORDERED
FROM SALES.SALESORDERDETAIL


2. Write a query using the Sales.SalesOrderDetail table that displays a count of the detail lines for 
each SalesOrderID.
SELECT *FROM SALES.SALESORDERDETAIL
SELECT
COUNT(SALESORDERDETAILID)
FROM SALES.SALESORDERDETAIL
 

--3. Write a query using the Production.Product table that lists a count of the products in each product line. 
SELECT *FROM PRODUCTION.PRODUCT
SELECT
COUNT(PRODUCTID)COUNTOFPRODUCT
FROM PRODUCTION.PRODUCT




--4.* Write a query that displays the count of orders placed by year for each customer using the Sales.SalesOrderHeader table.
SELECT *FROM SALES.SALESORDERHEADER 
SELECT CUSTOMERID,ORDERDATE,
COUNT(1) COUNTOFORDERS
FROM SALES.SALESORDERHEADER
GROUP BY CUSTOMERID,ORDERDATE

Exercise 5-3: Using the HAVING Clause

1. Write a query that returns a count of detail lines in the Sales.SalesOrderDetail table by 
SalesOrderID. Include only those sales that have more than three detail lines
SELECT *FROM SALES.SALESORDERDETAIL
SELECT
COUNT(SALESORDERID)
FROM SALES.SALESORDERDETAIL
GROUP BY SALESORDERID
HAVING COUNT(SALESORDERID) > 3


2. Write a query that creates a sum of the LineTotal in the Sales.SalesOrderDetail table grouped by 
the SalesOrderID. Include only those rows where the sum exceeds 1,000.
SELECT
SUM([LINETOTAL])
FROM SALES.SALESORDERDETAIL
GROUP BY SALESORDERID
HAVING SUM ([LINETOTAL])> 1000
 

--3.* Write a query that groups the products by ProductModelID along with a count. Display the rows 
that have a count that equals 1.
 SELECT *FROM PRODUCTION.PRODUCTMODEL
 SELECT
 COUNT(1)
 FROM SALES.SALESORDERHEADER
 GROUP BY PRODUCTMODELID
 HAVING COUNT(PRODUCTMODELID)=1

4. Change the query in question 3 so that only the products with the color blue or red are included.