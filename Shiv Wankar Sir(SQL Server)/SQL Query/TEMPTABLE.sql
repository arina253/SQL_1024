--TEMPORARY TABLES IN SQL SERVER

--TO STORE DATA BUT TABLE WILL BE AUTO DELETED
--TABLE WILL EXIST TEMPORARILY ON THE SQL SERVER.
--USED FOR STORING DATA OR IMMEDIATE RESULT SETS THAT ARE ACCESSED MULTIPLE TIMES.

CREATE TEMP TABLE
BLOCK ---1 --ACCESSING THE REQUIRED DATA USING FILTERS & INSERT INTO TEMP (FROM MILLION ROWS TO 500 ROWS)

BLOCK - ACCESS AND PROCESS 500 ROWS TEMP TABLE(SELECT DATA AND CALCULATE SOMETHING ON THIS ROWS)

BLOCK - ACCESS AND PROCESS 500 ROWS TEMP TABLE

BLOCK - ACCESS AND PROCESS 500 ROWS----TRANSFERRING TO OTHER TABLE

BLOCK ---- DELETING 500 ROWS -----TEMP TABLE JOIN WITH MAIN TABLE

EVERYTIME WE HAVE TO HIT THE MAIN TABLE AND READ ALL DATA WHICH IS NOT NEEDED TO ACCESS THE ENTIRE TABLE.
DATA IS TAKEN INTO TEMPORARY TABLE WHICH WILL HAVE LESS MEMORY CONSUMPTION AND BETTER PERFORMANCE.

--SIMILAR TO NORMAL TABLES
--TEMPORARY TABLE STARTS WITH A HASH SYMBOL (#)
--GET STORED IN THE TEMPDB SYSTEM DATABASE IRRESPECTIVE OF DATABASE


CREATE TABLE #EMP
(
ID INT,
NAME VARCHAR(20),
DOB DATE
)

TEMPORARY TABLES WILL BE AUTOMATICALLY DELETED WHEN WINDOW CREATING THE TABLE IS CLOSED.

--IT IS BETTER TO DROP THE TABLE AT THE END. RUNNING THE TABLE TWO TIMES WILL THROW ERROR. 

--IN THE STORED PROCEDURE, WE WILL NOT HAVE ANY HARD CODED VALUE.

--SELECT INTO INSERT - NO NEED TO CREATE NEW TABLE
--INSERT INTO SELECT - WE NEED TO CREATE TABLE FIRST

WHENEVER USING APPLICATION, OF DIFFERENT DURATION, DURING TESTING, THROW ERROR AS TEMP TABLE ALREADY PRESENT.WE ARE NOT GIVING ANY SCOPE TO THROW ERROR,SO WE ARE DROPPING TABLE AT THE EXTREME END.

--CREATING TEMPORARY TABLES
--SELECT INTO # TEMP_TABLE FROM OLD_TABLE WHERE CONDITION
--CREATE TABLE #TEMP_TABLE

1.SELECT INTO FROM ------> WE DO NOT NEED TO CREATE TABLE
2.INSERT INTO SELECT -----> WE SHOULD HAVE THE TABLE FIRST

SELECT COLUMN NAMES INTO TABLE_NAME FROM OLD_TABLE WHERE 
SELECT * INTO #CUSTOMER_TEMP FROM [SALES].[CUSTOMER]

SELECT *FROM #CUSTOMER_TEMP

SELECT  CUSTOMERID,ACCOUNTNUMBER,ROWGUID INTO #CUSTOMER_TEMP FROM [SALES].[CUSTOMER] WHERE TERRITORYID = 10

--TWO TYPES OF TEMPORARY TABLE
1) LOCAL TEMPORARY TABLE
2) GLOBAL TEMPORARY TABLE

1) LOCAL TEMPORARY TABLE
AVAILABLE ONLY FOR THE SESSION THAT HAS CREATED IT.
NOT ACCESSIBLE IN OTHER WINDOW.
AUTOMATICALLY TABLE IS DROPPED WHEN THE  CONNECTION IS CLOSED.
SINGLE HASH IS USED AS THE PREFIX OF A TABLE NAME
DURING TESTING PHASE, WE CAN RUN SAME QUERY MULTIPLE TIMES,SO BEST PRACTICE IS TO DROP THE TABLE.

2) GLOBAL TEMPORARY TABLE
--ADD THE ## SYMBOL BEFORE THE TABLE NAME
VISIBLE TO ALL THE CONNECTIONS AND DROPPED WHEN THE CONNECTION WHO CREATED THE TABLE IS CLOSED
ONCE THE CONNECTION IN WHICH TABLE IS CREATED IS CLOSED, THEN WE CANNOT ACCESS IT

--SUMMARY
--TO SELECT THE SET OF DATA MULTIPLE TIMES IN A STORED PROCEDURE OR WITHIN THE DIFFERENT BATCHES.
--2 TYPES:
LOCAL TEMP TABLE ARE CREATED USING SINGLE HASH AS PREFIX BEFORE THE TABLE NAME
AUTOMATICALLY DROPPED AND CANNOT BE ACCESSED IN ANY OTHER WINDOWS.

ONCE THE STORED PROCEDURE IS EXECUTED, TEMPORARY TABLE IS DROPPED AUTOMATICALLY WHETHER WE USE LOCAL TEMP TABLE OR GLOBAL TEMP TABLE.
IN BOTH TABLE TYPES, WHEN THE SESSION IS CLOSED, THAT CANNOT BE ACCESSED.
--WE SHOULD BE ABLE TO SEE QUERY IN ANOTHER WINDOW/ MULTIPLE PEOPLE CAN ACCESS THE QUERY - GLOBAL TEMP TABLE USE

SELECT  CUSTOMERID,ACCOUNTNUMBER,ROWGUID INTO #CUSTOMER_TEMP FROM [SALES].[CUSTOMER] WHERE TERRITORYID = 10
SELECT *FROM #CUSTOMER_TEMP
UPDATE #CUSTOMER_TEMP SET ACCOUNTNUMBER = 

--UI IS THE INTERFACE BETWEEN DATABASE AND USER.
