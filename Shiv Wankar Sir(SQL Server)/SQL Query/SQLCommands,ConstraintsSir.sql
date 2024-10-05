CREATE TABLE Employee
(
EmpId INT,
Name VARCHAR(7),
Salary INT,
DOB DATE,
Gender VARCHAR(1),
Department VARCHAR(25)
)
-- ALTER TABLE Employee ALTER COLUMN EmpId TinyINT
ALTER TABLE Employee ADD IsACTIVE BIT
SELECT * FROM Employee 

NAME CHAR(10) -- OM-2, SHIV4, MAX-3, JUSTIN-6

-- 1 USED FOR ACTIVE RECORDS,
-- 0 IS USED FOR INACVTIVE RECORDS

INSERT INTO Employee VALUES (255.54,'MAX',1235456787,'02/01/1999','M','Sale',4)

-- VARCHAR,DATE DATATYPE VALUES MUST BE ENCLOSED WITHIN THE SINGLE QUOTES

SELECT * FROM Employee WHERE IsACTIVE=0
DECIMAL(5,2)
55.55

SMALLINT,
INT,
BIGINT
DECIMAL(3,1)
5.323 --> 5.00
NUMERIC --> 

DECIMAL---> (5,3) --- 20.5576588 -- 
NUMERIC---> (5,3) --- 20.5680980809 --

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

(P,S)

P- NUMBER OF DIGITS (ON EITHER SIDE OF DECIMAL)
S- SCALE (NUMBER OF DIGITS ON RIGHT SIDE OF DECIMAL)

DECIMAL & NUMERIC - WHAT IS MAXIMUM PRECISION 
(P - 38 DIGITS)
DEFAULT (18,0)

CREATE TABLE (Sales DECIMAL, Discount NUMERIC) SalesInfo

ALTER TABLE SalesInfo ALTER COLUMN Sales DECIMAL(5,2)
ALTER TABLE SalesInfo ALTER COLUMN Discount NUMERIC(6,3)
SELECT* FROM SalesInfo
INSERT INTO SalesInfo 
(Sales,Discount) VALUES 
--('123.45','123.45'), 
--('12.345','12.345'),
--('120.345','12.34578')

1 = TRUE
0 = FALSE

ANY VALUES GREATE THAN 1 --> WILL BE CONVERTED 1
VARCHAR VALUES --> 'TRUE' OR 'FALSE'

CREATE TABLE BIT_DT (FLAG BIT)

SELECT * FROM BIT_DT

INSERT INTO BIT_DT (FLAG) VALUES (1),(0),(NULL),(3)
INSERT INTO BIT_DT (FLAG) VALUES ('TRUE'),('FALSE')

CREATE TABLE DATEINFO (DATE1 DATETIME, DATE2 DATETIME2, DATE3 SMALLDATETIME,DATE4 DATE, DATE5 TIME)

SELECT * FROM DATEINFO

INSERT INTO DATEINFO (DATE1,DATE2,DATE3,DATE4,DATE5) VALUES 
(GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE()) -- MM/DD/YYYY, YYYY/MM/DD
insert into DATEINFO (DATE5) VALUES ('12:04:32')



-- MM/DD/YYYY HR:MM:SS:MS

SELECT GETDATE()   --> DATETIME
SELECT SYSDATETIME()  --> DATETIME2
SELECT CURRENT_TIMESTAMP --> DATETIME
SELECT GETUTCDATE()   --> DATETIME

CREATE TABLE TIMEOFF (CREATE_DT DATETIMEOFFSET)

SELECT * FROM TIMEOFF

INSERT INTO TIMEOFF VALUES ('2024-05-18 07:52:55.1600000 +02:00')

INSERT INTO TIMEOFF VALUES ('2024-05-18 07:52:55.1600000 +02:00')

SELECT CREATE_DT AS IST_ZONE, CREATE_DT AT TIME ZONE 'UTC' 
FROM TIMEOFF

CREATE TABLE TIMESTAM (ID INT,PRODUCT VARCHAR(10), CREATE_DT TIMESTAMP)
SELECT * FROM TIMESTAM
INSERT INTO TIMESTAM (ID, PRODUCT) VALUES (1,'TV')

PRODUCT -- UNIQUE

TV,
AC,
TV

ID - IDENTITY -- WILL NOT ALLOW DUPLICATE
AUTO INCREMENNTAL
DROP TABLE DUP
CREATE TABLE DUP (ID INT IDENTITY(10,10), PRODUCT VARCHAR(10))
SELECT * FROM DUP
INSERT INTO DUP (PRODUCT) VALUES ('TV')

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT / INSERT / CREATE / ALTER / DROP / DELETE

