
--SQL Aliases
--To give a table or column in a table a temporary name.

SELECT COLUMN_NAME AS ALIAS_NAME
FROM TABLE_NAME



SELECT FNAME AS FIRSTNAME,LNAME AS LASTNAME
FROM TABLE_NAME AS TABLE

SELECT CULTUREID,NAME AS LANGUAGE
FROM PRODUCTION.CULTURE

SELECT CULTUREID AS 'CULTURE ID',NAME AS [LANGUAGE IN USE]
FROM PRODUCTION.CULTURE

--ALIAS IS JUST FOR DISPLAY PURPOSE AND IT IS TEMPORARY.

--FROM DATABASE ZORBA 1024
SELECT *FROM DBO.EMPLOYEE
SELECT *FROM DBO.DEPARTMENT

SELECT EMPLOYEE.FNAME,EMPLOYEE.LNAME,DEPARTMENT.DEPNAME
FROM EMPLOYEE 
JOIN DEPARTMENT 
ON EMPLOYEE.DEPARTMENTID = DEPARTMENT.DEPID

SELECT E.FNAME,E.LNAME,DEPARTMENT.DEPNAME
FROM EMPLOYEE AS E
JOIN DEPARTMENT AS D
ON E.DEPARTMENTID = D.DEPID

--ALIAS IN TABLE CAN BE MOSTLY USED IN JOINS

SELECT TOP 1 *FROM HUMANRESOURCES.EMPLOYEEDEPARTMENTHISTORY
SELECT TOP 1 *FROM HUMANRESOURCES.DEPARTMENT
SELECT TOP 1 *FROM HUMANRESOURCES.EMPLOYEE


SELECT E.FNAME,E.LNAME,D.DEPNAME
FROM HUMANRESOURCES.EMPLOYEEDEPARTMENTHISTORY AS EDH
JOIN HUMANRESOURCES.EMPLOYEE AS E
ON EDH.BUSINESSENTITYID = E.BUSINESSENTITYID
JOIN HUMANRESOURCES. DEPARTMENT AS D
ON EDH.DEPARTMENTID = D.DEPARTMENTID


--TO SHOW ALL THE TABLES FROM THE DATABASE
SELECT
*FROM INFORMATION_SCHEMA.TABLES

--SQL SERVER FUNCTIONS
-- SQL SERVER IN BUILT FUNCTIONS ARE THE ACTIONS THAT PERFORM CALCULATIONS,MANIPULATE THE DATA AND RETURN SOME RESULT
--EVERY FUNCTION REQUIRE ARGUMENTS/INPUTS
--EVERY FUNCTION WILL RETURN SOME RESULT
--STRING,NUMERIC,DATE,CONVERSION AND SOME ADVANCED FUNCTIONS

/*PATH TO SEE FUNCTIONS IN OBJECT EXPLORER*/
--OBJECT EXPLORER ----> DATABASES ----->SELECT AND EXPAND DATABASE-----> PROGRAMMABILITY ----> FUNCTIONS ------> SYSTEM FUNCTIONS -----> AGGREGATE/STRING/DATE/MATHEMATICAL 

/*SQL STRING FUNCTIONS */

--LEN - TO CALCULATE THE LENGTH OF THE STRING
--LEN (COLUMN_NAME)FROM TABLE

SELECT 'ARINA' AS NAME
SELECT 'ARINA' AS NAME, LEN('ARINA')AS [LEN OF STRING]

--IT WILL INCLUDE SPACE AS WELL.
--LEADING SPACE IS CALCULATED AS 1 CHARACTER
-TRAILING SPACE IS NOT CONSIDERED AS 1 CHARACTER

SELECT 'ARINA' AS NAME, LEN('ARINA ')AS [LEN OF STRING]
SELECT 'ARINA' AS NAME, LEN(' ARINA ')AS [LEN OF STRING]

--LEN FUNCTION WILL CONSIDER ONLY LEADING SPACES IN STRING.
--LEN FUNCTION WILL NOT CONSIDER TRAILING SPACES IN STRING

SELECT NAME AS DEPNAME,LEN(NAME)AS NOOFCHAR FROM HUMANRESOURCES.DEPARTMENT

--CHARINDEX - RETURNS THE POSITION OF A SUBSTRING IN A STRING

SELECT CHARINDEX(SUBSTRING,STRING,START_LOCATION)
--SUBSTRING --> IT IS REQUIRED ( THIS IS THE VALUE TO SEARCH FOR)
--STRING ----> IT IS ALSO REQUIRED(THIS IS THE VALUE IN WHICH WE SEARCH THE SUBSTRING)
--START_LOCATION ----> OPTIONAL

