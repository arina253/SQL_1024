DATATYPE has to be defined on columns of the tables
Datatype will tell you about what type of data a table - column can hold
What type of data can be insered into the table.

SQL COMMANDS
1.DDL - Create,Drop, Alter,Truncate - Related to  structure of database objects (Create/Alter/Drop/Truncate)
2.DML - Insert,Update,Delete
3.DCL - Grant,Revoke
4.TCL - Commit,Rollback, Savepoint
5. DQL- Select

Database Objects: Tables, Views, Stored Procedures, Functions

DDL - This has nothing to do with the data inside the object.

Query Editor Window.
Execute all if run without selecting a particular query.
Right click on Database and Refresh if we arenot able to see created table.
The replica of  model db will be created when creating new object.

When executing query,
Select correct database.
See under db table option and all tables will be present here.

In object explorer, we can create table in graphical way.
Go inside the database ------ Right click on table in database--------Select New -------------- Select Table ------------- Design Window
To save database, when we will do right click, option named as Save Table…..give table name and click Ok.
We will expand db and see table name
If we want to create syntax, right click on table name ------ Design ------make a change  in modification window and save it.


-- To see line numbers
Tools ---- Options ---Text Editor ----- All Languages ----- Click on line numbers ----- Select OK

--CREATE DATABASE SQL_SAMPLE

--CREATE TABLE WITH NAME TBLGENDER WITH ID AND GENDER COLUMNS

CREATE TABLE TBLGENDER
(
ID INT,
GENDER CHAR(2)
)

--When database is in use, we cannot rename the table name
--In real world, no one is creating a new database.
-- Database are used things, created by DBAdministrator.
-- For table/object created, we need database.
-- There might be different servers.
-- Know the type of server and database before creating any object in the database.

-- To see the structure of table:
-- To create new table in any database.

--ALTER - Used to modify the object structure/table structure.
--ADD NEW COLUMN, REMOVE EXISTING COLUMN, MODIFY THE DATATYPE OF EXISTING COLUMN

GENERAL SYNTAX
ALTER TABLE TABLE_NAME ADD COLUMN_NAME DATATYPE ----> ADDING NEW COLUMN
ALTER TABLE TABLE_NAME ALTER COLUMN COLUMN_NAME NEW_DATATYPE ----> MODIFYING DATATYPE OF COLUMN
ALTER TABLE TABLE_NAME DROP COLUMN COLUMN_NAME ------DROP COLUMN FROM TABLE

--ALTER IS NOT USED FOR DROPPING ANY ROWS IN A TABLE/ DATASET.

ALTER PROCEDURE
ALTER VIEW

SYNTAX - a format of query.
eg: CREATE TABLE SYNTAX/QUERY.

--For identity column, we have integer datatype.

exec sp_rename 
Renaming db objects in sql server can be done with the help of sp_rename