--/* SQL COMMANDS */
--1. DDL --> DATA DEFINATION LANGUAGE --> This are related to structure of database objects (Create/Alter/Drop/Truncate)
--1. DML --> DATA MANIPULATION LAN
--1. DCL --> DATA CONTROL LAN
--1. TCL --> TRANSACTION CONTROL LAN
--1. DQL --> DATA QUERY LANGUAGE

--DDL --> This has nothing to do with the data inside the object 
--1. CREATE
--2. ALTER
--3. DROP
--4. TRUNCATE

CREATE TABLE GiveYourTableName (FirstCol Datatype, SecCol DATATYPE.....)

-- A TABLE CAN HAVE MAX 1024 COLUMNS

CREATE TABLE TABLE_NAME 
( 
 COL1 INT,
 COL2 VARCHAR(20),
 COL3 VARCHAR(10),
 COL4 BIT,
 COL5 NUMERIC(6,2)
)

CREATE DATABASE DATABASE_NAME

DATABASE NAME - SQL_SAMLE

CREATE Procedure Proc_Name

CREATE PROCEDURE PROC_NAME
AS
BEGIN
 SQL COMMANDS
END

Create Database Database_Name

CREATE VIEW VIEW_NAME
SELECT

CREATE FUNCTION FUN_NAME

-- CREATE TABLE WITH NAME tblGender , ID AND Gender 

ALTER -- USED TO MODIFY THE OBJECT STRUCTURE/TABLE STRUCTURE
-- ADD NEW COLUMN, REMOVE EXISTING COLUMN / MODIFY THE DATATYPE OF COLUMN

CREATE TABLE [dbo].[Student]
(
 [RollNo] [smallint] NOT NULL,
 [FirstName] [varchar](50) NULL,
 [LastName] [varchar](50) NULL,
 [Email] [varchar](50) NULL,
 [DOB] [date] NULL
) ON [PRIMARY]
GO

GENERAL SYNTAX 
ALTER TABLE TABLE_NAME ADD /*COLUMN*/ COLUMN_NAME DATATYPE     --> ADDING NEW COLUMN
ALTER TABLE TABLE_NAME ALTER COLUMN COLUMN_NAME NEW_DATATYPE --> MODIFYING DATATYPE OF COLUMN
ALTER TABLE TABLE_NAME DROP COLUMN COLUMN_NAME     --> Drop Column from Table

exec sp_rename 'Student.DOB','Student.DateOfBirth','column'

ALTER PROCEDURE
ALTER VIEW

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

GENERAL SYNTAX 
ALTER TABLE TABLE_NAME ADD /*COLUMN*/ COLUMN_NAME DATATYPE     --> ADDING NEW COLUMN
ALTER TABLE TABLE_NAME ALTER COLUMN COLUMN_NAME NEW_DATATYPE    --> MODIFYING DATATYPE OF COLUMN
ALTER TABLE TABLE_NAME DROP COLUMN COLUMN_NAME        --> Drop Column from Table

SELECT * FROM StudentInfo

ALTER TABLE StudentInfo ADD Class1 

ALTER TABLE StudentInfo ALTER COLUMN RollNo INT

EXEC sp_rename 'OLD_NAME', 'NEW_NAME', 'NAMEOFOBJECT'

EXEC sp_rename 'Student.ID', 'RollNo', 'COLUMN' 

EXEC sp_rename 'Student', 'Student_Info' --,'TABLE'

DROP TABLE table_name; 
-- Drop Database Database_Name, 
Drop Proc Proc_Name 

ALTER TABLE TABLE_NAME DROP COLUMN COLUMN_NAME

--ALTER TABLE Student_Info 

DROP Table MS_SQL.[dbo].[DocType]
DROP Table SQL_1024.[dbo].[DocType]

Drop FUNCTION [dbo].[INSERT.EMPLOYEEDETAILS]

-- FULL NAME --> 3 PART NAME --> DATABASE.SCHEMA.OBJECT
ALTER TABLE dbo.Employee ALTER COLUMN EmpID INT IDENTITY(1,1)  NOT NULL

DROP TABLE tblGender

CREATE TABLE tblGender
(
ID INT IDENTITY(1,1),
Gender VARCHAR(6)
)

SELECT * FROM tblGender 

INSERT INTO tblGender (Gender) VALUES ('MALE'),('FEMALE'),('UNKN'),(NULL)

