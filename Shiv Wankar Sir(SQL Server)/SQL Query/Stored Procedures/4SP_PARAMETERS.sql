--OUTPUT PARAMETER
The OUTPUT parameter is used when you want to return some value from the stored procedure. The 
calling program must also use the OUTPUT keyword while executing the procedure.

drop table if exists tblEmployee

CREATE TABLE tblEmployee
(
 Id int IDENTITY PRIMARY KEY,
 Name nvarchar(50),
 Email nvarchar(50),
 Age int,
 Gender nvarchar(50),
 HireDate date,
 Salary int
)

Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values 
('Sara Nan','Sara.Nan@test.com',35,'Female','1999-04-04',5000)
Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values
('James Histo','James.Histo@test.com',33,'Male','2008-07-13',4000)
Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values
('Mary Jane','Mary.Jane@test.com',28,'Female','2005-11-11',5000)
Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values
('Paul Sensit','Paul.Sensit@test.com',29,'Male','2007-10-23',3000)

CREATE PROC DBO.GETEMPSALARY_IN
@ID INT
AS 
BEGIN
	SELECT
		SALARY
    FROM TBLEMPLOYEE
	WHERE ID = @ID
END

EXEC DBO.GETEMPSALARY_IN 2

CREATE PROC DBO.GETEMPSALARY_OUT
@ID INT,
@SAL INT OUT 
AS 
BEGIN
  SET @SAL = (SELECT
	            SALARY
             FROM TBLEMPLOYEE
	         WHERE ID = @ID)

	--SELECT @SAL AS EMPSALARY
	--PRINT @SAL
END

DECLARE @SAL INT
EXEC DBO.GETEMPSALARY_OUT 2,@SAL OUT
SELECT @SAL AS SALARY
--EXECUTE ALL 3 STEPS AT ONCE.

--FOR OUTPUT PARAMETER,WE NEED TO DECLARE VARIABLE.
--OUTPUT PARAMETER IS MOSTLY USED TO SEND ERROR MESSAGE.
--OUTPUT PARAMETER IS A SINGLE VALUE PARAMETER.
--PROCEDURE WITH OUTPUT PARAMETERS ARE USED WITH SUCCESS INDICATIOR,FAILURE INDICATOR IN STORED PROCEDURE.

DECLARE @NAME VARCHAR(10)
SET @NAME ='SQL'
SELECT @NAME

SETTING THE VALUE INSIDE THE PARAMETER AND DISPLAYING IT AFTER EXECUTION OR STORING IT FOR OTHER PART OF SOFTWARE-----OUTPUT PARAMETER

--DISPLAYING THE DATA BACK FROM THE SP TO THE FRONTEND?
There are a total of three methods of returning data from a stored procedure: OUTPUT parameter, result 
sets, and return codes. 
Result sets: If the body of the stored procedure has a SELECT statement, then the rows returned by the 
select statement are directly returned to the client. 
Return code: A stored procedure can return an integer value called the Return code which will indicate 
the execution status of the procedure. You specify the return code using the RETURN keyword in the 
procedure.

Return code can be 1 or 0.

--OPTIONAL PARAMETERS
ACT AS DEFAULT VALUE IN THE INSERT COMMAND

CREATE OR ALTER PROCEDURE USPUPDATEEMPSALARY
(
@EMPID INT,
@SALARY MONEY = 1000
)
AS
BEGIN





CREATE OR ALTER PROC INSERT_EMP
@NAME VARCHAR(50),
@EMAIL VARCHAR(50),
@AGE INT,
@GENDER VARCHAR(10),
@HIREDATE DATETIME = '01/01/2025'
AS 
BEGIN
	INSERT INTO TBLEMPLOYEE(NAME,EMAIL,AGE,GENDER,HIREDATE)
	VALUES
	(@NAME,@EMAIL,@AGE,@GENDER,@HIREDATE)
END

EXEC INSERT_EMP 'SHIVRAJ','S.S@GMAIL.COM',28,'MALE','01/01/2024'

--IF WE DONOT WANT TO PASS HIREDATE
--IF I DONOT WANT TO SET DEFAULT VALUE BUT SET IT AS NULL, WE USE OPTIONAL PARAMETER

