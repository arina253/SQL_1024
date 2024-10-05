--WHEN WE UPDATE VIEW,ACTUALLY BASE TABLE WILL BE UPDATED
WE CAN UPDATE VIEW WHEN VIEW IS DEPENDENT ON SINGLE  BASE TABLE ONLY.
WE CAN INSERT, DELETE , UPDATE FROM BASE TABLE IN VIEW.

VIEWS ARE UPDATABLE IN SQL SERVER.DATA IS UPDATED IN THE BASE TABLE.
UPDATE WILL NOT WORK AS EXPECTED WHEN MORE THAN ONE TABLE IS USED.

WE CAN UPDATE DATA IN BASE TABLE USING VIEWS.
THERE MAY BE CHANCE OF UPDATING OTHER ROWS WHEN DATA IS FETCHED FROM MULTIPLE TABLE.

--INDEXED VIEW/MATERIALIZED VIEW
--NOT NECESSARY TO CREATE INDEX ON VIEW WHEN BASE TABLE HAS INDEX.
--2 TYPES OF SYSTEM:
OLAP-USED ONLY FOR REPORTING PURPOSE,SO NO NEED TO CREATE INDEX ON BASE TABLE.IF WE WANT TO FETCH DATA VIA VIEWS,WE CAN CREATE INDEXES.
OLTP - DB DEVELOPER WORK ON THIS.DATA ON MAIN TABLE CHANGES EVERYDAY AND THERE IS INDEXES ON BASE TABLE,SO WE CREATE INDEX ON SUCH TABLE.NO NEED TO CREATE INDEX ON VIEW.
--COST OF MAINTAINING INDEX ON VIEW IS MUCH HIGHER THAN CREATING INDEX ON BASE TABLE.

STANDARD/NON INDEXED VIEW - A STORED SQL QUERY.
WHEN WE CREATE AN INDEX ON VIEW, THE VIEW GETS MATERIALIZED.
CAPABLE OF STORING DATA INTO VIEW-MATERIALIZED VIEW

IF WE WANT TO CREATE INDEX ON VIEW, CERTAIN RULES TO BE FOLLOWED:
RULE: SHOULD HAVE SCHEMA NAME WHILE CREATING VIEW.
TABLE SHOULD HAVE TWO PART NAME,SCHEMA NAME AND TABLE NAME
THE FIRST INDEX THAT WE CREATE ON A VIEW MUST BE A UNIQUE CLUSTERED INDEX,THEN ONLY WE CAN CREATE NON CLUSTERED INDEX ON VIEW

--INDEXED VIEWS ARE  MORE OFTEN USED IN OLAP SYSTEMS

--WE CAN HIDE ROWS USING WHERE CLAUSE
--WE CANNOT USE ORDER BY CLAUSE IN VIEWS
--WE CANNOT USE ALTER COMMAND FOR MODIFYING THE STRUCTURE OF VIEW.

VIEW IS USED TO FETCH DATA FROM UNDERLYING TABLE.
SYNTAX OF NORMAL VIEW
2 TYPES: SIMPLE VIEW DEPEND ON SINGLE BASE TABLE.
VIEWS CAN BE UPDATABLE BUT INCASE OF COMPLEX VIEW WHEN IT IS DEPENDENT ON MULTIPLE BASE TABLE ,RESULT IS NOT AS EXPECTED.
INDEXED VIEW - INDEX ON VIEW. MATERIALIXED VIEW IN CASSE ON ORACLE
TO CREATE INDEX ON ANY VIEW,CERTAIN RULES TO BE FOLLOWED: SCHEMABINDING OPTIONS, USE ISNULL() TO REPLACE NULL VALUES IN AGGREGATE, INCLUDE COUNT_BIG(*),REFERENCE TABLE SHOULD HAVE 2 PART NAME.
VIEW SHOULD NOT BE DEPENDENT ON ANY OTHER VIEW

---------------------------------------------------------------------------------------------------------------
--CLASS NOTES

DROP TABLE IF EXISTS tblEmployee
CREATE TABLE tblEmployee
(
  Id int ,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

--Script to insert data:
Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)
GO

SELECT * FROM tblEmployee
GO

--Let's create a view, which returns all the columns from the tblEmployees table, except Salary column.
CREATE OR ALTER VIEW vWEmployeesDataExceptSalary
AS
SELECT Id, Name, Gender, DepartmentId
FROM tblEmployee
GO

-- Select data from the view: A view does not store any data. So, when this query is executed, 
-- the database engine actually retrieves data, from the underlying tblEmployee base table.


Select * from vWEmployeesDataExceptSalary

--Is it possible to Insert, Update and delete rows, from the underlying tblEmployees table, using view vWEmployeesDataExceptSalary?
--Yes, SQL server views are updateable.

--The following query updates, Name column from Mike to Mikey. Though, we are updating the view, 
-- SQL server, correctly updates the base table tblEmployee. To verify, execute, SELECT statement, on tblEmployee table.

Update vWEmployeesDataExceptSalary
Set Name = 'Mikey' Where Id = 2

