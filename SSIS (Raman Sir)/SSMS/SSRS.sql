--3. Create a SSIS package the display every year wise total customer ,Total Orders and total sale

SELECT 
    Year([Order Date]) AS OrderYear,
    COUNT(DISTINCT [Customer Name]) AS TotalCustomers,
    COUNT([Order ID]) AS TotalOrders,
    SUM(Sales) AS TotalSales
FROM Orders$
GROUP BY 
    Year([Order Date])
ORDER BY 
    OrderYear;


--Create a SSIS package that display yearwise total orders,total sale and total quantity.

SELECT 
    Year([Order Date]) AS OrderYear,
    COUNT([Order ID]) AS TotalOrderID,
    SUM(Sales) AS TotalSale,
    SUM(Quantity) AS TotalQuantity
FROM Orders$
GROUP BY 
    Year([Order Date])
ORDER BY 
    OrderYear;
---------------------------------------------------------------------------------------------------------------------------

SSRS

SELECT 
Year([Order Date]) AS OrderYear,
[Customer Name],
COUNT([Order ID]) AS TotalOrderID,
SUm(Sales) AS TotalSale,
SUm(Quantity) AS TotalQunatity
FROM Orders$
GROUP BY 
Year([Order Date]),
[Customer Name]

---------------------------------------------------------------------------------------------------------------

--SORTING
If the report that is showing is not in ordered manner, we can either fix in query section with SQL command that is called static order and user need to do rework with report and again deploy the report.
In interactive sorting,user can change order or see button in top 
If we want to change order on the basis of fixed SQL query, that is called static sorting.

SELECT
   YEAR([ORDER DATE])AS ORDERYEAR,
   [CUSTOMER NAME],
   COUNT([ORDER ID])AS TOTALORDERID,
   SUM(SALES)AS TOTALSALE,
   SUM(QUANTITY)AS TOTALQUANTITY
FROM ORDERS$
GROUP BY 
   YEAR([ORDER DATE]),[CUSTOMER NAME]
ORDER BY 
  YEAR([ORDER DATE])

--------------------------------------------------------------------------------------------------------------------------------
--PARAMETER

SELECT *FROM ORDERS$ WHERE CATEGORY = @CATEGORY
SELECT DISTINCT CATEGORY FROM ORDERS$

------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *FROM ORDERS$ WHERE CATEGORY = @CATEGORY AND [SUB-CATEGORY]=@SUBCATEGORY
SELECT DISTINCT CATEGORY FROM ORDERS$ WHERE CATEGORY=@CATEGORY AND [SUB-CATEGORY]=@SUBCATEGORY

PARAMETER = FILTER = WHERE CLAUSE


--MULTIVALUE PARAMETERS

SELECT * FROM Orders$
WHERE Category IN (@Category)

SELECT DISTINCT Category from Orders$

--PAGELEVEL PARAMETER

SELECT * FROM Orders$
WHERE Category = (@Category)

--------------------------------------------------------------------------------------------------------------------------------

--MATRIX
SELECT
[CUSTOMER NAME],
YEAR([ORDER DATE]) AS ORDERYEAR,
COUNT([ORDER ID])AS TOTALORDER
FROM ORDERS$
GROUP BY [CUSTOMER NAME],YEAR([ORDER DATE])

------------------------------------------------------------------------------------------------------------------------------
--TWO VALUE MATRIX

SELECT 
[CUSTOMER NAME],
YEAR([ORDER DATE])AS ORDERYEAR,
COUNT([ORDER ID])AS TOTALORDER,
SUM(SALES) AS TOTALSALES
FROM ORDERS$
GROUP BY [CUSTOMER NAME],YEAR([ORDER DATE])

CASE 1: IF TOTAL ORDER >= 5 THEN ROWS BACKGROUND IS GREEN ELSE YELLOW.
CASE 2:IF A CUSTOMER PLACES MORE THAN 5 ORDERS IN A YEAR, WHOLE ROW TO BE TURNED GREEN ELSE YELLOW

SELECT
[CUSTOMER NAME],
YEAR([ORDER DATE])AS ORDERYEAR,
COUNT([ORDER ID])AS TOTALORDER,
SUM(SALES) AS TOTALSALES
FROM ORDERS$
GROUP BY [CUSTOMER NAME],YEAR([ORDER DATE])
HAVING COUNT([ORDER ID]) > 5
ORDER BY [CUSTOMER NAME]

--CHARTS
SELECT 
	Category,
	Year([Order Date]) AS OrderYear,
	COUNT([Order ID]) AS TotalOrder,
	SUM(Sales) AS TotalSales
	FROM 
	Orders$
	GROUP BY Category,Year([Order Date])

-----------------------------------------
SELECT *FROM ORDERS$
/*REQUIREMENT: Parameter - Customer name.
According to the selected customer name, show yearly sale of the customer in chart.*/
SELECT SUM(SALES) AS [TOTAL SALE],
[CUSTOMER NAME],
YEAR([ORDER DATE]) AS [SALEYEAR]
FROM ORDERS$
--WHERE [CUSTOMER NAME] = @CUSTOMERNAME
GROUP BY 
[CUSTOMER NAME],
YEAR([ORDER DATE])

