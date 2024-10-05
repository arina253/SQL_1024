--SQL CONSTRAINTS
--Rules to limit the type of data to be inserted in a table

/*1) NOT NULL:
Must have some value for column.
If we do not define any constraint in column of a table, it means we can insert null values in a column.
Null column can insert null values.
Irrespective of data type, column specified as NOT NULL will not accept null values.
Can have empty value but not null values in case of column specified as NOT NULL
Empty value converted to 0 in case of integer.
Empty value is not converted to 0 in case of varchar
We can use ALTER command to insert null constraint only when the column does not contain null values.
Truncate table ,delete all data in case of null values.
Equals to sign will not work for NULL , IS NULL will work for equals 
'NULL' - work as value.
NULL is by default.

2) UNIQUE :
Ensures all values in a column are different.
More than one UK per table.
Can accept only one null
Sequence of writing constraint: NOT NULL (first) UNIQUE (second)

where do we see unique constraint?
Under Keys section, we can see UC/UK.
Right click ---- Script constraint as ----- CREATE TO ----NEW QUERY WINDOW.
SQL will gikve by default name to constraint

If we want to create unique key on already existing table ,we can use ALTER command.
ALTER TABLE TABLE_NAME ADD CONSTRAINT CONSTRAINT_NAME UNIQUE(column name)
eg: ALTER TABLE COLLEGES ADD CONSTRAINT UQ_COLLEGES_COLLEGE_NAME UNIQUE(COLLEGE_NAME)-----for giving meaningful constraint name

abbreviation of constraint_tablename_columnname - BEST WAY TO GIVE NAME OF CONSTRAINT

uq_Colleges_college_name
--fk_uq_pk_ck_df

--NOT NULL WILL NOT HAVE NAME
--UNIQUE CONSTRAINT WILL HAVE NAME

--We can drop constraint if we do not want constraint.

--Constraint is a part of structure of table, we use drop command to drop constraint.If we know the name of constraint, it will be easy.
--Using ALTER command,we can give name to the constraint

While creating table, if we want to give our constaint name, we can write constraint uq_colleges_clgid(college_id) at the end of the last column of a table.

---------------------------------------------------------------------------------------------------------------------------

NOT NULL - Ensures that a column cannot have a NULL value --> '', NULL
• UNIQUE - Ensures that all values in a column are different 
(more than one UK per table, can accept only one null)
• PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
(only 1 PK per table)
• FOREIGN KEY - Prevents actions that would destroy links between tables
• CHECK - Ensures that the values in a column satisfies a specific condition
• DEFAULT - Sets a default value for a column if no value is specified

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE COLLEGES
(
COLLEGE_ID INT NOT NULL,
COLLEGE_CODE VARCHAR(20) NULL,
COLLEGE_NAME VARCHAR(50) NULL
);


INSERT INTO COLLEGES (COLLEGE_ID,COLLEGE_CODE,COLLEGE_NAME)
VALUES
(1,'SAVT12','ORCHID COLLEGE'),
(2,'FEADS54','SVERI''S INSTITUTE')

SELECT *FROM COLLEGES

INSERT INTO COLLEGES (COLLEGE_ID,COLLEGE_CODE,COLLEGE_NAME)
VALUES
(NULL,'GGSDE','MIT INSTITUTE')
--Cannot insert the value NULL into column 'COLLEGE_ID', table 'Zorba_1024.dbo.COLLEGES'; column does not allow nulls. INSERT fails.

INSERT INTO COLLEGES VALUES (3,'BIYN01','')
INSERT INTO COLLEGES VALUES (4,'LTIN11','')
--Empty value is not converted to 0 in case of varchar

INSERT INTO COLLEGES VALUES('','GGSDE','MIT INSTITUTE')
--Empty value is converted to 0 in case of int datatype.

INSERT INTO COLLEGES VALUES (5,'','MIT INSTITUTE')
INSERT INTO COLLEGES (COLLEGE_ID,COLLEGE_NAME)VALUES (6,'BIGCE INSTITUTE')

-- TO ADD CONSTRAINT IN A COLUMN

ALTER TABLE COLLEGES ALTER COLUMN COLLEGE_CODE VARCHAR(20) NOT NULL
--Cannot insert the value NULL into column 'COLLEGE_CODE', table 'Zorba_1024.dbo.COLLEGES'; column does not allow nulls. UPDATE fails.
--We can use ALTER command to insert null constraint only when the column does not contain null values.

ALTER TABLE COLLEGES ALTER COLUMN COLLEGE_NAME VARCHAR(20) NOT NULL

--TRUNCATE TABLE ----> OR UPDATE NULL ---->

UPDATE COLLEGES
SET COLLEGE_NAME =' '
WHERE COLLEGE_CODE IS NOT NULL

SELECT *FROM COLLEGES

TRUNCATE TABLE COLLEGES
( to remove null values)

ALTER TABLE COLLEGES ALTER COLUMN COLLEGE_CODE VARCHAR(20) NOT NULL

--DROP TABLE IF EXIST COLLEGES

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2) UNIQUE KEY

DROP TABLE IF EXISTS COLLEGES
CREATE TABLE COLLEGES
(
COLLEGE_ID INT NOT NULL,
COLLEGE_CODE VARCHAR(20),
COLLEGE_NAME VARCHAR(50),
CONSTRAINT UQ_COLLEGES_CLGID UNIQUE(COLLEGE_ID),
CONSTRAINT UQ_COLLEGES_COLLEGE_CODE UNIQUE(COLLEGE_CODE)
)

SELECT *FROM COLLEGES

ALTER TABLE COLLEGES ALTER COLUMN COLLEGE_ID INT