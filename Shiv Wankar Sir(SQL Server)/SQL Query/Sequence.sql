Using sequence, we can generate new integer value.
User defined schema bound object that generates a sequence of numeric values according to a set of rules.
Used primarily for generating unique numbers.

Sequence once created, it can be used within stored procedure.
Identity should be created in each and every table

Features of Sequence
Independent of Tables
We can use the same sequence across multiple tables or in differen parts of your database
We are using sequence to generate last 7 digits in claims processing
Customizable : can define the starting value,increment,maximum and minimum values, and whether the sequence should cycle

CREATE SEQUENCE schema_name.sequence_name
AS integer type
START WITH start_value
INCREMENT BY increment_value
MINVALUE min_value
MAXVALUE max_value
CYCLE - restart after reaching the maximum limit

--To find all the sequence in the database using system table
SELECT *FROM sys.sequences

--surrogate keys are generated using sequences
--sequences have business value

we cannot see anything about cache.
cache memory to see last generated memory
we can define cycle during creation of sequence itself
-----------------------------------------------------------------------------------------------------------------

--CLASS NOTES

-- Sequence in SQL Server
A Sequence in SQL Server is a user-defined, schema-bound object that generates a sequence of numeric values according to a set of rules.
It is used primarily for generating unique numbers

-- Key Features of Sequences
Independent of Tables: Unlike identity columns, sequences are not tied to a specific table. 
You can use the same sequence across multiple tables or in different parts of your database.

Customizable: You can define the starting value, increment, maximum, and minimum values, 
and whether the sequence should cycle (restart after reaching the maximum or minimum value).

-- syntax
CREATE SEQUENCE schema_name.sequence_name  
AS integer_type 
START WITH start_value
INCREMENT BY increment_value 
MINVALUE min_value 
MAXVALUE max_value ;
CYCLE

Parameters used:

sequence_name – Define a name for the sequence which is unique in the database.
AS integer_type – Use any integer type for the sequence for example; TINYINT, INT, or DECIMAL. By default, the sequence uses BIGINT.
START WITH start_value – Define the first value that the sequence.
INCREMENT BY increment_value – Define the increment_value of the sequence object to call the NEXT VALUE FOR function, the increment_value cannot be zero.
MINVALUE min_value – Define the lower value for the sequence.
MAXVALUE max_value – Define the upper value for the sequence.
CYLCE - restart after reaching the maximum or minimum value from initial

-- TO FIND ALL SEQUENCE IN THE DATABASE USING SYSTEM TABLE -- 
SELECT * FROM sys.sequences; 

SELECT NEXT VALUE FOR SEQEUNCE_NAME

ALTER SEQUENCE CLCL_ID_SEQ RESTART WITH 1;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Using user defined table type:
we can pass a Table-Valued Parameter to send multiple rows of data to a stored procedure or a function without creating a temporary table or passing so many parameters.

-- Limitation of Table Valued Parameter
Table-valued Parameters can’t be used in user-defined functions.
Table Valued Parameters are ReadOnly in nature, so we can't update, insert, and delete data into the Table Value Parameter.
We cannot use ALTER TABLE statements to modify the design of table-valued parameters. The only single way to change the table definition is to drop the type first and recreate the table type again.
Table Valued Parameter can’t used as an OUTPUT parameter in stored procedures.