SELECT
SUM(SALES),
YEAR([ORDER DATE])
FROM ORDERS$
--WHERE YEAR([ORDER DATE])=2014
GROUP BY YEAR([ORDER DATE])

SELECT DISTINCT [CUSTOMER NAME] FROM ORDERS$

SELECT
COUNT([ORDER ID]) AS [TOTAL ORDER] FROM ORDERS$
GROUP BY YEAR([ORDER DATE])

-------------------------------------------------------------------------------------------------------------------------------

--DASHBOARD (SAMPLE SUPERSTORE- ORDERS$)

SELECT *FROM ORDERS$

--FIND OUT TOTAL ORDERS,TOTAL SALES,TOTAL QUANTITY,AVG PRODUCT COST,AVG SHIP TIME FROM ORDERS$)

SELECT
   SUM(SALES)AS [TOTAL SALES],
   SUM(QUANTITY)AS [TOTAL QUANTITY],
   COUNT([ORDER ID])AS [TOTAL ORDERS],
   AVG(SALES-PROFIT)AS AVERAGEPRODUCTCOST,
   AVG(DATEDIFF(DD,[ORDER DATE],[SHIP DATE])) AS AVERAGESHIPTIME
FROM ORDERS$

--ORDERID IS A VARCHAR DATATYPE

--SUM OF SALES BY SEGMENT
SELECT
SEGMENT,
SUM(SALES)
FROM ORDERS$
GROUP BY SEGMENT 

--SUM OF SALES BY CATEGORY
SELECT
CATEGORY,
SUM(SALES)
FROM ORDERS$
GROUP BY CATEGORY 

--SUM OF SALES BY SHIP MODE
SELECT
[SHIP MODE],
SUM(SALES)
FROM ORDERS$
GROUP BY [SHIP MODE]

--SUM OF SALES BY MONTH
SELECT
DATENAME(MONTH,[ORDER DATE])AS MONTH,
SUM(SALES) AS TOTALSALES
FROM ORDERS$
GROUP BY DATENAME(MONTH,[ORDER DATE])

--SUM OF PROFIT BY MONTH
SELECT 
DATENAME(MONTH,[ORDER DATE])AS MONTH,
SUM(PROFIT)AS SUMOFPROFIT
FROM ORDERS$
GROUP BY DATENAME(MONTH,[ORDER DATE])

--SALES VS PROFIT DAILY
SELECT
SUM(SALES)AS [SUM OF SALES],
SUM(PROFIT)AS [SUM OF PROFIT],
DATENAME(DAY,[ORDER DATE])AS [NAME OF THE DAY]
FROM ORDERS$
GROUP BY DATENAME(DAY,[ORDER DATE])

--SUM OF SALES AND SUM OF PROFIT BY STATE
SELECT
STATE,
SUM(SALES)AS [SUM OF SALES],
SUM(PROFIT) AS [SUM OF PROFIT]
FROM ORDERS$
GROUP BY STATE

--SUM OF SALES AND SUM OF PROFIT BY CITY
SELECT
CITY,
SUM(SALES)AS [SUM OF SALES],
SUM(PROFIT) AS [SUM OF PROFIT]
FROM ORDERS$
GROUP BY CITY

--SUM OF SALES BY SUB-CATEGORY
SELECT *FROM ORDERS$
SELECT
[SUB-CATEGORY],
SUM(SALES)AS [SUM OF SALES]
FROM ORDERS$
GROUP BY [SUB-CATEGORY]

-------------------------------------------------------------------------------------------------------

--DRILL DOWN

SELECT 
Country,
State,
City,
COUNT([Order ID]) AS TotalOrders,
SUm(Sales) AS TotalSales,
Sum(Profit) AS TotalProfit
FROM Orders$
GROUP BY Country,
State,
City

SELECT 
[Customer Name],
COUNT([Order ID]) AS TotalOrders,
SUm(Sales) AS TotalSales,
Sum(Profit) AS TotalProfit
FROM Orders$
GROUP BY [Customer Name]
order by [Customer Name]

--DRILL THROUGH DETAILS
SELECT *FROM ORDERS$ WHERE [CUSTOMER NAME] = @CUSTOMERNAME

-----------------------------------------------------------------------------------------------------------------------------------------

1. create a bar chart to display to show top 5 customer name sale wise
2. create a pie chart that show subcategory wise total orders placed. 
3. create a drill down report 
4. create a SSRS report for display page level filter

SELECT *FROM ORDERS$
SELECT 
TOP 5 [CUSTOMER NAME],
SUM(SALES)AS TOTALSALES
FROM ORDERS$
GROUP BY [CUSTOMER NAME]
ORDER BY TOTALSALES DESC

SELECT
[CUSTOMER NAME],
[SUB-CATEGORY],
COUNT([ORDER ID])AS [TOTAL ORDER PLACED]
FROM ORDERS$
GROUP BY [CUSTOMER NAME],
[SUB-CATEGORY]

SELECT

[SUB-CATEGORY],
COUNT([ORDER ID])AS [TOTAL ORDER PLACED]
FROM ORDERS$
GROUP BY 
[SUB-CATEGORY]
3.
SELECT
     COUNTRY,
     STATE,
     CITY,
     SUM(SALES)AS TOTALSALES,
     SUM(QUANTITY)AS TOTALQUANTITY
FROM ORDERS$
GROUP BY
     COUNTRY,STATE,CITY