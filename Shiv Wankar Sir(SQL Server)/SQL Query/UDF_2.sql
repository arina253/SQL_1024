
SELECT *FROM DBO.TBLEMPLOYEE

--2) INLINE TABLE VALUED FUNCTIONS
RETURN A TABLE

CREATE FUNCTION FUNCTION_NAME
(
@PARAM1 DATATYPE,
@PARAM2 DATATYPE.....,
@PARAMN DATATYPE
)
RETURNS TABLE
AS
RETURN (SELECT STATEMENT)

--WE SPECIFY TABLE AS THE RETURN TYPE.
-- THE FUNCTION BODY IS NOT ENCLOSED IN BEGIN AND END BLOCK.
--INPUT PARAMETER IS NOT MUST FOR INLINE TABLE VALUED FUNCTION
--WE CAN APPLY FILTERS TO RESULTSETS OF INLINE TABLE VALUED FUNCTIONS
--WE CAN USE INLINE TABLE VALUED FUNCTIONS IN JOINS

TEMP TABLE - WE CAN INSERT DATA INTO TABLE.
UDF - WE CANNOT INSERT DATA INTO UDF.CAN STORE IN SYSTEM AND REUSABLE.
WE USE INPUT PARAMETER IN UDF

WE CAN USE THIS INLINE TABLE VALUED FUNCTIONS WITH WHERE CLAUSE AND JOINS.
IF WE WANT A PARTICULAR RESULT FOR A SINGLE TIME, WE SHOULD GO WITH CTE FOR TEMPORARY RESULT.
FUNCTIONS ARE USED IF WE ARE GOING TO USE IT IN SOME OTHER QUERY OR FUNCTIONS.


--3) MULTI STATEMENT TABLE VALUED FUNCTIONS

IN RETURNS WE HAVE ONE TABLE VARIABLE AND WE CAN DEFINE THE TABLE STRUCTURE.
WE CAN INSERT DATA INTO TABLE
HAVE BEGIN AND END BLOCK
WE CAN DEFINE THE STRUCTURE OF THE TABLE THAT WE ARE GETTING IN RESULT SET.
CAN FILTER THE RESULT SET
CAN USE PARAMETERS

INLINE TABLE VALUED FUNCTION IS FASTER AS COMPARED TO MULTISTATEMENT TABLE VALUED FUNCTION IN TERMS OF PERFORMANCE.

WHEN WE UPDATE INLINED TABLE VALUED FUNCTION, BASE TABLE GETS UPDATED
WE CANNOT UPDATE BASE TABLES WITH MULTISTATEMENT TABLE VALUED FUNCTIONS.

WE USE FUNCTION TO GET RESULT AFTER PROCESSING INPUT.

------------------------------------------------------------------------------------------------------------------------------

--CLASS NOTES

2)INLINE TABLE VALUED FUNCTIONS

CREATE FUNCTION fn_EmployeesByGender
(@Gender nvarchar(10))
RETURNS TABLE
AS 
RETURN
	(SELECT ID,Name,Gender,DepartmentId
	FROM TblEmploye
	WHERE Gender = @Gender)

--Calling the user defined function
SELECT *FROM fn_EmployeesByGender ('Male')

--The table returned by the table valued function, can also be used in joins with other tables.
--Joining the employees returned by the function with the Departments Table
SELECT Name,Gender,DepName
FROM fn_EmployeesByGender('Male') E
JOIN DEPARTMENT D
ON E.DEPARTMENTID = D.DEPID

SELECT *FROM DEPARTMENT

3) MULTISTATEMENT TABLE VALUED FUNCTION

CREATE FUNCTION MULTISTATEMENT_TABLEVALUED_FUNCTION_NAME
(
 @PARAM1 DATATYPE,
 @PARAM2 DATATYPE,
 @PARAMN DATATYPE
 )
 RETURNS
 @OUTPUTTABLE TABLE 
 (
	@COLUMN1 DATATYPEFORCOLUMN1,
	@COLUMN2 DATATYPEFORCOLUMN2
 )
 AS
 BEGIN
    --FUNCTION BODY
 RETURN
 END


 CREATE FUNCTION FN_MSTVF_GETEMPLOYEES()
 RETURNS @OUTTABLE TABLE
 (
  ID INT,
  NAME VARCHAR(20),
  SALARY INT
  )
  AS
  BEGIN
	INSERT INTO @OUTTABLE
	SELECT ID,NAME,SALARY
	FROM ZORBA_1024.DBO.EMPLOYEE
  RETURN
  END

  SELECT *FROM FN_MSTVF_GETEMPLOYEES()
  WHERE SALARY > 5000

  UPDATE FN_MSTVF_GETEMPLOYEES()
  SET SALARY = 10000
  WHERE NAME = 'BEN'
  --Object 'FN_MSTVF_GETEMPLOYEES' cannot be modified.
  --WE CANNOT UPDATE BASE TABLES WITH MULTISTATEMENT TABLE VALUED FUNCTIONS.


Declaring the return table structure
Starts and ends with BEGIN/END block
The function body can involve one or more than one statement
Must use to RETURN operator


CREATE FUNCTION dbo.UdfGetProductsScrapStatus
(
@ScrapComLevel INT
) 
RETURNS @ResultTable TABLE
( 
ProductName VARCHAR(50), ScrapQty FLOAT, ScrapReasonDef VARCHAR(100), ScrapStatus VARCHAR(50)
) AS BEGIN
        INSERT INTO @ResultTable
            SELECT PR.Name, SUM([ScrappedQty]), SC.Name, NULL
                FROM [Production].[WorkOrder] AS WO
                        INNER JOIN 
                        Production.Product AS PR
                        ON Pr.ProductID = WO.ProductID
                        INNER JOIN Production.ScrapReason AS SC
                        ON SC.ScrapReasonID = WO.ScrapReasonID
                WHERE WO.ScrapReasonID IS NOT NULL
                GROUP BY PR.Name, SC.Name
UPDATE @ResultTable
            SET ScrapStatus = 
            CASE WHEN ScrapQty > @ScrapComLevel THEN 'Critical'
            ELSE 'Normal'
            END
        
RETURN
END


SELECT 
    ProductName AS [Product Name],
    ScrapQty AS [Scrap Quantity] , 
    ScrapReasonDef AS [Scrap Reason],
    ScrapStatus AS [Scrap Status]
FROM dbo.UdfGetProductsScrapStatus(200)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SQL Server multi-statement table-valued functions
September 11, 2019 by Esat Erkec
SQL server Quest banner
In this article, we will learn multi-statement table-valued functions (MSTVFs) basics and then we will reinforce our learnings with case scenarios.

At first, If you are a newbie about the SQL Server functions concept, I would suggest taking a glance at the following two articles before to start this one:

How to use SQL Server built-in functions and create user-defined scalar functions
SQL Server inline table-valued functions
Why we use the functions
With the help of the functions, we can encapsulate the codes and we can also equip and execute these code packages with parameters.

Don’t Repeat Yourself (DRY) is a software development approach which advises that “as much as possible, don’t rewrite the same code again”. The main idea of this approach is to reduce code repetition. The main advantages of this idea are:

Improve maintainability
Improve the code readability
If we want to gain these benefits in SQL Server, the user-defined functions come at the first point in the list in order to implement this idea.

In the following section, we will go through with MSTVFs basics and usage scenarios.

Description and syntax:
Multi-statement table-valued function returns a table as output and this output table structure can be defined by the user. MSTVFs can contain only one statement or more than one statement. Also, we can modify and aggregate the output table in the function body. 