

--Create database
--CREATE database Zorba_1024

--Data types: what type of values we are going to save in this column.

int: store only numeric values without decimal.
eg: 12 = 12 (ok)
12.5 = 12
'ABC' = Error
12/06/1987 = Error

Decimal(total number of digit,after decimal) - it store decimal values
eg : 12 = 12.0
12.5 = 12.5
'abc' = error
12/06/1987 = error
DECIMAL (5,2)
Total digit = 5
after decimal = 2
before decimal = 3
123.34
123.4 = 123.40
12.34
12.3 = 12.30
12 = 12.00
1234.2 = not allowed

Money = DECIMAL (10,2)

date : store only date (system date format)
12/06/1987
12Jun1987
12061987 : it's not  allowed
'TwelveJunenintygightyseven' : not allowed

CHAR : store everything which is in keyboard.
Store value within a  single quote.
is always fixed size.
'12'
'12.34'
'12Jun1987'
'ABC'
CHAR(no. of character)
CHAR(5) - Upto 5 characters it is fine but not above 5
'India' - allowed
'In' - allowed
'United' = Not allowed
'12'
'123'
'$12'
'$12345' = Not allowed

== equal
= : assign a value

--Value with blue color are known by the computer
'bharat' = allowed = ???? -------through keyboard we cannot write bharat but with SQL Server, we can
'In' = never release unused memory with CHAR datatype.---- 3 characters are wasted
Memory is totally responsible for processing.Never release unused memory.

varchar(no. of character) - variable character
varchar(5) - Upto 5 characters it is fine but not above 5
'India' - allowed
'In' - allowed
'United' = Not allowed
'12'
'123'
'$12'
'$12345' = Not allowed
'bharat' = allowed = ????
'In' Non fixed size - even though declared fixed size,computer release unused memory for further operation.

Outside the limit condition is called Overflow-----need five characters but we pass 6 characters.
Under flow -need five characters but we pass only 2 characters

ONLY DIFFERENCE IS : CHAR IS FIXED IN SIZE BUT VARCHAR IS NOT.

nvarchar(no. of character)
Allow non English language.
'India' - allowed
'In' - allowed
'United' = Not allowed
'12'
'123'
'$12'
'$12345' = Not allowed
'bharat' = allowed = ????
'In' Non fixed size 

Boolean : TRUE/FALSE

SELECT GETDATE() ----server current date

pink color - predefined function comes with two brackets ()
red color - predefined command

TABLE defines columns, which value we are going to store.

In SQL Server we can create multiple database.
Always choose correct database for performing any operation/create table in database.

--Prototype for creating table
CREATE TABLE <Tablename>
(
<column name> <data type>,
<column name> <data type>,
<column name> <data type>,
<column name> <data type>,

)

CREATE TABLE STUDENT 
(
ROLLNO INT,
NAME VARCHAR(100),
CLASS CHAR(10),
ADDRESS VARCHAR(15),
PHONE VARCHAR (15),
PARENT_NAME NVARCHAR (100),
DOB DATE,
GENDER CHAR(1),
MARKS DECIMAL(5,2),
)

--SQL Server is not case sensitive.

SQL Server doesn't allow space between column name.
If your column name have space between
1. remove space --- commonly used
2. in place of space add any other eg _ (underscore)
3. put column name inside []

blue color - predefined value in computer science

ROW - means value , we cannot define/fix it and it is given by the user
Column - defines table structure

for showing table values
SELECT * FROM STUDENT


