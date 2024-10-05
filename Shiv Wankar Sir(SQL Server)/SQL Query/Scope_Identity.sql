--FOR GETTING THE LAST GENERATED IDENTITY

SELECT SCOPE_IDENTITY() SHOW LAST GENERATED IDENTITY 
SELECT @@IDENTITY
SELECT IDENT_CURRENT('STUDENTDATA')

SELECT MAX(ID) FROM TABLE

------------------------------------------------------------------------------------------------------------------------------------------

--CLASS NOTE

How to get the last generated identity column value in SQL Server - Part 8
From the previous session, we understood that identity column values are auto generated. There are several ways in sql server, to retrieve the last identity value that is generated. The most common way is to use SCOPE_IDENTITY() built in function.

Apart, from using SCOPE_IDENTITY(), you also have @@IDENTITY and IDENT_CURRENT('TableName') function.

Example queries for getting the last generated identity value
Select SCOPE_IDENTITY()
Select @@IDENTITY
Select IDENT_CURRENT('tblPerson')

Let's now understand the difference between, these 3 approaches.


SCOPE_IDENTITY() returns the last identity value that is created in the same session (Connection) and in the same scope (in the same Stored procedure, function, trigger). 
Let's say, I have 2 tables tblPerson1 and tblPerson2, and I have a trigger on tblPerson1 table, which will insert a record into tblPerson2 table. Now, when you insert a record into tblPerson1 table,  SCOPE_IDENTITY() returns the idetentity value that is generated in tblPerson1 table, where as @@IDENTITY returns, the value that is generated in tblPerson2 table. 

So, @@IDENTITY returns the last identity value that is created in the same session without any consideration to the scope. 
IDENT_CURRENT('tblPerson') returns the last identity value created for a specific table across any session and any scope.

In brief:
SCOPE_IDENTITY() - returns the last identity value that is created in the same session and in the same scope.
@@IDENTITY - returns the last identity value that is created in the same session and across any scope.
IDENT_CURRENT('TableName') - returns the last identity value that is created for a specific table across any session and any scope.

Create a procedure to insert the data into 4 tables, CMC_CLCL table will have claims level data where CLCL_ID is primary key along with other columns like CLCL_TOT_CHG, CLCL_SUB_TYPE. CMC_CDML table will have line level data for the claims where CLCL_ID and CDML_SEQ is composite primary key. We need to generate sequential number for CDML_SEQ for each new line against CLCL_ID which is referring CLCL_ID from CMC_CLCL table. Third table is CMC_CLPR, this is also line level table in which CLCL_ID and CLPR_TYPE is composite primary key. Create a stored procedure in sql server to load all this 3 tables where CLCL_ID is common for all the tables