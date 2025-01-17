--Using Stored Procedure for inserting data 
CREATE TABLE DBO.STUDENTREGISTRATION
(
ID INT IDENTITY (1,1),
FIRSTNAME VARCHAR(100),
LASTNAME VARCHAR(100),
GENDER VARCHAR(1),
PHONENUMBER VARCHAR(12),
EMAIL VARCHAR(20)
)

CREATE PROCEDURE DBO.INSERTSTUDENTREGISTRATION
	@FIRSTNAME VARCHAR(100),
	@LASTNAME VARCHAR(100),
	@GENDER VARCHAR(1),
	@PHONENUMBER VARCHAR(12),
	@EMAIL VARCHAR(20)
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
	@FIRSTNAME,
	@LASTNAME,
	@GENDER,
	@PHONENUMBER,
	@EMAIL
	)
END

SELECT *FROM DBO.STUDENTREGISTRATION

EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ARINA','JOSHI','F','123456789','ARIJOSH.SQL2024@GAMIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ANAMIKA','SHAHA','F','234567890','ANA@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ANUBHAV','NEPAL','M','345678901','ANU@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'BIBHA','KARKI','F','456789012','BKARKI@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'BIKASH','THAPA','M','56789012','BKASH@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'BISHAL','THAPA','M','56789012','BSHAL@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ANJU','SINGH','F','2222222222','ANJU@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'AMAR','SHRESTHA','M','3333333333','AMAR@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'BHARAT','VERMA','M','4444444444','BBB@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'DADHI','BHATTARAI','M','5555555555','DDD@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'DIPESH','KC','M','6666666666','DPESH@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'DIPESH','KOIRALA','M','8888888888','DP@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ICHHA','RAI','F','2111111111','III@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ISHA','SHRESTHA','F','99999999999','IS@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'JYOTI','NEGI','F','4555555555','JJJ@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'KRISHNA','KHAREL','M','5666666666','KKK@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'MANJEET','ACHARYA','M','6555555555','MMM@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'NEHA','PARAJULI','F','34444444444','NEHA@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'NIMA','SHERPA','M','8777777777','NNN@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'PRIYANKA','BHATTARAI','F','98888888888','PRI@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'SAROJ','SHRESTHA','M','8777777777','SAR@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'BIGYA','DHAKAL','F','4566666666','BIGYA@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'ROJINA','THAPA','F','2345555555','ROJ@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'RAMHARI','GURAGAI','M','8765432109','RAM@gMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'LOBSANG','GYATSO','M','7899999999','LOB@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'PRAKASH','PYAKUREL','M','7777766666','PRA@GMAIL.COM'
EXECUTE DBO.INSERTSTUDENTREGISTRATION 'RABIN','MAHARJAN','M','5678901111','RBIN@GMAIL.COM'

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE IF  EXISTS [dbo].[IntershipRegistration]
GO

CREATE TABLE [dbo].[IntershipRegistration]
(
FullName  VARCHAR(100),
Email   VARCHAR(100),
EducationalQual VARCHAR(20),
PassoutYear  INT,
Profile   VARCHAR(50),
IntershipIn  VARCHAR(50),
PrimContact  VARCHAR(10),
SecContact  VARCHAR(10),
SupportModel VARCHAR(20),
Location  VARCHAR(20)
) 
GO

ALTER TABLE [DBO].[INTERNSHIPREGISTRATION]ADD INSERTED ON DATETIME

INSERT INTO [DBO].[INTERNSHIPREGISTRATION]
(
FULLNAME,
EMAIL,
EDUCATIONALQUAL,
PASSOUTYEAR,
PROFILE,
INTERSHIPIN,
PRIMCONTACT,
SECCONTACT,
SUPPORTMODEL,
LOCATION
)
VALUES
(
'SHIVRAJ WANKER',
'SHIVRAK.WANKAR@YAHOO.COM',
'GRADUATE',
 2015,
'EXPERIENCED WORKING PROFESSIONAL',
'DATA SCIENCE',
'9876543210'
'4567890324',
'ONLINE',
'PUNE'
)

SELECT *FROM [DBO].[INTERNSHIPREGISTRATION]

