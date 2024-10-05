DROP TABLE IF EXISTS [dbo].[Employees]
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] NULL,
	[First_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[Salary] [numeric](18, 0) NULL,
	[Manager_Id] [smallint] NULL
) ON [PRIMARY]
GO

INSERT [dbo].[Employees] ([Id], [First_Name], [Last_Name], [Department], [Salary], [Manager_Id]) VALUES 
(1, N'Angelika', N'Voules', N'Marketing', CAST(5294 AS Numeric(18, 0)), 2)
,(2, N'Rozelle', N'Swynley', N'Marketing', CAST(8295 AS Numeric(18, 0)), 18)
,(3, N'Warren', N'Willey', N'Engineering', CAST(9127 AS Numeric(18, 0)), 19)
,(4, N'Lynelle', N'Whiten', N'Management Board', CAST(10716 AS Numeric(18, 0)), NULL)
,(5, N'Consolata', N'Roman', N'Legal', CAST(8456 AS Numeric(18, 0)), 4)
,(6, N'Hoebart', N'Baldock', N'Research and Development', CAST(4817 AS Numeric(18, 0)), 20)
,(7, N'Starlene', N'Watkiss', N'Accounting', CAST(6541 AS Numeric(18, 0)), 4)
,(8, N'Barde', N'Ribbens', N'Marketing', CAST(4853 AS Numeric(18, 0)), 2)
,(9, N'Lorne', N'Philipsen', N'Engineering', CAST(7236 AS Numeric(18, 0)), 3)
,(10, N'Pedro', N'Naldrett', N'Research and Development', CAST(5472 AS Numeric(18, 0)), 20)
,(11, N'Brina', N'Dillinger', N'Marketing', CAST(6512 AS Numeric(18, 0)), 2)
,(12, N'Verile', N'Sonley', N'Research and Development', CAST(4574 AS Numeric(18, 0)), 20)
,(13, N'Noble', N'Geerling', N'Research and Development', CAST(8391 AS Numeric(18, 0)), 20)
,(14, N'Garey', N'MacAdam', N'Accounting', CAST(3830 AS Numeric(18, 0)), 7)
,(15, N'Theo', N'Sorrell', N'Engineering', CAST(6442 AS Numeric(18, 0)), 3)
,(16, N'Erminie', N'Gelling', N'Research and Development', CAST(8591 AS Numeric(18, 0)), 20)
,(17, N'Loralie', N'Koop', N'Accounting', CAST(5248 AS Numeric(18, 0)), 7)
,(18, N'Cal', N'Andrey', N'Management Board', CAST(11259 AS Numeric(18, 0)), NULL)
,(19, N'Quincey', N'Gamell', N'Management Board', CAST(11367 AS Numeric(18, 0)), NULL)
,(20, N'Janith', N'McGiffie', N'Research and Development', CAST(7429 AS Numeric(18, 0)), 19)
,(18, N'Cal', N'Andrey', N'Management Board', CAST(11259 AS Numeric(18, 0)), NULL)
,(7, N'Starlene', N'Watkiss', N'Accounting', CAST(6541 AS Numeric(18, 0)), 4)
,(10, N'Pedro', N'Naldrett', N'Research and Development', CAST(5472 AS Numeric(18, 0)), 20)
,(8, N'Barde', N'Ribbens', N'Marketing', CAST(4853 AS Numeric(18, 0)), 2)


--Q1. Using the table employees, show all the employees, their departments, salaries, and the average salary in their respective department. Order the result by department.

SELECT *FROM DBO.EMPLOYEES

SELECT 
	 DISTINCT FIRST_NAME, LAST_NAME,DEPARTMENT,SALARY,AVG(SALARY) OVER (PARTITION BY DEPARTMENT)AS AVERAGE_SALARY
FROM DBO.EMPLOYEES
ORDER BY DEPARTMENT


--Q2. Find the employee with the highest salary in each department. Show their first and last names, salaries, and departments.

