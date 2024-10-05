CREATE TABLE king (
 k_no INT PRIMARY KEY,
 king VARCHAR(50),
 house VARCHAR(50)
);

Create Table Battle 
(
  Battle_no INT PRIMARY KEY,
  Battle_Name Varchar(50),
  attacker_king int,
  Defender_king int,
  Attacker_outcome int,
  Region varchar(50),
  Constraint FK_battle_attacker_king FOREIGN KEY(attacker_king) REFERENCES king(k_no),
  Constraint FK_battle_Defender_king FOREIGN KEY(Defender_king) REFERENCES king(k_no) 
)

-- Step 1: Calculate the total number of wins for each house in each region
;WITH HouseWins AS (
    SELECT
        b.Region,
        k.house AS House,
        SUM(CASE WHEN b.Attacker_outcome = 1 AND k.k_no = b.attacker_king THEN 1 ELSE 0 END +
            CASE WHEN b.Attacker_outcome = 0 AND k.k_no = b.Defender_king THEN 1 ELSE 0 END) AS TotalWins
    FROM Battle b
    JOIN king k ON b.attacker_king = k.k_no OR b.Defender_king = k.k_no
    GROUP BY b.Region, k.house
),

-- Step 2: Find the maximum number of wins for each region
MaxWins AS 
(
    SELECT Region, MAX(TotalWins) AS MaxWins
    FROM HouseWins
    GROUP BY Region
)
-- Step 3: Select the house with the maximum wins in each region
SELECT
    hw.Region,
    hw.House,
    hw.TotalWins AS NumberOfWins
FROM HouseWins hw
JOIN MaxWins mw ON hw.Region = mw.Region AND hw.TotalWins = mw.MaxWins;

Drop Table If Exists #temp_winner_table
Select King, Region, Sum(NUM_OF_BATTLES_WON) As Total_Battles_Won
Into #temp_winner_table
From
(
	SELECT ATTACKER_KING As King, REGION, COUNT(Battle_no) AS NUM_OF_BATTLES_WON
		FROM BATTLE
		Where ATTACKER_OUTCOME = 1
		GROUP BY ATTACKER_KING, REGION
	Union All
	SELECT DEFENDER_KING As King, REGION, COUNT(Battle_no) AS NUM_OF_BATTLES_WON
		FROM BATTLE
		Where ATTACKER_OUTCOME = 0
		GROUP BY DEFENDER_KING, REGION
) winners
Group By King, Region

Select t.REGION, K.HOUSE, t.Total_Battles_Won
From #temp_winner_table t Join 
	(Select Region, Max(Total_Battles_Won) Max_Won
		From #temp_winner_table
		Group By Region) tm
			On t.REGION = tm.REGION
	Join KING K
		On K.K_NO = t.King
	Where t.Total_Battles_Won = tm.Max_Won
Go

-- 2

/*
Id		|	Id
1		|	1
1		|	1
1		|	1
1		|	2
1		|	Null
null	|	NULL
null	|	NULL
*/

DROP TABLE IF EXISTS TABLE_A
CREATE TABLE TABLE_A (ID INT)
INSERT INTO TABLE_A VALUES (1),(1),(1),(1),(1),(NULL),(NULL)

DROP TABLE IF EXISTS TABLE_B
CREATE TABLE TABLE_B (ID INT)
INSERT INTO TABLE_B VALUES (1),(1),(1),(2),(NULL)

SELECT * FROM TABLE_A
SELECT * FROM TABLE_B

SELECT A.ID, B.ID 
FROM TABLE_A A 
INNER JOIN TABLE_B B ON A.ID = B.ID

SELECT A.ID, B.ID 
FROM TABLE_A A 
LEFT JOIN TABLE_B B ON A.ID = B.ID

SELECT A.ID, B.ID 
FROM TABLE_A A 
RIGHT JOIN TABLE_B B ON A.ID = B.ID

SELECT A.ID, B.ID 
FROM TABLE_A A 
FULL JOIN TABLE_B B ON A.ID = B.ID

SELECT A.ID, B.ID 
FROM TABLE_A A 
CROSS JOIN TABLE_B B 

-- 3 & 4
DROP TABLE IF EXISTS REGIONS
CREATE Table  Regions
(
Region_Id 	int,
Region_name varchar(50)
)

DROP TABLE IF EXISTS CUSTOMERS
CREATE Table Customers
(
Customer_id		int,
node_id			int,
region_id		int,
start_date		datetime,
end_date		datetime
)

DROP TABLE IF EXISTS CUSTOMER_TRANSACTIONS
CREATE Table customer_transactions
(
customer_id		int,
txn_date		datetime,
txn_type		varchar(100),
txn_amount		money
)

