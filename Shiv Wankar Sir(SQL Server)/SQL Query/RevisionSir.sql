

SQL COMMANDS -->

1. DDL (Data Definition Language)
2. DML (Data Manupulation Language)
3. DCL (Data Control Language)
4. DQL (Data Query Language)
5. TCL (Transaction Control Language)

SQL command are used to intereact with the database.

1. DDL (Data Definition Language)		--> CREATE, ALTER, DROP, TRUNCATE --> Structure of an Object (Table/Database/View/Stored Procedure)
2. DML (Data Manupulation Language)		--> INSERT, UPDATE, DELETE		  --> DML's are related to Data inside the table (manipulation) 
3. DCL (Data Control Language)			--> GRANT,REVOKE				  --> This are related to permission on objects
4. DQL (Data Query Language)			--> SELECT --> (FUNCTIONS/WHERE/GROUPBY ORDER BY)-- FETCH DATA FROM THE DB TABLE
5. TCL (Transaction Control Language)	--> COMMIT, ROLLBACK, SAVEPOINT

/* DATA TYPE */

STRING DATATYPE		--> CHAR(N)/VARCHAR(N)/NVARCHAR(N)/TEXT
NUMERIC DATATYPE    --> SMALLINT/INT/BIGINT/BIT/DECIMAL/NUMERIC/MONEY
DATE DATATYPE       --> DATE/SMALLDATE/DATETIME/DATETIME2

/* SQL Constraints */
This are used to specify the differenct rules for data in the table / Limit the type of data being inserted

NOT NULL	--> We can not insert null values in a column (It does not accepts null)
UNIQUE      --> It ensures every value in a column is unique (It accepts one NULL value)
PRIMARY KEY --> It is combination of Not NUll and Unique (Every value should be unique and not null)
FOREGIN KEY --> Link/relationship between two tables... (It will prevent the actions that will detroy link between the table) 
CHECK       --> It ensures the values in a column satisfies a specific condition
DEFAULT     --> It sets a default value for a column if no value specified

/* Identity Column or SQL AUTO INCREMENT Field */
This is an auto increment field (It will generate an incremental value for the column)
we can define starting value and the interval
IDENTITY(s,i)
s-- starting value
i-- interval 
Mostaly primary key but it is not necessary to have primary key
--> We can not supply the values manually
--> IDENTITY_INSERT ON

whenever we deleted all records..
delete will not reset identity value
truncate will reset idenity value


SELECT CHARINDEX('V','Shivraj')
CONCAT--> IT IS USED TO COMBINE TW OR MORE STRINGS TOGETHERE
USING + SIGN
USING CONCAT KEYWORD
SELECT 'SHIVRAJ'+ ' ' +'WANKAR' 
SELECT CONCAT('SHIVRAJ',' ','TUKARAM',' ','WANKAR') AS FULL_NAME

SELECT CHARINDEX('V','Shivraj')

SELECT DATALENGTH('  SHIVRAJ   ')
SELECT LEN('   SHIVRAJ   ')

SELECT LEFT('Shivraj',4)
SELECT RIGHT('Shivraj',4)

SELECT SUBSTRING('Shivraj',3,3)

SELECT PATINDEX('%schools%', 'W3Schools.com');
SELECT PATINDEX('%s%com%', 'W3Schools.com')


SELECT CHARINDEX('A', 'W3Schols.com');
SELECT PATINDEX('%schools%', 'W3Schols.com');

SELECT AVG(WEIGHT) FROM Production.Product
SELECT SUM(WEIGHT) FROM Production.Product
SELECT MAX(WEIGHT) FROM Production.Product
SELECT MIN(WEIGHT) FROM Production.Product
SELECT COUNT(WEIGHT) FROM Production.Product

CREATE StudentData table with columns (Id,StName, DOB, City, JoiningDate )

SELECT JoiningDate, COUNT(Id) TotalCount FROM StudentData
GROUP BY JoiningDate
HAVING COUNT(Id) > 2

SELECT EmailAddress FROM Person.EmailAddress
SELECT REPLACE(EmailAddress,'@adventure','@gmail') NewEmailDomain, EmailAddress FROM Person.EmailAddress

SELECT STUFF('SQL Tutorial!', 4, 0, ' is fun!');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------




CHARINDEX - indexing the position of character in a string
SELECT CHARINDEX('V','Shivaraj')   --4

CONCAT ----> TO COMBINE TWO OR MORE STRINGS TOGETHER
USING +SIGN
USING CONCAT KEYWORD

