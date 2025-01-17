

--SQL SERVER MATH/NUMERIC FUNCTIONS

ABS -ALWAYS CONVERT INTO POSITIVE NUMBER ONLY

SELECT ABS (-10.30)

AVG - RETURNS THE AVERAGE VALUE OF THE EXPRESSION
SYNTAX:  AVG(EXPRESSION)

SELECT AVG(LISTPRICE)AS AAVGLISTPRICE FROM [PRODUCTION].[PRODUCT]
WHERE LISTPRICE > 0

COUNT() - RETURNS THE NUMBR OF RECORDS RETURNED BY A SELECT QUERY.
NULL VALUES ARE NOT COUNTED
SYNTAX: COUNT(EXPRESSION)


SELECT COLOR AS COLORCOUNT FROM  [PRODUCTION].[PRODUCT]------504 ROWS INCLUDING NULL
SELECT *FROM [PRODUCTION].[PRODUCT] WHERE COLOR IS NULL
TOTAL ROWS----504

SELECT COUNT(COLOR)COLORCOUNT FROM [PRODUCTION].[PRODUCT]

--TO FIND THE COUNT,WE USE COLUMN NAME
-- * WILL COUNT ALL ROWS

--TO FIND TOTAL NO. OF RECORDS/ROWS IN THE  TABLE, WE HAVE 2 WAYS:
SELECT COUNT(*)AS TABLECOUNT FROM [PRODUCTION].[PRODUCT]
SELECT COUNT(1)AS TABLECOUNT FROM [PRODUCTION].[PRODUCT]
--COUNT WILL RETURN THE NUMBER OF ROWS.

SUM()
CALCULATES THE SUM OF A SET OF VALUES
NULL VALUES ARE IGNORED.
SYNTAX: SUM(EXPRESSION)
SELECT *FROM [PRODUCTION].[PRODUCT]
SELECT SUM(LISTPRICE),TOTALLISTPRICE FROM [PRODUCTION].[PRODUCT]

--SELECT SUM(COLOR),TOTALLISTPRICE FROM [PRODUCTION].[PRODUCT]
--MATHEMATICAL FUNCTION IS POSSIBLE FOR INT DATATYPE ONLY.

MIN()-RETURNS THE MINIMUM VALUE IN A SET OF VALUES
SYNTAX: MIN(EXPRESSION)

SELECT MIN(LISTPRICE)MINLISTPRICE FROM [PRODUCTION].[PRODUCT] WHERE LISTPRICE <> 0

SELECT MAX(LISTPRICE)MAXLISTPRICE FROM [PRODUCTION].[PRODUCT]

SYNTAX: MAX(EXPRESSION)

SELECT MIN(SELLSTARTDATE),MINSTARTDATE FROM [PRODUCTION].[PRODUCT] WHERE LISTPRICE <>0
SELECT MAX(SELLSTARTDATE),MAXSTARTDATE FROM [PRODUCTION].[PRODUCT] WHERE LISTPRICE <>0

--MAX AND MIN CAN BE USED WITH INTEGER AND  DATE COLUMN AS WELL

CEILING()
RETURNS THE SMALLEST INTEGER VALUE THAT IS LARGER THAN OR EQUAL TO A NUMBER.
SYNTAX: CEILING(NUMBER)
SELECT CEILING(25.1)AS CEILVALUE -----RETURNS 26

FLOOR()-RETURNS THE LARGEST INTEGER VALUE THAT IS SMALLER THAN OR EQUAL TO A NUMBER
SYNTAX: FLOOR(NUMBER)
SELECT FLOOR(25.1) AS CEILVALUE -----RETURNS 25

SELECT FLOOR (LISTPRICE) MAXLISTPRICE FROM [PRODUCTION].[PRODUCT]

SELECT *FROM [PRODUCTION].[PRODUCT] WHERE PRODUCTID BETWEEN 710 AND 720

SELECT FLOOR (LLISTPRICE)FLOORVALUE,CEILING(LISTPRICE)CELILINGVALUE
FROM [PRODUCTION].[PRODUCT]WHERE PRODUCTID BETWEEN 710 AND 720.

RAND()
RETURNS A RANDOM NUMBER BETWEEN 0 (INCLUSIVE)AND 1(EXCLUSIVE)
SYNTAX: RAND(sEED)
SELECT RAND(10)

SELECT RAND(LISTPRICE)FROM [PRODUCTION].[PRODUCT]WHERE PRODUCTID BETWEEN 710 AND 720

ROUND() - ROUNDS A NUMBER TO A SPECIFIED NUMBER OF DECIMAL PLACES
SYNTAX: ROUND(NUMBER,DECIMALS,OPERATION)