SELECT CHARINDEX ('R','SHIVRAJ')
---SEARCH CHARACTER R IN SHIVRAJ AND RETURN THE POSITION
--RETURNS THE RESULT FOR FIRST OCCURENCE POSITION ONLY.

SELECT NAME AS DEPTNAME,CHARINDEX ('E',NAME)AS NOOFCHAR
FROM HUMANRESOURCES.DEPARTMENT

--USE : TO FIND EMAIL OR SPECIFIED VALUE IN A STRING

SELECT *FROM PERSON.EMAILADDRESS
--TO SEARCH ONLY NAME FROM EMAIL ADDRESS
SELECT EMAILADDRESS
FROM PERSON.EMAILADDRESS

SELECT EMAILADDRESS,SUBSTRING (EMAILADDRESS,1,3)
FROM PERSON.EMAILADDRESS --OUTPUT : a0@

SELECT EMAILADDRESS,SUBSTRING (EMAILADDRESS,1,CHARINDEX('@',EMAILADDRESS)-1)
FROM PERSON.EMAILADDRESS

SELECT CHARINDEX('@',EMAILADDRESS,1)FROM PERSON.EMAILADDRESS



--TO EXTRACT ONLY .COM
SELECT EMAILADDRESS,RIGHT(EMAILADDRESS,4)
FROM PERSON.EMAILADDRESS

--CONCAT - ADDS TWO OR MORE STRINGS TOGETHER
--CONCAT CAN BE USED IN TWO WAYS
1. CONCAT WITH +
2. CONCAT WITH BRACKET --- COMMA SEPARATED VALUES

SELECT 'SHIVRAJ' + ' ' + 'WANKAR' ......ONE SPACE IN BETWEEN ''

SELECT 'SHIVRAJ' + NULL 
--ANY VALUE CONCATENATION WITH NULL BY THE USE OF + SYMBOL, WE WILL GET NULL.
-- WHENEVER WE ARE ADDING ANY VALUE TO NULL WITH +,IT IS CONVERTED TO NULL
--ANY VALUE WHEN WE TRY TO OPERATE WITH NULL , WILL BE CONVERTED TO NULL
--CONCAT IS BETTER THAN NULL

SELECT *FROM PERSON.PERSON
SELECT FIRSTNAME + ' ' + MIDDLENAME + ' ' + LASTNAME AS FULLNAME FROM PERSON.PERSON

SELECT CONCAT(FIRSTNAME,' ',MIDDLENAME,' ',LASTNAME) AS FULLNAME FROM PERSON.PERSON

USE: CONCATENATE ALL THE ADDRESS TOGETHER TO GET FULL ADDRESS 

SELECT CONCAT(FIRSTNAME,' ',MIDDLENAME,' ',LASTNAME) AS FULLNAME FROM PERSON.PERSON

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ASCII - RETURN THE ASCII VALUE OF THE FIRST CHARACTER IN "SHIVRAJ"

SELECT ASCII ('SHIVRAJ')AS NUMCODEOFFIRSTCHAR

--CHAR - THE CHAR()FUNCTION RETURNS THE CHARACTER BASED ON THE ASCII CODE
--SYNTAX: CHAR(CODE)

SELECT CHAR(83)AS CODETOCHARACTER

--DATALENGTH()
--RETURNS THE NUMBER OF BYTES USED TO REPRESENT AN EXPRESSION
--COUNTS BOTH LEADING AND TRAILING SPACES WHEN CALCULATING THE LENGTH OF THE EXPRESSION

SYNTAX: DATALENGTH(EXPRESSION)

SELECT DATALENGTH('   SHIVRAJ   ')AS CHARACTERLENGTH ----- LEADING AND TRAILING BOTH SPACES CONSIDERED
SELECT LEN ('   SHIVRAJ   ')AS CHARACTERLENGTH----------------ONLY LEADING SPACES CONSIDERED


--LOWER()
CONVERTS A STRING TO LOWERCASE
SYNTAX: LOWER(TEXT)
EG: SELECT LOWER ('SHIVRAJ') AS CHARACTERLENGTH

--UPPER()
CONVERTS A STRING TO UPPERCASE
SYNTAX: UPPER(TEXT)
EG: SELECT UPPER('shivraj')

select distinct FIRSTNAME,LASTNAME FROM PERSON.PERSON


