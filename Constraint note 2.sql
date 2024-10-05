--Constraint is an database object.

--PRIMARY KEY
A combination of NOT NULL and UNIQUE
Uniquely identifies each row n a table
Only 1 PK per table.
Do not allow null values.

Difference between Primary key and unique key
Unique Key
1. Ensures every value is unique in column.
2. It allows a single/1 null value to insert
3. More than 1 unique key per table.


Primary Key
1. Ensures every value is unique in column.
2. It will not allow any null.(It is always not null)
3.Only 1 primary key per table.

Significance: It will not allow duplicates and null values.

While creating table ---can give system generated name and also can give our own nice name to PK so that it is easy to identify or drop the constraint.

We can create one/same constraint on multiple column.This is called Composite Primary Key.
PK that is applied on multiple column is called Composite Primary key.

SQL will see combination of two columns to be unique in case of composite primary key.
PK constraint will look for combination of two columns--
--SINGLE PRIMARY KEY ON MULTIPLE COLUMN----COMPOSITE PRIMARY KEY

EG: Employee table with employee id and employee date of birth----we can use composite primary key.

--PRIMARY KEY CONSTRAINT TO EXISTING TABLE

Drop the column
Create table without any primary key
Using ALTER command,we can add PK constraint in the column of a table.

ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME PRIMARY KEY(COLUMN_NAME)

We cannot create PK constraint in nullable  column.
We can use ALTER command to add NOT NULL constraint if the column is having NULL value.
Can use ALTER command to drop constraint.

--ANY MODIFICATION IN TABLE STRUCTURE,WE CAN USE ALTER COMMAND
--MODIFYING DATA CAN BE DONE WITH DML OR UPDATE.

SUPPOSE I WANT TO CREATE PRIMARY KEY ON MULTIPLE COLUMN??
WE CAN HAVE SINGLE PRIMARY KEY ON MULTIPLE COLUMN.

----------------------------------------------------------------------------------------------------------------------------------------------

--DEFAULT CONSTRAINT
Sets a default value for a column if no value is specified
SYNTAX: COLUMN NAME DATATYPE DEFAULT 'VALUE'
Under KEYS fokder, we see PK Constraint.
Under CONSTRAINTS folder, we see Default constraint
Can have system generated name as well as own name for default constraint.

--Default will work only when we do not supply any value.
--IF WE SUPPLY VALUE TO THE DEFAULT COLUMN,THE SUPPLIED VALUE GETS INSERTED.
--IF WE DID NOT SUPPLY ANY VALUE FOR DEFAULT COLUMN,DEFAULT VALUE GETS INSERTED.

--NO NEED TO MENTION CONSTRAINT KEYWORD IF WE ARE NOT NAMING DEFAULT CONSTRAINT.
--HAVE TO MENTION CONSTRAINT KEYWORD IF WE ARE GIVING NAME.

--FOR ALREADY EXISTING TABLE
--CREATE DEFAULT ON EXISTING TABLE COLUMN

Can use ALTER command
ALTER TABLE TABLE_NAME
--Round bracket will not work for column name

--WE CAN HAVE MULTIPLE DEFAULT CONSTRAINT ON TABLE BUT NAME SHOULD BE UNIQUE.

------------------------------------------------------------------------------------------------------------------------

--CHECK CONSTRAINT
--Ensures that the values in a column satisfies a specific condition.

eg: Hospital application----daily data for inborn child----by mistake date canbe inserted as 2025 instead of 2024, we can have check for column as year should be equal to current date,

Constraint ensures that correct data is inserted into table.

Check constraint is used to limit the value range that can be inserted into the column.
Eg: employee table ---- we want to insert salary ---- there should be certain range

When we define check on a column, it will allow only certain range of values to insert.

ADD COLUMN OR CONSTRAINT TO EXISTING TABLE, WE HAVE TO USE ALTER COMMAND.

--WE CAN ADD MULTIPLE CONDITIONS ON CHECK CONSTRAINT.IT WILL CHECK BOTH CONDITIONS IF WE MENTION AND & ONLY ONE CONDITION IF SATISFIED OR.
--WE CAN USE IN,BETWEEN,AND,OR OPERATOR WITH CHECK
--BETWEEN WE CAN USE WITH NUMBERS ONLY

--WHENEVER WE WILL NOT PROVIDE ANY NAME TO CONSTRAINT, WE WILL GET SYSTEM GENERATED CONSTRAINT NAME

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3) PRIMARY KEY

DROP TABLE IF EXISTS COLLEGES

/*BELOW SYNTAX WILL GENERATE SYSTEM NAME TO PRIMARY KEY CONSTRAINT*/

CREATE TABLE COLLEGES(
COLLEGE_ID INT PRIMARY KEY,
COLLEGE_CODE VARCHAR(20),
COLLEGE_NAME VARCHAR(50)
);


DROP TABLE IF EXISTS COLLEGES

CREATE TABLE COLLEGES(
COLLEGE_ID INT ,
COLLEGE_CODE VARCHAR(20),
COLLEGE_NAME VARCHAR(50)
);

INSERT INTO COLLEGES (COLLEGE_ID,COLLEGE_CODE,COLLEGE_NAME)
VALUES
(1,'SAVT12','ORCHID COLLEGE'),
(2,'FEADS54','SVERI''S INSTITUTE'),
(3,'SAVT12','ORCHID COLLEGE'),
(4,'FEADS54','SVERI''S INSTITUTE')

