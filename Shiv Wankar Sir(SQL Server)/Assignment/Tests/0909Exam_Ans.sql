
-- 1. Question: Write a SQL Query to find All the Employees Present in the Office.
-- Emp - 1-OUT,  2-IN, 3-IN, 4-IN, 5-OUT, 6-OUT

DROP TABLE IF EXISTS dbo.EmpSwapDetails
GO

CREATE TABLE dbo.EmpSwapDetails
(
	EMP_ID			INT,
	SWAP_ACTION		VARCHAR(10),
	SWAP_TIME		DATETIME
)
GO

INSERT INTO dbo.EmpSwapDetails (EMP_ID,SWAP_ACTION,SWAP_TIME)
VALUES
(1,'IN','2024-09-07 12:00:00.000'),
(1,'OUT','2024-09-07 12:10:00.000'),
(2,'IN','2024-09-07 12:00:00.000'),
(2,'OUT','2024-09-07 12:22:00.321'),
(2,'IN','2024-09-07 12:35:00.000'),
(3,'OUT','2024-09-07 12:30:00:000'),
(3,'IN','2024-09-07 12:35:00.000'),
(3,'OUT','2024-09-07 12:45:00.000'),
(3,'IN','2024-09-07 12:55:00.000'),
(4,'IN','2024-09-07 11:00:00.000'),
(5,'OUT','2024-09-07 12:45:00.000'),
(6,'IN','2024-09-07 12:00:00.000'),
(6,'OUT','2024-09-07 12:20:00.000')
GO

SELECT * FROM dbo.EmpSwapDetails

-- Method 1
WITH CTE AS(
SELECT
	EMP_ID,
	MAX(CASE WHEN SWAP_ACTION = 'IN' THEN SWAP_TIME END) AS 'InTime',
	MAX(CASE WHEN SWAP_ACTION = 'OUT' THEN SWAP_TIME END) AS 'OutTime'
FROM dbo.EmpSwapDetails
GROUP BY EMP_ID
)

SELECT EMP_ID FROM CTE WHERE InTime > OutTime OR OutTime IS NULL

-- Method 2
;WITH CTE as (
SELECT *, ROW_NUMBER() OVER (PARTITION BY EMP_ID ORDER BY SWAP_TIME DESC) AS activity
FROM dbo.EmpSwapDetails)

SELECT EMP_ID FROM CTE
WHERE SWAP_ACTION = 'IN' and activity = 1;

-- Method 3 Joins
SELECT EMP_ID
FROM dbo.EmpSwapDetails E1
WHERE SWAP_ACTION = 'IN'
AND SWAP_TIME = (SELECT MAX(SWAP_TIME)
    FROM dbo.EmpSwapDetails E2
    WHERE E1.EMP_ID = E2.EMP_ID)

--2 FIND COMPANIES IN WHICH ATLEAST TWO USERS SPEAKS ENGLISH AND GERMAN BOTH LANGUAGES
-- Only COMPANY 1 has TWO USERS WHO SPEAKS BOTH ENGLISH AND GERMAN (User-Id (1 & 3) FOR COMPANY ID 1) 

CREATE TABLE COMPANY_USERS 
(
COMPANY_ID	INT,
USER_ID		INT,
LANGUAGE	VARCHAR(20)
)
GO

