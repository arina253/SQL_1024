/*
Assessment/Exam for SQL-1024
Date – 28/07/2024
Total Questions - 8

Please Note: 
While creating table, please use constraint keys to maintain quality data for e.g. avoide duplication, maintain uniqueness in data, reference keys to each other, data should not be bank.

Section -1 
Q1. Create Table with name mentioned for the table (Items, Location) – 
Create Scripts is the answer it should have all details as mentioned in note above.

Q2. Insert below values in the Table – Insert scripts will be the answer for this question.*/

--Ans1: Scripts for creating table


CREATE TABLE ITEMS
(
ID INT PRIMARY KEY,
CODE VARCHAR (10),
DESCRIPTION VARCHAR(100),
UOM CHAR(2)
)


CREATE TABLE LOCATION
(
ID INT PRIMARY KEY,
CODE VARCHAR(4),
LOCATION_IDENTIFIER VARCHAR(35),
DESCRIPTION VARCHAR(30)
)

CREATE TABLE [ITEM TRANSACTIONS]
(
INVCNUMB VARCHAR(6) PRIMARY KEY,
INVCDATE DATE,
LOCID INT,
ITEMID INT,
QTY INT
FOREIGN KEY (LOCID) REFERENCES LOCATION (ID),
FOREIGN KEY (ITEMID) REFERENCES ITEMS (ID)
)

----------------------------------------------------------------------------------------------------------------------------

--Ans2: Scripts for inserting values into the table

INSERT INTO ITEMS VALUES
(1,'R8196020','FRONT PANEL LOCK THREAD','No'),
(2,'R8196031','FRM SIM1 ADJ FRM LOCK THREAD','No'),
(3,'R820964','FRM LASER MATRIX PLT SIDE','No'),
(4,'R827828','FRM££ 7S2028 LSR MTRX BTM','No'),
(5,'R8395123','FRM 19" BUS BAR _1 BK PL PCB','No'),
(6,'R8395124','FRM 19" BUS BAR _2  BK PL PCB','No')

SELECT *FROM ITEMS


INSERT INTO LOCATION VALUES
(1,'L001','Release Store','RM STORE'),
(2,'L002','Store_2','UNIT-2 STORE'),
(3,'L003','Central Store','CAPITAL STORE'),
(4,'L004','Inward Store','INWARD QUALITY')

SELECT *FROM LOCATION

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q-3 Write a stored procedure “usp_Insert_ItemTransactions” which will insert the data into ItemTrnsactions Table. 
--For any duplicates display the message as 'Invoice Number already generated'. 
--And insert the data as per the table above by executing the stored procedure. 
--(This procedure will be used to insert the above existing data into table).

CREATE OR ALTER PROC USP_INSERT_ITEMTRANSACTIONS
@INVCNUMB VARCHAR(6),
@INVCDATE DATE,
@LOCID INT,
@ITEMID INT,
@QTY INT
AS
BEGIN
 IF EXISTS(SELECT 1 FROM [ITEM TRANSACTIONS] WHERE INVCNUMB=@INVCNUMB)
 BEGIN
 	PRINT 'INVOICE NUMBER ALREADY GENERATED'
 END
 ELSE
 BEGIN
 	INSERT INTO [ITEM TRANSACTIONS]VALUES
 		(
 		 @INVCNUMB,
         @INVCDATE,
         @LOCID,
         @ITEMID,
         @QTY
 		)
 END
END

