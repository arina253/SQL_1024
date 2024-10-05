SELECT *  FROM [AdventureWorks2022].[HumanResources].[Employee]

Below four Date functions used to find/fetch current date & time
1. The CURRENT_TIMESTAMP function returns the current date and time, in a 'YYYY-MM-DD hh:mm:ss.mmm' format.
SELECT CURRENT_TIMESTAMP
-- 2024-06-14 06:58:25.597
-- 2024-06-14 06:59:32.460

2. The GETDATE() function returns the current database system date and time, in a 'YYYY-MM-DD hh:mm:ss.mmm' format.
SELECT GETDATE()

3. The GETUTCDATE() function returns the current database system UTC date and time, in a 'YYYY-MMDD hh:mm:ss.mmm' format.
SELECT GETUTCDATE()

4. The SYSDATETIME() function returns the date and time of the computer where the SQL Server is
running.
SELECT SYSDATETIME()

SELECT CURRENT_TIMESTAMP
SELECT GETDATE()
SELECT SYSDATETIME()
SELECT GETUTCDATE()

5. The DATEADD() function adds a time/date interval to a date and then returns the date.
Syntax : Select DATEADD(interval, number, date)

SELECT DATEADD(year, 10, '2024/06/14') AS YearAdd; ----It will add 1 year to date
SELECT DATEADD(month, 2, '2024/06/14') AS DateAdd; ----It will add 2 months to date
SELECT DATEADD(DAY, -2, '2024/06/14') AS DateAdd; ----It will add -2 months to date i.e. 2015
SELECT GETDATE()
SELECT DATEADD(HH, 3, GETDATE()) AS DateAdd; ----It will add -2 months to date i.e. 2015
SELECT DATEADD(MINUTE, 30, GETDATE()) AS DateAdd;

6. The DATEDIFF() function returns the difference between two dates.
Syntax : Select DATEDIFF(interval, date1, date2)
Example :
SELECT DATEDIFF(month, '2024/08/31', '2024/08/01') AS DateDiff; -- Displays diff between given dates in month
SELECT DATEDIFF(month, '2024/06/25', '2024/12/01') AS DateDiff; -- Displays diff between given dates in month
SELECT DATEDIFF(YEAR, '2020/06/25', '2024/12/01') AS DateDiff; -- Displays diff between given dates in month
SELECT DATEDIFF(DAY, '2024/06/25', '2024/06/01') AS DateDiff; -- Displays diff between given dates in month
SELECT DATEDIFF(hour, '2017/08/25 07:00', '2017/08/25 12:45') AS DateDiff; --Diff in Hours

-- SELECT *  FROM [HumanResources].[Employee]
/* FIND THE AGE */
SELECT BusinessEntityID,NationalIDNumber,BirthDate, DATEDIFF(YEAR,BirthDate,GETDATE()) AS AGE 
FROM [HumanResources].[Employee]
WHERE DATEDIFF(YEAR,BirthDate,GETDATE()) >= 50

SELECT BusinessEntityID,NationalIDNumber,BirthDate,DATEDIFF(YEAR,BirthDate,GETDATE()),
(DATEDIFF(YEAR,BirthDate,GETDATE()) + 10) AS AGE 
FROM [HumanResources].[Employee]

7. The DATEFROMPARTS() function returns a date from the specified parts (year, month, and day values).
Syntax : Select DATEFROMPARTS(year, month, day)
Example : 
SELECT DATEFROMPARTS(2018, 10, 31) AS DateFromParts;

8. The DATENAME() function returns a specified part of a date.This function returns the result as a string value.
Syntax : Select DATENAME(interval, date)
Example :
SELECT DATENAME(year, '2017/08/25') AS DatePartString;
SELECT DATENAME(YYYY, '2017/08/25') AS DatePartString;
SELECT DATENAME(YY, '2017/08/25') AS DatePartString;
SELECT DATENAME(month, '2017/07/25') AS DatePartString;
SELECT DATENAME(hour, '2017/08/25 08:36') AS DatePartString;
SELECT DATENAME(minute, '2017/08/25 08:36') AS DatePartString;