SELECT *FROM EMPLOYEES
--SELECT DISTINCT DEPARTMENT FROM EMPLOYEES

WITH SALARYLEVEL
AS
(
SELECT 
FIRST_NAME,LAST_NAME,SALARY, DEPARTMENT,ROW_NUMBER()OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC)AS ROW_NUM 
FROM EMPLOYEES
)
SELECT 
FIRST_NAME,LAST_NAME,SALARY, DEPARTMENT
FROM SALARYLEVEL
WHERE ROW_NUM=1

--USE DENSE RANK TO AVOID DUPLICATES


--Q3. Find all employees working directly or indirectly under the employee whose ID is 18.

SELECT *FROM DBO.EMPLOYEES

SELECT 
DISTINCT 
E.ID ID,M.ID MANAGER_ID,
E.FIRST_NAME,E.LAST_NAME
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M
ON E.MANAGER_ID = M.ID
WHERE M.ID = 18 


------------------------------------------------------------------------------------------------------

Dataset - 2 (Sample Data only) (Q4 & Q5)

DROP TABLE IF EXISTS dbo.Supporter
CREATE TABLE dbo.Supporter
(
Id int,
First_Name varchar(50),
Last_Name varchar(50)
)

INSERT INTO dbo.Supporter VALUES
(1,'Marlene','Wagner'),
(2,'Lonnie','Goodwin'),
(3,'Sophie','Peters'),
(4,'Edwin','Paul'),
(5,'Hugh','Thornton')

DROP TABLE IF EXISTS dbo.Projects

CREATE TABLE dbo.Projects
(
Id int,
Category varchar(50),
Author_Id int,
Minimul_Amount numeric
)

INSERT INTO dbo.Projects VALUES
 (1,'Music',1,1677)
,(2,'Music',5,21573)
,(3,'Traveling',2,4952)
,(4,'Traveling',5,3135)
,(5,'Traveling',2,8555)

CREATE TABLE dbo.Donations
(
Id int,
Project_Id int,
Supporter_Id int,
Amount money,
Donated DATE
)

INSERT INTO dbo.Donations VALUES
 (1,4,4,928.40,'2016-09-07')
,(2,8,18,384.38,'2016-12-16')
,(3,6,12,367.21,'2016-01-21')
,(4,2,19,108.62,'2016-12-29')
,(5,10,20,842.58,'2016-11-30')

--Q4. Obtain the project ID, minimal amount, and total donations for projects that have received donations over the minimum amount.

SELECT *FROM DBO.SUPPORTER
SELECT *FROM DBO.PROJECTS
SELECT *FROM DBO.DONATIONS

SELECT
P.ID,P.MINIMUL_AMOUNT,SUM(D.AMOUNT)
FROM PROJECTS P
JOIN DONATIONS D
ON P.ID = D.PROJECT_ID
GROUP BY P.ID,P.MINIMUL_AMOUNT
HAVING SUM(D.AMOUNT)> P.MINIMUL_AMOUNT


--Q5. Select supporters who donated more than $200 total or who donated at least twice.

SELECT *FROM DBO.SUPPORTER
SELECT *FROM DONATIONS

SELECT
S.FIRST_NAME,S.LAST_NAME,D.AMOUNT
FROM SUPPORTER S
 LEFT JOIN DONATIONS D
ON S.ID = D.SUPPORTER_ID
WHERE D.AMOUNT > '200'

----------------------------------------------------------------------------

--Dataset for Q6 to Q10

--Q6. For each single_rental, show the rental_date, the title of the movie rented, its genre, the payment amount, and the rank of the rental in terms of the price paid (the most expensive rental should have rank = 1). The ranking should be created separately for each movie genre. Allow the same rank for multiple rows and allow gaps in numbering. 

--SELECT *FROM CUSTOMER
--SELECT *FROM MOVIE
--SELECT *FROM REVIEW
--SELECT *FROM SINGLE_RENTAL
--SELECT *FROM SUBSCRIPTION
--SELECT *FROM GIFTCARD