INSERT INTO COLLEGES(COLLEGE_ID,COLLEGE_CODE,COLLEGE_NAME)
VALUES
(NULL,'SAVT12','ORCHID COLLEGE')
--Cannot insert the value NULL into column 'COLLEGE_ID', table 'Zorba_1024.dbo.COLLEGES'; column does not allow nulls. INSERT fails.

INSERT INTO COLLEGES(COLLEGE_ID,COLLEGE_NAME)
VALUES
(5,'ORCHID COLLEGE')
SELECT *FROM COLLEGES

--ADD PRIMARY KEY CONSTRAINT TO EXISTING TABLE

ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME PRIMARY KEY (COLUMN_NAME)

ALTER TABLE COLLEGES
ADD CONSTRAINT PK_COLLEGES_COLLEGE_CODE PRIMARY KEY(COLLEGE_CODE)
--Cannot define PRIMARY KEY constraint on nullable column in table 'COLLEGES'.

ALTER TABLE COLLEGES ALTER COLUMN COLLEGE_CODE VARCHAR(20) NOT NULL
ALTER TABLE Colleges ALTER COLUMN college_code VARCHAR(20) NOT NULL

ALTER TABLE COLLEGES ADD CONSTRAINT PK_COLLEGES_CLGID PRIMARY KEY(COLLEGE_ID) 

/*BELOW COMMAND WILL GIVE A NICE NAME TO PRIMARY KEY*/

DROP TABLE IF EXISTS COLLEGES
CREATE TABLE COLLEGES(
COLLEGE_ID INT,
COLLEGE_CODE VARCHAR(20),
COLLEGE_NAME VARCHAR(50),
CONSTRAINT PK_COLLEGES_CLGID PRIMARY KEY (COLLEGE_ID,COLLEGE_CODE)
)

--We can create one/same constraint on multiple column.This is called Composite Primary Key.
--PK that is applied on multiple column is called Composite Primary key.

SELECT *FROM COLLEGES

--ADD PRIMARY KEY CONSTRAINT TO EXISTING TABLE

ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME PRIMARY KEY(COLUMN_NAME)

--We cannot create PK constraint in nullable  column.
--We can use ALTER command to add NOT NULL constraint if the column is having NULL value.

ALTER TABLE COLLEGES DROP CONSTRAINT PK_COLLEGES_CLGID

ALTER TABLE COLLEGES ADD CONSTRAINT PK_COLLEGES_COLLEGE_CODE PRIMARY KEY(COLLEGE_CODE)

ALTER TABLE COLLEGES DROP COLUMN COLLEGE_ID

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

4) DEFAULT CONSTRAINT
Sets a default value for a column if no value is specified

DROP TABLE IF EXISTS COLLEGES

/*BELOW SYNTAX WILL GENERATE SYSTEM NAME TO DEFAULT KEY CONSTRAINT*/
CREATE TABLE COLLEGES
(
COLLEGE_ID INT PRIMARY KEY,
COLLEGE_CODE VARCHAR(20),
COLLEGE_COUNTRY VARCHAR(20) DEFAULT 'NEPAL'
)

--[DF__COLLEGES__COLLEG__5FB337D6]

/*BELOW SYNTAX WILL GENERATE CUSTOM NAME TO DEFAULT KEY CONSTRAINT*/

DROP TABLE IF EXISTS COLLEGES
CREATE TABLE COLLEGES
(
COLLEGE_ID INT PRIMARY KEY,
COLLEGE_CODE VARCHAR(20),
COLLEGE_COUNTRY VARCHAR(20)
CONSTRAINT DF_COLLEGES_CLGCNTRY DEFAULT('INDIA')
)

--WE CAN SEE THE NAME OF DEFAULT CONSTRAINT UNDER CONSTRAINTS SECTION IN OBJECT EXPLORER.

INSERT INTO COLLEGES (COLLEGE_ID,COLLEGE_CODE,COLLEGE_COUNTRY)
VALUES
(1,'SAVT12','USA'),
(2,'FEADS54','USA')

SELECT *FROM COLLEGES

INSERT INTO COLLEGES (COLLEGE_ID,COLLEGE_CODE)VALUES
(3,'SUKP10'),
(4,'SVIT')

--IF WE SUPPLY VALUE TO THE DEFAULT COLUMN,THE SUPPLIED VALUE GETS INSERTED.
--IF WE DID NOT SUPPLY ANY VALUE FOR DEFAULT COLUMN,DEFAULT VALUE GETS INSERTED.

--NO NEED TO MENTION CONSTRAINT KEYWORD IF WE ARE NOT NAMING DEFAULT CONSTRAINT.
--HAVE TO MENTION CONSTRAINT KEYWORD IF WE ARE GIVING NAME.

--CREATE DEFAULT CONSTRAINT ON EXISTING TABLE/COLUMN

ALTER TABLE TABLE_NAME
ADD CONSTRAINT CONSTRAINT_NAME DEFAULT('DEFAULT VALUE')FOR [COLUMN NAME]

ALTER TABLE COLLEGES
ADD CONSTRAINT DF_COLLEGES_CLGCODE DEFAULT('ABC')FOR COLLEGE_CODE