SELECT 'SHIVRAJ' +  ' '  +  'WANKAR'
SELECT CONCAT('SHIVRAJ', ' ', 'WANKAR')AS FULL_NAME

SELECT 'SHIVRAJ' +  ' '  +  NULL

--WHEN WE DO ANY OPERATION WITH NULL,WE GET NULL
SELECT (REORDERPOINT * SIZE)MULTIPLIEDQTY, *FROM PRODUCTION.PRODUCT

DATALENGTH 
SELECT DATALENGTH('SHIVRAJ     ')   --12
SELECT LEN('SHIVRAJ   ')--7.....DO NOT COUNT THE TRAILING SPACE

SELECT LEFT('SHIVRAJ',4) -----SHIV
SELECT RIGHT('SHIVRAJ',4)-----VRAJ

SELECT SUBSTRING('SHIVRAJ',3,3)-----IVR
arguments--3 expression,starting position of search, length we want to extract

--PATINDEX SIMILAR TO CHARINDEX BUT IN PATINDEX, WE CAN SEARCH FOR A POSITION OF PATTERN IN A STRING
SELECT PATINDEX('%SCHOOLS%','W3SCHOOLS.COM')  -- 3
RETURN THE STARTING POSITION OF PATTERN.
SELECT CHARNDEX('%SCHOOLS%','W3SCHOOLS.COM')

CHARINDEX RETURNS THE POSITION OF FIRST CHARACTER THOUGH WE CAN USE FOR MULTIPLE CHARACTERS AND USED WITH %.
PATINDEX USED FOR ENTIRE PATTERN BUT RETURNS THE POSITION OF FIRST CHARACTER.

SELECT REPLACE(EMAILADDRESS,'@ADVENTURE-WORKS.COM','@GMAIL.COM')NEWEMAILDOMAIN,EMAILADDRESS FROM PERSON.EMAILADDRESS 

STUFF () - WE NEED TO PASS THE STARTING LENGTH 
STUFF() &  REPLACE() ARE DOING SAME FUNCTION.

IN REPLACE() WE HAVE TO REPLACE THE VALUE WHICH IS PROVIDED
BUT IN STUFF() WE CAN ADD NEW STRING AT A SPECIFIED POSITION BY GIVING START POSITION AND LENGTH
REPLACE() WILL REPLACE THE EXISTING THE VALUE ONLY.

SELECT STUFF('SQL TUTORIAL',4,5,'IS FUN!')
SELECT STUFF('SQL TUTORIAL',4,0,'IS FUN!')

---------------------------------------------------------------------------

--MATH/NUMERIC FUNCTIONS/AGGREGATE FUNCTIONS

AVG,SUM,MAX,MIN,COUNT
--ALL NUMERIC FUNCTIONS WORK ON A SET OF DATA AND PROVIDE A SINGLE OUTPUT.
--COUNT WILL IGNORE NULL VALUES
-- IF THERE IS ANY NULL VALUES IN SUM, IT WILL IGNORE NULL

SELECT AVG(WEIGHT) FROM PRODUCTION.PRODUCT
SELECT SUM(WEIGHT) FROM PRODUCTION.PRODUCT
SELECT MAX(WEIGHT) FROM PRODUCTION.PRODUCT
SELECT MIN(WEIGHT) FROM PRODUCTION.PRODUCT

--AVG,SUM,MAX,MIN IGNORE NULL VALUES
SELECT COUNT(1) FROM PRODUCTION.PRODUCT
SELECT COUNT(WEIGHT) FROM PRODUCTION.PRODUCT

--------------------------------------------------------------------------------------------------------------------------------

--DATE FUNCTIONS

DATEADD() - WE CAN SEE PAST DATE(-) OR FUTURE DATE(+)
DATEDIFF() -TO FIND AGE
DAY,MONTH,YEAR CAN BE USED IN WHERE CLAUSE.

QUES. 5) DISPLAY COUNT AND JOINING DATE OF ALL STUDENTS WHERE COUNT FOR A DAY IS MORE THAN 2
SELECT JOININGDATE,COUNT(ID)TOTALCOUNT FROM STUDENTDATA 
GROUP BY JOINING DATE
HAVING COUNT(ID)>2 
--WHERE CANNOT BE USED WITH AGGREGATE FUNCTIONS.

----------------------------------------------------------------------

--GROUP BY CLAUSE
MOSTLY USED WITH AGGREGATE FUNCTIONS

HAVING WILL ALWAYS BE AFTER THE GROUP BY CLAUSE AND WHERE WILL BE BEFORE THE GROUP BY CLAUSE.


