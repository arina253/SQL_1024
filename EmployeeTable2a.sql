
--Table name : Employee
EID        
ENAME
EADDRESS
EPHONENO
EEMAIL
EDESIGNATION
EDEPARTMENT
EJOININGDATE
EDOB
EGENDER
EMANAGERNAME

CREATE TABLE EMPLOYEE
(
EID      INT,
ENAME    VARCHAR(100),
EADDRESS NVARCHAR(100),
EPHONENO VARCHAR(12),
EEMAIL   VARCHAR(20),
EDESIGNATION VARCHAR(50),
EDEPARTMENT VARCHAR(50),
EJOININGDATE DATE,
EDOB DATE,
EGENDER CHAR(1),
ESALARY DECIMAL(10,2),
EMANAGERID INT
)

--EID INT(12345) OR VARCHAR(MX2522)
--Searching is difficult if we take NVARCHAR in ENAME
--Dynamic memory allocation in VARCHAR and NVARCHAR.
--Can use MONEY in ESALARY
--If EID is int,EMANAGERID is also int
--Money donot store any currency.
--VARCHAR support English keyboard.
-- Two ways to view table in database:
--1)Server name - Right click -- Refresh -- Database + ----Select db -----Select Tables----To see table name ---- Click on columns to see column name
--Always choose correct database when creating table.

2)--SELECT *FROM EMPLOYEE

SELECT *FROM EMPLOYEE ----- SELECT TABLE NAME PRESS FN + ALT + F1 without releasing any button
--Executing command : F5
