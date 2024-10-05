Syntax 
The syntax for the INNER JOIN in SQL Server (Transact-SQL) is: 
SELECT column_list  
From Table1  
INNER Join Table2 
ON Table1.column = Table2.column

. Columns containing NULL do not 
match any values when you are creating an inner join and are therefore excluded from the result set. 
Null values do not match other null values.

Basic Syntax of Left Join: 
SELECT table1.column1, table2.column2....   
FROM table1    
LEFTJOIN table2   
ON table1.column_field = table2.column_field;  

Output of this query will contain matching records from both tables & non matching records from left table.

Basic syntax for right join: 
SELECT table1.column1, table2.column2.....   
FROM table1    
RIGHT JOIN table2   
ON table1.column_field = table2.column_field;  

Syntax for full outer join: 
SELECT *   
FROM table1   
FULL OUTER JOIN table2   
ON table1.column_name = table2.column_name;   
Let us take two tables to demonstrate full outer join:

SQL full outer join is used to combine the result of both left and right outer join and returns all rows (don't 
care its matched or unmatched) from the both participating tables. 

Self Join
Syntax of joining the table T to itself: 
SELECT select_list FROM T t1 
[INNER | LEFT]  JOIN T t2  
ON join_predicate; 
The query references the table T twice. The table aliases t1 and t2 are used to assign the T table different names in the query.

Cross Join: 
the total number of rows present in the final table will be equal to the 
product of the number of rows present in table 1 and the number of rows present in table 2.

Syntax: 
Select Column_list From Table1 Cross Join Table2 (Full Join will not have ON condition) 

Subqueries with the SELECT Statement 

SELECT column_name [, column_name ] 
FROM table1 [, table2 ] 
WHERE column_name OPERATOR 
(SELECT column_name [, column_name ] 
FROM table1 [, table2 ] 
[WHERE]) 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SQL Set Operators:

Standard Syntax for SET operators: 
SELECT your_select_query 
set_operator 
SELECT another_select_query; 

It uses two (or more) SELECT queries, with a set operator in the middle. 

SELECT first_name, last_name 
FROM customer 
UNION ALL 
SELECT first_name, last_name 
FROM employee;

SELECT first_name, last_name 
FROM customer 
EXCEPT 
SELECT first_name, last_name 
FROM employee; 

SELECT first_name, last_name 
FROM customer 
INTERSECT 
SELECT first_name, last_name 
FROM employee;
