
--Aggregate function: always give one value according to selected column

SELECT AVG(SALES),SUM(SALES) FROM ORDERS$
SELECT CATEGORY,SUM(SALES),AVG(SALES),SUM(sALES)/COUNT(SALES)FROM ORDERS$ GROUP BY CATEGORY
--IF WE HAVE GROUP BY,WE HAVE COUNT.

SUM -----TOTAL NUMBER OF RECORDS

--Avg

--MAX
SELECT AVG(sALES),SUM(sALES),MAX(SALES) FROM ORDERS$

SELECT CATEGORY,SUM(SALES),AVG(SALES),MAX(sALES)FROM ORDERS$ GROUP BY CATEGORY

--WINDOW FUNCTIONS 
ROW_NUMBER
DENSE_RANK
RANK
LAG
LEAD
RETURNS SINGLE TYPE OF VALUE

GOOGLE- WINDOW FUNCTION IN SQL SHACK

SELECT *FROM ORDERS$
SELECT YEAR([ORDER DATE])AS YEAR,MONTH([ORDER DATE])AS MONTH FROM ORDERS$
GROUP BY YEAR([ORDER DATE]),MONTH([ORDER DATE])

SELECT AVG(SALES),SUM(SALES),MAX(SALES)FROM ORDERS$

--WE CANNOT USE GROUP BY IN WINDOW FUNCTIONS.

Regular aggregate functions  operate on an entire table and are used with a GROUP BY clause. But very few people use Window functions in SQL. These operate on a set of rows and return a single aggregated value for each row.
Window functions operate on a set of rows and return a single aggregated value for each row. The term Window describes the set of rows in the database on which the function will operate.

We define the Window (set of rows on which functions operates) using an OVER() clause. 

The main advantage of using Window functions over regular aggregate functions is: Window functions do not cause rows to become grouped into a single output row, the rows retain their separate identities and an aggregated value will be added to each row.

Types of Window functions
Aggregate Window Functions
SUM(), MAX(), MIN(), AVG(). COUNT()
Ranking Window Functions
RANK(), DENSE_RANK(), ROW_NUMBER(), NTILE()
Value Window Functions
LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE()

Syntax
window_function ( [ ALL ] expression ) 
OVER ( [ PARTITION BY partition_list ] [ ORDER BY order_list] )
 
