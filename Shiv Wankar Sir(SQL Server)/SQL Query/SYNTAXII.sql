THE SQL CASE STATEMENT

CASE SYNTAX
CASE 
	WHEN CONDITION 1 THEN RESULT1
	WHEN CONDITION 2 THEN RESULT2
	WHEN CONDITION 3 THEN RESULT3
    ELSE RESULT
END

SELECT ORDER_NO,QUANTITY,PRODUCT_ID,
CASE 
	WHEN QUANTITY > 30 THEN 'THE QUANTITY IS GREATER THAN 30'
	WHEN QUANTITY = 30 THEN 'THE QUANTITY IS 30'
	ELSE 'THE QUANTITY IS UNDER 30'
END AS QUANTITYTEXT 
FROM ORDERS

Different ways to Replace NULL value:

SELECT PRODUCT,QUANTITY * (RATE +ISNULL(GST,0)AS 'TOTALCOST' FROM PRODUCT_MASTER

SELECT PRODUCT,QUANTITY * (RATE + COALESCE(GST,NULL,NULL,0) AS 'TOTAL COST' FROM PRODUCT_MASTER

SQL Server CAST() Function 
Syntax: 
CAST(expression AS datatype(length)) 

SELECT CAST ('2017-08-25' AS DATETIME);
SELECT CAST(34.5 AS INT)

SQL Server CONVERT() Function
Syntax: 
CONVERT(data_type(length), expression, style)

SELECT CONVERT(DATETIME,GETDATE(),106)
SELECT CONVERT(VARCHAR, GETDATE(), 106)

SELECT GETDATE()

IN THE CAST() WE DONOT HAVE ANY STYLE TO CONVERT DATEFORMAT.
IN CONVERT() WE HAVE THE OPTION TO CONVERT DATE INTO SPECIFIC FORMAT BY THE USE OF STYLE.
CONVERT() IS USED FOR DATE FORMAT(99%)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

THE SQL SELECT INTO STATEMENT
The SELECT INTO statement copies data from one table into a new table

Copy all columns into a new table: 
SELECT * 
INTO newtable [IN externaldb] 
FROM oldtable 
WHERE condition; 

Copy only some columns into a new table: 
SELECT column1, column2, column3, ... 
INTO newtable [IN externaldb] 
FROM oldtable 
WHERE condition; 

Tip: SELECT INTO can also be used to create a new, empty table using the schema of another. Just add 
a WHERE clause that causes the query to return no data: 
SELECT * INTO newtable 
FROM oldtable 
WHERE 1 = 0;

The following SQL statement copies data from more than one table into a new table:

SELECT CUSTOMERS.CUSTOMERNAME,ORDERS.ORDERID
INTO CUSTOMERSORDERBACKUP2017
FROM CUSTOMERS
LEFT JOIN ORDERS ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID;

The SQL INSERT INTO SELECT Statement

The INSERT INTO SELECT statement copies data from one table and inserts it into another table. 
The INSERT INTO SELECT statement requires that the data types in source and target tables match.

Note: The existing records in the target table are unaffected. 

INSERT INTO SELECT Syntax 
Copy all columns from one table to another table: 
INSERT INTO table2 
SELECT * FROM table1 
WHERE condition; 

Copy only some columns from one table into another table: 
INSERT INTO table2 (column1, column2, column3, ...) 
SELECT column1, column2, column3, ... 
FROM table1 
WHERE condition;

The following SQL statement copies only the German suppliers into "Customers":
INSERT INTO CUSTOMERS (CUSTOMERNAME,CITY,COUNTRY)
SELECT SUPPLIERNAME,CITY,COUNTRY FROM SUPPLIERS
WHERE COUNTRY = 'GERMANY'

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARING A VARIABLE---- USE 'DECLARE' STATEMENT
ASSIGNING A VALUE TO THE VARIABLE
USING VARIABLES IN A QUERY

The following SELECT statement uses the @PaymentAmount variable in the WHERE clause to find the 
customers who pays less than 5000 payment amount.

DECLARE @PAYMENTAMOUNT SMALLINT;
SET @ PAYMENTAMOUNT = 5000
SELECT
CUST_NAME,AGENT_CODE,OPENING_AMT,PAYMENT_AMT
FROM CUSTOMERS 
WHERE PAYMENT_AMT <  @PAYMENTAMOUNT
ORDER BY AGENT_CODE


Temporary Tables in SQL Server: 

1)Create temporary tables using SELECT INTO statement 
SELECT  
      select_list 
INTO  
      #temporary_table 
FROM  
      table_name 
Where Condition 

SELECT AGENT_CODE,AGENT_NAME,WORKING_AREA INTO #AGENTDATA FROM AGENTS
SELECT FROM *AGENTDATA


2)Create temporary tables using CREATE TABLE statement 
To Create Temporary Table: 
CREATE TABLE #EmpDetails (id INT, name VARCHAR(25))  