RIGHT()
EXTRACTS A NUMBER OF CHARACTERS FROM A STRING STARTING FROM RIGHT.
LEFT() 
EXTRACTS A NUMBER OF CHARACTES FROM A STRING STARTING FROM LEFT

SYNTAX:
RIGHT(STRING,NUMBER_OF_CHARACTERS) 
LEFT(STRING,NUMBER_OF_CHARACTES)


SELECT RIGHT('SHIVRAJ',3)
SELECT EMAILADDRESS FROM [PERSON].EMAILADDRESS
SELECT LEFT(NAME,3),NAME,RIGHT(NAME,2)FROM DEPARTMENTS

--WHICH DO NOT HAVE VALID EMAIL ADDRESS
SELECT *FROM PERSON.EMAILADDRESS WHERE RIGHT(EMAILADDRESS,4)<>'.COM'
SELECT *FROM PERSON.EMAILADDRESS WHERE RIGHT(EMAILADDRESS,4)NOT LIKE'%.COM'
--TRY TO AVOID WILD CARD IF OTHER OPTION AVAILABLE

SELECT LEFT('SHIVRAJ',1)
SELECT EMAILADDRESS,LEFT(EMAILADDRESS,CHARINDEX('@',EMAILADDRESS)-1)FROM PERSON.EMAILADDRESS 
--WE HAVE TO FIND THE POSITION OF @ BY USING CHARINDEX AND SUBTRACTING 1


--LTRIM()
--REMOVES LEADING SPACES FROM A STRING
--RTRIM()
REMOVES TRAILING SPACES FROM A STRING
--TRIM()
REMOVES LEADING AND TRAILING SPACES FROM A STRING

SYNTAX:
TRIM([CHARACTERS FROM]STRING) OR LTRIM([CHARACTERS FROM] STRING)



SELECT TRIM 'SQL TUTORIAL  ')AS TRIMMEDSTRING

SELECT DATALENGTH (LTRIM (' SQL TUTORIAL! '))REMOVESPACE,DATALENGTH (' SQL TUTORIAL! ') WITHSPACE

SELECT DATALENGTH (RTRIM (' SQL TUTORIAL! '))REMOVESPACE,DATALENGTH (' SQL TUTORIAL! ') WITHSPACE

SELECT DATALENGTH (TRIM (' SQL TUTORIAL! '))REMOVESPACE,DATALENGTH (' SQL TUTORIAL! ') WITHSPACE

SELECT *FROM PERSON.PERSON WHERE TRIM(MIDDLENAME) = 'M'
--WHILE COMPARING THE DATA AND RETURNING RESULT SET,TRIM IS USED

UPDATE [PERSON].PERSON SET MIDDLENAME = ' M' WHERE MIDDLENAME = 'M'

--REPLACE()
REPLACES ALL OCCURENCES OF A SUBSTRING WITHIN A STRING 
THE SEARCH IS CASE INSENSITIVE
SYNTAX : REPLACE(sTRING,OLD_STRING,NEW_sTRING)

SELECT REPLACE ('SQL TUTORIAL TUTORIAL','TUTORIAL','CLASSES')

SELECT REPLACE(LASTNAME,'WANKAR','JADHAV')AS REPLACEDLASTNAME,LASTNAME,FIRSTNAME,AGE FROM PERSONS

SELECT EMAILADDRESS, REPLACE(EMAILADDRESS,'@ADVENTURE-WORKS.COM','@YAHOO.COM')REPLACEDEMAIL
FROM PERSON.EMAILADDRESS

--IF WE DONOT KNOW THE DOMAIN

--SELECT EMAILADDRESS,REPLACE(EMAILADDRESS,RIGHT(EMAILADDRESS,(LEN(EMAILADDRESS)-CHARINDEX('@',EMAILADDRESS)-1)),'@GMAIL.COM')REPLACEDEMAIL
--FROM PERSON.EMAILADDRESS

--SELECT EMAILADDRESS,RIGHT(EMAILADDRESS,CHARINDEX('@',EMAILADDRESS)) FROM PERSON.EMAILADDRESS

--SUBSTRING()
EXTRACTS SOME CHARACTERS FROM A STRING

SYNTAX: SUBSTRING(STRING,START,LENGTH)
SELECT SUBSTRING(NAME,1,8),NAME FROM DEPARTMENTS 

-- WE CAN FETCH CHARACTERS IN BETWEEN AS WELL WITH SUBSTRING
-- WE CAN FETCH CHARACTERS FROM RIGHT AND LEFT WITH RIGHT() AND LEFT()

