--STORED PROCEDURE

ONE OF THE DATABASE OBJECT.
PROGRAMMABILITY ------> STORED PROCEDURES
--SYSTEM STORED PROCEDURE-ALREADY EXISTED IN DB
--USESR DEFINED SP ARE OUTSIDE THE SYSTEM STORED PROCEDURE

--PREPARED SQL CODE THAT WE CAN SAVE SO THE CODE CAN BE USED AGAIN AND AGAIN
--REUSABLE
--PARAMETER IS A CONCEPT - VALUE THAT WE ARE PASSING TO EXECUTE SP.

BENEFITS:
--REUSABLE - MULTIPLE USERS AND APPLICATIONSA CAN EASILY USE AND REUSE SP BY MERELY CALLING IT.
--EASY TO MODIFY - WITH THE HELP OF ALTER PROC COMMAND
--SECURITY - CAN GIVE THE ACCESS TO THE SP TO SEE DATA BY RESTRICTING THE USERS FROM DIRECT ACCESS TO THE TABLE.
--LOW NETWORK TRAFFIC -SERVER ONLY PASSES THE PROCEDURE NAME INSTEAD OF THE WHOLE QUERY.
--INCREASED PERFORMANCE -UPON THE FIRST USE,A PLAN FOR SP IS CREATED AND STORED IN THE BUFFER POOL FOR QUICK EXECUTION FOR THE NEXT TIME
(EXECUTION PLAN WILL BE STORED SOMEWHERE IN C DRIVE)

--STORED PROCEDURE SYNTAX WITHOUT ANY PARAMETERS
--CREATE PROC PROCEDURE_NAME
CREATE PROCEDURE PROCEDURE_NAME
AS
BEGIN
  SQL_sTATEMENT (CODE/CALCULATIONS AS PER PROJECT REQUIREMENT)
END

--EXECUTE/RUN A STORED PROCEDURE
EXEC PROCEDURE_NAME
EXECUTE PROCEDURE_NAME

--SYSTEM STORED PROCEDURE MAINTAINED IN SEPARATE FOLDER AND CREATED BY THE SYSTEM.
--USED FOR SENDING EMAILS,EG: WRONG PASSWORD MULTIPLE TIMES
--EMAIL CONFIGURATION CAN BE DONE WITH SYSTEM SP.
--NO DIFFERENCE IN SYSTEM AND USER SP
--DBA GIVE ACCESS TO SP.
--WE CAN HAVE MULTIPLE TRANSACTION WITHIN SP.

EG: VIEW OFFERS OPTIONS----LOGICAL SQL STATEMENT TO DISPLAY DATA 
--UPON ONE CLICK DATA WILL SHOW;
--ONE BUSINESS LOGIC ---- ONE STORED PROCEDURE.
--FRONTEND DEVELOPER CONVERT TABULAR DATA IN A FORMAT IN WHICH BUSINESS IS ASKING.THEY WILL DESIGN THE STRUCTURE OF PAGE.
--MULTIPLE TEAMS RUN TO 
--FRONTEND WILL USE THE PROCEDURE CREATED BY US TO SHOW IN THE SCREEN
--THERE WILL BE CONNECTION MANAGER,APIS....TO RUN APPLICATION
API USED FOR CONNECTING TWO SOFTWARE COMPONENTS 

SQL LANGUAGE IS AN INTERFACE

PRODUCTION IS A LIVE SERVER.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --WITH PARAMETERS

 CREATE PROC PROCEDURE_NAME
 (
 @IN PAR1 DATATYPE,
 @IN PAR2 DATATYPE)
 )
 AS
BEGIN
  SQL_sTATEMENT (CODE/CALCULATIONS AS PER PROJECT REQUIREMENT)
END

--EXECUTE/RUN A STORED PROCEDURE
EXEC PROCEDURE_NAME
EXECUTE PROCEDURE_NAME VALUE @IN_PAR1,VAL -@IN_PAR2

 --SELECT DATA USING STORED PROCEDURE
 --TO SELECT ALL THE PRODUCTS/RETURN TOTAL LISTPRICE,AND STANDARDCOST FOR EACH PRODUCT WHERE NAME OF THE PRODUCT STARTS WITH 'mountain' and LISTPRICE IS MORE THAN O,COLOR IS NOT NULL
 --DISPLAY COLOR,TOTALLISTPRICE,TOTALSTANDARDCOST

 SELECT TOP 10 *FROM ADVENTUREWORKS2022.PRODUCTION.PRODUCT

