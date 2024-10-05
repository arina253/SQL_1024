Question 1: Hierarchical Data
Question: Given an Employees table with a ManagerID column that references EmployeeID, write a CTE to display the hierarchy of employees up to 3 levels deep.

Solution:

sql
Copy code
WITH EmployeeHierarchy AS (
    SELECT 
        EmployeeID, 
        FirstName, 
        LastName, 
        ManagerID, 
        0 AS Level
    FROM 
        Employees
    WHERE 
        ManagerID IS NULL
    
    UNION ALL
    
    SELECT 
        e.EmployeeID, 
        e.FirstName, 
        e.LastName, 
        e.ManagerID, 
        eh.Level + 1
    FROM 
        Employees e
    INNER JOIN 
        EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
    WHERE 
        eh.Level < 2
)
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    ManagerID, 
    Level
FROM 
    EmployeeHierarchy
ORDER BY 
    Level, ManagerID;
Question 2: Running Total
Question: Given a Sales table with columns SaleID, SaleDate, and Amount, write a CTE to calculate a running total of sales amount by date.

Solution:

sql
Copy code
WITH RunningTotal AS (
    SELECT 
        SaleDate, 
        Amount, 
        SUM(Amount) OVER (ORDER BY SaleDate) AS RunningTotal
    FROM 
        Sales
)
SELECT 
    SaleDate, 
    Amount, 
    RunningTotal
FROM 
    RunningTotal;
Question 3: Recursive Sum
Question: Given a Numbers table with a single column Number, write a CTE to calculate the cumulative sum of the first 10 natural numbers.

Solution:

sql
Copy code
WITH NumberCTE AS (
    SELECT 
        1 AS Number
    UNION ALL
    SELECT 
        Number + 1
    FROM 
        NumberCTE
    WHERE 
        Number < 10
), 
SumCTE AS (
    SELECT 
        Number, 
        (SELECT SUM(Number) FROM NumberCTE WHERE Number <= n.Number) AS CumulativeSum
    FROM 
        NumberCTE n
)
SELECT 
    Number, 
    CumulativeSum
FROM 
    SumCTE;
Question 4: Find Top N per Group
Question: Given an Orders table with columns OrderID, CustomerID, and OrderDate, write a CTE to find the latest order for each customer.

Solution:

sql
Copy code
WITH LatestOrders AS (
    SELECT 
        OrderID, 
        CustomerID, 
        OrderDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS RowNum
    FROM 
        Orders
)
SELECT 
    OrderID, 
    CustomerID, 
    OrderDate
FROM 
    LatestOrders
WHERE 
    RowNum = 1;
Question 5: Calculate Average Salary Above a Certain Threshold
Question: Given an Employees table with columns EmployeeID, FirstName, LastName, Department, and Salary, write a CTE to find the average salary for each department and list the departments where the average salary is above $75,000.

Solution:

sql
Copy code
WITH AvgSalaryByDept AS (
    SELECT 
        Department, 
        AVG(Salary) AS AvgSalary
    FROM 
        Employees
    GROUP BY 
        Department
)
SELECT 
    Department, 
    AvgSalary
FROM 
    AvgSalaryByDept
WHERE 
    AvgSalary > 75000;
These questions and solutions should provide a good range of practice with CTEs, covering hierarchical data, running totals, recursive sums, finding top records per group, and aggregate calculations.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Sure! Below are example questions along with solutions that demonstrate the use of CTEs, temporary tables, and table variables side by side. These examples will help you understand the differences and appropriate scenarios for using each method.

Scenario: Employees and Sales Data
Let's assume we have the following tables:

Employees(EmployeeID, FirstName, LastName, ManagerID, Department, Salary)
Sales(SaleID, EmployeeID, SaleDate, Amount)
Question 1: Calculate Department-wise Average Salary
Objective: Calculate the average salary for each department using CTE, temporary table, and table variable.

-Using Joins
SELECT AVG(E.SALARY),E.DEPARTMENT
FROM EMPLOYEES E
JOIN 

Using CTE:

sql
Copy code
WITH AvgSalaryByDept AS (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
)
SELECT Department, AvgSalary
FROM AvgSalaryByDept;


Using Temporary Table:

sql
Copy code
CREATE TABLE #AvgSalaryByDept (
    Department NVARCHAR(50),
    AvgSalary DECIMAL(10, 2)
);

INSERT INTO #AvgSalaryByDept
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

SELECT Department, AvgSalary
FROM #AvgSalaryByDept;

DROP TABLE #AvgSalaryByDept;

Using Table Variable:

sql
Copy code
DECLARE @AvgSalaryByDept TABLE (
    Department NVARCHAR(50),
    AvgSalary DECIMAL(10, 2)
);

