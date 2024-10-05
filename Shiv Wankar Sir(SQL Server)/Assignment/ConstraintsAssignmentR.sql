1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.

2. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and 
make sure that no countries except Italy, India and China will be entered in the table.

3. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and 
check whether the max_salary amount exceeding the upper limit 25000.

DROP TABLE JOBS
CREATE TABLE JOBS 
(
JOB_ID INT,
JOB_TITLE VARCHAR(20),
MIN_SAL DECIMAL (10,2),
MAX_SAL DECIMAL(10,2),
CONSTRAINT CK_JOB_MAX_SAL CHECK (MAX_SAL > 25000)
)

INSERT INTO JOBS VALUES (1,'ER',10000,30000)

ALTER TABLE JOBS
ADD CONSTRAINT PK_JOBS_JOBID PRIMARY KEY (JOB_ID).....WILL NOT WORK SINCE NULL VALUE

ALTER TABLE JOBS
ALTER COLUMN 


4. Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and 
make sure that no duplicate data against column country_id will be allowed at the time of insertion.

5. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and 
make sure that the column country_id will be unique and store an auto incremented value.

6. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any 
duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

Here is the structure of the table jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     |    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

7.  Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date,
 job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value 
at the time of insertion and the foreign key columns combined by department_id columns contain only those unique combination values, which exists in the departments table.

Assume the structure of departments table below.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+

8. Sample table: orders

ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05  3005         5002
70009       270.65      2012-09-10  3001         5005
70002       65.26       2012-10-05  3002         5001
70004       110.5       2012-08-17  3009         5003
70007       948.5       2012-09-10  3005         5002
70005       2400.6      2012-07-27  3007         5001
70008       5760        2012-09-10  3002         5001
70010       1983.43     2012-10-10  3004         5006
70003       2480.4      2012-10-10  3009         5003
70012       250.45      2012-06-27  3008         5002
70011       75.29       2012-08-17  3003         5007
70013       3045.6      2012-04-25  3002         5001


write a SQL query to identify the unique salespeople ID. Return salesman_id.
WRITE a sql query to display result based on ordered desc customer_id 
write a sql query to display records based on  ord_date

--------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE COUNTRIES
CREATE TABLE COUNTRIES
(
COUNTRYID  INT IDENTITY(1,1) PRIMARY KEY,
COUNTRY_NAME VARCHAR(25),
REGIONID INT,
CONSTRAINT CHK_COUNTRIES_NAME CHECK (COUNTRY_NAME IN ('ITALY','INDIA','CHINA'))
)

SELECT *FROM COUNTRIES

INSERT INTO COUNTRIES (COUNTRY_NAME,REGIONID) VALUES ('INDIA',22)

--DROPPING THE EXISTING COLUMN, ADD IDENTITY COLUMN WITH ALTER COMMAND MAKING SURE THAT IT DOESN'T CONTAIN NULL AND DUPLICATE VALUES.

ALTER TABLE COUNTRIES
DROP COLUMN COUNTRYID

ALTER TABLE COUNTRIES
ADD COUNTRYID INT NOT NULL IDENTITY(1,1)

6. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any 
duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

Here is the structure of the table jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     |    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

CREATE TABLE JOB_HISTORY
(
EMPLOYEE_ID INT PRIMARY KEY,
START_DATE DATE,
END_dATE DATE,
JOB_ID INT,
DEPARTMENT_ID INT)

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT FK_JOB_HISTORY_JOBID FOREIGN KEY (JOB_ID) REFERENCES JOBS (JOB_ID)

INSERT INTO JOB_HISTORY VALUES (1,GETDATE(),GETDATE(),2,1)----CANNOT INSERT BECAUSE NO DATA IN THE JOBS TABLE

WE MUST HAVE DATA FIRST INTO THE REFERENCES TABLE AND ONLY THOSE DATA CAN BE INSERTED INTO OTHER TABLE

--7. CREATE TABLE EMPLOYEE
(
EMPLOYEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
EMAIL VARCHAR(20),
PHONE_NUMBER VARCHAR(11),
HIRE_DATE DATE,
JOB_ID INT,


)

--EITHER TWO SEPARATE FOREIGN KEY FOR EACH OF THE COMBINATION 

ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMP FOREIGN KEY (MANAGER_ID,DEPARTMENT_ID)REFERENCES DEPARTENTS(DEPARTMENT_ID,MANAGER_ID)

