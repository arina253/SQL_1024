Source
M
F
1
0

CHECK (GENDER IN ('M','F')

Conditional Split
Match Gender='M' || Gender = 'F'...............all data we can insert in to sql
No Match - all values other than these -----convert to flat file and send back to correction
Destination
M
F


Source
M
F
1
0
Male
Female
True
False

Destination accept only M or F

Rule 1 : If M and F then insert
Rule 1: If 1 then M, 0 then F,after insert
Rule 3: Pick first character and then insert
Rule 4: If true then M,false then F

Destination
M
F
M
F
M
F
M
F

Derived Column : LEFT(Gender,1)
M
F
1
0
M
F
T
F

Conditional Split
Case 1 : Value IN ('M','F')
M
F
M
F
F - False (in Rule No.4,if false then F

Use OLEDB Destination and insert records into table

Default
1
0
T

Derived column for only default output

Derived column
if 1 & T then M else F
M
F
M
Use OLEDB Destination and insert records into table


Rule 1 : if M and F then insert 
Rule 2 : if 1 then M , 0 then F ,after insert 
Rule 3 : pick first character and then insert 
RUle 4 : if true then M , false then F

----------------------------------------------------------------------

IMPLEMENT SCD WITH MERGE

SELECT 'M' AS GENDER
UNION ALL
SELECT 'F'
UNION ALL
SELECT '1'
UNION ALL
SELECT '0'
UNION ALL
SELECT 'Male'
UNION ALL
SELECT 'Female'
UNION ALL
SELECT 'True'
UNION ALL
SELECT 'False'

CREATE TABLE GENDERSSIS
(
GENDER CHAR(1)
)

DROP  TABLE GENDERSSIS

SELECT *FROM GENDERSSIS
TRUNCATE TABLE GENDERSSIS

----------------------------------------------------------------------------------------------------------------------------

TASK: EXECUTE SQL TASK



SELECT *FROM TESTEXECUTESQLTASK

--DELETE FROM TESTEXECUTESQLTASK
--TRUNCATE TABLE TESTEXECUTESQLTASK