To Insert Values Into Temporary Table: 
INSERT INTO #EmpDetails VALUES (01, 'Lalit'), (02, 'Atharva')  

To Select Values from Temporary Table: 
SELECT * FROM #EmpDetails 

Local Temporary Table: 
CREATE TABLE #EmpDetails 
INSERT INTO #EmpDetails VALUES ( 01, 'Lalit'), ( 02, 'Atharva') 
SELECT * FROM #EmpDetails 

Global Temporary Table: 
CREATE TABLE ##EmpDetails (id INT, name VARCHAR(25))  
SELECT * FROM ##EmpDetails


Table Variables in SQL Server: 

DECLARE @LOCALTABLEVARIABLE AS TABLE
      (column_1 DATATYPE,
	   column_2,DATATYPE,
	   column_N,DATATYPE)
	   
DECLARE @LISTOFWEEKDAYS TABLE (DAYNUMBER INT, DAYABB VARCHAR(40), WEEKNAME VARCHAR(40))

INSERT INTO @LISTOFWEEKDAYS VALUES (1,'MON','MONDAY')

SELECT *FROM @LISTOFWEEKDAYS

--------------------------------------------------------------

IF-Else statement in SQL Server: 
IF Boolean_expression 
BEGIN 
    -- Statement block executes when the Boolean expression is TRUE 
END 
ELSE 
BEGIN 
    -- Statement block executes when the Boolean expression is FALSE 
END

IF @sales > 1000 
    BEGIN 
        PRINT 'Great! The sales amount in 2018 is greater than 1,000,000'; 
    END 

The following example first gets the sales amount from the AgentOrders table and then prints out a 
message if the sales amount is greater than 1 million 

BEGIN 
    DECLARE @sales INT; 
 
    SELECT    @sales = SUM(ORD_AMOUNT + ADVANCE_AMOUNT)   FROM     AgentORDERS 
    WHERE  month(ORD_DATE) = 07 
 
    --SELECT @sales; 
 
    IF @sales > 100000 
    BEGIN 
        PRINT 'Great! The sales amount in 2018 is greater than 100000'; 
    END 
 Else 
 BEGIN 
  PRINT 'Sales amount in July did not reach 100000'; 
 END 
END


Common Table Expressions 
;WITH cte_name (Column1, Column2,) 
AS 
( CTE_query )

 --CALL CTE
SELECT [COLUMN1,COLUMN2..]FROM CTE_NAME
SELECT *FROM CTE_NAME

--Write a query using CTE, to display the total number of Employees by Department Name.

WITH EMPLOYEECOUNT(DEPARTMENTID,TOTALEMPLOYEES)
AS
(SELECT DEPARTMENTID,COUNT(*)AS TOTALEMPLOYEES FROM TBLEMPLOYEE
GROUP BY DEPARTMENTID)
SELECT DEPNAME,TOTALEMPLOYEES
FROM TBLDEPARTMENT
JOIN EMPLOYEECOUNT
ON TBLDEPARTMENT.DEPTID = EMPLOYEECOUNT.DEPARTMENTID
ORDER BY TOTALEMPLOYEES