CREATE PROC [DBO].[INSERT_REGISTRATIONDATA]
   @FullName  VARCHAR(100),
   @Email   VARCHAR(100),
   @EducationalQual VARCHAR(20),
   @PassoutYear  INT,
   @Profile   VARCHAR(50),
   @IntershipIn  VARCHAR(50),
   @PrimContact  VARCHAR(10),
   @SecContact  VARCHAR(10),
   @SupportModel VARCHAR(20),
   @Location  VARCHAR(20)
AS
BEGIN 
	DECLARE @SYSDATE DATETIME
	SET @sYSDATE=GETDATE()
	INSERT INTO [DBO].[INTERNSHIPREGISTRATION]
(
   FULLNAME,
   EMAIL,
   EDUCATIONALQUAL,
   PASSOUTYEAR,
   PROFILE,
   INTERSHIPIN,
   PRIMCONTACT,
   SECCONTACT,
   SUPPORTMODEL,
   LOCATION,
   INSERTED ON
)
VALUES
(
	@FULLNAME,
    @EMAIL,
    @EDUCATIONALQUAL,
    @PASSOUTYEAR,
    @PROFILE,
    @INTERSHIPIN,
    @PRIMCONTACT,
    @SECCONTACT,
    @SUPPORTMODEL,
    @LOCATION,
	GETDATE()
)
END

EXEC DBO.INSERT_REGISTRATIONDATA 'ANAMIKA SAHA','A.SAHA@GMAIL.COM','GRADUATION','2020','FRESHER','FULLSTACK DEVELOPER','345678901','2222222222','ONLINE','MUMBAI'

--PARAMETERS INCASE OF STORED PROCEDURE ONLY AND NO DECLARE COMMAND
--FOR VARIABLE WE NEED TO HAVE DECLARE AND USE 

CREATE TABLE DBO.INTERNSHIPCOURSES
(
ID INT,
COURSENAME VARCHAR(100),
ISACTIVE BIT DEFAULT 1
--USERINSERTED VARCHAR (100) DEFAULT SYSTEM_USER
)

