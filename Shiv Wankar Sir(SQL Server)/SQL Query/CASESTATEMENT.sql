--THE SQL CASE STATEMENT
WHEN THE FIRST CONDITION IS MET,RESULT IS DISPLAYED.
LIKE IF THEN ELSE STATEMENT
IF NO CONDITION, RETURNS THE VALUE IN THE ELSE CLAUSE

CASE Syntax 
SELECT COL1,COL2,COL3
CASE 
WHEN column =1 THEN result1 
WHEN column=2 THEN result2 
WHEN column =N THEN resultN 
ELSE result 
END
FROM TABLE_NAME

--DISPLAY NATIONAL ID NUMBER,LOGINID, JOB TITLE,GENDER OF THE EMPLOYEE,
--IF GENDER = M THEN MALE AND IF GENDER = F THEN FEMALE, UNKNOWN VALUE FOR GENDER

SELECT NATIONALIDNUMBER,LOGINID,JOBTITLE,GENDER AS GENDERABBR,
CASE 
WHEN GENDER = 'M' THEN 'MALE'
WHEN GENDER = 'F' THEN 'FEMALE'
--ELSE 'UNKNOWN'
END AS GENDER
FROM [ADVENTUREWORKS2022].[HUMANRESOURCES].[EMPLOYEE]
--ALIAS NAME SHOULD BE THERE FOR COLUMN

--FIND THEAGE OF RETIRED EMPLOYEE
MARK THE EMPLOYEE AS RETIRED OR ACTIVE IF AGE<50
 SELECT *FROM [ADVENTUREWORKS2022].[HUMANRESOURCES].[EMPLOYEE]

 SELECT NATIONALIDNUMBER, DATEDIFF(YEAR,BIRTHDATE,GETDATE())AS AGE,
 CASE 
     WHEN DATEDIFF(YEAR,BIRTHDATE,GETDATE()) > 50 THEN 'RETIRED'
	 WHEN DATEDIFF(YEAR,BIRTHDATE,GETDATE()) =50  THEN 'RETIREMENTYEAR'
	 ELSE 'ACTIVE'
	 END AS EMPSTATUS,
	 CASE 
     WHEN DATEDIFF(YEAR,BIRTHDATE,GETDATE()) <40 THEN 'UNDER 40'
	 WHEN DATEDIFF(YEAR,BIRTHDATE,GETDATE()) <50 THEN 'UNDER 50'
	 --WHEN DATEDIFF(YEAR,BIRTHDATE,GETDATE()) > 30 AND  DATEDIFF(YEAR,BIRTHDATE,GETDATE()) < 40 THEN 'RETIREMENTYEARUNDER 40
	 ELSE 'OVER 50'
	 END AS AGEDESC
	 FROM [ADVENTUREWORKS2022].[HUMANRESOURCES].[EMPLOYEE]


--CASE IN UPDATE

UPDATE [ADVENTUREWORKS2022].[HUMANRESOURCES].[EMPLOYEE]
SET GENDER = CASE 
        WHEN GENDER = 'M' THEN 'MALE'
        WHEN GENDER = 'F' THEN 'FEMALE'
        ELSE 'UNKNOWN'
    END 
--NO ALIAS NAME IN UPDATE

SELECT * FROM SALES.SALESTERRITORY
SELECT *FROM SALES.SALESPERSON SP
JOIN SALES.SALESTERRITORY ST ON SP.TERRITORYID = SP.TERRITORYID

SELECT *FROM SALES.VSALESPERSON
--SELECT DATA FROM VIEW AND ORDER THE RESULT SET BY TERRITORY NAME AND USE CASE STATEMENT 
WHEN COUNTRYREGIONNAME IS NOT EQUAL TO UNITED STATES,ORDER BY WHATEVER THE COUNTRY NAME

SELECT BUSINESSENTITYID,FIRSTNAME,LASTNAME , COUNTRYREGIONNAME,TERRITORYNAME FROM SALES.VSALESPERSON
WHERE TERRITORYNAME IS NOT NULL
ORDER BY CASE
			WHEN COUNTRYREGIONNAME = 'UNITED STATES' THEN TERRITORYNAME
			ELSE COUNTRYREGIONNAME
		END

--NULL WILL COME FIRST
WHEN WE ARE DERIVING NEW COLUMN BASED ON CONDITION, WE HAVE TO GIVE ALIAS.
WHEN WE ARE USING CASE STATEMENT IN SELECT CLAUSE, WE USE ALIAS.
ALIAS IS NOT REQUIRED FOR UPDATE AND ORDER BY CLAUSE.


SELECT *FROM SALES.SALESORDERHEADER
IF TAXAMOUNT > 2000 

SELECT SALESPERSONID,SUM(TAXAMT)
CASE
	WHEN SUM(TAXAMT) > 500000 THEN 'OVERTAX'
	ELSE 'WITHIN LIMIT'
END
FROM SALES.SALESORDERHEADER
GROUP BY SALESPERSONID

-- WE CAN USE CASE STATEMENT WITH AGGREGATE FUNCTIONS AS WELL

--DIFFERENT WAYS TO REPLACE NULL VALUES
ISNULL- WE GIVE ONE VALUE AND CHECK ONE COLUMN
COALESCE - WE CAN CHECK MORE THAN ONE COLUMN AND FIRST NOT NULL VALUE WILL BE TAKEN FOR SELECT STATEMENT.