TRUNCATE TABLE tblGender 

DELETE FROM tblGender WHERE ID = 1 

-- DIFF BETWEEN DELETE AND TRUNCATE
1. TRUNCATE WILL DO THE IDENETITY RESET
1. DELETE WILL NOT 

1. TRUNCATE IS DDL / DELETE IS DML

------------------------------------------------------------------------------------------------------------------------------------------------------------------

Insert - It is used for inserting data into row of a table

-- There is a syntax we are having for Insert:

CREATE TABLE Dept 
(
DeptNo INT NOT NULL,
DeptName VARCHAR(14),
Location VARCHAR(13)
)

/* Syntax for Insert */
INSERT INTO TABLE_NAME (col1, col2, col3,.... col N)
VALUES (value1, value2, value3, .... valueN); 

INSERT INTO TABLE_NAME 
VALUES (value1, value2, value3, .... valueN);

INSERT INTO TABLE_NAME (col1)
VALUES (value1)

-- Above insert syntax --> only when all values will be provided
-- VALUES: VARCHAR WE MUST INCLUDE IN SINLGE QUOUTES >> ''
INSERT INTO dbo.Dept (DeptNo,DeptName,Location) 
VALUES 
(4,'IT','DELHI'),
(4,'IT','DELHI'),
(5,'SALES','LONDON'),
(5,'SALES','LONDON')

INSERT INTO dbo.Dept (LOCATION) 
VALUES 
('PUNE')
-- WE CAN INSERT INT VALUE TO VARCHAR COLUMN
-- WE CANNOT INSERT VARCHAR TO INT COLUMN
SELECT * FROM dbo.Dept

/* UPDATE */

Syntax:
UPDATE table_name 
SET [column_name1] = value1,
...column_nameN = valueN],
COL3 = VAL
[WHERE CONDITION] -- OPTIONAL

SELECT * FROM dbo.Dept

UPDATE dbo.Dept 
SET DeptName = 'Sales'
WHERE DeptName = 'ACCOUNTS'

UPDATE dbo.Dept 
SET DeptName = 'Sales'
WHERE DeptName = 'Sales' OR Location = 'PUNE'

UPDATE dbo.Dept 
SET DeptName = 'HR', Location = 'PUNE'
WHERE DeptNo = 11

UPDATE dbo.Dept 
SET DeptName = 'HR', Location = 'PUNE'
WHERE DeptNo = 10

UPDATE dbo.Dept 
SET LOCATION = 'NEW JURSEY'
WHERE DeptNo IN (6,7)

UPDATE dbo.Dept 
SET LOCATION = 'NEW JURSEY'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM dbo.Dept

/*
INSERT INTO dbo.Dept Values
(1,'Human Resource','New York'),
(2,'Marketing','Chicago'),
(3,'Finance','Boston'),
(4,'IT','Dallas'),
(5,'Sales','Dallas'),
(6,'HR','New York'),
(7,'Operations','New York')
*/

--SYNTAX 
DELETE FROM TABLE_NAME WHERE CONDITION --> DELETE DATA FROM A TABLE WITH FILTER (PARTICULAR ROWS)
DELETE FROM TABLE_NAME     --> DELETE DATA FROM ENTIRE TABLE OR DELETE ALL DATA FROM TABLE

SELECT * FROM dbo.Dept 
--DELETE FROM dbo.Dept
DELETE FROM dbo.Dept WHERE DeptNo > 4 -- ><=
DELETE FROM dbo.Dept WHERE DeptNo != 4 --> (!= OR <>)

-- DCL - DATA CONTROL LANGUAGE
-- ARE USED TO GRANT OR TAKE BACK THE ACCESS FROM THE USER

GRANT --> USED FOR PROVIDING THE ACCESS
REVOKE --> USED TO REMOVE THE ACCESS

GRANT PREVILILEGE_NAME ON OBJECT_NAme
TO USER_NAME 
PREVILILEGE_NAME --> INSERT, UPDATE, CREATE, DELETE, ALTER, TRUNCATE

GRANT INSERT ON SQL_1024
TO shivraj_wankar 

GRANT select ON SQL_1024
TO shivraj_wankar

