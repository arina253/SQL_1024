Exercise 1.1 - Select Statements

1. Write a SELECT statement that lists the persons along with their ID numbers. Include the last 
names, first names,middle names and company names (Table - person.Person)

SELECT *FROM PERSON.PERSON
SELECT BUSINESSENTITYID,LASTNAME,FIRSTNAME,MIDDLENAME FROM PERSON.PERSON
--NOTE: COMPANY NAME IS NOT MENTIONED IN THE TABLE.


2. Write a SELECT statement that lists the name, product number, and color of each product. (Table - Production.Product)

SELECT *FROM PRODUCTION.PRODUCT
SELECT NAME,PRODUCTNUMBER,COLOR FROM PRODUCTION.PRODUCT


3. Write a SELECT statement that lists the customer ID numbers and sales order ID numbers from 
the SalesLT.SalesOrderHeader table. 

SELECT *FROM SALES.SALESORDERHEADER
SELECT CUSTOMERID,SALESORDERID FROM SALES.SALESORDERHEADER



4. Write a query displaying the ProductID, Name, and Color columns from rows in the 
Production.Product table. Display only those rows where no color has been assigned. 

SELECT *FROM PRODUCTION.PRODUCT
SELECT PRODUCTID,NAME,COLOR FROM PRODUCTION.PRODUCT WHERE COLOR IS NULL



5. Write a query displaying the ProductID, Name, and Color columns from rows in the 
Production.Product table. Display only those rows in which the color is not blue. 

SELECT *FROM PRODUCTION.PRODUCT
SELECT PRODUCTID,NAME,COLOR FROM PRODUCTION.PRODUCT WHERE COLOR <>'BLUE'



6. Write a query displaying ProductID, Name, Style, Size, and Color from the Production.Product
table. Include only those rows where at least one of the Style, Size, or Color columns contains 
a value

SELECT *FROM PRODUCTION.PRODUCT
SELECT 
PRODUCTID,NAME,STYLE,SIZE,COLOR 
FROM PRODUCTION.PRODUCT
WHERE STYLE IS NOT NULL OR SIZE IS NOT NULL OR COLOR IS NOT NULL


-----------------------------------------------------------------------------------------------------------------------------------------------------------------


Exercise 1.2 - Filtering Data

7. Write a query using a WHERE clause that displays all the employees listed in the 
HumanResources.Employee table who have the job title Research and Development Engineer. 
Display the business entity ID number, the login ID, and the title for each one. 

SELECT *FROM HUMANRESOURCES.EMPLOYEE
SELECT 
BUSINESSENTITYID,LOGINID,JOBTITLE
FROM HUMANRESOURCES.EMPLOYEE
WHERE JOBTITLE = 'RESEARCH AND DEVELOPMENT ENGINEER'



8. Write a query using a WHERE clause that displays all the names in Person.Person with the middle 
name J. Display the first, last, and middle names along with the ID numbers. 

SELECT *FROM PERSON.PERSON
SELECT
BUSINESSENTITYID, FIRSTNAME,MIDDLENAME,LASTNAME 
FROM PERSON.PERSON
WHERE MIDDLENAME='J.'


9. Write a query displaying all the columns of the Production.ProductCostHistory table from the 
rows that were modified on June 16, 2013.

SELECT *FROM PRODUCTION.PRODUCTCOSTHISTORY
SELECT 
*FROM PRODUCTION.PRODUCTCOSTHISTORY
WHERE MODIFIEDDATE = '2013-06-16'



10. Rewrite the query you wrote in question 1, changing it so that the employees who do not have the 
title Research and Development Engineer are displayed.

SELECT *FROM HUMANRESOURCES.EMPLOYEE
SELECT 
BUSINESSENTITYID,LOGINID,JOBTITLE
FROM HUMANRESOURCES.EMPLOYEE
WHERE JOBTITLE <> 'RESEARCH AND DEVELOPMENT ENGINEER'



11. Rewrite the query you wrote in question 1, changing it so that the employees who do not have the 
title Research and Development Engineer are displayed.

SELECT *FROM HUMANRESOURCES.EMPLOYEE
SELECT 
BUSINESSENTITYID,LOGINID,JOBTITLE
FROM HUMANRESOURCES.EMPLOYEE
WHERE JOBTITLE <>'RESEARCH AND DEVELOPMENT ENGINEER'