INSERT INTO DBO.INTERNSHIPCOURSES (COURSENAME)VALUES
'FULL STACK(FRONT END)'),
('POWER BI',
('DATA SCIENCE')

SELECT COURSENAME FROM DBO.INTERNSHIPCOURSES

--FOR EACH DROPDOWN, WE NEED TO CREATE TABLE AND SELECT STATEMENT IS PASSED/SP TO THE FRONT END DEVELOPER

CREATE PROC DBO.GETCOURSEDROPDOWN
AS
BEGIN
(
	SELECT COURSENAME FROM DBO.INTERNSHIPCOURSES WHERE ISACTIVE=1
)
END

EXEC DBO.INTERNSHIPCOURSES

--A SINGLE SET OF APPLICATION HAS MULTIPLE PROCEDURE.

--TO REMOVE POWERBI FROM DROP DOWN
UPDATE DBO.INTERNSHIPCOURSES SET ISACTIVE = 0 WHERE COURSENAME = 'POWER BI'

--IT IS EASY TO DO CHANGES IN TABLE DATA THAN IN OUR CODE.

IF EXISTS (SELECT 1 FROM [DBO].[INTERNSHIPREGISTRATION] WHEE FULLNAME = @FULLNAME AND EMAIL = @EMAIL)
BEGIN
SELECT 'USER HAS ALREADY SUBMITTED THE RESPONSE'
END
ELSE
BEGIN
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CLASS NOTES

DROP TABLE IF  EXISTS [dbo].[IntershipRegistration]
GO

CREATE TABLE [dbo].[IntershipRegistration]
(
FullName  VARCHAR(100),
Email   VARCHAR(100),
EducationalQual VARCHAR(20),
PassoutYear  INT,
Profile   VARCHAR(50),
IntershipIn  VARCHAR(50),
PrimContact  VARCHAR(10),
SecContact  VARCHAR(10),
SupportModel VARCHAR(20),
Location  VARCHAR(20)
) 
GO

ALTER TABLE [dbo].[IntershipRegistration] ADD InsertedOn DATETIME

INSERT INTO [dbo].[IntershipRegistration]
(
  FullName  
 ,Email   
 ,EducationalQual 
 ,PassoutYear  
 ,Profile   
 ,IntershipIn  
 ,PrimContact  
 ,SecContact  
 ,SupportModel 
 ,Location  
)
VALUES
(
 'SHIVRAJ WANKAR',
 'shivraj.wankar@yahoo.com',
 'Graduate',
 2015,
 'Experienced Working Professional',
 'Data Science',
 '9922003311',
 '7022033113',
 'Online',
 'Pune'
)

SELECT * FROM [dbo].[IntershipRegistration]
GO

CREATE OR ALTER PROC dbo.Insert_RegistrationData
@FullName   VARCHAR(100),
@Email    VARCHAR(100),
@EducationalQual VARCHAR(20),
@PassoutYear  INT,
@Profile   VARCHAR(50),
@IntershipIn  VARCHAR(50),
@PrimContact  VARCHAR(10),
@SecContact   VARCHAR(10),
@SupportModel  VARCHAR(20),
@Location   VARCHAR(20)
AS
BEGIN
 DECLARE @SYSDATE DATETIME
 SET @SYSDATE = GETDATE()

 IF EXISTS (SELECT 1 FROM [dbo].[IntershipRegistration] WHERE FullName = @FullName AND Email = @Email)
 BEGIN
  SELECT 'User has already submitted the response' AS ErrorMessage
 END
 ELSE
 BEGIN
  INSERT INTO [dbo].[IntershipRegistration]
  (
    FullName  
   ,Email   
   ,EducationalQual 
   ,PassoutYear  
   ,Profile   
   ,IntershipIn  
   ,PrimContact  
   ,SecContact  
   ,SupportModel 
   ,Location 
   ,InsertedOn
  )
  VALUES
  (
    @FullName  
   ,@Email   
   ,@EducationalQual
   ,@PassoutYear 
   ,@Profile  
   ,@IntershipIn 
   ,@PrimContact 
   ,@SecContact  
   ,@SupportModel 
   ,@Location
   ,@SYSDATE
  )
 END
END

EXEC dbo.Insert_RegistrationData 'Bishal Thapa','bishal.thapa@gmail.com','under Graduate','2019','Fresher','Web Development','7021000222','9738831112','Offline','Pune'

SELECT * FROM [dbo].[IntershipRegistration]

DROP TABLE IF EXISTS dbo.IntershipCourses
CREATE TABLE dbo.IntershipCourses
(
 ID INT IDENTITY(1,1),
 CourseName VARCHAR(100),
 IsActive BIT DEFAULT 1,
 UserInserted VARCHAR(100) DEFAULT SYSTEM_USER
)

INSERT INTO dbo.IntershipCourses  (CourseName) VALUES
('Full Stack (Front End)'),
('Full Stack (Back End)'),
('Power Bi'),
('Software Testing (Manual & Automation)'),
('Data Science'),
('Other')

CREATE OR ALTER PROC dbo.GetCourseDropdown
AS
BEGIN
(
 SELECT CourseName FROM dbo.IntershipCourses
 WHERE IsActive = 1
)
END

SELECT * FROM dbo.IntershipCourses

EXEC dbo.GetCourseDropdown

UPDATE dbo.IntershipCourses SET IsActive = 0 WHERE CourseName = 'Power Bi'

CREATE OR ALTER PROC dbo.Update_RegistrationData
@FullName   VARCHAR(100), -- 
@Email    VARCHAR(100), --
@PrimContact  VARCHAR(10)
AS
BEGIN
 DECLARE @SYSDATE DATETIME
 SET @SYSDATE = GETDATE()

 IF EXISTS (SELECT 1 FROM [dbo].[IntershipRegistration] WHERE FullName = @FullName AND Email = @Email)
 BEGIN
  UPDATE [dbo].[IntershipRegistration]
  SET
    --FullName  
   --Email  =  @Email,  
   PrimContact =  @PrimContact
  WHERE FullName  = @FullName AND Email = @Email
 END
 ELSE
 BEGIN
  SELECT 'User is not Registered' AS ErrorMessage
 END
 
END

SELECT * FROM[dbo].[IntershipRegistration] WHERE FullName = 'Bishal Thapa'
EXEC dbo.Update_RegistrationData 'Bishal Thapa','bishal.t@gmail.com','9233301192'
SELECT * FROM[dbo].[IntershipRegistration] WHERE FullName = 'Bishal Thapa'


