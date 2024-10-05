--INNER JOIN
--RETURN ALL ROWS FROM MULTIPLE TABLES WHERE THE JOIN CONDITION IS MET.
--JOIN CONDITION MEANS ON CONDITION.

--SYNTAX:
/*SELECT A.COL1,B.COL1,B.COL2(COLUMN_LIST)
FROM TABLE1 A
INNER JOIN TABLE2 B
ON A.COLUMN = B.COLUMN

--WE CAN EITHER MENTION INNER JOIN OR JOIN ONLY.*/

DROP TABLE STUDENTDATA
CREATE TABLE StudentData
(
SdId			int,
Admission_No	int,
First_Name	varchar(20),
Last_Name	varchar(20),
Age			int,
City		varchar(20)
)
insert into StudentData values
 (1,3354,'Luisa','Evans', 13,'Texas')
,(2,2135,'Paul','Ward', 15,'Alaska')
,(3,4321,'Peter','Bennett', 14,'California')
,(4,4213,'Carlos','Patterson', 17,'New York')
,(5,5112,'Rose','Huges', 16,'Florida')
,(6,6113,'Marielia','Simmons', 15,'Arizona')
,(7,7555,'Antonio','Butler', 14,'New York')
,(8,8345,'Diego','Cox', 13,'California')


create table FeeDetails
(
FdId			int,
Admission_no	int,
Course			varchar(25),
Amount_Paid		int
)

insert into FeeDetails values

 (1, 3354, 'Java', 20000)
,(2, 7555, 'Android', 22000)
,(3, 4321, 'Python', 18000)
,(4, 8345, 'SQL', 15000)
,(5, 5112, 'Machine Learning', 30000)

SELECT *FROM STUDENTDATA
SELECT *FROM FEEDETAILS

-- RETURN STUDENT ID,ADMINNO, NAME,CITY,COURSE,

SELECT S.SDID,S.ADMISSION_NO,S.FIRST_NAME,S.LAST_NAME,S.CITY,F.COURSE
FROM STUDENTDATA S
INNER JOIN FEEDETAILS F
ON S.ADMISSION_NO = F.ADMISSION_NO

SELECT *FROM EMPLOYEE
SELECT *FROM DEPARTMENT

--TO GET THE DEPARTNAME FOR THE EMP AND THE RESPECTIVE DEPT HEAD

SELECT E.NAME,E.GENDER,D.NAME,D.DEPARTMENTHEAD
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPARTMENTID = D.ID

UPDATE DEPARTMENT SET ID = NULL WHERE ID = 4

--EVEN THOUGH WE ARE HAVING NULL VALUES IN BOTH TABLE COLUMNS, IN INNER JOIN ,NULL WILL BE ELIMINATED.
--WHENEVER THERE IS A EXACT MATCH WITHOUT ANY NULL VALUES, INNER JOIN WILL RETURN THOSE RECORDS

--NULL VALUE WILL BE ELIMINATED IN THE INNER JOIN
--INNER JOINWILL FETCH ALL THE MATCHING RECORDS ONLY
--NULL VALUES DO NOT MATCH OTHER NULL VALUES

--2)OUTER JOIN 
--ALL THE CONTENTS OF THE BOTH TABLES ARE INTEGRATED TOGETHER EITHER THEY ARE MATCHED OR NOT

 --2.1 LEFT OUTER JOIN
 --2.2 RIGHT OUTER JOIN/RIGHT JOIN
 --2.3 FULL OUTER JOIN/FULL JOIN

 --2.1 LEFT OUTER JOIN
 RETURN ALL THE ROWS FROM THE LEFT TABLE COMBINE WITH THE MATCHING ROWS FROM THE RIGHT TABLE
 --WHENEVER THERE IS NO MATCH, RETURN NULL VALUES.

 SELECT *FROM EMPLOYEE
 SELECT *FROM DEPARTMENT

 SELECT E.NAME,E.DEPARTMENTID, D.ID,E.GENDER,D.NAME,D.DEPARTMENTHEAD
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D
ON E.DEPARTMENTID = D.ID

SELECT E.NAME,E.DEPARTMENTID, D.ID,E.GENDER,D.NAME,D.DEPARTMENTHEAD
FROM DEPARTMENT D     --LEFT TABLE (TABLE IN FROM CLAUSE)
LEFT JOIN EMPLOYEE E   -- TABLE IN JOIN RIGHT TABLE
ON E.DEPARTMENTID = D.ID

