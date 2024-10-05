Ranking or Window Functions in SQL Server:

Functions 
Description 
Row_Number() 
It will assign the sequential number to each unique record present in a partition. 
Rank()
It will assign the rank number to each record present in a partition. 
Dense_Ranke() 
 It will assign the number to each record within a partition without skipping the numbers. 
NTILE
This will assign the number to each record present in a partition. 
Lag and Lead 
It can often be useful to compare rows to preceding or following rows,

The syntax of the ROW_NUMBER Function is: 
SELECT ROW_NUMBER() OVER (PARTITION_BY_Clause ORDER_BY_Clause) FROM [Source]

ROW_NUMBER functions without Partition_By clause: 
SELECT Studentname, Subject, Marks, ROW_NUMBER() OVER(ORDER BY Marks) RowNumber 
FROM ExamResult; 


ROW_NUMBER functions with Partition_By clause: 
SELECT STUDENTNAMAE,SUBJECT,MARKS,ROW_NUMBER()OVER(PARTITION BY STUDENTNAME ORDER BY MARKS)ROWNUMBER FROM EXAMRESULT

When we use partition by, SQL will give sequential rank to each row in partition. 

RANK() SQL RANK Function 
Syntax: 
SELECT RANK() OVER (PARTITION_BY_Clause ORDER_BY_Clause) FROM [Source] 

RANK functions without Partition_By clause: 
SELECT Studentname, Subject, Marks, RANK() OVER(ORDER BY Marks) Rank FROM ExamResult; 

RANK functions with Partition_By clause: 
SELECT Studentname, Subject, Marks, RANK() OVER(PARTITION BY StudentName ORDER BY Marks) Rank FROM 
ExamResult; 

SQL DENSE_RANK Function
Syntax: 
SELECT DENSE_RANK() OVER (PARTITION_BY_Clause ORDER_BY_Clause) FROM [Source]

-- DENSE_RANK functions without Partition_By clause: 
SELECT Studentname, Subject, Marks, dense_RANK() OVER(ORDER BY Marks) DenseRank FROM ExamResult; 
-- DENSE_RANK functions with Partition_By clause: 
SELECT Studentname, Subject, Marks, dense_RANK() OVER(PARTITION BY StudentName ORDER BY Marks) 
DenseRank FROM ExamResult; 

SQL NTILE Function 
SELECT NTILE(Interger_Value) OVER (PARTITION_BY_Clause ORDER_BY_Clause) 
FROM [Source] 

Integer_Value: It will use this integer value to decide the number of ranks it has to assign for each partition. For 
instance, If we specify 2, the NTILE Function will assign 2 rank numbers for each category.

--NTILE functions without Partition_By Clause
SELECT STUDENTNAME,SUBJECT,MARKS,NTILE(@)OVER (ORDER BY MARKS)NTILE FROM EXAMRESULT

--NTILE functions with Partition_By clause: 
SELECT Studentname, Subject, Marks, NTILE(2) OVER(PARTITION BY StudentName ORDER BY Marks) NTILE
FROM ExamResult; 


Using LAG() and LEAD() to Compare Values 
An important use for LAG() and LEAD() in reports is comparing the values in the 
current row with the values in the same column but in a row above or below. 

SELECT
	SALEYEAR,
	TOTALSALES AS CURRENT_TOTAL_SALE,
	LAG(TOTALSALES)OVER(ORDER BY SALEYEAR)AS PREVIOUS_TOTAL_SALE,
	TOTALSALES - LAG(TOTALSALES) OVER (ORDER BY SALEYEAR)AS DIFFERENCE
FROM DBO.SALEBYYEAR;

-- LEAD AND LAG WITH OFFSET 
--The query below selects the bonus for the employee with ID=1 for each quarter of 
each year.  --It then identifies the bonuses for the corresponding quarter in the year before and 
the year after. 

SYNTAX:
LAG(EXPRESSION,[OFFSET],DEFAULT_VALUE])OVER (ORDER BY COLUMN)

EXPRESSION : NAME OF COLUMN ON WHICH WE ARE APPLYING LAG FUNCTION
OFFSET - NUMBER OF ROWS TO SKIP ABOVE
DEFAULT VALUE IS ALLOWED ONLY IF YOU SPECIFY THE SECOND PARAMETER.


SELECT 
	BONUSYEAR,BONUSQUAR,
	LAG(BONUSAMT,4)OVER(ORDER BY BONUSYEAR,BONUSQUAR)AS PREVIOUS_BONUS,
	BONUSAMT AS CURRENT_BONUS
	LEAD(BONUSAMT,4)OVER(ORDER BY BONUSYEAR,BONUSQUAR)AS NEXT_BONUS
	FROM DBO.EMPBONUS
WHERE EMPID = 1