revoke INSERT ON dbo.Dept
from shivraj_wankar

 -- TCL --> Transaction Control Language
 1. COMMIT
 2. ROLLBACK
 3. SAVE POINT

 -- DQL - DATA QUERY LANGUAGE
 --1 SELECT --> FETCHING DATA FROM A DATABASE TABLE

 SELECT COL1, COL2,COL3.... FROM TABLE_NAME
 SELECT * FROM TABLE_NAME -- * ALL COLUMNS

 SELECT DeptNo,DeptName FROM dbo.Dept 

 SELECT * FROM dbo.Dept 
 WHERE DeptNo < 5

 SELECT * FROM dbo.Dept 
 WHERE Location = 'NEW YORK'

 SELECT 
 TRANSACTION_ID,
 WITHDRAW_AMT,
 REMAINING_AMT,
 TRANS_DATE
 FROM TRANSACTIONS
 WHERE TRANS_DATE BETWEEN 'DATE' AND 'DATE2'

DDL
DML
DQL

TCL
DCL

SQL --> DATA IS KEY -->

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

• NOT NULL - Ensures that a column cannot have a NULL value --> '', NULL
• UNIQUE - Ensures that all values in a column are different 
(more than one UK per table, can accept only one null)
• PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
(only 1 PK per table)
• FOREIGN KEY - Prevents actions that would destroy links between tables
• CHECK - Ensures that the values in a column satisfies a specific condition
• DEFAULT - Sets a default value for a column if no value is specified

CREATE TABLE Colleges 
(
  college_id INT NOT NULL,
  college_code VARCHAR(20) NULL,
  college_name VARCHAR(50) NULL
);

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(1,'SAVT12','ORCHID COLLEGE'),
(2,'FEADS54','SVERI''S INSTITUTE')
--(NULL,'GGSDE','MIT INSTITUTE')

INSERT INTO COLLEGES VALUES (3,'BIYN01','')
INSERT INTO COLLEGES VALUES (4,'LTIN11','')

INSERT INTO COLLEGES VALUES (NULL,'GGSDE','MIT INSTITUTE')
INSERT INTO COLLEGES VALUES ('','GGSDE','MIT INSTITUTE')

INSERT INTO COLLEGES VALUES (5,'','MIT INSTITUTE')
INSERT INTO COLLEGES (college_id,college_name) VALUES (6,'BIGCE INSTITUTE')

ALTER TABLE COLLEGES ALTER COLUMN college_code VARCHAR(20) NOT NULL
ALTER TABLE COLLEGES ALTER COLUMN college_name VARCHAR(20) NOT NULL

TRUNCATE TABLE--> OR UPDATE NULL--> ''

UPDATE COLLEGES
 SET college_name = ''
WHERE college_name IS NOT NULL

SELECT * FROM Colleges

--DROP TABLE IF EXISTS Colleges

CREATE TABLE Colleges 
(
  college_id INT NOT NULL unique,
  college_code VARCHAR(20), -- unique key or unique constraint
  college_name VARCHAR(50),
  constraint uq_colleges_clgid unique (college_id),
  constraint uq_colleges_college_code unique (college_code)
 ) 

alter table Colleges alter column college_id int
alter table Colleges add constraint uq_colleges_clgid unique (college_id)

alter table table_name
add constraint constraint_name uq_Colleges_college_name
-- check constraint
alter table table_name add constraint constraint_name unique (column_name)
alter table Address drop constraint UQAddress091C2A1A65E645CE

alter table Colleges add constraint abc unique (college_name)
alter table Colleges add constraint abc unique (college_name)

alter table Colleges add constraint uq_Colleges_college_name unique (college_name)

-- fk_uq_pk_ck_df
-- uq_Colleges_college_name
-- abrreavation_tablename_columnname
update Colleges set college_name = ''
truncate table Colleges

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(1,'SAVT12','ORCHID COLLEGE'),
(2,'FEADS54','SVERI''S INSTITUTE')

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(null,'SAVT12','ORCHID COLLEGE')

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(3,'SAVT123','ORCHID COLLEGE')

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(5,'SAVT12','ORCHID COLLEGE')

SELECT * FROM Colleges

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Shiv Wankar Sir, [5/29/2024 10:21 PM]
DROP TABLE IF EXISTS Colleges
/* Below syntax will generate system name to primary key constraint */
CREATE TABLE Colleges (
  college_id INT ,
  college_code VARCHAR(20),
  college_name VARCHAR(50)
);

/* Below command will give a nice name to PK */
CREATE TABLE Colleges (
  college_id INT,
  college_code VARCHAR(20),
  college_name VARCHAR(50),
  constraint pk_colleges_clgid primary key (college_id,college_code)
);

/* ADD PRIMARY KEY CONSTRAINT TO EXISTING TABLE */

ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME PRIMARY KEY (COLUMN_NAME)