--TABLE WHICH IS IN THE FROM CLAUSE IS LEFT TABLE
-- TABLE WHICH IS IN THE JOIN IS RIGHT TABLE

--2.2 RIGHT OUTER JOIN 

SELECT E.NAME,E.DEPARTMENTID, D.ID,E.GENDER,D.NAME,D.DEPARTMENTHEAD
FROM EMPLOYEE E
RIGHT JOIN DEPARTMENT D
ON E.DEPARTMENTID = D.ID

--2.3 OUTER JOIN/FULL OUTER JOIN
--COMBINATION OF BOTH LEFT AND RIGHT OUTER JOIN
--RETURN ALL ROWS FROM BOTH TABLE WHETHER IT IS MATCHED OR NOT.
-- NULL FOR NO MATCHING VALUES
-- CAN USE EITHER FULL JOIN OR FULL OUTER JOIN

--BLUE COLOR - PREDEFINED KEYWORD IN SQL


SELECT E.NAME,E.DEPARTMENTID, D.ID,E.GENDER,D.NAME,D.DEPARTMENTHEAD
FROM EMPLOYEE E
FULL OUTER JOIN DEPARTMENT D
ON E.DEPARTMENTID = D.ID

--UNION ALL IS FOR ROWS
--FULL OUTER JOIN IS FOR COLUMN

--CROSS JOIN 
GET THE CARTESIAN PRODUC TOF THE SETS OF ROWS FROM THE JOINED TABLE
MULTIPLICATION OF THE NUMBER OF ROWS FROM BOTH TABLE.

SELECT *FROM EMPLOYEE
SELECT *FROM DEPARTMENT

SYNTAX
SELECT COLUMN_LIST 
FROM TABLE1
CROSS JOIN TABLE2

SELECT E.NAME,E.DEPARTMENTID, D.ID,E.GENDER,D.NAME,D.DEPARTMENTHEAD
FROM EMPLOYEE E
CROSS JOIN DEPARTMENT D

--CROSS JOIN WILL NOT HAVE ON CONDITION

--SELF JOIN
--TO JOIN A TABLE TO ITSELF.
--USES THE INNER JOIN OR LEFT JOIN CLAUSE

SELECT TOP 1 *FROM [SALES].[SALESORDERDETAIL]
SELECT TOP 1 *FROM [SALES].[SALESORDERHEADER] WHERE CUSTOMERID = 29580
SELECT TOP 1 *FROM [SALES].[SALESPERSON]


--FROM SALESORDERHEADER TABLE, I WANT TO KNOW ORDER IS FOR WHICH PERSON OR TERRITORY

--FINDING FIRSTNAME,LASTNAME BASED ON SALEID,CUSTOMERID
SELECT SALESORDERNUMBER,SC.CUSTOMERID,P.FIRSTNAME,P.LASTNAME,ST.NAME,ST.COUNTRYREGIONCODE
FROM [SALES].[SALESORDERHEADER]SH
INNER JOIN SALES.SALESTERRITORY ST ON SH.TERRITORYID = ST.TERRITORYID
INNER JOIN SALES.CUSTOMER SC ON SH.CUSTOMERID = SC.CUSTOEMRID
INNER JOIN PERSON.PERSON P ON SC.PERSONID = P.BUSINESSENTITYID
WHERE SH.CUSTOMERID = 29580


--DISPLAY THE COUNT OF SALES ORDER ID BASED ON REGION

SELECT COUNT(SALESORDERNUMBER),ST.NAME
FROM [SALES].[SALESORDERHEADER]SH
INNER JOIN SALES.SALESTERRITORY ST ON SH.TERRITORYID = ST.TERRITORYID
INNER JOIN SALES.CUSTOMER SC ON SH.CUSTOMERID = SC.CUSTOEMRID
INNER JOIN PERSON.PERSON P ON SC.PERSONID = P.BUSINESSENTITYID
WHERE SH.CUSTOMERID = 29580
GROUP BY ST.NAME


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--SIR CLASS NOTES

CREATE TABLE StudentData
(
SdId			int,
Admission_No	int,
First_Name	varchar(20),
Last_Name	varchar(20),
Age			int,
City		varchar(20)
)

Insert into StudentData values
 (1,3354,'Luisa','Evans', 13,'Texas')
