--sql when do insert update, it will happen in sets.
--cursor is useful for handling data sets row by row basis.
--take much time and read data from db row by row basis.
--Cursor used for migrating data from one database to other
--Cursors are bad for performance.

7 lakhs record - take 54 minutes to load data from source to destination.

while loop - control flow statement to execute a statement block repeatedly as long as the specified condition is true.
it is important to set value to the next level in while loop.
using while loop we can generate large set of data, for repeating the sql statement for a n number of times until the condition is false.

--if we do not know the number of iterations for a particular SQL statement, we can use cursor

-----------------------------------------------------------------------------------------------------------------------------

--HOMEWORK

--RECREATE TABLES

CREATE TABLE TBLPRODUCTS
(
   [ID] INT IDENTITY PRIMARY KEY,
   [NAME] NVARCHAR(50),
   [DESCRIPTION] NVARCHAR(250)
)

DROP TABLE IF EXISTS TBLPRODUCTSALES
CREATE TABLE TBLPRODUCTSALES
(
   ID INT PRIMARY KEY IDENTITY,
   PRODUCTID INT FOREIGN KEY REFERENCES TBLPRODUCTS(ID),
   UNITPRICE INT,
   QUANTITYSOLD INT
 )

 --INSERT 400000 RECORDS IN TBLPRODUCTS

 DROP TABLE TBLPRODUCTS

 DECLARE @ID INT
 SET @ID =1

 WHILE @ID <= 400000
 BEGIN
	INSERT INTO TBLPRODUCTS (NAME,DESCRIPTION) 
	VALUES
	('PRODUCT -' + ' ' + CAST(@ID AS VARCHAR(10)),
	'PRODUCT -' + '' + CAST(@ID AS VARCHAR(10)) + ' ' + 'DESCRIPTION')
 PRINT @ID
 SET @ID= @ID + 1
 END

 SELECT *FROM TBLPRODUCTS
 SELECT *FROM TBLPRODUCTSALES

 --INSERT SAMPLE DATA INTO TBLPRODUCTSALES TABLE

DECLARE @COUNTER INT
SET @COUNTER = 1

-- Define limits for product ID, unit price, and quantity sold
DECLARE @UPPERLIMITFORPRODUCTID INT = 100000
DECLARE @LOWERLIMITFORPRODUCTID INT = 1

DECLARE @UPPERLIMITFORUNITPRICE INT = 100000 -- Example upper limit for unit price
DECLARE @LOWERLIMITFORUNITPRICE INT = 10  -- Example lower limit for unit price

DECLARE @UPPERLIMITFORQUANTITYSOLD INT = 100000 -- Example upper limit for quantity sold
DECLARE @LOWERLIMITFORQUANTITYSOLD INT = 1   -- Example lower limit for quantity sold

WHILE (@COUNTER <= 550000)
BEGIN
    DECLARE @RANDOMPRODUCTID INT,
            @RANDOMUNITPRICE INT,
            @RANDOMQUANTITYSOLD INT

    -- Generate random values for product ID, unit price, and quantity sold
    SELECT @RANDOMPRODUCTID = ROUND(((@UPPERLIMITFORPRODUCTID - @LOWERLIMITFORPRODUCTID) * RAND() +
    @LOWERLIMITFORPRODUCTID), 0)

    SELECT @RANDOMUNITPRICE = ROUND(((@UPPERLIMITFORUNITPRICE - @LOWERLIMITFORUNITPRICE) * RAND() +
    @LOWERLIMITFORUNITPRICE), 0)

    SELECT @RANDOMQUANTITYSOLD = ROUND(((@UPPERLIMITFORQUANTITYSOLD - @LOWERLIMITFORQUANTITYSOLD) * RAND() +
    @LOWERLIMITFORQUANTITYSOLD), 0)

    -- Insert the generated values into the TBLPRODUCTSALES table
    INSERT INTO TBLPRODUCTSALES
    VALUES
    (@RANDOMPRODUCTID, @RANDOMUNITPRICE, @RANDOMQUANTITYSOLD)

    PRINT @COUNTER
    SET @COUNTER = @COUNTER + 1
END

 RAND() - WILL GENERATE RANDOM NUMBER FROM 0 TO 1

 --SYNTAX
 DECLARE CURSOR_NAME FOR
 COLUMN NAMES FROM TABLES

 --CURSOR IS USED FOR PROCESSING DATA ROW BY ROW
 --IF WE DO NOT KNOW THE NUMBER OF TIMES LOOP TO BE EXECUTED,

 @@FETCH_STATUS

 SELECT *FROM STUDENTSOURCE

 DECLARE @ID INT,
         @NAME VARCHAR(10)
 

 DECLARE READDATA CURSOR FOR
 SELECT ID,NAME FROM STUDENTSOURCE

 OPEN READDATA

 FETCH NEXT FROM READDATA INTO @ID,@NAME

 WHILE (@@FETCH_STATUS = 0)
 BEGIN
	SELECT @ID,@NAME
	--TO TAKE NEXT DATA FROM READDATA CURSOR
	FETCH NEXT FROM READDATA INTO @ID,@NAME
 END
 CLOSE READDATA
 DEALLOCATE READDATA

 --FETCHSTATUS WILL ROW UPTO THE LAST ROW OF THE CURSOR

 --CURSOR IS SLOW, SO RARELY USED .
 WHEN THERE IS NO OTHER WAY TO DO OUR TASK THEN ONLY WE USE CURSOR.
 WHENEVER THERE IS A NEED TO PROCESS DATA BY INDIVIDUAL ROWS, WE USE CURSOR
 WHATEVER THE LIST OF COLUMNS WE NEED FOR CURSOR, WE NEED TO DECLARE THAT MUCH VARIABLE.

 DECLARE VARIABLE
 DECLARE CURSOR
 SELECT COLUMN FROM TABLE
 OPEN CURSOR
 FETCH NEXT WILL READ ROWS FROM CURSOR - READ FIRST ROW FROM CURSOR INTO THE VARIABLE
 WHILE LOOP ENTER
 BEGIN 
 FETCH NEXT FROM CURSOR - FOR SETTING THE NEXT VALUE FROM CURSOR INTO THE VARIABLE
 END
 CLOSE CURSOR
 DEALLOCATE CURSOR


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CLASS QUERY

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
  @ID,
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
 
 --CAN WE DO WHATEVER UPDATE WE ARE DOING WITH CURSOR  BY USING JOIN?YES

 UPDATE
 SET TS.UNITPRICE = CASE
				 WHEN TP.NAME = 'PRODUCT - 55' THEN 55
				 WHEN TP.NAME = 'PRODUCT - 65' THEN 65
				 WHEN TP.NAME = 'PRODUCT - 100%' THEN 1000
				 ELSE TS.UNITPRICE
				END
 FROM TBLPRODUCTSALES TS
 JOIN TBLPRODUCTS TP ON TS.PRODUCTID = TP.ID

 --WHENEVER POSSIBLE, WE WILL ALWAYS GO WITH SIMPLE QUERY OR JOINS.