ALTER TABLE Colleges ALTER COLUMN college_code VARCHAR(20) NOT NULL

ALTER TABLE Colleges
ADD CONSTRAINT PK_Colleges_ClgId PRIMARY KEY (college_id)

ALTER TABLE Colleges
ADD CONSTRAINT PK_Colleges_college_ID_CODE PRIMARY KEY (college_id,college_code)

ALTER TABLE Colleges
DROP CONSTRAINT PK_Colleges_ClgId

ALTER TABLE Colleges
DROP COLUMN college_id

SELECT * FROM Colleges

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(3,'SAVT12','ORCHID COLLEGE'),
(4,'FEADS54','SVERI''S INSTITUTE')

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(null,'SAVT12','ORCHID COLLEGE')

INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(1,'SAVT12','ORCHID COLLEGE'),
(2,'FEADS54','SVERI''S INSTITUTE')
INSERT INTO Colleges (college_id,college_code,college_name) VALUES
(4,'FDS54','SVERI''S INSTITUTE')
(1,'SAVT12','ORCHID COLLEGE'),

DROP TABLE IF EXISTS Colleges

CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified

DROP TABLE IF EXISTS Colleges
CREATE TABLE Colleges 
(
  college_id INT PRIMARY KEY,
  college_code VARCHAR(20),
  college_country VARCHAR(20) DEFAULT 'INDIA'
);

CREATE TABLE Colleges 
(
  college_id INT PRIMARY KEY,
  college_code VARCHAR(20),
  college_country VARCHAR(20) CONSTRAINT DF_Colleges_ClgCntry DEFAULT ('India')
);

INSERT INTO Colleges (college_id,college_code,college_country) VALUES
(1,'SAVT12','USA'),
(2,'FEADS54','USA')

INSERT INTO Colleges (college_id,college_code) VALUES
(3,'SUKP10'),
(4,'SVIT')

INSERT INTO Colleges (college_id,college_code,college_country) VALUES
(5,'SUKP10',NULL),
(6,'SVIT',NULL)

SELECT * FROM Colleges
-- DEFAULT
-- IF WE SUPPLY VALUE FOR DEFAULT COLUMN -- SUPPLIED VALUE GET INSERTED
-- IF WE DID NOT SUPPLY ANY VALUE FOR DEFAULT COLUMN -- DEFAULT VALUE GET INSERTED

/* CREATE DEFAULT ON EXISTING TABLE/COLUMN */
ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME DEFAULT ('DEFAULT VALUE') FOR [COLUMN_NAME]

ALTER TABLE Colleges
ADD CONSTRAINT DF_Colleges_ClgCode DEFAULT ('XYZ') FOR College_Code

ALTER TABLE Colleges
ADD CONSTRAINT DF_Colleges_ClgId DEFAULT (1) FOR College_Id

ALTER TABLE Colleges DROP CONSTRAINT PKColleges012CD28C2EF279C3 


ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME 

INSERT INTO Colleges (College_id) VALUES
(7),
('SVIT')

CHECK:
The check constraint is used to limit the value range that can be inserted into the column.
when we define on check on a column, it will allow only certain range of values to be insert.

CREATE TABLE VOTERS
(
 ID INT NOT NULL,
 FName VARCHAR(50),
 LName VARCHAR(50),
 AGE INT CHECK (AGE>=18),
)

INSERT INTO VOTERS VALUES (1,'SHIVRAJ','WANKAR',29)
INSERT INTO VOTERS VALUES (2,'YASH','DAYAL',18)
INSERT INTO VOTERS VALUES (3,'VEERAJ','DAYAL',20)

INSERT INTO VOTERS VALUES (4,'VEERAJ','DAYAL',20,'FEMALE')
INSERT INTO VOTERS VALUES (4,'VEERAJ','DAYAL',20,'MALE')
INSERT INTO VOTERS VALUES (5,'RAJ','SHARMA',17,'MALE')

INSERT INTO VOTERS VALUES (6,'MANDEEP','SHARMA', 28,'UNKNOWN')

ALTER TABLE VOTERS ADD Gender VARCHAR(10)

ALTER TABLE VOTERS
ADD CONSTRAINT CHK_VOTERS_GENDER CHECK (GENDER='MALE')

ALTER TABLE VOTERS
ADD CONSTRAINT CHK_VOTERS_AGE CHECK (AGE BETWEEN 18 AND 50)

ALTER TABLE VOTERS
ADD CONSTRAINT CHK_VOTERS_GENDER CHECK (GENDER IN ('MALE','FEMALE'))