;WITH CountCte AS(
   SELECT 
	DATEPART(MONTH,txn_date) AS month,
	DATEPART(YEAR, txn_date) AS YEAR,
   	customer_id,
   	COUNT(CASE
   			WHEN txn_type = 'deposit' THEN 1 ELSE 0 END) AS deposit_count,
   	COUNT(CASE
   		 WHEN txn_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_count,
   	COUNT(CASE
   		 WHEN txn_type = 'withdrawal' THEN 1 ELSE 0 END) AS withdrawal_count
   FROM customer_transactions
   GROUP BY customer_id, DATEPART(YEAR, txn_date), DATEPART(MONTH,txn_date)
)
SELECT 
   month, 
   YEAR, 
   COUNT(DISTINCT customer_id) AS customer_count
FROM CountCte
WHERE deposit_count > 1
AND (purchase_count = 1 OR withdrawal_count = 1)
GROUP BY month, YEAR
ORDER BY customer_count DESC;

SELECT 
   txn_type, 
   COUNT(*) AS num_of_transactions, 
   SUM(txn_amount) AS total_amount
FROM customer_transactions
GROUP BY txn_type
ORDER BY num_of_transactions DESC;

-- 5
-- direct reports for each employee
WITH EmployeeCounts AS (
    SELECT 
        e1.employee_id AS emp_id,
        e1.manager_id AS mgr_id,
        COUNT(e2.employee_id) AS num_reports
    FROM employees e1
    INNER JOIN employees e2 ON e1.employee_id = e2.manager_id
    GROUP BY e1.employee_id, e1.manager_id
),
-- Compare the number of direct reports of employees with their managers
ManagerComparison AS 
(
    SELECT
        ec1.emp_id,
        ec1.num_reports AS emp_reports,
        ec2.num_reports AS mgr_reports
    FROM EmployeeCounts ec1
    JOIN EmployeeCounts ec2 ON ec1.mgr_id = ec2.emp_id
    WHERE ec1.num_reports = ec2.num_reports
)
-- Select employees
SELECT
    e1.employee_id,
    e1.manager_id
	E.NAME,
	E.LASTNAME
    --ec1.num_reports AS employee_report_count,
    --ec2.num_reports AS manager_report_count
FROM employees e1
JOIN ManagerComparison mc ON e1.employee_id = mc.emp_id
--JOIN EmployeeCounts ec1 ON e1.employee_id = ec1.emp_id
--JOIN EmployeeCounts ec2 ON e1.manager_id = ec2.emp_id

-- 6
WITH RankedOrders AS (
    SELECT customer_id,order_id,order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders )

SELECT customer_id,order_id,order_date
FROM RankedOrders
WHERE rn <= 3
ORDER BY customer_id, rn;

-- 7
-- TRIGGER FOR INSERT
CREATE OR ALTER TRIGGER TR_ORDERS_FOR_INSERT
ON ORDERS
AFTER INSERT
AS
BEGIN
	IF 'ORDERS_TABLE_AUDIT' NOT IN (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES)
	BEGIN
		CREATE TABLE ORDERS_AUDIT
		(
			LOG_ID INT IDENTITY,
			INSERT_DESCRIPTION NVARCHAR(2000),
			INSERT_DATE DATETIME,
			INSERT_SERVER_NAME VARCHAR(100),
		)
	END

	INSERT INTO ORDERS_AUDIT
	SELECT 
			CONCAT('NEW ORDER: ',ORDER_ID, ' HAS BEEN ADDED WITH ASSOCIATED CUSTOMER ID: ', CUSTOMER_ID),
			GETDATE(),
			SYSTEM_USER
		FROM INSERTED
END
GO

-- TRIGGER FOR UPDATE
CREATE OR ALTER TRIGGER TR_ORDERS_FOR_UPDATE
ON ORDERS
AFTER UPDATE
AS
BEGIN
	IF 'ORDERS_TABLE_AUDIT' NOT IN (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES)
	BEGIN
		CREATE TABLE ORDERS_AUDIT
		(
			LOG_ID INT IDENTITY,
			INSERT_DESCRIPTION NVARCHAR(2000),
			INSERT_DATE DATETIME,
			INSERT_SERVER_NAME VARCHAR(100),
		)
	END

	INSERT INTO ORDERS_AUDIT
	SELECT 
			CONCAT('AN EXISTING RECORD WITH ORDER ID: ',ORDER_ID, ' AND CUSTOMER ID: ', CUSTOMER_ID, ' HAS BEEN UPDATED'),
			GETDATE(),
			SYSTEM_USER
		FROM INSERTED

END
GO
