
--SQL Injection
an type of security concern.
occurs when attacker is able to do manipulation insert,update in our database 
they are able to query our database using some inputs passed to the application.
as a business rule, we need to pass some thing , input parameters to pass from user.
SP commonly used nowadays
--Some queries giving direct access to the application without direct authentication

--using some suspicious query as an input parameter

We can use dynamic sql within the query.
We can avoid dynamic sql for authentication purpose.

SQL Collation:
Refers to a set or rules how data is sorted and compared in a SQL Server database
We can restrict case sensitivity
Related to the case sensitivityMostly used for reading case sensitivity data.
Supports character set

We can create entire databasae by setting collation 
Default collation - case insensitive
We can decide/set collation case sensitivity on database level or column level as well.

SELECT 'A' = 'a' COLLATE Latin1_General_BIN

--TESTING METHODS
BLACK BOX TESTING -common type of testing
testing the functionality of the sql queries,stored procedures,triggers and other dab components without knowledge of the internal code structure.
focuses on providing input and validating the output.
Testers will not have any access to the database, they are able to see data only after execution.
Data preparation called test case.
eg: procedure for service date validation - he will create different test case like sample data to sql server
just evaluate the functionality irrespective of the internal code structure
Tester will look for all possible scenarios

WHITE BOX TESTING
Testing the internal workings of the SQL code.
Due to the tight timeline, people are following black box testing most of the time.

Automation is included in black box testing

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CROSS APPLY AND OUTER APPLY
for joining two tables or functions

Not access to a table.
Use user defined function
if function is having some parameter and we are joining, we need to use Cross apply
We cannot join functions directly with some parameters

Outer Apply will work as left outer join.
Cross Apply will work as inner join

Whenever we need to join table with inline table valued function or some query as a result set,we use apply

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

EXEC sp_configure 'show advanced options', 1; RECONFIGURE; EXEC sp_configure 'Agent XPs', 1; RECONFIGURE;