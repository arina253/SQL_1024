/*Q5. Write Store Procedure “usp_GetInvoiceDetailsByItem” for getting below results with ITEMCODE as input.
Display INVCNUMB, INVCDATE,	LOCATION, ITEMCODE, QTY,CUM_SUM
Cumulative Sum is sum of qty for the ItemCode. Add previous qty to current row.
Sample result as below for ITEMCODE - R8196031
HINT – Use SUM() OVER() to get running Total*/

/*Q6. Write a store procedure to get Total count of invoice for each item along total quantity for the month. 
Month number is input parameter. 
Also, display the data like Q.5 for the ItemCode which is having higher quantity in the result set.*/

SELECT 
    IT.INVCNUMB,
    IT.INVCDATE,
    L.DESCRIPTION AS LOCATION,
    I.CODE AS ITEMCODE,
    IT.QTY,
    SUM(IT.QTY) OVER(ORDER BY IT.INVCDATE)AS CUM_SUM
    FROM [ITEM TRANSACTIONS]IT
    JOIN LOCATION L ON IT.LOCID = L.ID
    JOIN ITEMS I ON IT.ITEMID = I.ID


exec sp_depends usp_GetInvoiceDetailsByItem
exec sp_help usp_GetInvoiceDetailsByItem

select *from items
select *from location
select *from [item transactions]

CREATE OR ALTER PROCEDURE USP_GETINVOICEDETAILFORMONTH
 @MONTH INT
AS
BEGIN
	SELECT
	COUNT(IT.INVCNUMB)AS [TOTAL COUNT OF INVOICE],
	SUM(IT.QTY) AS [TOTAL QUANTITY],
	I.CODE,
	MONTH(IT.INVCDATE)AS [MONTH NAME]
	FROM [ITEM TRANSACTIONS]IT
	JOIN ITEMS I
	ON IT.ITEMID = I.ID
	GROUP BY I.CODE,MONTH(IT.INVCDATE)

	EXEC usp_GetInvoiceDetailsByItem 'R8196031'
END

EXEC USP_GETINVOICEDETAILFORMONTH 3

--------------------------------------------------------------------------------------------------------------------------
--Q.NO.5*****

CREATE OR ALTER PROCEDURE usp_GetInvoiceDetailsByItem
    @ITEMCODE NVARCHAR(50)
AS
BEGIN
    SELECT
		IT.INVCNUMB,
        IT.INVCDATE,
        L.DESCRIPTION AS LOCATION,
        I.CODE AS ITEMCODE,
        IT.QTY,
    SUM(IT.QTY) OVER(PARTITION BY I.CODE ORDER BY IT.INVCDATE, IT.INVCNUMB) AS CUM_SUM
    FROM [ITEM TRANSACTIONS]IT
    JOIN LOCATION L ON IT.LOCID = L.ID
    JOIN ITEMS I ON IT.ITEMID = I.ID
	WHERE
        I.CODE = @ITEMCODE
    ORDER BY
        INVCDATE, INVCNUMB
END

EXEC usp_GetInvoiceDetailsByItem 'R8196031'


--Q.NO.6

CREATE OR ALTER PROCEDURE USP_GETINVOICEDETAILFORMONTH
    @MONTH INT
AS
BEGIN
    -- Temporary table to hold the summary data
    IF OBJECT_ID('tempdb..#ItemSummary') IS NOT NULL
        DROP TABLE #ItemSummary;

    CREATE TABLE #ItemSummary (
        ITEMCODE NVARCHAR(50),
        TOTAL_INVOICES INT,
        TOTAL_QUANTITY INT
    );

    -- Insert summary data into the temporary table
    INSERT INTO #ItemSummary
    SELECT
        IT.ITEMCODE,
        COUNT(IT.INVCNUMB) AS TOTAL_INVOICES,
        SUM(IT.QTY) AS TOTAL_QUANTITY
    FROM
        [ITEM TRANSACTIONS] IT
    WHERE
        MONTH(IT.INVCDATE) = @MONTH
    GROUP BY
        IT.ITEMCODE;

    -- Get the item with the highest total quantity
    DECLARE @HighestQtyItemCode NVARCHAR(50);
    SELECT TOP 1
        @HighestQtyItemCode = ITEMCODE
    FROM
        #ItemSummary
    ORDER BY
        TOTAL_QUANTITY DESC;

    -- Display the summary data
    SELECT
        ITEMCODE,
        TOTAL_INVOICES AS [TOTAL COUNT OF INVOICE],
        TOTAL_QUANTITY AS [TOTAL QUANTITY]
    FROM
        #ItemSummary;

    -- Display detailed data for the item with the highest total quantity
    EXEC usp_GetInvoiceDetailsByItem @HighestQtyItemCode;
END

EXEC USP_GETINVOICEDETAILFORMONTH 3;