SELECT
SR.RENTAL_DATE,
M.TITLE,
M.GENRE,
S.PAYMENT_AMOUNT,
ROW_NUM()OVER(ORDER BY S.PAYMENT_AMOUNT DESC) 
ROW_NUM()OVER(ORDER BY M.GENRE),
RANK()OVER(





--Q7. Show the first and last name of the customer who bought the second most-recent gift card, along with the date when the payment took place. Assume that a unique rank is assigned for each gift card purchase.

WITH GIFTCARDSRANKING
AS(
SELECT
	C.FIRST_NAME,C.LAST_NAME,G.PAYMENT_DATE,
	ROW_NUMBER()OVER(ORDER BY G.ID DESC)ROW_NUM
FROM CUSTOMER C
JOIN GIFTCARD G
ON C.ID = G.CUSTOMER_ID
)
SELECT
	FIRST_NAME,LAST_NAME,PAYMENT_DATE
FROM GIFTCARDSRANKING
WHERE ROW_NUM=2

--Q8. Find all the customers who has given review to the movie. Show customer name (firstName, last_Name), movie name and the corresponding rating.

WITH REVIEWER
AS(
SELECT
   C.FIRST_NAME + ' ' +  C.LAST_NAME AS CUSTOMERNAME,
   M.TITLE AS MOVIENAME,
   R.RATING AS RATING
FROM CUSTOMER C
JOIN  REVIEW R ON C.ID = R.CUSTOMER_ID
JOIN MOVIE M ON M.ID = R.MOVIE_ID
)
SELECT
	CUSTOMERNAME,MOVIENAME,RATING
FROM REVIEWER

--Q9. Find no of movies taken on rental by each customer. Return movie name and customer name. Result should inlcude only those movies which was taken on rental for the current year

WITH MOVIESRENTAL
AS(
SELECT 
	COUNT(M.ID) AS RENTAL_COUNT,
	M.TITLE AS MOVIENAME,
	C.FIRST_NAME + ' ' +  C.LAST_NAME AS CUSTOMERNAME
FROM SINGLE_RENTAL SR
JOIN MOVIE M ON SR.MOVIE_ID = M.ID
JOIN CUSTOMER C ON C.ID = SR.CUSTOMER_ID
WHERE YEAR(SR.RENTAL_DATE) = GETDATE()
GROUP BY M.TITLE,C.FIRST_NAME + ' ' +  C.LAST_NAME AS CUSTOMERNAME
)
SELECT
	MOVIENAME,CUSTOMERNAME,RENTAL_COUNT FROM MOVIESRENTAL

--Q10. Find customer first_name, last_name for each platform who has been having active subscription for more than one platform.

WITH PLATFORMCOUNT
AS
(
SELECT
	C.FIRST_NAME,C.LAST_NAME,
	COUNT DISTINCT(S.PLATFORM)AS PLATFORM_COUNT
FROM SUBSCRIPTION S
JOIN CUSTOMER C ON S.CUSTOMER_ID = C.ID
WHERE LENGTH >=1
GROUP BY C.FIRST_NAME,C.LAST_NAME
)
SELECT
	FIRST_NAME,LAST_NAME 
FROM PLATFORMCOUNT
WHERE PLATFORM_COUNT >1

HINT: SUBSCRIPTION END DATE IS GREATER THAN TODAY DATE 
CONSIDER 2 DATE : END DATE GREATER THAN TODAYS DATE AND START DATE MORE THAN TODAYS DATE.
STARTDATE GREATER THAN TODAYS DATE 

--Q11. Delete the duplicate records from table employees

SELECT *FROM DBO.EMPLOYEES

WITH CTE_DUP
AS
( SELECT *,
ROW_NUM()OVER(PARTITION BY FIRST_NAME,LAST_NAME,DEPARTMENT,SALARY ORDER BY ID)AS ROW_NUM
FROM EMPLOYEES
)
DELETE FROM CTE_DUP WHERE ROW_NUM > 1