INSERT INTO COMPANY_USERS VALUES
 (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English')
GO

SELECT * FROM COMPANY_USERS

-- Method 1
SELECT COMPANY_ID
FROM (
SELECT COMPANY_ID, USER_ID
FROM COMPANY_USERS
WHERE LANGUAGE IN ('English','German')
GROUP BY COMPANY_ID, USER_ID
HAVING COUNT(1) = 2
) A
GROUP BY COMPANY_ID
HAVING COUNT(1) >=2

-- Method 2
WITH LanguagesUsed AS (
    SELECT COMPANY_ID, USER_ID
    FROM COMPANY_USERS
    WHERE LANGUAGE IN ('English', 'German')
    GROUP BY COMPANY_ID, USER_ID
    HAVING COUNT(DISTINCT LANGUAGE) = 2
),
CompanyUserCount AS (
    SELECT COMPANY_ID
    FROM Languagesused
    GROUP BY COMPANY_ID
    HAVING COUNT(USER_ID) >= 2
)
SELECT COMPANY_ID
FROM CompanyUserCount
GO

-- Method 3
SELECT 
    cu1.COMPANY_ID
FROM 
    COMPANY_USERS cu1
JOIN 
    COMPANY_USERS cu2
    ON cu1.COMPANY_ID = cu2.COMPANY_ID 
    AND cu1.USER_ID = cu2.USER_ID
WHERE 
    cu1.LANGUAGE = 'English'
    AND cu2.LANGUAGE = 'German'
GROUP BY 
    cu1.COMPANY_ID
HAVING 
    COUNT(DISTINCT cu1.USER_ID) >= 2;

-- Method 4
 WITH CTE_Lan AS (
    SELECT
        COMPANY_ID,
        USER_ID,
        STRING_AGG(LANGUAGE, ',') AS Languages
    FROM COMPANY_USERS
    GROUP BY COMPANY_ID, USER_ID
)
SELECT DISTINCT cu.COMPANY_ID, cu.USER_ID
FROM CTE_Lan cu
WHERE Languages = ('English,German') or languages = ('German,English')
  AND EXISTS (
				SELECT 1
				FROM CTE_Lan cu2
				WHERE cu.COMPANY_ID = cu2.COMPANY_ID
					AND cu2.Languages IN ('English', 'German')
					AND cu.USER_ID <> cu2.USER_ID
			);

-- 3 From the custome table find count of all the Old Customers and New customer on th day
-- Example.. ON 01/01 Old Customers(0) New Customers(3)
		--   On 01/02 Old Customers(1) New Customer(2)

create table customer_orders 
(
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
--select * from customer_orders

insert into customer_orders values
(1,100,cast('2022-01-01' as date),2000),
(2,200,cast('2022-01-01' as date),2500),
(3,300,cast('2022-01-01' as date),2100),
(4,100,cast('2022-01-02' as date),2000),
(5,400,cast('2022-01-02' as date),2200),
(6,500,cast('2022-01-02' as date),2700),
(7,100,cast('2022-01-03' as date),3000),
(8,400,cast('2022-01-03' as date),1000),
(9,600,cast('2022-01-03' as date),3000)
GO

-- Method 1
with FirstVisit as
(
select customer_id, min(order_date) as FirstVisitDate
from customer_orders
group by customer_id
),

VisitFlag AS
(
select CO.*, FirstVisitDate ,
CASE WHEN CO.order_date = FV.FirstVisitDate THEN 1 ELSE 0 END AS FirstVisitFlag,
CASE WHEN CO.order_date <> FV.FirstVisitDate THEN 1 ELSE 0 END AS RepeatVisitFlag
from customer_orders CO
join FirstVisit FV on CO.customer_id = FV.customer_id
)

SELECT order_date, SUM(FirstVisitFlag) AS NewCustomerCount, SUM(RepeatVisitFlag) AS OldCustomerCount
FROM VisitFlag
GROUP BY order_date

-- Method 2
WITH FirstOrder AS (
SELECT customer_id, 
MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
)
SELECT o.order_date,
       SUM(CASE WHEN o.order_date = f.first_order_date THEN 1 ELSE 0 END) AS New_Customers,
       SUM(CASE WHEN o.order_date > f.first_order_date THEN 1 ELSE 0 END) AS Old_Customers
FROM customer_orders o
JOIN FirstOrder f ON o.customer_id = f.customer_id
GROUP BY o.order_date
ORDER BY o.order_date

-- Method 3
SELECT
	CO.ORDER_DATE,
	COUNT (CASE WHEN CO.ORDER_DATE = FP.FIRST_PURCHASE_DATE THEN 1 END)AS NEW_CUSTOMERS,
	COUNT (CASE WHEN CO.ORDER_DATE > FP.FIRST_PURCHASE_DATE THEN 1 END)AS OLD_CUSTOMERS
FROM CUSTOMER_ORDERS CO
LEFT JOIN (
SELECT
	CUSTOMER_ID,
	MIN(ORDER_DATE) AS FIRST_PURCHASE_DATE
FROM CUSTOMER_ORDERS
GROUP BY CUSTOMER_ID
)FP
ON CO.CUSTOMER_ID =FP.CUSTOMER_ID
GROUP BY CO.ORDER_DATE


-- 4 Find the largest order by value for each salesperson and display oreder details (Withou CTE, TempTable, Window FUnction, SubQuery)

CREATE TABLE [dbo].[int_orders](
 [order_number] [int] NOT NULL,
 [order_date] [date] NOT NULL,
 [cust_id] [int] NOT NULL,
 [salesperson_id] [int] NOT NULL,
 [amount] [float] NOT NULL
) ON [PRIMARY];

INSERT INTO [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (30, CAST('1995-07-14' AS Date), 9, 1, 460);
INSERT into [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (10, CAST('1996-08-02' AS Date), 4, 2, 540);
INSERT INTO [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (40, CAST('1998-01-29' AS Date), 7, 2, 2400);
INSERT INTO [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (50, CAST('1998-02-03' AS Date), 6, 7, 600);
INSERT into [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (60, CAST('1998-03-02' AS Date), 6, 7, 720);
INSERT into [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (70, CAST('1998-05-06' AS Date), 9, 7, 150);
INSERT into [dbo].[int_orders] ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (20, CAST('1999-01-30' AS Date), 4, 8, 1800);

SELECT a.order_number, b.order_date, a.cust_id, a.salesperson_id, a.amount
FROM dbo.int_orders a
LEFT JOIN dbo.int_orders b 
ON a.salesperson_id = b.salesperson_id
GROUP BY a.order_number, b.order_date, a.cust_id, a.salesperson_id, a.amount
HAVING a.amount > MAX(b.amount)

-- It was asked to without CTE, window functions. Below is the way where window function can be used for this.
WITH LargestOrder AS
(
    SELECT 
	  salesperson_id, cust_id, order_date, order_number, amount,
	  ROW_NUMBER() over (PARTITION BY salesperson_id ORDER BY amount DESC) AS rn
	FROM dbo.int_orders
)
SELECT
      salesperson_id,  cust_id,  order_date,  order_number,  amount
FROM LargestOrder 
WHERE  rn=1


-- 5 Find the departments whose average salary is less than the average salary of the company without considering that department
CREATE TABLE emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

INSERT INTO emp VALUES (1, 'Ankit', 100,10000, 4, 39);
INSERT INTO emp VALUES (2, 'Mohit', 100, 15000, 5, 48);
INSERT INTO emp VALUES (3, 'Vikas', 100, 10000,4,37);
INSERT INTO emp VALUES (4, 'Rohit', 100, 5000, 2, 16);
INSERT INTO emp VALUES (5, 'Mudit', 200, 12000, 6,55);
INSERT INTO emp VALUES (6, 'Agam', 200, 12000,2, 14);
INSERT INTO emp VALUES (7, 'Sanjay', 200, 9000, 2,13);
INSERT INTO emp VALUES (8, 'Ashish', 200,5000,2,12);
INSERT INTO emp VALUES (9, 'Mukesh',300,6000,6,51);
INSERT INTO emp VALUES (10, 'Rakesh',300,7000,6,50);

-- Method 1
SELECT e1.department_id, AVG(e1.salary) AS dept_avg_salary
FROM emp e1
JOIN emp e2
ON e1.department_id != e2.department_id
GROUP BY e1.department_id
HAVING AVG(e1.salary) < AVG(e2.salary)

-- Method 2
WITH CTE AS
(
SELECT department_id, AVG(salary) dep_avg, COUNT(*) no_of_emp, SUM(salary) total_dept_sal
FROM emp
GROUP BY department_id
)
SELECT * FROM 
( SELECT e1.department_id, e1.dep_avg, SUM(e2.no_of_emp) as no_of_emp, SUM(e2.total_dept_sal) as total_dept_sal,
SUM(e2.total_dept_sal)/SUM(e2.no_of_emp) as com_avg_sal
FROM cte e1
JOIN cte e2 ON e1.department_id <> e2.department_id
GROUP BY e1.department_id, e1.dep_avg
) a
WHERE dep_avg < com_avg_sal

-- Method 3
SELECT e.department_id
FROM emp e
GROUP BY e.department_id
HAVING AVG(e.salary) < (
    SELECT AVG(salary)
    FROM emp
    WHERE department_id <> e.department_id
)