SELECT SUBSTRING('SHIVRAJ',3,3)



SELECT SUBSTRING(EMAILADDRESS,CHARINDEX('@',EMAILADDRESS),LEN(EMAILADDRESS)-CHARINDEX('@',EMAILADDRESS)+1)
FROM PERSON.EMAILADDRESS

SELECT EMAILADDRESS,REPLACE(EMAILADDRESS,
SUBSTRING(EMAILADDRESS,CHARINDEX('@',EMAILADDRESS),LEN(EMAILADDRESS)-CHARINDEX('@',EMAILADDRESS)+1),'@GMAIL.COM')REPLACEDEMAIL
FROM PERSON.EMAILADDRESS

UPDATE PERSON.EMAILADDRESS
SET EMAILADDRESS = REPLACE(EMAILADDRESS,'@ADVENTURE-WORKS.COM','@YAHOO.COM')
WHERE BUSINESSENTITYID IN (4,5,6)

SELECT *FROM PERSON.EMAILADDRESS

SELECT EMAILADDRESS,SUBSTRING(EMAILADDRESS,CHARINDEX('@',EMAILADDRESS),LEN(EMAILADDRESS)-CHARINDEX('@',EMAILADDRESS)+1)FROM PERSON.EMAILADDRESS WHERE 
BUSINESSENTITYID IN (4,5,6,7,9)

--BREAKDOWN
SELECT CHARINDEX('@',EMAILADDRESS)FROM PERSON.EMAILADDRESS 
SELECT LEN(EMAILADDRESS)-CHARINDEX('@',EMAILADDRESS) FROM PERSON.EMAILADDRESS 

SELECT SUBSTRING('ken0@adventure-works.com',5,20)

--FINDING THE POSITION OF @ BY CHARINDEX

--REPLACE CAN BE USED IN WHERE, UPDATE,DELETE

--EXTRACTING THE DOMAIN ONLY

--REPLICATE()
REPEATS A STRING A SPECIFIED NUMBR OF TIMES
SYNTAX:
REPLICATE(STRING,INTEGER)
EG: SELECT REPLICATE('SIVRAJ',2)

--STUFF()
DELETES A PART OF A STRING AND THEN INSERTS ANOTHER PART INTO A STRING STARTING A SPECIFIED POSITION

SYNTAX:
STUFF(STRING,START,LENGTH,NEW_sTRING)

STRING ----> COLUMN VALUES IN WHICH YOU WANT TO REPLACE/DELETE VALUES
START ------> STARTING POSITION IN STRING
LENGTH ------> NUMBER OF CHARACTERS TO DELETE
NEW_STRING ----> NEW VALUES TO REPLACE IN PLACE OF DELETED VALUE

SELECT STUFF('SQL TUTORIAL',13,1,' IS FUN!');
SELECT STUFF('SQL TUTORIAL!',5,8,' CLASS');


--PATINDEX()
--RETURNS THE POSITION OF A PATTERN IN A STRING
IF THE PATTERN IS NOT FOUND, WILL RETURN 0.

SYNTAX:
PATINDEX(%PATTERN%,STRING)

SELECT PATINDEX ('%SCHOOLS%','W3SCHOOLS.COM')
SELECT PATINDEX ('%S%COM%','W3SCHOOLS.COM')

% DENOTES A PATTERN AND A PART OF SYNTAX

SELECT EMAILADDRESS,PATINDEX('%YAHOO.COM%',EMAILADDRESS)FROM PERSON.EMAILADDRESS
ORDER BY BUSINESSENTITYID 

CHARINDEX-WE CAN USE ONLY ONE CHARACTER
PATINDEX - WE CAN USE PATTERN

--ALL THE DOMAINS WHERE YAHOO.COM IS NOT FOUND
SELECT *FROM PERSON.

SOUNDEX()
ACCEPTS A STRING AND CONVERTS IN TO A FOUR CHARACTER CODE BASED ON HOW THE STRING SOUNDS WHEN IT IS SPOKEN
SELECT SOUNDEX('SHIVRAJ')

DIFFERENCE()
COMPARES TWO SOUNDEX VALUES AND RETURNS AN INTEGER.
THE INTEGER VALUE INDICATES THE MATCH FOR THE TWO SOUNDEX VALUES FROM O TO 4
0 INDICATES WEAK OR NO SIMILARITY
4 INDICATES STRONG SIMILARITY
SELECT DIFFERENCE ('LENOVO','LEMON')