12. Write the sql query so that the rows that were not modified on December 29, 2000, are 
displayed. 

SELECT *FROM PRODUCTION.PRODUCTCOSTHISTORY
SELECT
*FROM PRODUCTION.PRODUCTCOSTHISTORY 
WHERE MODIFIEDDATE !='2000-12-29'



13. Explain why a WHERE clause should be used in many of your T-SQL queries. 

--WHERE CLAUSE IS USED IN MANY OF OUR T-SQL QUERIES TO EXTRACT ONLY THOSE RECORDS THAT FULFILS A SPECIFIED CONDITION.
--WE CAN USE WHERE CLAUSE WITH DIFFERENT OPERATORS AND DIFFERENT CONDITIONS TO FILTER OUR DATA.
--WHERE CLAUSE CAN BE USED WITH SELECT,INSERT,DELETE STATEMENTS.

----------------------------------------------------------------------------------------------------------------------------------------------------------------


Exercise 1.3 - Filtering with Wildcards

14. Write a query that displays the product ID and name for each product from the 
Production.Product table with the name starting with Chain. 

SELECT *FROM PRODUCTION.PRODUCT
SELECT 
PRODUCTID,NAME FROM PRODUCTION.PRODUCT 
WHERE NAME LIKE 'CHAIN%'


15. Write a query like the one in question 1 that displays the products with helmet in the name

SELECT *FROM PRODUCTION.PRODUCT
SELECT 
PRODUCTID,NAME FROM PRODUCTION.PRODUCT 
WHERE NAME LIKE '%HELMET%'


16. Change the last query(que 2) so that the products without helmet in the name are displayed. 

SELECT *FROM PRODUCTION.PRODUCT
SELECT 
PRODUCTID,NAME FROM PRODUCTION.PRODUCT 
WHERE NAME NOT LIKE '%HELMET%'



17. Write a query that displays the business entity ID number, first name, middle name, and last 
name from the Person.Person table for only those rows that have E or B stored in the middle 
name column. 

SELECT *FROM PERSON.PERSON
SELECT
BUSINESSENTITYID,FIRSTNAME,MIDDLENAME,LASTNAME
FROM PERSON.PERSON
WHERE MIDDLENAME LIKE'[EB]'


18. Explain the difference between the following two queries: 
SELECT FirstName 
FROM Person.Person 
WHERE LastName LIKE 'Ja%es'; 

SELECT FirstName 
FROM Person.Person 
WHERE LastName LIKE 'Ja_es';

--THE FIRST QUERY SELECTS ONLY THOSE FIRSTNAME COLUMN FROM PERSON.PERSON TABLE WHERE LASTNAME STARTS WITH JA AND ENDS WITH ES AND ANY NUMBER OF CHARACTERS IN BETWEEN.

--THE SECOND QUERY SELECTS ONLY THOSE FIRSTNAME COLUMN FROM PERSON.PERSON WHERE LASTNAME STARTS WITH JA AND ENDS WITH ES AND THIRD CHARACTER CAN BE ANY ONE CHARACTER


----------------------------------------------------------------------------------------------------------------------------------------------------------------------



Exercise 1.4 -  Filtering with Multiple Predicates
Use Table - Sales.SalesOrderHeader for all the below questions

19. Write a query displaying the order ID, order date, and total due from the Sales.SalesOrderHeader
table. Retrieve only those rows where the order was placed during the month of September 2013 
and the total due exceeded $1,000.

SELECT *FROM SALES.SALESORDERHEADER
SELECT 
SALESORDERID,ORDERDATE,TOTALDUE
FROM SALES.SALESORDERHEADER
WHERE ORDERDATE >= '2013-09-01' AND ORDERDATE <= '2013-09-30'
AND TOTALDUE > 1000



20. Change the query in question 1 so that only the dates September 1,2 & 3, 2013, are retrieved. See 
whether you can figure out three different ways to write this query. 

--1) USING IN OPERATOR
SELECT SALESORDERID,ORDERDATE,TOTALDUE
FROM SALES.SALESORDERHEADER
WHERE ORDERDATE IN('2013-09-01','2013-09-02','2013-09-03')
AND TOTALDUE > 1000