SELECT * FROM dbo.tblEmployee
SELECT * FROM  tblDepartment

--Along the same lines, it is also possible to insert and delete rows from the base table using views.
Delete from vWEmployeesDataExceptSalary where Id = 2

Insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)

-- Now, let us see, what happens if our view is based on multiple base tables. 
-- For this purpose, let's create tblDepartment table and populate with some sample data.
--SQL Script to create tblDepartment table 

DROP TABLE IF EXISTS tblDepartment
CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

--Insert data into tblDepartment table
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')
GO

SELECT * FROM tblDepartment
SELECT * FROM tblEmployee

--View that joins tblEmployee and tblDepartment
Create OR ALTER view dbo.vwEmployeeDetailsByDepartment
as
Select TOP 10 Id, Name, Salary, Gender, DeptName
from dbo.tblEmployee
join dbo.tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
ORDER BY Salary
GO

--Select Data from view vwEmployeeDetailsByDepartment
Select * from vwEmployeeDetailsByDepartment

CREATE CLUSTERED INDEX IX_vwEmployeeDetailsByDepartment_ID
ON vwEmployeeDetailsByDepartment (ID)

-- Now, let's update, John's department, from HR to IT. At the moment, there are 2 employees (Ben, and John) in the HR department.
Update vwEmployeeDetailsByDepartment 
set DeptName = 'IT' where Name = 'John'

Update vwEmployeeDetailsByDepartment 
SET Salary = 5000 WHERE Name = 'Mikey'

The UPDATE statement, updated DeptName from HR to IT in tblDepartment table, instead of upadting DepartmentId column in tblEmployee table. 
--So, the conclusion - If a view is based on multiple tables, and if you update the view, it may not update the underlying base tables correctly.

-----------------------------------------------------------------------------------------------------------------

--What is an Indexed View or What happens when you create an Index on a view?
--A standard or Non-indexed view, is just a stored SQL query. When, we try to retrieve data from the view, 
--the data is actually retrieved from the underlying base tables. So, a view is just a virtual table it does not store any data, by default.

--However, when you create an index, on a view, the view gets materialized. This means, the view is now, capable of storing data. 
--In SQL server, we call them Indexed views and in Oracle, Materialized views.

--Let's now, look at an example of creating an Indexed view. For the purpose of this video, we will be using tblProduct and tblProductSales tables.

--Script to create table tblProduct
DROP TABLE IF EXISTS tblProduct
Create Table tblProduct
(
 ProductId int primary key,
 Name nvarchar(20),
 UnitPrice int
)

--Script to pouplate tblProduct, with sample data
Insert into tblProduct Values(1, 'Books', 20)
Insert into tblProduct Values(2, 'Pens', 14)
Insert into tblProduct Values(3, 'Pencils', 11)
Insert into tblProduct Values(4, 'Clips', 10)

SELECT * FROM tblProduct

--Script to create table tblProductSales
DROP TABLE IF EXISTS tblProductSales
Create Table tblProductSales
(
 ProductId int,
 QuantitySold int
)
GO

--Script to pouplate tblProductSales, with sample data
Insert into tblProductSales values(1, 10)
Insert into tblProductSales values(3, 23)
Insert into tblProductSales values(4, 21)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 13)
Insert into tblProductSales values(3, 12)
Insert into tblProductSales values(4, 13)
Insert into tblProductSales values(1, 11)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 14)
GO

-- Create a view which returns Total Sales and Total Transactions by Product. 
--Script to create view vWTotalSalesByProduct
Create view vWTotalSalesByProduct
with SchemaBinding
as
Select 
 Name, 
 SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales, 
 COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name
GO

--If you want to create an Index, on a view, the following rules should be followed by the view. For the complete list of all rules, please check MSDN.
1. The view should be created with SchemaBinding option
2. If an Aggregate function in the SELECT LIST, references an expression, and if there is a possibility for that expression to become NULL, then, a replacement value should be specified. In this example, we are using, ISNULL() function, to replace NULL values with ZERO.
3. If GROUP BY is specified, the view select list must contain a COUNT_BIG(*) expression
4. The base tables in the view, should be referenced with 2 part name. In this example, tblProduct and tblProductSales are referenced using dbo.tblProduct and dbo.tblProductSales respectively.

--Now, let's create an Index on the view:
--The first index that you create on a view, must be a unique clustered index. After the unique clustered index has been created, 
--you can create additional nonclustered indexes.

Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

Create Unique NONClustered Index UIX_vWTotalSalesByProduct_Count
on vWTotalSalesByProduct(TotalSales)

-- DROP INDEX UIX_vWTotalSalesByProduct_Name ON vWTotalSalesByProduct

--Since, we now have an index on the view, the view gets materialized. The data is stored in the view. 
--So when we execute 
Select * from vWTotalSalesByProduct, the data is returned from the view itself, rather than retrieving data from the underlying base tables.

Indexed views, can significantly improve the performance of queries that involves JOINS and Aggeregations. 
The cost of maintaining an indexed view is much higher than the cost of maintaining a table index.

Indexed views are ideal for scenarios, where the underlying data is not frequently changed. 