SELECT * FROM VOTERS

Shiv Wankar Sir, [5/29/2024 10:21 PM]
Unique Key --
1. Ensures every value is unique in column
2. It allows a single/1 null value to insert
3. More than 1 unique key per table

Primary Key --
1. Ensures every value is unique in column
2. It will not allows any null (it is always not null)
3. Only 1 primary key per table 

SUPPOSE I WANT TO CREATE PRIMARY ON TWO COLUMNS??

------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Shiv Wankar Sir, [5/30/2024 10:27 PM]
DROP TABLE IF EXISTS Employee
CREATE TABLE Employee
(
EmpId INT,
FName VARCHAR(10),
LName VARCHAR(10),
AGE INT,
DepartmentId INT,
FOREIGN KEY (DepartmentId) --(FOREIGN KEY COLUMN-- SAME TABLE)
REFERENCES Department (DeptId) -- REFERENCED_TABLE (REFERNCE COLUMN)
)

DROP TABLE Department
CREATE TABLE Department
(
DeptId INT PRIMARY key,
DepName VARCHAR(20),
Location VARCHAR(20)
)
-- DEPARTMENT TABLE IS NOT REFERENCING ANY DATA FROM OTHER TABLE-- THIS IS PARENT/PRIMARY TABLE
-- EMPLOYEE TABLE IS REFERENCING DEPTID FROM DEPARTMENT TABLE -- THIS IS CHILD TABLE

SELECT * FROM Department
SELECT * FROM Employee

INSERT INTO Department VALUES
(4,'Human Resource','New York')
(1,'Marketing','Mumbai'),
(2,'Sales','Delhi'),
(3,'IT-Software','New York')

INSERT INTO Employee VALUES
(5,'RAJ','WANKAR',33,4),
(4,'Jyoti','Khanna',33,2),
(1,'Tom','jERRY',33,2),
(2,'Shiv','Sharma',30,1),
(3,'Pravin','Sharma',45,3)

UPDATE Employee SET DepartmentId = 3 WHERE EmpId=2

DELETE FROM Employee WHERE DepartmentId = 3

DELETE FROM Department WHERE DeptId=3

DROP TABLE Department

-- WE WILL BE ABLE TO INSERT/REFER ONLY THOSE DEPTID WHICH ARE PRESENT IN DEPT TABLE
-- WE CANNOT DEELET THE DEPT ID IN DEPT TABLE WHICH ARE REFERENCE IN EMPLOYEE TABLE
-- WE CANNOT UPDATE THE EMPLOYEE TABLE DEPTID COLUMN TO VALUES WHICH ARE NOT AVAILABLE IN DEPT 
-- TABLE
-- TO CREATE THE FOREIGN KEY -- 2 TABLES MUST HAVE 1 COMMON COLUMN (WHICH HOLDS COMMON DATA)
-- 
-- STEPS / RULES
1. WE SHOULD HAVE COMMON COLUMN IN 2 TABLES (WHICH HOLDS COMMON DATA)
2. THE COLUMN WE ARE USING AS REFERENCE COLUMN -- THAT SHOULD BE PRIMARY KEY IN TABLE
-- THE PARENT TABLE / PRIMARY TABLE SHOULD HAVE THE PRIMARY KEY DEFINED ON THE COLUNM
-- THE COLUMN IN PARENT TABLE HAVING PRIMARY KEY CAN BE USED AS REFERENCE

CUSTOMER TABLE  -- CUID,NAME,CITY
ORDERS TABLE  -- ORDERID,AMOUNT,ITEM,CustmerId
TRASACTION TABLE -- TRANID, TRANAMT, ORDERID, CUSTID

-- PRIMARY KEY COLUMN OF THE PARENT TABLE WILL BE FOREIGN KEY COLUMN IN CHILD TABLE

-------------------------------------------------------------------------------------------------------------------------------------------------------------------


Shiv Wankar Sir, [5/30/2024 10:28 PM]
DROP TABLE IF EXISTS Employee
CREATE TABLE Employee
(
EmpId INT,
FName VARCHAR(10),
LName VARCHAR(10),
AGE INT,
DepartmentId INT
)

DROP TABLE Department
CREATE TABLE Department
(
DeptId INT PRIMARY KEY,
DepName VARCHAR(20),
Location VARCHAR(20)
)
/* CREATE FOREIGN KEY FOR EXISTING TABLE */