EXEC USP_INSERT_ITEMTRANSACTIONS 'INV001', '2024-03-10', 1, 2, 10
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV006', '2024-03-20', 1, 2, 20
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV011', '2024-03-30', 1, 2, 30
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV016', '2024-03-09', 1, 2, 40
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV021', '2024-03-19', 1, 2, 50
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV002', '2024-03-12', 2, 3, 12
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV007', '2024-03-22', 2, 3, 22
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV012', '2024-03-01', 2, 3, 32
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV017', '2024-03-11', 2, 3, 42
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV022', '2024-03-21', 2, 3, 52
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV003', '2024-03-14', 3, 4, 14
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV008', '2024-03-24', 3, 4, 24
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV013', '2024-04-03', 3, 4, 34
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV018', '2024-04-13', 3, 4, 44
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV023', '2024-04-23', 3, 4, 54
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV004', '2024-04-16', 4, 5, 16
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV009', '2024-04-26', 4, 5, 26
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV014', '2024-04-05', 4, 5, 36
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV019', '2024-04-15', 4, 5, 46
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV024', '2024-04-25', 4, 5, 54
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV005', '2024-04-18', 1, 5, 18
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV010', '2024-04-28', 2, 4, 28
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV015', '2024-04-07', 3, 3, 38
EXEC USP_INSERT_ITEMTRANSACTIONS 'INV020', '2024-04-17', 4, 2, 48

--NOTE: The date format dd-mm-yy causing some problem,some date inserted, some date not inserted, so format is changed to yyyy-mm-dd

SELECT *FROM [ITEM TRANSACTIONS]

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q4. Write a stored procedure “usp_InsertNewTransaction” to insert data into ItemTrnsactions Table.
--Input parameter will be INVNUMB, LocationCode, ItemCode and InvQty. Invoice date will be system date. 
--Take care of failures due to duplicates. 
--Print the Message “Invoice @INVNUMB inserted successfully for Quantity @InvQty” after successful insertion.

SELECT *FROM ITEMS
SELECT *FROM LOCATION
SELECT *FROM [ITEM TRANSACTIONS]

CREATE OR ALTER PROC USP_INSERTNEWTRANSACTION
	@INVCNUMB VARCHAR(6),
	@LOCATIONCODE VARCHAR(4),
	@ITEMCODE VARCHAR(15),
	@QTY INT 
AS
BEGIN
  DECLARE @LOCID INT,
         @ITEMID INT

 IF EXISTS (SELECT 1 FROM [ITEM TRANSACTIONS] WHERE INVCNUMB = @INVCNUMB)
 BEGIN
	PRINT 'INVOICE NUMBER ALREADY GENERATED' 
 END
 ELSE
 BEGIN
	SELECT @ITEMID = ID FROM ITEMS WHERE CODE = @ITEMCODE

	SELECT @LOCID = ID FROM LOCATION WHERE CODE = @LOCATIONCODE
  
	INSERT INTO [ITEM TRANSACTIONS] (INVCNUMB, INVCDATE, LOCID, ITEMID, QTY)
	VALUES
 		(
 		 @INVCNUMB,
         GETDATE(),
         @LOCID,
         @ITEMID,
         @QTY
 		)

   PRINT 'INVOICE ' + @INVCNUMB + ' INSERTED SUCCESSFULLY FOR QUANTITY ' + CAST(@QTY AS VARCHAR(10))
 END
END

EXEC USP_INSERTNEWTRANSACTION 'INV027','R827828','L10',15
EXEC USP_INSERTNEWTRANSACTION 'INV030','R828828','L93',25
EXEC USP_INSERTNEWTRANSACTION 'INV032','R820828','L63',15
EXEC USP_INSERTNEWTRANSACTION 'INV029','R8176031','L45',10


SELECT *FROM [ITEM TRANSACTIONS]

-------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Q5. Write Store Procedure “usp_GetInvoiceDetailsByItem” for getting below results with ITEMCODE as input.
Display INVCNUMB, INVCDATE,	LOCATION, ITEMCODE, QTY,CUM_SUM
Cumulative Sum is sum of qty for the ItemCode. Add previous qty to current row.
Sample result as below for ITEMCODE - R8196031
HINT – Use SUM() OVER() to get running Total*/

SELECT *FROM ITEMS
SELECT *FROM LOCATION
SELECT *FROM [ITEM TRANSACTIONS]

CREATE OR ALTER PROC USP_GETINVOICEDETAILSBYITEM
	@ITEMCODE VARCHAR(8)