INPUT PARAMETERS ARE THOSE FOR WHICH WE ARE SUPPLYING VALUE
--OUTPUT PARAMETERS ARE USED TO STORE THE VALUES OF THE EXECUTION STATUS.

----------------------------------------------------------------------------------------------------------------------------------------------------------

Shiv Wankar Sir, [7/23/2024 8:07 PM]
--CLASS NOTES 
drop table if exists tblEmployee

CREATE TABLE tblEmployee
(
 Id int IDENTITY PRIMARY KEY,
 Name nvarchar(50),
 Email nvarchar(50),
 Age int,
 Gender nvarchar(50),
 HireDate date,
 Salary int
)

Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values 
('Sara Nan','Sara.Nan@test.com',35,'Female','1999-04-04',5000)
Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values
('James Histo','James.Histo@test.com',33,'Male','2008-07-13',4000)
Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values
('Mary Jane','Mary.Jane@test.com',28,'Female','2005-11-11',5000)
Insert into tblEmployee (Name,Email,Age,Gender,HireDate,Salary) values
('Paul Sensit','Paul.Sensit@test.com',29,'Male','2007-10-23',3000)

SELECT * FROM tblEmployee
GO

CREATE OR ALTER PROC dbo.GetEmpSalary_IN
@ID INT
AS
BEGIN
 SELECT
  Salary
 FROM tblEmployee
 WHERE Id = @ID
END

EXEC dbo.GetEmpSalary_IN 2

CREATE OR ALTER PROC dbo.GetEmpSalary_OUT
@ID INT ,
@Sal INT OUT
AS
BEGIN
 SET @Sal = (SELECT
     Salary
    FROM tblEmployee
    WHERE Id = @ID)

 -- SELECT @Sal AS EmpSalary
 -- PRINT @Sal 
 
 SELECT 1 
 SELECT 0
END


EXEC dbo.GetEmpSalary_IN 3

DECLARE @Sal INT
EXEC dbo.GetEmpSalary_OUT 3, @Sal OUT
SELECT @Sal AS SALARY

DECLARE @NAME VARCHAR(10)
SET @NAME = 'SQL'
SELECT @NAME

SELECT * FROM tblEmployee

CREATE OR ALTER PROCEDURE uspUpdateEmpSalary
(
  @empId int
 ,@salary money = 1000
)
AS
BEGIN
 UPDATE dbo.tblEmployee
 SET Salary = @salary
 WHERE ID = @empId
END

EXEC uspUpdateEmpSalary 6--,5500

CREATE OR ALTER PROC Insert_EMP
@Name VARCHAR(50),
@Email VARCHAR(50),
@Age INT = 28,
@Gender VARCHAR(10),
@HireDate DATETIME = '01/01/2024'
AS
BEGIN
 INSERT INTO tblEmployee
 (Name,Email,Age,Gender,HireDate)
 VALUES 
 (@Name,@Email,@Age,@Gender,@HireDate)

END

EXEC Insert_EMP @Name = 'SOHAM',@Email = 's.s@gmail.com',@Age = 28,@Gender= 'Male'

SELECT * FROM tblEmployee

Create Proc spSearchEmployees
@Name nvarchar(50) = NULL,
@Email nvarchar(50) = NULL,
@Age int = NULL,
@Gender nvarchar(50) = NULL
as
Begin
 Select * from tblEmployee 
 where
 (Name = @Name OR @Name IS NULL)  AND
 (Email = @Email OR @Email IS NULL) AND
 (Age = @Age OR @Age IS NULL)  AND
 (Gender = @Gender OR @Gender IS NULL) 
End

Execute spSearchEmployees        -- This command will return all the rows
Execute spSearchEmployees @Gender = 'Male'    -- Retruns only Male employees
Execute spSearchEmployees @Gender = 'Male', @Age = 29 -- Retruns Male employees whose age is 29

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Useful System Stored Procedures:
sp_depends
exec sp_depends 'dbo.InsertStudentRegistration'
shows object types used in this sp that may be view,cursor,procedures

exec sp_depends 'dbo.tblEmployee'
--Object does not reference any object, and no objects reference it.

exec sp_depends 'dbo.IntershipRegistration'

sp_help : show all the details of any database object..
exec sp_help 'Update_RegistrationData'

Right click on object ----- View dependencies