--SQL SERVER CAST()FUNCTION
CONVERTS A VALUE OF ANY DATATYPE INTO A SPECIFIED DATATYPE
SYNTAX:
CAST(EXPRESSION AS DATATYE(LENGTH))

SELECT CAST('2017-08-25' AS DATETIME)
SELECT CAST(25.65 AS INT)
CAN BE USED MAJORLY IN JOIN CONDITIONS

SELECT *FROM SALES.SALESORDERHEADER
SELECT *FROM SALES.SALESORDERDETAIL

SELECT *FROM SALES.SALESORDERHEADER SO
JOIN SALES.SALESORDERDETAIL SO
ON CAST(SH.SALESORDERID AS INT) =SO.SALESORDERID

WE CAN USE CAST IN JOIN AND SELECT CLAUSE

--SQL SERVER CONVERT()FUNCTION
MOSTLY USED FOR DATE FUNCTION

SELECT GETDATE()

SELECT CONVERT(VARCHAR,GETDATE(),106)
VARCHAR IS A TARGET DATATYPE --03 Jul 2024
--WE HAVE DIFFERENT STYLE FORMAT TO CONVERT DATE.

IN THE CAST() WE DONOT HAVE ANY STYLE TO CONVERT DATEFORMAT.
IN CONVERT() WE HAVE THE OPTION TO CONVERT DATE INTO SPECIFIC FORMAT BY THE USE OF STYLE.
CONVERT() IS USED FOR DATE FORMAT(99%)

--IF WE DO NOT HAVE MATCHING VALUE COLUMN , WE USE SUBQUERY.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CLASS NOTES

-- CASE Syntax
SELECT COL1, COL2, COL3,
CASE
 WHEN COL3 = 1 THEN result1
 WHEN COL3 = 2 THEN result2
 WHEN COL3 = 3 THEN resultN
 ELSE result
END
FROM TABLE_NAME

-- display NationalId number, loginId, job  Title,GenderAbbr of the employee, 
-- if gender=m then Male and If gender= F then female, Unkonwn value for Gender

SELECT NationalIDNumber,LoginID,JobTitle,Gender AS GenderAbbr,
CASE
 WHEN Gender = 'M' THEN 'Male'
 WHEN Gender = 'F' THEN 'Female'
 ELSE 'Unknowm'
END AS Gender
FROM [AdventureWorks2022].[HumanResources].[Employee]

SELECT * FROM [AdventureWorks2022].[HumanResources].[Employee]

SELECT NationalIDNumber,DATEDIFF(YEAR,BirthDate,GETDATE()) AS AGE,
CASE 
 WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) > 50 THEN 'Retired'
 WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) = 50 THEN 'RetirementYear'
 ELSE 'Active' 
END AS EmpStatus,
CASE 
 WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) < 40 THEN 'Under 40'
 WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) < 50 THEN 'Under 50'
 --WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) > 30 AND DATEDIFF(YEAR,BirthDate,GETDATE()) < 40 THEN 'Under 40'
 ELSE 'OVER 50' 
END AS AgeDesc
FROM [AdventureWorks2022].[HumanResources].[Employee]

-- CASE IN UPDATE
--ALTER TABLE [AdventureWorks2022].[HumanResources].[Employee] ALTER COLUMN Gender VARCHAR(10)
UPDATE [AdventureWorks2022].[HumanResources].[Employee]
SET Gender = CASE
    WHEN Gender = 'M' THEN 'Male'
    WHEN Gender = 'F' THEN 'Female'
    ELSE 'Unknowm'
    END

SELECT * FROM Sales.SalesTerritory
SELECT * FROM Sales.SalesPerson SP
JOIN Sales.SalesTerritory ST ON SP.TerritoryID = SP.TerritoryID

SELECT BusinessEntityID,FirstName,LastName,CountryRegionName,TerritoryName FROM  Sales.vSalesPerson
--ORDER BY CountryRegionName
WHERE TerritoryName IS NOT NULL
ORDER BY CASE 
   WHEN CountryRegionName = 'United States' THEN TerritoryName
   ELSE CountryRegionName
  END

SELECT SalesPersonID,SUM(TaxAmt),
CASE 
 WHEN SUM(TaxAmt) > 500000 THEN 'OVERTAX'
 ELSE 'WITHIN LIMIT'
END
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID

--SQL Server CAST() Function
The CAST() function converts a value (of any DATA type) into a specified datatype.
--Syntax:
CAST(expression AS datatype(length))

SELECT '2017-08-25' AS DATE
SELECT CAST('2017-08-25' AS datetime);
SELECT CAST(25.65 AS int)


SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail

SELECT * FROM Sales.SalesOrderHeader SH
JOIN Sales.SalesOrderDetail SO
ON CAST(SH.SalesOrderID AS INT) = SO.SalesOrderID

--SQL Server CONVERT() Function
The CONVERT() function converts a value (of any type) into a specified datatype.
Syntax:
CONVERT(data_type(length), expression, style)

SELECT GETDATE()
SELECT CONVERT(VARCHAR, GETDATE(), 106)