SELECT ROUND(235.416,3,3) AS ROUNDVALUE

SQUARE(NUMBER)-RETURNS THE SQUARE OF THE GIVEN NUMBER
SELECT SQUARE(9)

SQRT()-STANDS FOR SQUARE ROOT
SELECT SQRT(81)

AVG,MAX,MIN,SUM,COUNT ---AGGREGATE FUNCTIONS

--GROUP BY CLAUSE

--FIND THE MAX VALUE FROM THE PRODUCT TABLE AND DISPLAY MAX VALUE AND PRODUCT NAME
SELECT NAME,MAX(LISTPRICE)MAXLISTPRICE FROM [PRODUCTION].[PRODUCT]
--SELECT NAME,MAX(LISTPRICE)MAXLISTPRICE FROM [PRODUCTION].[PRODUCT]
--Column 'PRODUCTION.PRODUCT.Name' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

--NAME COLUMN SHOULD CONTAIN AGGREGATE FUNCTION OR IT SHOULD BE INCLUDED IN GROUP BY CLAUSE

SELECT COLOR,MAX(LISTPRICE),MAXLISTPRICE FROM [PRODUCTION].[PRODUCT]GROUP BY COLOR

SELECT *FROM [PRODUCTION].[PRODUCT] WHERE COLOR = 'BLUE'
--GROUPS ALL ROWS THAT HAVE THE SAME VALUES INTO SUMMARY ROWS

--HOW MANY ADDRESSLINES ARE PRESEINT FOR THE SAME CITY
SELECT DISTINCT CITY FROM [PERSON].[ADDRESS] 

SELECT  CITY,COUNT(1) FROM [PERSON].[ADDRESS] GROUP BY CITY

--GROUP BY IS USED WITH AGGREGATE FUNCTIONS 

SYNTAX:
SELECT COLUMN_NAME(s)
FROM TABLE_NAME
WHERE CONDITION ---OPTIONAL
GROUP BY COLUMN_NAME(s)
ORDER BY COLUMN NAME(s) -- OPTIONAL

--TO FIND MAXIMUM PRICE FOR PRODUCT ALONG WITH ID

SELECT *FROM [SALES].[SALESORDERDETAIL] WHERE PRODUCTID = 925

SELECT PRODUCTID,MAX(UNITPRICE)AS MAXUNITPRICE FROM [SALES].[SALESORDERDETAIL]
WHERE UNITPRICE >150
GROUP BY PRODUCTID

--TO SEE THE SMALLEST PRODUCTID FROM RESULTSET
SELECT PRODUCTID,MAX(UNITPRICE)AS MAXUNITPRICE FROM [SALES].[SALESORDERDETAIL]
WHERE UNITPRICE >150
GROUP BY PRODUCTID
ORDER BY PRODUCTID

--FIND THOSE PRODUCT WHOSE MAXIMUM UNITPRICE IS GREATER THAN 1000
SELECT PRODUCTID,MAX(UNITPRICE)AS MAXUNITPRICE FROM [SALES].[SALESORDERDETAIL]
WHERE UNITPRICE >150
GROUP BY PRODUCTID
HAVING MAX(UNITPRICE) > 1000
ORDER BY PRODUCTID

--HAVING 
IF WE WANT TO FILTER DATA WITH AGGREGATE FUNCTIONS, WE USE HAVING CLAUSE.

--WHAT IS THE DIFFERENCE BETWEEN WHERE AND HAVING CLAUSE?

SIMILARITY:
BOTH ARE USED FOR FILTERING DATA.
BOTH TAKE MULTIPLE CONDITIONS
DIFFERENCES:
SYNTAX: WHERE IS USED BEFORE GROUP BY CLAUSE.
HAVING IS USED AFTER GROUP BY CLAUSE

WHERE IS USED TO FILTER RESULTS WITHOUT AGGREGATIONS ---COLUMN NAME AND CONDITION NAME
HAVING IS ALWAYS USED TO FILTER THE RESULTS WITH AGGREGATIONS SUCH AS MAX,MIN,SUM,COUNT

--GROUP BY CLAUSE CAN BE USED WITH MULTIPLE CONDITIONS
SELECT PRODUCTID,CARRIERTRACKINGNUMBER,MAX(UNITPRICE) AS MAXUNITPRICE FROM [SALES].[SALESORDERDETAIL]
WHERE UNITPRICE>150
GROUP BY PRODUCTID,CARRIERTRACKINGNUMBER

--EVERY AGGREGATE FUNCTION ALWAYS RETURNS A SINGLE ROW.