Infact, CTE column names are optional. However, if you do specify, the number of CTE columns and the CTE SELECT 
query columns should be same. Otherwise you will get an error stating - 'EmployeeCount has fewer columns than 
were specified in the column list'. 

Remember, a CTE can only be referenced by a SELECT, INSERT, UPDATE, or DELETE statement, that immediately 
follows the CTE. If you try to do something else in between, we get an error stating - 'Common table expression 
defined but not used'.

It is also, possible to create multiple CTE's using a single WITH clause.

WITH EMPLOYEESCOUNTBY_PAYROLL_IT_dEPT(DEPARTMENTNAME,TOTAL)
AS
(
SELECT DEPTNAME,COUNT(ID)AS TOTALEMPLOYEES
FROM TBLEMPLOYEE
JOIN TBLDEPARTMENT
ON TBLEMPLOYEE.DEPARTMENTID = TBLDEPARTMENT.DEPID
WHERE DEPTNAM IN ('PAYROLL','IT')
GROUP BY DEPTNAME),
EMPLOYEESCOUNTBY_HR_aDMIN_DEPT(DEPARTMENTNAME,TOTAL)
AS 
(
SELECT DEPTNAME,COUNT(ID)AS TOTALEMPLOYEES
FROM TBLEMPLOYEE
JOIN TBLDEPARTMENT
ON TBLEMPLOYEE.DEPARTMENTID = TBLDEPARTMENT.DEPTID
GROUP BY DEPTNAME
)
SELECT *FROM EMPLOYEESCOUNTBY_HR_ADMIN_DEPT
UNION 
SELECT *FROM EMPLOYEESCOUNTBY_PAYROLL_IT_DEPT

UPDATABLE CTE
With Employees_Name_Gender 
as 
( 
Select Id, Name, Gender from tblEmployee 
) 
Select * from Employees_Name_Gender

With Employees_Name_Gender 
as 
( 
Select Id, Name, Gender from tblEmployee 
) 
Update Employees_Name_Gender Set Gender = 'Female' where Id = 1 

--CTE, on both the tables - tblEmployee and tblDepartment

With EmployeesByDepartment 
as 
( 
Select Id, Name, Gender, DeptName  
from tblEmployee 
join tblDepartment 
on tblDepartment.DeptId = tblEmployee.DepartmentId 
) 
Select * from EmployeesByDepartment

With EmployeesByDepartment 
as 
( 
Select Id, Name, Gender, DeptName  
from tblEmployee 
join tblDepartment 
on tblDepartment.DeptId = tblEmployee.DepartmentId 
) 
Update EmployeesByDepartment set Gender = 'Male' where Id = 1 

in short if,  
1. A CTE is based on a single base table, then the UPDATE suceeds and works as 
expected. 
2. A CTE is based on more than one base table, and if the UPDATE affects multiple base 
tables, the update is not allowed and the statement terminates with an error. 
3. A CTE is based on more than one base table, and if the UPDATE affects only one base 
table, the UPDATE succeeds(but not as expected always) 

--RECURSIVE CTE

SELF JOIN QUERY: 
Select Employee.Name as [Employee Name], 
IsNull(Manager.Name, 'Super Boss') as [Manager Name] 
from EmpMngr Employee 
left join EmpMngr Manager 
on Employee.ManagerId = Manager.EmployeeId 

With 
  EmployeesCTE (EmployeeId, Name, ManagerId, [Level]) 
  as 
  ( 
    Select EmployeeId, Name, ManagerId, 1 
    from tblEmployee 
    where ManagerId is null 
     
    union all 
     
    Select tblEmployee.EmployeeId, tblEmployee.Name,  
    tblEmployee.ManagerId, EmployeesCTE.[Level] + 1 
    from tblEmployee 
    join EmployeesCTE 
    on tblEmployee.ManagerID = EmployeesCTE.EmployeeId 
  ) 
Select EmpCTE.Name as Employee, Isnull(MgrCTE.Name, 'Super Boss') as Manager,  
EmpCTE.[Level]  
from EmployeesCTE EmpCTE 
left join EmployeesCTE MgrCTE 
on EmpCTE.ManagerId = MgrCTE.EmployeeId