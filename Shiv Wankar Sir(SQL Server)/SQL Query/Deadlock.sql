--LOCKING IN SQL SERVER

--take care of transaction concurrency.
--for successful SQL Server transaction processing and is designed to allow SQL Server to work seamlesslu in a multi user environment.

Table A -update table by  user A -----LOCK WILL BE RELEASED ONLY ON SUCCESSFUL TRANSACTION
Table A - update table by user B

LOCK MODE
EXCLUSIVE LOCK(X) - applied on a page or row to update
imposed during DML operation and once imposed, no other locks can be imposed.

SHARED LOCK
it will reserve a page or row to be available only for reading

UPDATE LOCK(U)
can be imposed on a record that already has a shared lock.

DEADLOCK DEFINITION IN SQL SERVER

--Occurs when multiple users are trying to access same table with different resource.
--SQL engine decides to kill one process to solve the conflict
--the killed process is called deadlock victim.

CORRECTION: LOCK THE SHARED RESOURCE.


DROP TABLE IF EXISTS Table_A 
CREATE TABLE Table_A (Id INT PRIMARY KEY, FruitName VARCHAR(100))
GO
INSERT INTO Table_A VALUES(1,'Lemon') 
INSERT INTO Table_A VALUES(2,'Apple')
GO

DROP TABLE IF EXISTS Table_B
CREATE TABLE Table_B (Id INT PRIMARY KEY, FruitName VARCHAR(100))
GO 
INSERT INTO Table_B VALUES(1,'Banana') 
INSERT INTO Table_B VALUES(2,'Orange') 
GO

--HOW TO SEE DEADLOCK IN SQL SERER

SELECT @@SPID
 SELECT *FROM SYS.SYSPROCESSES

 SQL SYSTEM PROFILER TO SEE THE GRAPH OF DEADLOCK

 TOOLS ---- GO TO SQL SERVER PROFILER ----- EVENT SELECTION
 ASK FOR TRACE NAME-DEADLOCK TRACE --SHOW ALL EVENTS --- DEADLOCK ---RUN

 SERVER --------- MANAGEMENT ----------- EXTENDED EVENTS


 EDIT ----INTELLISENSE ---------- REFRESH LOCAL CACHE

 --HOW TO PREVENT DEADLOCK?
 Access the resources in the same order.
 Write the shortest transactions as much as possible and lock the resource for the minimum duration.
 Limiting the usage of the cursors.
 Design more normalized databases.
 Avoid poorly optimized queries.

 Capture the deadlock by SQL Profiler and Extended Events handler

 SELECT *FROM TABLE_A
 SELECT *FROM TABLE_B

 BEGIN TRAN 
UPDATE Table_A SET FruitName ='Mangoo' WHERE Id=1 
WAITFOR DELAY '00:00:30' 
UPDATE Table_B SET FruitName ='Avacadoo' WHERE Id=1 
COMMIT TRAN
