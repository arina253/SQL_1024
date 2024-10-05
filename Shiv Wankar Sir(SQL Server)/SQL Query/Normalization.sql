
--all the images will be stored in the cloud and document id or link is only stored in the database. It will save space.
--we are uploading image in cloud based technology, we are generating binary data 

--DATABASE NORMALIZATION
We are creating a system which is more stabilized.
Process of organizing data to minimize data redundancy(data duplication )which in turn ensures data consistency.
We will create separate columns and tables to reduce duplication.
Goal is to divide large set data into smaller set and establish relation between them.
--PROCESS OF ORGANIZING LARGE DATA INTO SMALL FORM

Denormalization -
--3NF
--Calculated values should not be stored in table as calculation is based on more than one column.

--PROCESS OF ORGANIZING DATA IN A EFFICIENT WAY SO THAT WE CAN AVOID DATA DUPLICATION.
THERE ARE THREE FORMS OF DATA NORMALIZATION.
3NF: WE SHOULD NOT STORE DATA THAT IS NOT FULLY DEPENDENT ON PRIMARY KEY.

--TRANSACTIONS
a single logical unit of work 
IT IS GROUPING SMALL PIECES OF WORK TOGETHER
EG: UPDATING THE CURRENT QUANTITY
INSERTING INTO SALES TABLE
--3 types of transactions:

we use Begin End block if there is any boolean condition to be evaluated and which expression to go first.
1) Auto Commit Transaction mode- this is the default mode
DDL,DML are autocommitted,if any error rollback the transaction

2) Implicit Transaction Mode 
SQL Server will begin the transaction implicitle.
Developers end the transaction with a commit or rollback.

SET IMPLICIT_TRANSACTIONS OFF- AUTO COMMITTED

3) Explicit Transaction
Developer is only responsible for beginning and ending the transaction.

DBCC USEROPTIONS---Database console server ---To get the Property of SQL Server,database,table.
DBCC CHECKDB('ZORBA_1024') ----used by administrative people

select IIF(@@OPTIONS & 2 = 0, 'OFF', 'ON') -- TO CHECK SET IMPLICIT TRANSACTIONS ON/OFF

/*To maintain the database level consistency,should follow ACID Properties 
1)Atomicity - The entire transaction takes place at once or doesn't happen at all.
2)Consistency - The database must be consistent before and after the transaction.
3)Isolation - Multiple Transactions occur independently without interference.
4)Durability-The changes of a successful transaction occurs even if the system failure occurs.

-----------------------------------------------------------------------------------------------------------------

--CLASS NOTES*/

--DROP TABLE Customers

--CREATE TABLE Customers
--(
--CustomerID INT PRIMARY KEY,
--CustomerCode VARCHAR(10),
--CustomerName VARCHAR(50)
--)

--DELETE FROM Customers;
--Step1: Set the Implicit transaction mode to ON
SET IMPLICIT_TRANSACTIONS OFF
--Step2: Execute the DML Statement
--Now let us try to insert two records using the implicit mode of transaction.
INSERT INTO Customers VALUES (1, 'CODE_1', 'David');
INSERT INTO Customers VALUES (2, 'CODE_2', 'John');
--Step3: Commit the transaction
-- COMMIT TRANSACTION
ROLLBACK TRANSACTION



SELECT * FROM Customers
--DELETE FROM Customers
SET IMPLICIT_TRANSACTIONS ON
INSERT INTO Customers VALUES (3, 'CODE_3', 'Pam');
UPDATE Customers SET CustomerName = 'John Changed' WHERE CustomerID = 3;

UPDATE Customers SET CustomerName = 'John Changed1' WHERE CustomerID = 3;
SELECT * FROM Customers
COMMIT TRANSACTION
SELECT * FROM Customers


/* SET IMPLICIT_TRANSACTION OFF */
DELETE FROM Customers;
--Step1: Set the Implicit transaction mode to ON
--SET IMPLICIT_TRANSACTIONS ON
--Step2: Execute the DML Statement
--Now let us try to insert two records using the implicit mode of transaction.
INSERT INTO Customers VALUES (1, 'CODE_1', 'David');
INSERT INTO Customers VALUES (2, 'CODE_2', 'John');
--Step3: Commit the transaction
--COMMIT TRANSACTION
SELECT * FROM Customers
SET IMPLICIT_TRANSACTIONS OFF
INSERT INTO Customers VALUES (3, 'CODE_3', 'Pam');
UPDATE Customers SET CustomerName = 'John Changed' WHERE CustomerID = 2;
SELECT * FROM Customers

--ROLLBACK TRANSACTION
--SELECT * FROM Customers

DBCC CHECKALLOC(SQL_1024)
--DBCC CHECKPOINT()

SELECT IIF(@@OPTIONS & 2 = 0, 'OFF', 'ON')

SELECT @@OPTIONS