ALTER TABLE TABLENAME
ADD CONSTRAINT CONSTRAINT_NAME FOREIGN KEY (FOREIGN_KEY_COLUMN) 
REFERENCES REFERNEC_TABLE (REFERENCE_COLUMN FROM REFERENCE TABLE);

--PRIMARY KEY ()
--UNIQUE ()
--DEFAULT (VALUE) FOR ()
--CHECK (COLUMN=VALUES)

-- DEFAULT  --> D
-- CHECK  --> 

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_DepartmentId FOREIGN KEY (DepartmentId)
REFERENCES Department (DeptId)

ALTER TABLE Employee DROP CONSTRAINT FK_Employee_DepartmentId

SELECT * FROM Department
SELECT * FROM Employee

INSERT INTO Department VALUES
(4,'Human Resource','New York')
(1,'Marketing','Mumbai'),
(2,'Sales','Delhi'),
(3,'IT-Software','New York')

INSERT INTO Employee VALUES
(5,'RAJ','WANKAR',33,4),
(4,'Jyoti','Khanna',33,2),
(1,'Tom','jERRY',33,2),
(2,'Shiv','Sharma',30,1),
(3,'Pravin','Sharma',45,3)

UPDATE Employee SET DepartmentId = 3 WHERE EmpId=2

DELETE FROM Employee WHERE DepartmentId = 3

DELETE FROM Department WHERE DeptId=3

DROP TABLE Department

-- WE WILL BE ABLE TO INSERT/REFER ONLY THOSE DEPTID WHICH ARE PRESENT IN DEPT TABLE
-- WE CANNOT DEELET THE DEPT ID IN DEPT TABLE WHICH ARE REFERENCE IN EMPLOYEE TABLE
-- WE CANNOT UPDATE THE EMPLOYEE TABLE DEPTID COLUMN TO VALUES WHICH ARE NOT AVAILABLE IN DEPT 
-- TABLE
-- TO CREATE THE FOREIGN KEY -- 2 TABLES MUST HAVE 1 COMMON COLUMN (WHICH HOLDS COMMON DATA)
-- 
-- STEPS / RULES
1. WE SHOULD HAVE COMMON COLUMN IN 2 TABLES (WHICH HOLDS COMMON DATA)
2. THE COLUMN WE ARE USING AS REFERENCE COLUMN -- THAT SHOULD BE PRIMARY KEY IN TABLE
-- THE PARENT TABLE / PRIMARY TABLE SHOULD HAVE THE PRIMARY KEY DEFINED ON THE COLUNM
-- THE COLUMN IN PARENT TABLE HAVING PRIMARY KEY CAN BE USED AS REFERENCE





CUSTOMER TABLE  -- CUID,NAME, CITY
ORDERS TABLE  -- ORDERID,AMOUNT,ITEM,CustmerId
TRASACTION TABLE -- TRANID, TRANAMT, ORDERID, CUSTID

-- PRIMARY KEY COLUMN OF THE PARENT TABLE WILL BE FOREIGN KEY COLUMN IN CHILD TABLE

----------------------------------------------------------------------------------------------------------------------------------------------------------------------


Shiv Wankar Sir, [5/30/2024 10:28 PM]
DROP TABLE IF EXISTS Employee
CREATE TABLE Employee
(
EmpId INT,
FName VARCHAR(10),
LName VARCHAR(10),
AGE INT,
DepartmentId INT
)

DROP TABLE Department
CREATE TABLE Department
(
DeptId INT PRIMARY KEY,
DepName VARCHAR(20),
Location VARCHAR(20)
)
/* CREATE FOREIGN KEY FOR EXISTING TABLE */

ALTER TABLE TABLENAME
ADD CONSTRAINT CONSTRAINT_NAME FOREIGN KEY (FOREIGN_KEY_COLUMN) 
REFERENCES REFERNEC_TABLE (REFERENCE_COLUMN FROM REFERENCE TABLE);

--PRIMARY KEY ()
--UNIQUE ()
--DEFAULT (VALUE) FOR ()
--CHECK (COLUMN=VALUES)

-- DEFAULT  --> D
-- CHECK  --> 

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_DepartmentId FOREIGN KEY (DepartmentId)
REFERENCES Department (DeptId)

ALTER TABLE Employee DROP CONSTRAINT FK_Employee_DepartmentId

SELECT * FROM Department
SELECT * FROM Employee

INSERT INTO Department VALUES
(4,'Human Resource','New York')
(1,'Marketing','Mumbai'),
(2,'Sales','Delhi'),
(3,'IT-Software','New York')

