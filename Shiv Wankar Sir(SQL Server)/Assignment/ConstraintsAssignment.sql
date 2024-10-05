--1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.

CREATE TABLE COUNTRIES
(
COUNTRY_ID  VARCHAR(15),
COUNTRY_NAME VARCHAR(25),
REGION_ID VARCHAR(15))


--2.Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and 
--make sure that no countries except Italy, India and China will be entered in the table.

DROP TABLE COUNTRIES

CREATE TABLE COUNTRIES
(
COUNTRY_ID  VARCHAR(15),
COUNTRY_NAME VARCHAR(25),
REGION_ID VARCHAR(15))


ALTER TABLE COUNTRIES
ADD CONSTRAINT CHK_COUNTRY_NAME CHECK(COUNTRY_NAME='ITALY'OR COUNTRY_NAME='INDIA' OR COUNTRY_NAME='CHINA')

SELECT *FROM COUNTRIES

--3.Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and 
--check whether the max_salary amount exceeding  upper limit 25000.

CREATE TABLE JOBS
(
JOB_ID	INT,
JOB_TITLE VARCHAR(25),
MIN_SALARY MONEY,
MAX_SALARY MONEY CHECK (MAX_SALARY > 25000)
)

SELECT *FROM JOBS

--4.Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and 
--make sure that no duplicate data against column country_id will be allowed at the time of insertion.

DROP TABLE COUNTRIES
CREATE TABLE COUNTRIES
(
COUNTRY_ID	 INT PRIMARY KEY,
COUNTRY_NAME VARCHAR(30),
REGION_ID    VARCHAR(15)
)

--5.Write a SQL statement to create a table countries including columns country_id, country_name and region_id and 
--make sure that the column country_id will be unique and store an auto incremented value.

DROP TABLE COUNTRIES
CREATE TABLE COUNTRIES
(
COUNTRY_ID	 INT IDENTITY PRIMARY KEY,
COUNTRY_NAME VARCHAR(30),
REGION_ID    VARCHAR(15)
)

--6.Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any 
--duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
  Here is the structure of the table jobs;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

CREATE TABLE  JOB_HISTORY
(
EMPLOYEE_ID		INT UNIQUE,
START_DATE			DATE,
END_DATE			DATE,
JOB_ID              VARCHAR(10),
DEPARTMENT_ID       INT,
FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID)
)

DROP TABLE JOBS

CREATE TABLE JOBS
(
JOB_ID		VARCHAR(10) PRIMARY KEY,
JOB_TITLE   VARCHAR(35) NOT NULL DEFAULT NULL,
MIN_SALARY  DECIMAL(6,0) DEFAULT NULL,
MAX_SALARY  DECIMAL(6,0) DEFAULT NULL
)

--7 Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date,
--job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value 
--at the time of insertion and the foreign key columns combined by department_id columns contain only those unique combination values, which exists in the departments table.

Assume the structure of departments table below.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
DROP TABLE EMPLOYEES

CREATE TABLE EMPLOYEES
(
EMPLOYEE_ID		INT PRIMARY KEY,
FIRST_NAME		VARCHAR(30),
LAST_NAME		VARCHAR(30),
EMAIL           VARCHAR(30),
PHONE_NUMBER	INT,
HIRE_DATE		DATE,
JOB_ID			VARCHAR(10),
SALARY          MONEY,
COMMISSION      DECIMAL(6,2),
MANAGER_ID      DECIMAL(6,0),
DEPARTMENT_ID	DECIMAL(4,0)  DEFAULT 0,
CONSTRAINT FK_DEPARTMENT_MANAGER FOREIGN KEY (DEPARTMENT_ID,MANAGER_ID)
REFERENCES DEPARTMENTS (DEPARTMENT_ID,MANAGER_ID)
)

DROP TABLE DEPARTMENTS

CREATE TABLE DEPARTMENTS
(
DEPARTMENT_ID	DECIMAL(4,0)  DEFAULT 0,
DEPARTMENT_NAME	VARCHAR(30) NOT NULL DEFAULT 'NULL',
MANAGER_ID		DECIMAL(6,0),
LOCATION_ID		DECIMAL(4,0) DEFAULT NULL,
CONSTRAINT PK_DEPARTMENTS_DEPMANID PRIMARY KEY(DEPARTMENT_ID,MANAGER_ID)
);


--8. Sample table: orders

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

SELECT DISTINCT SALESMANID FROM ORDERS




