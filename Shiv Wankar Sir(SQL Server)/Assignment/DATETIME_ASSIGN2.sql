--DATETIME FUNCTIONS


--DROP TABLE STUDENTDATA
CREATE TABLE STUDENTDATA
(
ID INT,
STNAME VARCHAR(30),
DOB DATE,
CITY VARCHAR(25),
JOININGDATE DATE
)

SELECT *FROM STUDENTDATA

INSERT INTO STUDENTDATA VALUES
(1,'Steward','2001-03-02','London','2022-05-02'),
(2, 'Lucman', '2000-08-19', 'New York','2022-05-02'), 
(3, 'Brathwaite','2001-01-07','Oslo','2022-05-03'), 
(4, 'Lourel','1999-11-05', 'Mumbai','2022-05-03'), 
(5, 'Joe Stephen','2003-08-25', 'China','2022-05-05'), 
(6, 'Jack', '2000-08-19', 'New York' ,'2022-05-02'),
(7, 'Mike', '2001-01-07','Oslo','2022-05-03'), 
(8, 'Paul Harry', '1999-11-05', 'Mumbai', '2022-05-03'), 
(9, 'Mike Hamper','1998-12-20','China','2022-05-05'), 
(10,'Sara Jones','2000-08-12','Mumbai','2022-05-02'), 
(11, 'Johnson','1999-01-09','China','2022-05-02'),
(12, 'David Stephen','2002-03-06','China','2022-05-03'), 
(13, 'Mark John','1997-10-12', 'New York', '2022-05-02'), 
(14, 'Ken Villy','1997-11-30', 'New York', '2022-05-02'), 
(15, 'Harry Teckor','2000-08-14', 'Oslo',  '2022-05-04'), 
(16, 'Karl Hoope','2001-03-19', 'China', '2022-05-04'),
(17, 'Jacky Laurel','1999-06-25', 'Mumbai', '2022-05-06')

--1.Calculate Age of Student. Display name and age of student.
SELECT STNAME,DATEDIFF(YEAR,DOB,GETDATE())AGEOFSTUDENT FROM STUDENTDATA

--2.Find number of students who were born before 2000.
SELECT COUNT(1)AS STUDENTCOUNT FROM STUDENTDATA
WHERE YEAR(DOB) < 2000

--3.Calculate average age of students from New York City
SELECT AVG(DATEDIFF(YEAR,DOB,GETDATE()))AS AVERAGEAGE FROM STUDENTDATA
WHERE CITY = 'NEW YORK'

--**4. Find number of students joined for each day. Display count & day name. 
SELECT COUNT(1)AS DAYCOUNT,DATENAME(WEEKDAY,JOININGDATE)AS JOININGDAY FROM STUDENTDATA
GROUP BY DATENAME(WEEKDAY,JOININGDATE)

--5.Find average age of student for each city. 
SELECT AVG(DATEDIFF(YEAR,DOB,GETDATE()))AVERAGEAGEBYCITY FROM STUDENTDATA
GROUP BY CITY

--6**.Find number of students from each city who were born after 2000. 
SELECT COUNT(*)AS STUDENTCOUNT FROM STUDENTDATA
WHERE YEAR(DOB)>2000

--7.Find count of students from each city
SELECT COUNT(1)AS STUDENTCOUNT FROM STUDENTDATA
GROUP BY CITY

--Also write SQL queries for below questions : 
--1. Display all the records by adding 25 years to its birthdate
SELECT 
ID,STNAME,DOB,CITY,JOININGDATE,
DATEADD(YEAR,25,DOB)AS NEWDOB 
FROM STUDENTDATA


--2. Display all the records who are born in January irrespective of birth year 
SELECT *FROM STUDENTDATA

SELECT COUNT(1) 
FROM STUDENTDATA
WHERE MONTH(DOB) = 1;


--3. Display count of students & year born in particular year 
SELECT COUNT(1)AS STUDENTCOUNT,DOB FROM STUDENTDATA 
GROUP BY DOB

--4. Display count & average age of students having average age more than 22 years. 
SELECT COUNT(1)STUDENTCOUNT,AVG(DATEDIFF(YEAR,DOB,GETDATE()))AVGAGE FROM STUDENTDATA
WHERE DATEDIFF(YEAR,DOB,GETDATE())>25

--5. Display Count & joining date of all the students where count for a day is more than 2. 
SELECT COUNT(1),JOININGDATE FROM STUDENTDATA 
GROUP BY JOININGDATE
HAVING COUNT(JOININGDATE)>2
--