CREATE PROC DBO.GET_PRODUCTCOSTBYCOLOR
AS
BEGIN
 SELECT 
	COLOR,
	SUM(LISTPRICE)AS TOTALLISTPRICE,
	SUM(STANDARDCOST)AS TOTALSTANDARDCOST
FROM ADVENTUREWORKS2022.PRODUCTION.PRODUCT
WHERE
YEAR(sELLSTARTDATE)='2012' AND
COLOR IS NOT NULL AND 
 NAME LIKE 'MOUNTAIN%' AND
 LISTPRICE > 0 --(<>0)
GROUP BY COLOR
END

--ANY OPERATION WE ARE DOING WE WILL WRITE IT IN NAME
EG: DBO.UPDATE_PRODUCTCOSTBYCOLOR

--EXECUTE SP TO GET THE RESULT
EXEC DBO.GET_PRODUCTCOSTBYCOLOR

--MODIFY STORED PROCEDURE
CREATE OR ALTER PROC DBO.GET_PRODUCTCOSTBYCOLOR
AS
BEGIN
 SELECT 
	COLOR,
	SUM(LISTPRICE)AS TOTALLISTPRICE,
	SUM(STANDARDCOST)AS TOTALSTANDARDCOST
FROM ADVENTUREWORKS2022.PRODUCTION.PRODUCT
WHERE
YEAR(sELLSTARTDATE)='2012' AND
COLOR IS NOT NULL AND 
 NAME LIKE 'MOUNTAIN%' AND
 LISTPRICE > 0 --(<>0)
GROUP BY COLOR
END

--EXECUTE SP TO GET THE RESULT
EXEC DBO.GET_PRODUCTCOSTBYCOLOR

--IF DO NOT WANT TO HARD CODE YEAR AS 2012 BUT RESULT NEEDS TO BE CHANGED
--WE NEED TO CREATE SP WITH INPUT PARAMETER
--CREATE SP WITH INPUT PARAMETER
CREATE OR ALTER PROC DBO.GET_PRODUCTCOSTBY_COLORYEAR
@YEAR INT
AS
BEGIN
	SELECT 
	COLOR,
	SUM(LISTPRICE)AS TOTALLISTPRICE,
	SUM(STANDARDCOST)AS TOTALSTANDARDCOST
FROM ADVENTUREWORKS2022.PRODUCTION.PRODUCT
WHERE
YEAR(sELLSTARTDATE)=@YEAR AND
COLOR IS NOT NULL AND 
 NAME LIKE 'MOUNTAIN%' AND
 LISTPRICE > 0 --(<>0)
GROUP BY COLOR

END

EXEC DBO.GET_PRODUCTCOSTBY_COLORYEAR 2012

RIGHT CLICK ---SCRIPT STORED PROCEDURE AS -----CREATE OR ALTER ----TO MODIFY THE SP -----TO GET SCRIPT

CREATE OR ALTER PROC DBO.GET_PRODUCTCOSTBY_COLORYEAR
@YEAR1 INT
@YEAR2 INT NOT NULL
AS
BEGIN
	SELECT 
	COLOR,
	SUM(LISTPRICE)AS TOTALLISTPRICE,
	SUM(STANDARDCOST)AS TOTALSTANDARDCOST
FROM ADVENTUREWORKS2022.PRODUCTION.PRODUCT
WHERE
YEAR(sELLSTARTDATE)IN ('@YEAR1','@YEAR2') AND
COLOR IS NOT NULL AND 
 NAME LIKE 'MOUNTAIN%' AND
 LISTPRICE > 0 --(<>0)
GROUP BY COLOR
END

EXEC DBO.GET_PRODUCTCOSTBY_COLORYEAR 2011,NULL

-------------------------------------------------
WE CANNOT USE INSERT INTO SYNTAX BECAUSE IT NEEDS ONLY HARD CODED VALUE

 --DATA REGISTRATION

CREATE TABLE DBO.STUDENTREGISTRATION
(
ID INT IDENTITY (1,1),
FIRSTNAME VARCHAR(100),
LASTNAME VARCHAR(100),
GENDER VARCHAR(1)
PHONENUMBER VARCHAR(12),
EMAIL VARCHAR(20)
)

--TO INSERT DATA USING SP