--2) USING OR OPERATOR
SELECT SALESORDERID,ORDERDATE,TOTALDUE
FROM SALES.SALESORDERHEADER
WHERE (ORDERDATE = '2013-09-01' OR ORDERDATE = '2013-09-02' OR ORDERDATE ='2013-09-03')
AND TOTALDUE > 1000

--3) USING BETWEEN OPERATOR
SELECT SALESORDERID,ORDERDATE,TOTALDUE
FROM SALES.SALESORDERHEADER
WHERE (ORDERDATE BETWEEN'2013-09-01' AND '2013-09-03')
AND TOTALDUE > 1000



21. Write a query displaying the sales orders where the total due exceeds $1,000. Retrieve only those 
rows where the salesperson ID is 279 or the territory ID is 6. 

SELECT *FROM SALES.SALESORDERHEADER
SELECT 
*FROM SALES.SALESORDERHEADER 
WHERE TOTALDUE> 1000
AND (SALESPERSONID=279 OR TERRITORYID=6)


22. Change the query in question 3 so that territory 4 is included.

SELECT *FROM SALES.SALESORDERHEADER
SELECT
SALESORDERID,SALESPERSONID,TERRITORYID,TOTALDUE
FROM SALES.SALESORDERHEADER 
WHERE TOTALDUE> 1000
AND (SALESPERSONID=279 OR TERRITORYID=6 OR TERRITORYID=4)


23. Explain when it makes sense to use the IN operator.

--IN OPERATOR IS USED TO SPECIFY MULTIPLE POSSIBLE VALUES OF THE COLUMN IN A TABLE.
--WE CAN SPECIFY COLUMN NAME ONLY ONCE AND ALL THE POSSIBLE VALUES WHILE USING IN OPERATOR 
--IN OPERATOR CAN BE USED WITH WHERE CLAUSE IN INTEGER AS WELL AS  VARCHAR DATATYPE
--IF WE WANT TO FILTER DATA THROUGH ONE COLUMN ONLY, WE CAN USE IN OPERATOR.
--EG: IF WE WANT TO SELECT THE RECORDS FROM COUNTRIES TABLE WHERE COUNTRYNAME IS JAPAN,NEPAL AND INDIA, THE SQL QUERY WILL BE:
SELECT *FROM COUNTRIES WHERE COUNTRYNAME IN ['JAPAN','NEPAL','INDIA']



24. select data from [Sales].[CreditCard] table for Expiry years from 2002 to 2005
  Display CardId, Type, Number and ExpYear columns

  SELECT *FROM SALES.CREDITCARD
  SELECT 
  CREDITCARDID,CARDTYPE,CARDNUMBER,EXPYEAR
  FROM SALES.CREDITCARD
  WHERE EXPYEAR BETWEEN 2002 AND 2005



25. List all the Credit cards having letters 'card' at the end in Card Type .(Table - CreditCard)

SELECT *FROM SALES.CREDITCARD
SELECT 
*FROM SALES.CREDITCARD
WHERE CARDTYPE LIKE '%CARD'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

1 . Below query will result in all the rows where the middle name value = 'E' or 'B'
select businessentityID, firstname, middlename, lastname  from Person.Person
Where MiddleName Like 'E' or MiddleName Like 'B'

-- 2 . Below query will result in all the rows where the middle name value = 'E' or 'B'
select businessentityID, firstname, middlename, lastname  from Person.Person
Where MiddleName IN ('E','B')

-- 3 . Below query will result in all the rows where the middle name value = 'E' or 'B'
select businessentityID, firstname, middlename, lastname  from Person.Person
Where MiddleName = 'E' or MiddleName = 'B'

-- 4 . Below query will result in all the rows where the middle name value starts or ends with 'E' or 'B'
select businessentityID, firstname, middlename, lastname  from Person.Person
Where MiddleName like '[EB]'

-- 5 . Below query will result in all the rows where the middle name value has 'E' or 'B' anywhere.
/* This was expected answer */
select businessentityID, firstname, middlename, lastname  from Person.Person
Where MiddleName like '%[EB]%'






