INSERT INTO @AvgSalaryByDept
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

SELECT Department, AvgSalary
FROM @AvgSalaryByDept;

Question 2: Find Employees with Sales Above Average
Objective: Find employees whose sales are above the average sales using CTE, temporary table, and table variable.

Using CTE:

sql
Copy code
WITH AvgSales AS (
    SELECT EmployeeID, AVG(Amount) AS AvgAmount
    FROM Sales
    GROUP BY EmployeeID
),
AboveAvgSales AS (
    SELECT s.EmployeeID, e.FirstName, e.LastName, s.Amount
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN AvgSales a ON s.EmployeeID = a.EmployeeID
    WHERE s.Amount > a.AvgAmount
)
SELECT EmployeeID, FirstName, LastName, Amount
FROM AboveAvgSales;
Using Temporary Table:

sql
Copy code
CREATE TABLE #AvgSales (
    EmployeeID INT,
    AvgAmount DECIMAL(10, 2)
);

INSERT INTO #AvgSales
SELECT EmployeeID, AVG(Amount) AS AvgAmount
FROM Sales
GROUP BY EmployeeID;

CREATE TABLE #AboveAvgSales (
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Amount DECIMAL(10, 2)
);

INSERT INTO #AboveAvgSales
SELECT s.EmployeeID, e.FirstName, e.LastName, s.Amount
FROM Sales s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN #AvgSales a ON s.EmployeeID = a.EmployeeID
WHERE s.Amount > a.AvgAmount;

SELECT EmployeeID, FirstName, LastName, Amount
FROM #AboveAvgSales;

DROP TABLE #AvgSales;
DROP TABLE #AboveAvgSales;
Using Table Variable:

sql
Copy code
DECLARE @AvgSales TABLE (
    EmployeeID INT,
    AvgAmount DECIMAL(10, 2)
);

INSERT INTO @AvgSales
SELECT EmployeeID, AVG(Amount) AS AvgAmount
FROM Sales
GROUP BY EmployeeID;

DECLARE @AboveAvgSales TABLE (
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Amount DECIMAL(10, 2)
);

INSERT INTO @AboveAvgSales
SELECT s.EmployeeID, e.FirstName, e.LastName, s.Amount
FROM Sales s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN @AvgSales a ON s.EmployeeID = a.EmployeeID
WHERE s.Amount > a.AvgAmount;

SELECT EmployeeID, FirstName, LastName, Amount
FROM @AboveAvgSales;
Question 3: Generate a Sales Report with Running Total
Objective: Generate a report showing each sale with a running total of sales amount by employee using CTE, temporary table, and table variable.

Using CTE:

sql
Copy code
WITH SalesWithRunningTotal AS (
    SELECT 
        SaleID, 
        EmployeeID, 
        SaleDate, 
        Amount,
        SUM(Amount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS RunningTotal
    FROM 
        Sales
)
SELECT 
    SaleID, 
    EmployeeID, 
    SaleDate, 
    Amount, 
    RunningTotal
FROM 
    SalesWithRunningTotal;
Using Temporary Table:

sql
Copy code
CREATE TABLE #SalesWithRunningTotal (
    SaleID INT,
    EmployeeID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2),
    RunningTotal DECIMAL(10, 2)
);

INSERT INTO #SalesWithRunningTotal
SELECT 
    SaleID, 
    EmployeeID, 
    SaleDate, 
    Amount,
    SUM(Amount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS RunningTotal
FROM 
    Sales;

SELECT 
    SaleID, 
    EmployeeID, 
    SaleDate, 
    Amount, 
    RunningTotal
FROM 
    #SalesWithRunningTotal;

DROP TABLE #SalesWithRunningTotal;
Using Table Variable:

sql
Copy code
DECLARE @SalesWithRunningTotal TABLE (
    SaleID INT,
    EmployeeID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2),
    RunningTotal DECIMAL(10, 2)
);

INSERT INTO @SalesWithRunningTotal
SELECT 
    SaleID, 
    EmployeeID, 
    SaleDate, 
    Amount,
    SUM(Amount) OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS RunningTotal
FROM 
    Sales;

SELECT 
    SaleID, 
    EmployeeID, 
    SaleDate, 
    Amount, 
    RunningTotal
FROM 
    @SalesWithRunningTotal;
Explanation
CTE is useful for temporary result sets that are only needed within a single query.
Temporary Tables are useful for intermediate storage that can be indexed and reused across multiple queries within the same session.
Table Variables are similar to temporary tables but are scoped to the batch, stored procedure, or function in which they are declared and generally perform better for small datasets.
These examples should help you practice and understand when to use each method effectively.