,(2,2135,'Paul','Ward', 15,'Alaska')
,(3,4321,'Peter','Bennett', 14,'California')
,(4,4213,'Carlos','Patterson', 17,'New York')
,(5,5112,'Rose','Huges', 16,'Florida')
,(6,6113,'Marielia','Simmons', 15,'Arizona')
,(7,7555,'Antonio','Butler', 14,'New York')
,(8,8345,'Diego','Cox', 13,'California')


create table FeeDetails
(
FdId			int,
Admission_no	int,
Course			varchar(25),
Amount_Paid		int
)

insert into FeeDetails values

 (1, 3354, 'Java', 20000)
,(2, 7555, 'Android', 22000)
,(3, 4321, 'Python', 18000)
,(4, 8345, 'SQL', 15000)
,(5, 5112, 'Machine Learning', 30000)


DROP TABLE Department

Create table Departmentt
(
     ID int ,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into Departmentt values (1, 'IT', 'London', 'Rick')
Insert into Departmentt values (2, 'Payroll', 'Delhi', 'Ron')
Insert into Departmentt values (3, 'HR', 'New York', 'Christie')
Insert into Departmentt values (4, 'Finance', 'Mumbai', 'John')
Insert into Departmentt values (5, 'Sales', 'Sydney', 'Cindrella')
Go

DROP TABLE EMPLOYEE
Create table Employee
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int
)
Go

Insert into Employee values (1, 'Tom', 'Male', 4000, 1)
Insert into Employee values (2, 'Pam', 'Female', 3000, 3)
Insert into Employee values (3, 'John', 'Male', 3500, 1)
Insert into Employee values (4, 'Sam', 'Male', 4500, 2)
Insert into Employee values (5, 'Todd', 'Male', 2800, 2)
Insert into Employee values (6, 'Ben', 'Male', 7000, 1)
Insert into Employee values (7, 'Sara', 'Female', 4800, 3)
Insert into Employee values (8, 'Valarie', 'Female', 5500, 1)
Insert into Employee values (9, 'James', 'Male', 6500, NULL)
Insert into Employee values (10, 'Russell', 'Male', 8800, NULL)
Go

-- syntax
SELECT a.col1, b.col1, b.col2 (column list)
From Table1 a
Inner Join/JOIN Table2 b
ON a.column = b.column

SELECT * FROM StudentData
SELECT * FROM FeeDetails

--- STUD ID, ADMINO, NAME, CITY, COURSE

SELECT S.SdId, S.Admission_No, S.First_Name, S.Last_Name, S.City, F.Course
FROM StudentData S
INNER JOIN FeeDetails F
ON S.Admission_No = F.Admission_no

SELECT * FROM Employee
SELECT * FROM Departmentt

-- TO GET THE DEPARTNAME FOR THE EMP AND RESPECTIVE DEPT HEAD

SELECT E.Name, E.Gender, D.DepartmentName, D.DepartmentHead
FROM Employee E
JOIN Departmentt D
ON E.DepartmentId = D.ID

--NULL WILL BE ELIMINATED IN THE INNER JOIN
--INNER JOIN WILL FETCH ALL THE MATHHING RECORDS ONLY

2. OUTER JOIN
	2.1 LEFT OUTER JOIN / LEFT JOIN
	2.2 RIGHT OUTER JOIN / RIGHT JOIN
	2.3 FULL OUTER JOIN / FULL JOIN
/* LEFT JOIN */

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Employee E
LEFT JOIN Departmentt D
ON E.DepartmentId = D.ID

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Departmentt D				-- LEFT TABLE (TABLE IN FROM CLAUSE)
LEFT JOIN Employee E			-- TABLE IN JOIN RIGHT TABLE
ON E.DepartmentId = D.ID

/* RIGHT JOIN */


SELECT * FROM Employee
SELECT * FROM Departmentt

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Employee E
RIGHT JOIN Departmentt D
ON E.DepartmentId = D.ID

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Departmentt D
RIGHT JOIN Employee E
ON E.DepartmentId = D.ID

/* OUTER JOIN */

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Employee E
FULL OUTER JOIN Departmentt D
ON E.DepartmentId = D.ID

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Employee E
FULL JOIN Departmentt D
ON E.DepartmentId = D.ID

/* CROSS JOIN */
SELECT * FROM Employee
SELECT * FROM Departmentt

Select Column_list 
From Table1 
Cross Join Table2 

SELECT E.Name, E.Gender,E.DepartmentId, D.ID, D.DepartmentName, D.DepartmentHead
FROM Employee E
CROSS JOIN Departmentt D

--(CROSS Join will not have ON condition)