INSERT INTO Employee VALUES
(5,'RAJ','WANKAR',33,4),
(4,'Jyoti','Khanna',33,2),
(1,'Tom','jERRY',33,2),
(2,'Shiv','Sharma',30,1),
(3,'Pravin','Sharma',45,3)

UPDATE Employee SET DepartmentId = 3 WHERE EmpId=2

DELETE FROM Employee WHERE DepartmentId = 3

DELETE FROM Department WHERE DeptId=3

DROP TABLE Department

-- WE WILL BE ABLE TO INSERT/REFER ONLY THOSE DEPTID WHICH ARE PRESENT IN DEPT TABLE
-- WE CANNOT DEELET THE DEPT ID IN DEPT TABLE WHICH ARE REFERENCE IN EMPLOYEE TABLE
-- WE CANNOT UPDATE THE EMPLOYEE TABLE DEPTID COLUMN TO VALUES WHICH ARE NOT AVAILABLE IN DEPT 
-- TABLE
-- TO CREATE THE FOREIGN KEY -- 2 TABLES MUST HAVE 1 COMMON COLUMN (WHICH HOLDS COMMON DATA)
-- 
-- STEPS / RULES
1. WE SHOULD HAVE COMMON COLUMN IN 2 TABLES (WHICH HOLDS COMMON DATA)
2. THE COLUMN WE ARE USING AS REFERENCE COLUMN -- THAT SHOULD BE PRIMARY KEY IN TABLE
-- THE PARENT TABLE / PRIMARY TABLE SHOULD HAVE THE PRIMARY KEY DEFINED ON THE COLUNM
-- THE COLUMN IN PARENT TABLE HAVING PRIMARY KEY CAN BE USED AS REFERENCE





CUSTOMER TABLE  -- CUID,NAME, CITY
ORDERS TABLE  -- ORDERID,AMOUNT,ITEM,CustmerId
TRASACTION TABLE -- TRANID, TRANAMT, ORDERID, CUSTID

-- PRIMARY KEY COLUMN OF THE PARENT TABLE WILL BE FOREIGN KEY COLUMN IN CHILD TABLE

Shiv Wankar Sir, [6/3/2024 9:39 PM]
drop table Persons

CREATE TABLE Persons (
 Personid int IDENTITY(100,10),
 LastName varchar(255) ,
 FirstName varchar(255),
 Age int);

 -- Auto-Increment
 -- MS SQL Uses IDENTITY KEYWORD FOR AUTO INCREMENT FEATURE
 -- IDENTITY(StartValue,IncrementalValue)
 -- Whenever we define identity column, No need to supply value for that column during insert
 -- Truncate will do the identity reset on the table (Identity value will be reset to starting value)
 -- Delete will not do identity reset (Even if records deleted & New record inserted, 
 -- next value will be assigned to Identity column)
 -- WE CANNOT SUPPLY THE VALUE TO THE IDENITY COLUMN
 -- IDENETITY_INSERT is SQL Feature to see Whether identity values can be specified explicitely during insert

 -- By Default -- IDENETITY_INSERT is OFF whenever we create identity column 
 (WE CANNOT INSERT THE VALUES IN IDENTITY COLUMN, That are automatically generated)

 -- IF YOU WANT TO INSERT EXPLICIT VALUE (IDENTITY VALUE BY YOU OWN) 
 THEN WE MUST SET THE IDENTITY_INSERT ON
 
 --SET IDENTITY_INSERT Database.dbo.Baskets ON

SELECT * FROM Persons 

SET IDENTITY_INSERT DatabaseName.Schema.TableName ON

SET IDENTITY_INSERT SAMPLE.dbo.Persons OFF
INSERT INTO Persons (Personid,LastName,FirstName,Age) VALUES (2,'Chahal','Rahul',35)

INSERT INTO Persons (Personid,LastName,FirstName,Age) VALUES (3,'GILL','SHUBH',35)
INSERT INTO Persons VALUES ('GILL','SHUBH',35)


INSERT INTO Persons --(Personid,LastName,FirstName,Age) 
VALUES ('Chahal','Rahul',35),
('RAJ','WANKAR',33),
('Jyoti','Khanna',33),
('Tom','jERRY',33),
('Shiv','Sharma',30),
('Pravin','Sharma',45)

Delete from Persons where Personid = 3

-- update Persons set Personid=3 where Personid = 2

Delete from Persons
Truncate table Persons

-- every insert--> New identity value = LastGeneratedIdentityValue + Incremenetal Value