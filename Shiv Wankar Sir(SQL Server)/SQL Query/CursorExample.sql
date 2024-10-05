 SELECT *FROM TBLPRODUCTS
 SELECT *FROM TBLPRODUCTSALES

 -- Cursor Example: 
-- Let us say, I want to update the UNITPRICE column in tblProductSales table, based on the following criteria
/*
1. If the ProductName = 'Product - 55', Set Unit Price to 55
2. If the ProductName = 'Product - 65', Set Unit Price to 65
3. If the ProductName is like 'Product - 100%', Set Unit Price to 1000
*/

Declare @ProductId int

--Declare the cursor using the declare keyword
Declare ProductIdCursor CURSOR FOR   --CURSOR NAME
Select ProductId from tblProductSales

--SELECT TOP 1 * from tblProductSales
--SELECT TOP 1 * from tblProducts

--Open statement executes the SELECT statement and populates the result set
Open ProductIdCursor

--Fetch the row from the result set into the variable
Fetch Next from ProductIdCursor into @ProductId

--If the result set still has rows,@@FETCH_STATUS will be ZERO
While (@@FETCH_STATUS=0)
Begin
 Declare @ProductName nvarchar(50)
 Select @ProductName = Name from tblProducts where Id = @ProductId

 if (@ProductName = 'Product -55')
 Begin
  Update tblProductSales
  Set UnitPrice = 55 where ProductId = @ProductId
 End
 else if (@Productname = 'Product -65')
  Begin
   Update tblProductSales
   Set UnitPrice = 65 where ProductId = @ProductId
  End
else if (@ProductName like 'Product -100%')
 Begin
  Update tblProductSales
  Set UnitPrice = 1000 where ProductId = @ProductId
 End

 Fetch Next from ProductIdCursor into @ProductId
End

--Release the rowset
CLOSE ProductIdCursor

--Deallocate the resources associated with the cursor
DEALLOCATE ProductIdCursor

UPDATE TS
SET TS.UnitPrice = CASE
	WHEN TP.NAME = 'Product -55' THEN 55
	WHEN TP.NAME = 'Product -65' THEN 65
	WHEN TP.NAME = 'Product -100%' THEN 1000
	ELSE TS.UNITPRICE
	END
FROM TBLPRODUCTSALES TS
JOIN TBLPRODUCTS TP ON TS.PRODUCTID = TP.ID

/*
The cursor will loop thru each row in tblProductSales table. As there are 600,000 rows, to be processed on a row-by-row basis, it takes around 40 to 45 seconds on my machine. We can achieve this very easily using a join, and this will significantly increase the performance. We will discuss about this in our next video session.

To check if the rows have been correctly updated, please use the following query.*/

Select  Name, UnitPrice 
from tblProducts join
tblProductSales on tblProducts.Id = tblProductSales.ProductId
where (Name='Product - 55' or Name='Product - 65' or Name like 'Product - 100%')

SELECT * FROM ProductSaleDesc

Update tblProductSales
set UnitPrice = 
 Case 
  When Name = 'Product - 55' Then 155
  When Name = 'Product - 65' Then 165
  When Name like 'Product - 100%' Then 10001
 End     
from tblProductSales
join tblProducts
on tblProducts.Id = tblProductSales.ProductId
Where Name = 'Product - 55' or Name = 'Product - 65' or 
Name like 'Product - 100%'

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS ProductSaleDesc
CREATE TABLE ProductSaleDesc 
(
ProductID INT,
ProductName VARCHAR(100),
QtySold INT
)

DECLARE 
 @ID INT

DECLARE InsertProductSaleDesc CURSOR FOR
SELECT ProductId FROM tblProductSales

OPEN InsertProductSaleDesc 

FETCH NEXT FROM InsertProductSaleDesc INTO @ID

WHILE (@@FETCH_STATUS = 0)
BEGIN
 
 INSERT INTO ProductSaleDesc
 (
  ProductID,
  ProductName,
  QtySold
 )
 SELECT
  @ID+1,
  tp.Name,
  ts.QuantitySold  
 FROM tblProductSales ts
 JOIN tblProducts tp ON ts.ProductId = tp.Id
 WHERE TS.ProductId = @ID

 FETCH NEXT FROM InsertProductSaleDesc INTO @ID
 
END

CLOSE InsertProductSaleDesc
DEALLOCATE InsertProductSaleDesc

SELECT * FROM ProductSaleDesc


