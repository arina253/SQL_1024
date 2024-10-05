ROW_NUMBER() --> SEQUENTIAL NUMBER TO EACH ROW
RANK()   --> SEQUENTIAL NUMBER TO EACH ROW, ASSIGN SAME RANK TO DUPLICATE RECORDS AND SKIPS THE NEXT RANK
DENSE_RANK() --> SEQUENTIAL NUMBER TO EACH ROW, ASSIGN THE SAME RANK TO DUPLICATE RECORDS AND DOES NOT SKIP THE NEXT RANK 
NTILE   --> DEVIDE THE RESULT SET INTO "N" OF PARTITIONS AND ASSIGN THE SEQUENTIAL RANK
LEAD()
LAG()

1
2
3 -- LAG

/*
The LAG() function allows access to a value stored in a different row above the current row. 
The row above may be adjacent or some number of rows above, as sorted by a specified column or set of columns.

Syntax:
ROW_NUMBER() OVER (PARTITION BY COLUMN ORDER BY COLUMN)
LAG(expression,[offset],default_value]) OVER(ORDER BY columns)

LAG() takes three arguments: the name of the column or an expression from which the value is obtained, 
the number of rows to skip (offset) above, and the default value to be returned if the stored value obtained 
from the row above is empty. Only the first argument is required. 
The third argument (default value) is allowed only if you specify the second argument, the offset.

The LEAD() is similar to LAG(). Whereas LAG() accesses a value stored in a row above, 
LEAD() accesses a value stored in a row below the current row.

Syntax:
LEAD(expression [,offset[,default_value]]) OVER(ORDER BY columns)

Just like LAG(), the LEAD() function takes three arguments: the name of a column or an expression, 
the offset to be skipped below, and the default value to be returned if the stored value obtained 
from the row below is empty. Only the first argument is required. 
The third argument, the default value, can be specified only if you specify the second argument, the offset.
*/

DROP TABLE IF EXISTS dbo.SalesData
CREATE TABLE dbo.SalesData
(
ID   INT,
Seller_Name VARCHAR(20),
Sale_Value MONEY
)
INSERT INTO dbo.SalesData VALUES
(3,'Stef',7000),
(1,'Alic',12000),
(2,'Mili',25000)

SELECT * FROM dbo.SalesData ORDER BY ID

-- LAG
SELECT seller_name, sale_value,
  LAG(sale_value) OVER(ORDER BY sale_value) as previous_sale_value
FROM dbo.SalesData;

SELECT seller_name, sale_value,
  LAG(sale_value,1,0) OVER(ORDER BY sale_value) as previous_sale_value
FROM dbo.SalesData;

-- LEAD
SELECT seller_name, sale_value,
  LEAD(sale_value) OVER(ORDER BY sale_value) as next_sale_value
FROM dbo.SalesData;

SELECT seller_name, sale_value,
  LEAD(sale_value,1,0) OVER(ORDER BY sale_value DESC) as next_sale_value
FROM dbo.SalesData;

/*
Using LAG() and LEAD() to Compare Values
An important use for LAG() and LEAD() in reports is comparing the values in the current row with the 
values in the same column but in a row above or below.

Consider the following table, annual_sale, shown below:
*/
DROP TABLE IF EXISTS dbo.SaleByYear
CREATE TABLE dbo.SaleByYear
(
 SaleYear INT,
 TotalSales MONEY
)

INSERT INTO dbo.SaleByYear VALUES 
(2015,23000),
(2016,25000),
(2017,34000),
(2018,32000),
(2019,33000),
(2020,37000),
(2021,37000),
(2022,42000),
(2023,45000)

SELECT * FROM dbo.SaleByYear

SELECT 
   SaleYear,
   TotalSales AS current_total_sale,
   LAG(TotalSales) OVER(ORDER BY SaleYear) AS previous_total_sale,
   TotalSales - LAG(TotalSales) OVER(ORDER BY SaleYear) AS difference
FROM dbo.SaleByYear;

-- LEAD AND LAG WITH OFFSET
CREATE TABLE dbo.EmpBonus
(
 EmpId INT,
 BonusYear INT,
 BonusQuar SMALLINT,
 BonusAmt DECIMAL
)

INSERT INTO dbo.EmpBonus VALUES
(2,2017,1,100),
(2,2017,2,250),
(2,2017,3,60),
(2,2017,4,20),
(2,2018,1,80),
(2,2018,2,80),
(2,2018,3,0),
(2,2018,4,0),
(2,2019,1,0),
(2,2019,2,100),
(2,2019,3,0),
(2,2019,4,150)

--The query below selects the bonus for the employee with ID = 1 for each quarter of each year. 
--It then identifies the bonuses for the corresponding quarter in the year before and the year after.

SELECT * FROM dbo.EmpBonus

SELECT 
 EmpId,
 BonusYear, 
 BonusQuar, 
 LAG(BonusAmt,4,0) OVER(PARTITION BY EmpId ORDER BY BonusYear,BonusQuar) AS previous_bonus,
 BonusAmt AS current_bonus,