CREATE PROC DBO.INSERTSTUDENTREGISTRATION
(
@FIRSTNAME VARCHAR(100),
@LASTNAME VARCHAR(100),
@GENDER VARCHAR(!) NOT NULL,
@PHONENUMBER VARCHAR(12),
EMAIL VARCHAR(20)
)
AS
BEGIN
	INSERT INTO DBO.STUDENTREGISTRATION
	(
	FIRSTNAME,
	LASTNAME,
	GENDER,
	PHONENUMBER,
	EMAIL
	)
	VALUES
	(
	@FIRSTNAME ,
    @LASTNAME ,
    @GENDER ,
    @PHONENUMBER ,
    EMAIL
	)
END

SELECT *FROM DBO.STUDENTREGISTRATION

EXEC DBO.INSERTSTUDENTREGISTRATION 'ARINA','JOSHI','F','78956433','ARIJOSH@GMAIL.COM'

	ON CLICKING SUBMIT, SP IS BINDED, 

	--SEQUENCE MATTERS

	CREATE PROCEDURE


	CREATE TABLE dbo.StudentRegistration
(
ID INT IDENTITY(1,1),
FirstName VARCHAR(100),
LastName VARCHAR(100),
Gender VARCHAR(1),
PhoneNumber INT,
Email VARCHAR(20)
)

--------------------------------------------------------------------------------------------------------------------------------------------------------

--CLASS NOTE

-Stored Procedure Syntax:
--CREATE PROCEDURE procedure_name
CREATE PROC procedure_name
AS
Begin
 sql_statement (Code/Calculations as per project requirement)
End

--Execute/Run a Stored Procedure
EXEC procedure_name
EXECute procedure_nam

CREATE PROC procedure_name
(
@IN_PAR1 DATATYPE,
@IN_PAR2 DATATYPE
)
AS
Begin
 sql_statement (Code/Calculations as per project requirement)
End

--Execute/Run a Stored Procedure
EXEC procedure_name
EXECute procedure_nam VALUE-@IN_PAR1, VAL-@IN_PAR2

-- SELECT DATA USING STORED PROCEDURE --
-- RETURN - TotaListPrice AND StandardCost for Each Product WHERE NAME OF TH EPRODUCT STARTS WITH  'MOuntain' AND 
--ListPrice IS MORE THAN ZERO, COLOR IS NOT NULLL
-- COLOR, TotalListPrice, TotalStandardCost

SELECT DISTINCT(SellStartDate) FROM AdventureWorks2022.Production.Product

CREATE PROC dbo.Get_ProductCostByColor
AS
BEGIN
 SELECT
  Color,
  SUM(ListPrice) AS TotalListPrice,
  SUM(StandardCost) AS TotalStandardCost
 FROM AdventureWorks2022.Production.Product
 WHERE COLOR IS NOT NULL AND
  Name LIKE 'Mountain%' AND
  ListPrice > 0 -- (<> 0)
 GROUP BY Color
END

-- EXECURE SP TO GET THE RESULT
EXEC dbo.Get_ProductCostByColor

-- MODIFY STORED PROC
CREATE OR ALTER PROC dbo.Get_ProductCostByColor
AS
BEGIN
 SELECT
  Color,
  SUM(ListPrice) AS TotalListPrice,
  SUM(StandardCost) AS TotalStandardCost
 FROM AdventureWorks2022.Production.Product
 WHERE YEAR(SellStartDate) IN (2013,2012) AND
  COLOR IS NOT NULL AND
  Name LIKE 'Mountain%' AND
  ListPrice > 0 -- (<> 0)
 GROUP BY Color
END

-- EXECURE SP TO GET THE RESULT
EXEC dbo.Get_ProductCostByColor

-- CREATE SP WITH INPUT PARAMETER
CREATE PROC dbo.GET_PRODUCTCOSTBY_COLORYEAR
@YEAR INT
AS
BEGIN
 SELECT
  Color,
  SUM(ListPrice) AS TotalListPrice,
  SUM(StandardCost) AS TotalStandardCost
 FROM AdventureWorks2022.Production.Product
 WHERE YEAR(SellStartDate) = @YEAR AND
  COLOR IS NOT NULL AND
  Name LIKE 'Mountain%' AND
  ListPrice > 0 -- (<> 0)
 GROUP BY Color
END

--EXEC dbo.GET_PRODUCTCOSTBY_COLORYEAR 2011,2013
--EXEC dbo.GET_PRODUCTCOSTBY_COLORYEAR 2011,NULL
--EXEC dbo.GET_PRODUCTCOSTBY_COLORYEAR 2010
--EXEC dbo.GET_PRODUCTCOSTBY_COLORYEAR 2013