AS
BEGIN
	SELECT 
		IT.INVCNUMB,
		IT.INVCDATE,
		L.DESCRIPTION AS LOCATION,
		I.CODE AS ITEMCODE,
		IT.QTY AS QTY,
		SUM(IT.QTY)OVER(ORDER BY IT.INVCDATE)AS [CUM_SUM]
     FROM [ITEM TRANSACTIONS]IT
	 JOIN LOCATION L ON IT.LOCID = L.ID
	 JOIN ITEMS I ON I.ID = IT.ITEMID
	 WHERE I.CODE = @ITEMCODE
END

EXEC  USP_GETINVOICEDETAILSBYITEM 'R8196031'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Q6. Write a store procedure to get Total count of invoice for each item along total quantity for the month. 
Month number is input parameter. 
Also, display the data like Q.5 for the ItemCode which is having higher quantity in the result set.*/

CREATE OR ALTER PROC USP_GETINVOICEDETAILFORMONTH
	@MONTHNUMBER INT
AS
BEGIN
	
	SELECT 
	    COUNT(IT.INVCNUMB)AS [INVOICECOUNTFORMONTH],
	    I.CODE AS ITEMCODE,
	    SUM(IT.QTY) AS [TOTAL_QUANTITY]
	    --MONTH(IT.INVCDATE) AS MONTHNUMBER
    FROM [ITEM TRANSACTIONS]IT
	JOIN ITEMS I 
	ON IT.ITEMID = I.ID
	WHERE MONTH(INVCDATE) = @MONTHNUMBER
	GROUP BY I.CODE ,MONTH(IT.INVCDATE) 

	SELECT 
		IT.INVCNUMB,
		IT.INVCDATE,
		L.DESCRIPTION AS description,
		I.CODE AS ITEMCODE,
		IT.QTY AS QTY,
		SUM(IT.QTY)OVER(PARTITION BY (I.CODE) ORDER BY IT.INVCDATE)AS [CUM_SUM]
     FROM [ITEM TRANSACTIONS]IT
	 JOIN LOCATION L ON IT.LOCID = L.ID
	 JOIN ITEMS I ON I.ID = IT.ITEMID
	 WHERE MONTH(IT.INVCDATE) = @MONTHNUMBER
END

EXEC USP_GETINVOICEDETAILFORMONTH 3

/*Comments: 7. Will not get result for the second part of the question. Display all column like Q5. for ItemCode having maximum qty.
Suggestion - Use column list in insert statements for better readability.*/

---------------------------------------------------------------------------------------------------------------------------

/* SECTION 2*/

CREATE TABLE EmpDetails
(
	EmpId INT,
	EmpName VARCHAR(100),
	BalanceLeaves DECIMAL(3,1)
)

INSERT INTO EmpDetails VALUES 
(1,'Medha Kulkarni',20),
(2,'Supriya Pathak',25),
(3,'Kiran Shetye',21),
(4,'Nimish Koparkar',33),
(5,'Priya Kolhapure',10)

SELECT * FROM EmpDetails

CREATE TABLE EmpLeaves
(
	LeaveId	INT,
	EmpId INT,
	LeaveDate DATE,
	LeaveDays DECIMAL(3,1)
)

INSERT INTO EmpLeaves VALUES
(1	,1,	'01-01-2024',	1	),
(2	,2,	'01-04-2024',	1	),
(3	,3,	'02-10-2024',	1	),
(4	,4,	'02-15-2024',	1	),
(5	,5,	'01-02-2024',	0.5	),
(6	,1,	'01-25-2024',	1	),
(7	,2,	'01-20-2024',	1	),
(8	,3,	'02-28-2024',	1	),
(9	,4,	'02-25-2024',	0.5	),
(10	,5,	'01-15-2024',	1	),
(11	,1,	'02-20-2024',	0.5	),
(12	,2,	'02-15-2024',	1	),
(13	,3,	'03-15-2024',	0.5	),
(14	,4,	'04-01-2024',	1	),
(15	,5,	'02-05-2024',	1	),
(16	,1,	'03-15-2024',	1	),
(17	,2,	'02-16-2024',	0.5	),
(18	,3,	'03-18-2024',	1	),
(19	,4,	'04-02-2024',	1	),
(20	,5,	'02-06-2024',	0.5	)

