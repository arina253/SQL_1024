--TRIGGERS

VIEW IS NOT STORING DATA BUT QUERY IS RUNNING.

WE CAN CREATE TRIGGERS ON TABLE OR VIEWS.
A SET OF SQL STATEMENTS THAT RESIDE IN SYSTEM MEMORY WITH UNIQUE NAMES
A SPECIALIZED CATEGORY OF STORED PROCEDURE AS IT IS CALLED AUTOMATICALLY WHEN A DATABASE SERVER EVENT OCCURS.
--EVENTS SUCH AS DML OPERATIONS- INSERT,DELETE,UPDATE,DDL OPERATIONS-CREATE,ALTER,DROP.
EACH TRIGGER IS ALWAYS ASSOCIATED WITH A TABLE.
A STORED PROCEDURE MUST BE INVOKED DIRECTLY.

TRIGGERS/SP
WE CANNOT MANUALLY EXECUTE TRIGGERS.
TRIGGERS HAVE NO CHANCE OF RECEIVING PARAMETERS.
A TRANSACTION CANNOT BE COMMITTED OR ROLLED BACK INSIDE A TRIGGER

SYNTAX
CREATE TRIGGER SCHEMA.TRIGGER_NAME
ON TABLE_NAME
AFTER/INSTEAD OF {INSERT,UPDATE,DELETE}
--[NOT FOR REPLICATION]
AS
  {SQL_STATEMENTS}

SCHEMA.TRIGGER_NAME --- NAME OF THE TRIGGER WHICH WILL BE UNIQUE
ON TABLE_NAME - THIS IS THE TABLE NAME ON WHICH THE TRIGGER IS GOING TO BE CREATED
AFTER {INSERT,UPDATE,DELETE} - EVENT TYPE ON WHICH THE TRIGGER WILL BE EXECUTED/INVOKED/FIRED
{SQL_STATEMENTS} - SQL QUERY TO CAPTURE CHANGES INTO SOME OTHER TABLES.
[NOT FOR REPLICATION] 

REPLICATION IS THE PROCESS OF COPYING DATA FROM ONE DB OBJECT TO OTHER.

TRIGGERS ARE USED TO TRACK THE CHANGES IN TABLES(INSERT/UPDATE/DELETE)
TO INSERT SOME OF THE COLUMNS TO OTHER TABLE/ FOR REPLICATING THE DATA TO OTHER TABLES.
LOGGING THE INFORMATION OF CHANGES.

SELECT *FROM DBO.TBLEMPLOYEE
SELECT *FROM DBO.TBLEMPLOYEEAUDIT

DROP TABLE IF EXISTS tblEmployeeAudit
CREATE TABLE tblEmployeeAudit
(
 ID   INT,
 ChangeDesc VARCHAR(25),
 ChangeDate DATETIME,
 ChangeOwner VARCHAR(25)
)

