
Insert into tblEmployee values (1, ' Sam ', 'S', 'Sony','Sam@aaa.com', 'Male', 1, 1)
Insert into tblEmployee values (2, ' Ram ', 'R', 'Barber','Ram@aaa.com', 'Male', 1, 1)
Insert into tblEmployee values (3, ' Sara ', 'J', 'Sanosky','Sara@ccc.com', 'Female', 1, 1)
Insert into tblEmployee values (4, ' Todd ', '', 'Gartner','Todd@bbb.com', 'Male', 1, 1)
Insert into tblEmployee values (5, ' John ', '', 'Grover','John@aaa.com', 'Male', 1, 1)
Insert into tblEmployee values (6, ' Sana ', 'J', 'Lenin','Sana@ccc.com', 'Female', 1, 1)
Insert into tblEmployee values (7, ' James ', 'S', 'Bond','James@bbb.com', 'Male', 1, 1)
Insert into tblEmployee values (8, ' Rob ', 'J', 'Hunter','Rob@ccc.com', 'Male', 1, 1)
Insert into tblEmployee values (9, ' Steve ', 'R', 'Wilson','Steve@aaa.com', 'Male', 1, 1)
Insert into tblEmployee values (10, ' Pam ', 'P', 'Broker','Pam@bbb.com','Female', 1, 1)

CREATE TABLE TBLEMPLOYEE
(
ID INT PRIMARY KEY,
FIRSTNAME VARCHAR(20),
MIDDLENAME VARCHAR(20),
LASTNAME VARCHAR (20),
EMAIL VARCHAR (20),
GENDER VARCHAR(20),
DEPARTMENTID INT,
NUMBER INT
)

INSERT INTO TBLEMPLOYEE VALUES (1,' SAM ','S','SONY','SAM@AAA.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (2,' RAM ','R','BARBER','RAM@AAA.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (3,' SARA ','J','SANOSKY','SARA@CC.COM','FEMALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (4,' TODD ','','GARTNER','TODD@BBB.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (5,' JOHN ','','GROVER','JOHN@AAA.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (6,' SANA ','J','LENIN','DANA@CCC.COM','FEMALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (7,' JAMES ','S','BOND','JAMES@BBB.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (8,' ROB ','J','HUNTER','ROB@CCC.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (9,' STEVE ','R','WILSON','STEVE@AAA.COM','MALE',1,1)
INSERT INTO TBLEMPLOYEE VALUES (10,' PAM ','P','BROKER','PAM@BBB.COM','FEMALE',1,1)

SELECT *FROM TBLEMPLOYEE

1.Find length of FirstName and LastName from the the table.
 
 SELECT *FROM TBLEMPLOYEE
 SELECT LEN(FIRSTNAME)AS NOOFCHARFIRSTNAME ,LEN(LASTNAME)AS NOOFCHARLASTNAME FROM TBLEMPLOYEE
 
2. Display only domain part from the email.

SELECT EMAIL,SUBSTRING(EMAIL,CHARINDEX('@',EMAIL),LEN(EMAIL)-CHARINDEX('@',EMAIL)+1) FROM TBLEMPLOYEE

SELECT EMAIL,RIGHT(EMAIL,LEN(EMAIL)-CHARINDEX('@',EMAIL)+1) AS DOMAIN FROM TBLEMPLOYEE

SELECT EMAIL,RIGHT(EMAIL,LEN(EMAIL)-CHARINDEX('@',EMAIL)+1) AS DOMAIN FROM TBLEMPLOYEE


3. Find position of @ in the emails for employeeId greater than 3.

SELECT EMAIL, CHARINDEX('@',EMAIL)FROM TBLEMPLOYEE
WHERE ID>3


4. Select only name from the Email (without @domain.com) for all the employees whose email domain is @aaa.com

SELECT EMAIL,LEFT(EMAIL,CHARINDEX('@',EMAIL)-1) FROM TBLEMPLOYEE WHERE EMAIL LIKE '%@AAA.COM'

SELECT EMAIL,SUBSTRING(EMAIL,1,CHARINDEX('@',EMAIL)-1) AS NAME 
FROM TBLEMPLOYEE
WHERE EMAIL LIKE '%AAA.COM' 

5. Replace Gender from Male to M and Female to F in gender column - use update with string function.

SELECT *FROM TBLEMPLOYEE

UPDATE TBLEMPLOYEE
SET GENDER = REPLACE(GENDER,'MALE','M' ) 

UPDATE TBLEMPLOYEE
SET GENDER = SUBSTRING(GENDER,1,1 )

UPDATE TBLEMPLOYEE
SET GENDER = LEFT(GENDER,1)

UPDATE TBLEMPLOYEE
SET GENDER = CASE WHEN GENDER = 'M'THEN 'MALE'ELSE 'FEMALE'END


6. Find length of FirstName and LastName including all the spaces.

SELECT DATALENGTH(FIRSTNAME)AS NOOFCHARFIRSTNAME,DATALENGTH(LASTNAME)AS NOOFCHARLASTNAME FROM TBLEMPLOYEE

7. Write a query Convert middle name in lower case.

SELECT MIDDLENAME, LOWER(MIDDLENAME)FROM TBLEMPLOYEE