--INSTEAD OF TRIGGERS

--FIRED BEFORE THE TRIGGERING ACTIONS LIKE INSERT,UPDATE,DELETE.
--TO AVOID ERRORS IN ACTUAL QUERY AND UPDATE DATA CORRECTLY.
-- VIEWS BASED ON MULTIPLE TABLES MAY THROW ERROR AND INSTEAD OF TRIGGER IS USEFUL.
-- MOSTLY USED IN CASE OF UPDATION OR DELETION OF VIEWS BASED ON MULTIPLE TABLES
-- WHENEVER THERE IS NEED TO UPDATE DATA DIRECTLY IN THE TABLE

IF SINGLE TABLE AND UPDATE DATA, AFTER TRIGGERS USED.
IF REQUIREMENT TO UPDATE VIEWS DIRECTLY BASED ON MULTIPLE TABLE, INSTEAD OF TRIGGER USED.

IF DATA WHICH WE ARE INSERTING IS DEPENDENT ON SINGLE TABLE, WILL UPDATE CORRECTLY BUT IF DEPEND ON MULTIPLE BASE TABLES, MAY NOT UPDATE CORRECTLY. TO AVOID THIS ERROR, WE USE INSTEAD OF TRIGGERS.

INSTEAD OF TRIGGERS NOT USED IN REAL LIFE.

SELECT *FROM TBLEMPLOYEE
SELECT *FROM TBLDEPARTMENT

READ ALL THE DATA FROM INSERTED TABLE.
IF DATA IS VALID, THEN INSERT.
HOW TO CHECK VALID DATA?IF EMPID IS ALREADY PRESENT SHOULD THROW ERROR.
WE SHOULD ALWAYS INSERT DEPT NAME WHICH IS PRESENT IN DEPT TABLE.IF PRESENT THEN ALLOWD TO INSERT

WHEN THE DATA THAT WE ARE UPDATING IS BASED ON A SINGLE TABLE, WORK CORRECTLY.
WHEN TRY TO UPDATE FROM MULTIPLE TABLE, IT WILL THROW ERROR.
TO CHECK WHETHER THE NAME PASSED IS VALID OR NOT

IT IS GOOD IDEA TO UPDATE THE MAIN TABLE INSTEAD OF USING INSTEAD OF TRIGGERS

UPDATE DEPARTMENT ID IN EMPLOYEE TABLE

UPDATING DEPT NAME, WHAT IS THE ID ? WE ARE UPDATING DEPTID FROM INSERTED TABLE AND WORKING CORRECTLY.

IF WE DO NOT WANT TO USE RETURN USE ELSE STATEMENT
UPDATE() CHECK WHICH COLUMN WE ARE UPDATING.
THERE IS A FUNCTION AVAILABLE WITHIN THE CONTEXT OF TRIGGER BODY ,UPDATE() LIKE MAGIC TABLE.

TO GET DATA FROM VIEW, WE HAVE TO UPDATE BASE TABLE.

IN UPDATE TRIGGER WHICH IS AFFECTING MULTIPLE TABLE, WE WILL BE HAVING CONDITION FOR EACH COLUMN

WHEN WE ARE DELETING USING JOIN , WE SHOULD HAVE DELETE COMMAND BEFORE JOIN.ROWS MATCHING THE CONDITION WILL BE DELETED.
--THUPDATE() WILL CHECK AND RETURN TRUE(1) OR FALSE(0)
EARLIER DIRECTLY UPDATING DEPT NAME IN DEP TABLE.

-----------------------------------------------------------------------------------------------------------------

--CLASS NOTES

-Script to insert data:
Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)

--Script to insert data:
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')
GO

SELECT * FROM tblEmployee
SELECT * FROM tblDepartment

TRUNCATE TABLE tblEmployee
TRUNCATE TABLE tblDepartment

Create OR ALTER view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

SELECT * FROM vWEmployeeDetails

Insert into vWEmployeeDetails values (10, 'Serena', 'Female', 'Sales')
Insert into tblDepartment values (10,'Sales')

--Script to create INSTEAD OF INSERT trigger:
CREATE OR ALTER TRIGGER tr_vWEmployeeDetails_InsteadOfInsert
ON vWEmployeeDetails
INSTEAD OF INSERT
AS
BEGIN
 Declare @DeptId int

 --Check if there is a valid DepartmentId for the given DepartmentName

 Select @DeptId = DeptId
 from tblDepartment
 join inserted
 on inserted.DeptName = tblDepartment.DeptName

 -- If DepartmentId is null throw an error and stop processing

 if(@DeptId is null)
 Begin
  Raiserror ('Invalid Department Name. Statement terminated', 16, 1)
  -- return
 End

 --Finally insert into tblEmployee table
 ELSE
 BEGIN
  Declare @EmpId int
  --Check if there is a valid EmpId
  --for the given DepartmentName
  Select @EmpId = tblEmployee.Id
  from tblEmployee
  join inserted
  on inserted.Id = tblEmployee.Id

  if(@EmpId is null)
  BEGIN
   Insert into tblEmployee (Id, Name, Gender, DepartmentId)
   Select Id, Name, Gender, @DeptId
   from inserted
  END
  ELSE
  BEGIN
   Raiserror('Duplicate Employee Id. Statement terminated', 16, 1)
   return
  END
 END
End
GO

-- Now, let's execute the insert query:
Insert into vWEmployeeDetails values(7, 'Valarie', 'Female', 'IT')

-- Instead Of Update Triggers:
Update vWEmployeeDetails
SET Name = 'Johny', DeptName = 'IT'
where Id = 1

Update vWEmployeeDetails SET Name = 'John' WHERE Id = 1

--SELECT * FROM tblEmployee
SELECT * FROM tblDepartment

SELECT * FROM vWEmployeeDetails

--DELETE FROM tblEmployee WHERE Id>6

Update vWEmployeeDetails
set DeptName = 'IT'
where Id = 1

-- Update tblDepartment set DeptName = 'HR' where DeptId = 3

--Script to create INSTEAD OF UPDATE trigger:

CREATE OR ALTER TRIGGER tr_vWEmployeeDetails_InsteadOfUpdate
ON vWEmployeeDetails
INSTEAD OF UPDATE
AS
BEGIN
 -- if EmployeeId is updated 

 IF(Update(Id))
 BEGIN
  Raiserror('Id cannot be changed', 16, 1)
  Return
 END

 -- If DeptName is updated

 IF(Update(DeptName))
 Begin
  Declare @DeptId int
  Select @DeptId = DeptId
  from tblDepartment
  join inserted
  on inserted.DeptName = tblDepartment.DeptName
  
  if(@DeptId is NULL )
  Begin
   Raiserror('Invalid Department Name', 16, 1)
  --Return
  End
  ELSE
  BEGIN
   Update tblEmployee 
    set DepartmentId = @DeptId
   from inserted
   join tblEmployee
   on tblEmployee.Id = inserted.id
  END
 End

 -- If gender is updated
 if(Update(Gender))
 Begin
  Update tblEmployee 
  set Gender = inserted.Gender
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End

 -- If Name is updated
 if(Update(Name))
 Begin
  Update tblEmployee 
   set Name = inserted.Name
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End

End

-- Now, let's try to update JOHN's Department to IT.
Update vWEmployeeDetails
set DeptName = 'IT'
where Id = 1


SELECT * FROM vWEmployeeDetails
SELECT * FROM tblEmployee
SELECT * FROM tblDepartment

DELETE FROM vWEmployeeDetails WHERE DeptName = 'IT'