9. The DATEPART() function returns a specified part of a date. This function returns the result as an integer value. 
Syntax : Select DATEPART(interval, date)
Example :
SELECT DATEPART(yy, '2017/08/25') AS DatePartInt;
SELECT DATENAME(month, '2017/07/25') AS DatePartString;
SELECT DATEPART(month, '2017/07/25') AS DatePartInt;
SELECT DATEPART(hour, '2017/08/25 08:36') AS DatePartInt;
SELECT DATEPART(minute, '2017/08/25 08:36') AS DatePartInt

10. The ISDATE() function checks an expression and returns 1 if it is a valid date, otherwise 0.
Syntax : ISDATE(expression)
Example : 
SELECT ISDATE('9999-13-14') 
SELECT ISDATE('Hello')
SELECT ISDATE('2000')
SELECT ISDATE('08')
SELECT ISDATE('14')

11. Day, Month, Year : Syntax SELECT Day/Month/Year(Date)
The DAY() function returns the day of the month (from 1 to 31) for a specified date.
SELECT DAY('2017/08/25') AS DayOfMonth;
SELECT DAY('2017/08/13 09:08') AS DayOfMonth;

The MONTH() function returns the month part for a specified date (a number from 1 to 12).
SELECT MONTH('2017/08/25') AS Month;
SELECT MONTH('2017/05/25 09:08') AS Month;

The YEAR() function returns the year part for a specified date.
SELECT YEAR('2017/08/25') AS Year;
SELECT YEAR('1998/05/25 09:08') AS Year;

SELECT *  FROM [HumanResources].[Employee] WHERE YEAR(HireDate) = '2007'

SELECT *  FROM [HumanResources].[Employee] --WHERE YEAR(HireDate) = '2007'
WHERE HireDate BETWEEN '2007/01/01' AND '2007/12/31'

SELECT *  FROM [HumanResources].[Employee] --WHERE YEAR(HireDate) = '2007'
WHERE HireDate > '2007/01/01' AND HireDate < '2007/12/31'


-- YESTERDATE EXERCISE --
Create Table tblEmployee
(
ID int primary key,
FirstName varchar(20),
MiddleName varchar(20),
LastName varchar(20),
Email varchar(20),
Gender varchar(20),
DepartmentID int,
Number int
)

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

1. Find length of FirstName and LastName from the the table.

SELECT * FROM tblEmployee
SELECT LEN(FirstName) NoOfCharFirstName,LEN(LastName) NoOfCharLastName FROM tblEmployee

2. Display only domain part from the email.
SELECT * FROM tblEmployee

SELECT Email,RIGHT(Email,(LEN(Email)-CHARINDEX('@',Email)+1)) AS DOMAIN FROM tblEmployee

3. Find position of @ in the emails for employeeId greater than 3.

SELECT ID,EMAIL,CHARINDEX('@',Email) FROM tblEmployee
WHERE ID > 3

4. Select only name from the Email (without @domain.com) for all the employees whose email domain is @aaa.com

SELECT EMAIL,SUBSTRING(EMAIL,1,(CHARINDEX('@',Email)-1)) AS Name 
FROM tblEmployee
WHERE Email LIKE '%aaa.com'

5. Replace Gender from Male to M and Female to F in gender column - use update with string function.

UPDATE tblEmployee
SET Gender = REPLACE(Gender,'Male','M')

UPDATE tblEmployee
SET Gender = SUBSTRING(Gender,1,1)

UPDATE tblEmployee
SET Gender = LEFT(Gender,1)

SELECT * FROM tblEmployee
UPDATE tblEmployee
SET Gender = CASE WHEN Gender = 'M' THEN 'Male' Else 'Female' END

6. Find length of FirstName and LastName including all the spaces.

SELECT DATALENGTH(FirstName) NoOfCharFirstName,DATALENGTH(LastName) NoOfCharLastName FROM tblEmployee

7. Write a query Convert middle name in lowe case.

SELECT LOWER(MiddleName),MiddleName FROM tblEmployee