/*Q7. Write a Store procedure for (usp_GetLeaveDetails):
--Display Records from above tables with data
. Employee name
. No of leaves applied 
. Balance Leaves

Input parameters - EMPID, FROMDATE, TO DATE*/

SELECT *FROM EMPLEAVES
SELECT *FROM EMPDETAILS

CREATE OR ALTER PROCEDURE USP_GETLEAVEDETAILS
	@EMPID INT,
	@FROMDATE DATE,
	@TODATE DATE
AS
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM EMPLEAVES WHERE EMPID=@EMPID AND LEAVEDATE BETWEEN @FROMDATE AND @TODATE)
	BEGIN
		PRINT 'NO LEAVES APPLIED BY THE EMPLOYEE IN THIS PERIOD'
	END
	ELSE
	BEGIN
		SELECT
		   ED.EMPNAME,
		   COUNT(EL.LEAVEDAYS) AS [NUMBER OF LEAVES APPLIED],
		   ED.BALANCELEAVES
	    FROM EMPDETAILS ED
	    JOIN EMPLEAVES EL ON EL.EMPID = ED.EMPID
	    WHERE 
		   ED.EMPID = @EMPID 
	       AND EL.LEAVEDATE BETWEEN @FROMDATE AND @TODATE
	    GROUP BY 
		   ED.EMPNAME,
		   ED.BALANCELEAVES
	END
END

EXEC USP_GETLEAVEDETAILS 2,'2024-01-01','2024-02-04'
EXEC USP_GETLEAVEDETAILS 2,'2023-12-31','2024-01-01'

/*Comments: 7. Will not get result for the second part of the question. Display all column like Q5. for ItemCode having maximum qty.
Suggestion - Use column list in insert statements for better readability.*/

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Q8. Create a stored procedure to insert Leave data into EmpLeaves table.
Whenever an employee will take the leave a new row should be entry should be created and the total balance leaves in EmpDetails should be updated with current information. 
Make sure the transaction should be successful only. 
For any failure no insert/update should happen. Display actual error message.
Input – EmpId, LeaveDate, NoOfLeaveApplied
usp_InsertLeaveTransasction
If the Employee details is not available, display an error message “Employee Details Not Found”*/

SELECT *FROM EMPDETAILS
SELECT *FROM EMPLEAVES

CREATE OR ALTER PROC USP_INSERTLEAVETRANSACTION
	@EMPID INT,
	@LEAVEDATE DATE ,
	@LEAVEDAYS DECIMAL(3,1)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM EMPDETAILS WHERE EMPID = @EMPID)
	BEGIN
		SELECT ('EMP DETAILS NOT FOUND')
	END
	ELSE
	BEGIN TRY
		BEGIN TRANSACTION
	         UPDATE EMPDETAILS
	         SET BALANCELEAVES = (BALANCELEAVES - @LEAVEDAYS)
	         WHERE EMPID = @EMPID
	         
	         DECLARE @MAXLEAVEID INT
	         SELECT @MAXLEAVEID = CASE 
	         WHEN MAX(LEAVEID)IS NULL THEN 0
	         ELSE MAX(LEAVEID)
	         END
	         FROM EMPLEAVES
	         
	         SET @MAXLEAVEID=@MAXLEAVEID + 1
	         
	         INSERT INTO EMPLEAVES VALUES (@MAXLEAVEID,@EMPID,@LEAVEDATE,@LEAVEDAYS)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	    ROLLBACK TRANSACTION

		SELECT ERROR_MESSAGE() AS ERRORMESSAGE
	END CATCH
END

EXEC USP_INSERTLEAVETRANSACTION 3,'2024-07-27',1.5
EXEC USP_INSERTLEAVETRANSACTION 6,'2024-07-27',1.5
EXEC USP_INSERTLEAVETRANSACTION 7,'2024-07-27',1.5

SELECT *FROM EMPDETAILS
SELECT *FROM EMPLEAVES

	