CREATE TRIGGER TR_TBLEMPLOYEE_FORINSERT
ON TBLEMPLOYEES
FOR INSERT
AS BEGIN
	DECLARE @ID INT
    SELECT @ID = ID FROM INSERTED
	INSERT INTO TBLEMPLOYEEAUDIT VALUES
	('NEW EMPLOYEE WITH ID = ' + CAST(@ID AS NVARCHAR(5)) + 'IS ADDED AT ' + CAST(GETDATE()AS NDROP TABLE IF EXISTS tblEmployeeAudit
CREATE TABLE tblEmployeeAudit
(
 ID   INT,
 ChangeDesc VARCHAR(25),
 ChangeDate DATETIME,
 ChangeOwner VARCHAR(25)
)
END

SELECT *FROM DBO.TBLEMPLOYEE
INSERT INTO TBLEMPLOYEE VALUES (7,'TAN',2300,'FEMALE',3)    --INSERT
DELETE FROM TBLEMPLOYEE WHERE ID = 7                        --DELETE

MAGIC TABLES
THEY WILL BE CREATED AND DISPAPPEAR IMMEDIATELY
2 KINDS OF MAGIC TABLES : INSERTED AND DELETED.
THESE TABLES ARE USED ONLY BY TRIGGERS IN SQL SERVER.
--STRUCTURE OF THESE TABLES DEPEND ON THE OPERATION QUERY

**FOR THE LATEST ONE, WE WILL GO WITH INSERTED TABLE.

-----------------------------------------------------------------------------------------------------------------------------

--CLASS NOTES

SELECT *FROM DBO.TBLEMPLOYEE
SELECT *FROM TBLEMPLOYEEAUDIT

DROP TABLE IF EXISTS tblEmployeeAudit
CREATE TABLE tblEmployeeAudit
(
 ID   INT,
 ChangeDesc VARCHAR(25),
 ChangeDate DATETIME,
 ChangeOwner VARCHAR(25)
)

DML OPERATIONS ----- INSERT/UPDATE/DELETE
DDL OPERATIONS ----- CREATE/ALTER/DROP

--Syntax of Trigger
--We can create a trigger in SQL Server by using the CREATE TRIGGER statement as follows:

CREATE TRIGGER schema.trigger_name
ON table_name
AFTER/INSTEAD OF {INSERT,UPDATE,DELETE}
--[NOT FOR REPLICATION]
AS
 {SQL_STATEMENTS}

CREATE TRIGGER schema.trigger_name
ON table_name
AFTER UPDATE
--[NOT FOR REPLICATION]
AS
 {SQL_STATEMENTS}

 DROP TABLE IF EXISTS tblEmployeeAudit
CREATE TABLE tblEmployeeAudit
(
 ID   INT,
 ChangeDesc VARCHAR(25),
 ChangeDate DATETIME,
 ChangeOwner VARCHAR(25)
)

ALTER TABLE tblEmployeeAudit ALTER COLUMN ChangeDesc VARCHAR(255)

CREATE TRIGGER schema.trigger_name
ON table_name
AFTER INSERT 
--[NOT FOR REPLICATION]
AS
 {SQL_STATEMENTS}

CREATE TRIGGER schema.trigger_name
ON table_name
AFTER DELETE 
--[NOT FOR REPLICATION]
AS
 {SQL_STATEMENTS}

schema.trigger_name          --NAME OF THE TRIGGER WHICH WILL BE UNIQUE
ON table_name                --THIS IS THE TABLE NAME ON WHICH THE TRIGGER IS GOING TO BE CREATED
AFTER {INSERT,UPDATE,DELETE} -- EVENT TYPE ON WHICH THE TRIGGER WILL BE EXECUTED/INVOKED/FIRED
{SQL_Statements}             -- SQL QUERY TO CAPTURE CHANGES INTO SOME OTHER TABLES
[NOT FOR REPLICATION]--

--Example for AFTER TRIGGER for INSERT event on tblEmployee table:

CREATE OR ALTER TRIGGER Tr_tblEmployee_ForInsert
ON tblEmployee
AFTER INSERT 
AS
BEGIN
  Declare @Id int
  Select @Id = Id FROM Inserted

  INSERT INTO tblEmployeeAudit
  (
  ID,
  ChangeDesc,
  ChangeDate,
  ChangeOwner
  )
  VALUES
  (
  @Id,
  ('New employee with Id = ' + Cast (@Id as varchar(5)) + 'is added'),
  GETDATE(),
  SYSTEM_USER
  )

  INSERT INTO EMPSALARY(ID,SALARY)
  SELECT ID,SALARY
  FROM INSERTED

  END

  DROP TABLE IF EXISTS EMPSALARY
  CREATE TABLE EMPSALARY
  (
  ID INT,
  SALARY INT
  )

SELECT *FROM dbo.tblEmployee
SELECT *FROM dbo.tblEmployeeAudit
SELECT *FROM DBO.EMPSALARY

INSERT INTO tblEmployee VALUES ('RAMAN','AAA@GMAIL.COM',45,'MALE','2023-01-01',10000) ----INSERT
DELETE FROM tblEmployee WHERE ID = 7 --DELETE

-----------------------------------------------------------------------------------------------------------------------------

--TRIGGER_DAY2

SELECT *FROM INFORMATION_sCHEMA.TABLES---CAN CHECK THE EXISTENCE OF ALL TABLES.
--NOT DELETING DATA FOR ALL UPDATES BUT TRACKING THE HISTORY WITH IF ELSE
--WHEN WE ARE USING TRIGGERS, WE HAVE THE TABLE TO STORE IT.
--DELETED AND INSERTED ARE THE TWO MAGIC TABLES THAT AUTOMATICALLY DETECT CHANGES
--DATA BEFORE UPDATE AND DATA AFTER UPDATE.
--MAGIC TABLES OCCUPY SPACE FOR THAT QUERY ONLY,SO WHEN FUNCTION IS DONE, IT IS DELETED AUTOMATICALLY.

--FIRST TRIGGERING ACTION AND THEN ONLY UPDATE IN CASE OF INSTEAD OF TRIGGER


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *FROM TBLEMPLOYE
SELECT *FROM TBLDEPARTMENT

CREATE TRIGGER TR_TBLEMPLOYE_FORDELETE
ON TBLEMPLOYE
FOR DELETE
AS
BEGIN
 DECLARE @ID INT
 SELECT @ID = ID FROM DELETED

 INSERT INTO TBLEMPLOYEEAUDIT 
 (
 ID,
 CHANGEDESC,
 CHANGEDATE,
 ChangeOwner
 )
 VALUES
 (
 @ID,
 ('AN EXISTING EMPLOYEE WITH ID = ' + CAST(@ID AS NVARCHAR(5)) + 'IS DELETED'),
 GETDATE(),
 SYSTEM_USER
 )
END

SELECT *FROM TBLEMPLOYE WHERE DEPARTMENTID = 3
DELETE FROM TBLEMPLOYE WHERE DEPARTMENTID = 3

SELECT *FROM TBLEMPLOYE
SELECT *FROM TBLDEPARTMENT
SELECT *FROM TBLEMPLOYEEAUDIT

----DELETING THE COLUMN FROM DEPARTMENT TABLE ,WE CAN DELETE FROM EMPLOYEE TABLE AS WELL

SELECT *FROM TBLDEPARTMENT WHERE DEPTID = 4
SELECT *FROM TBLEMPLOYE WHERE DEPARTMENTID =4

DELETE FROM TBLDEPARTMENT WHERE DEPTID = 1

CREATE TRIGGER TR_TBLDEPARTMENT_FORDELETE
ON TBLDEPARTMENT
FOR DELETE
AS
BEGIN
 DECLARE @ID INT
 SELECT @ID = DEPTID FROM DELETED

 DELETE FROM TBLEMPLOYE WHERE DEPARTMENTID = @ID

 INSERT INTO TBLEMPLOYEEAUDIT
 (
 ID,
 CHANGEDESC,
 CHANGEDATE,
 CHANGEOWNER
 )
 SELECT
 @ID,
 ('AN EXISTING EMPLOYEE WITH ID = ' + CAST(@ID AS NVARCHAR(5)) + ' IS DELETED'),
 GETDATE(),
 SYSTEM_USER
END
GO

-------------------------------------------------------------------------------------------------------------------------

--Create AFTER UPDATE Trigger script

SELECT *FROM TBLEMPLOYEE
CREATE OR ALTER TRIGGER TR_TBLEMPLOYEE_FORUPDATE
ON TBLEMPLOYEE
AFTER UPDATE
AS 
BEGIN
 DROP TABLE IF EXISTS DELETEDAUDIT
 DROP TABLE IF EXISTS INSERTEDAUDIT

SELECT *INTO DELETEDAUDIT FROM DELETED
SELECT *INTO INSERTEDAUDIT FROM INSERTED

DECLARE @ID INT
SELECT @ID=ID FROM DELETED

INSERT INTO TBLEMPLOYEEAUDIT
 (
 ID,
 CHANGEDESC,
 CHANGEDATE,
 CHANGEOWNER
 )
 SELECT
 @ID,
 ('AN EXISTING EMPLOYEE WITH ID = ' + CAST(@ID AS NVARCHAR(5)) + ' IS UPDATED'),
 GETDATE(),
 SYSTEM_USER

END

UPDATE TBLEMPLOYEE 
SET NAME ='RAMU', SALARY = 20000, GENDER = 'MALE' WHERE ID = 1

SELECT *FROM DELETEDAUDIT
SELECT *FROM INSERTEDAUDIT
SELECT *FROM TBLEMPLOYEEAUDIT

--IF WE DO NOT WANT TO DROP TABLE

SELECT *FROM TBLEMPLOYEE
CREATE OR ALTER TRIGGER TR_TBLEMPLOYEE_FORUPDATE_IF
ON TBLEMPLOYEE
AFTER UPDATE
AS 
BEGIN
  -- Check if the DELETEDAUDIT table exists
  IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DELETEDAUDIT')
  BEGIN
    -- If it exists, insert the deleted rows into DELETEDAUDIT
    INSERT INTO DELETEDAUDIT (NAME, EMAIL, AGE, GENDER, HIREDATE, SALARY)
    SELECT NAME, EMAIL, AGE, GENDER, HIREDATE, SALARY FROM DELETED;
  END
  ELSE
  BEGIN
    -- If it doesn't exist, create the DELETEDAUDIT table with the structure of DELETED and insert the rows
    SELECT NAME, EMAIL, AGE, GENDER, HIREDATE, SALARY
    INTO DELETEDAUDIT
    FROM DELETED;
  END

  -- Check if the INSERTEDAUDIT table exists
  IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'INSERTEDAUDIT')
  BEGIN
    -- If it exists, insert the inserted rows into INSERTEDAUDIT
    INSERT INTO INSERTEDAUDIT (NAME, EMAIL, AGE, GENDER, HIREDATE, SALARY)
    SELECT NAME, EMAIL, AGE, GENDER, HIREDATE, SALARY FROM INSERTED;
  END
  ELSE
  BEGIN
    -- If it doesn't exist, create the INSERTEDAUDIT table with the structure of INSERTED and insert the rows
    SELECT NAME, EMAIL, AGE, GENDER, HIREDATE, SALARY
    INTO INSERTEDAUDIT
    FROM INSERTED;
  END
END;


UPDATE TBLEMPLOYEE 
SET NAME ='RAMA', SALARY = 20000, GENDER = 'FEMALE' WHERE ID = 1

SELECT *FROM DELETEDAUDIT
SELECT *FROM INSERTEDAUDIT
SELECT *FROM TBLEMPLOYEEAUDIT
SELECT *FROM TBLEMPLOYEE
