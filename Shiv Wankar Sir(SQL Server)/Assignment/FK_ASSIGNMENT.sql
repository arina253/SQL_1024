
Tasks-
1.	Create the two tables above
2.	Insert the Data using insert command
3.	Create relationship (Foreign Key) between this two tables by identifying the common field.
4.	Try to insert/Update/Delete data which is being referenced in either tables.

-------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE AGENTS
CREATE TABLE AGENTS
(
AGENT_CODE		CHAR(6) PRIMARY KEY,
AGENT_NAME		CHAR(40) NOT NULL,
WORKING_AREA	CHAR(35),
COMMISSION		DECIMAL(10,2),
PHONE_NO		CHAR(17),

)

DROP TABLE CUSTOMER1
CREATE TABLE CUSTOMER1
(
CUST_CODE		CHAR(6)  PRIMARY KEY,
CUST_NAME		CHAR(25),
CUST_CITY		CHAR(25),
AGENT_CODE		CHAR(6)
FOREIGN KEY (AGENT_CODE)
REFERENCES AGENTS (AGENT_CODE)
)

SELECT *FROM CUSTOMER1
SELECT *FROM AGENTS

INSERT INTO AGENTS VALUES
('A001','Subbarao','Bangalore',0.14,'077-12346674'),
('A002','Mukesh','Mumbai',0.11,'029-12358964'),
('A003','Alex','London',0.13,'075-12458969'),
('A004','Ivan','Torento',0.15,'008-22544166'),
('A005','Anderson','Brisban',0.13,'045-21447739'),
('A006','McDen','London',0.15,'078-22255588'),
('A007','Ramasundar','Bangalore',0.15,'077-25814763'),
('A008','Alford','New York',0.12,'044-25874365'),
('A009','Benjamin','Hampshair',0.11,'008-22536178'),
('A010','Santakumar','Chennai',0.14,'007-22388644'),
('A011','Ravi Kumar','Bangalore',0.15,'077-45625874'),
('A012','Lucida','San Jose',0.12,'044-52981425')

SELECT *FROM AGENTS

INSERT INTO CUSTOMER1 (CUST_CODE,CUST_NAME,CUST_CITY,AGENT_CODE)VALUES
('C00001','Micheal','New York','A008'),
('C00002','Bolt','New York','A008'),
('C00003','Martin','Torento','A004'),
('C00004','Winston','Brisban','A005'),
('C00005','Sasikant','Mumbai ','A002'),
('C00006','Shilton','Torento','A004'),
('C00007','Ramanathan','Chennai','A010'),
('C00008','Karolina','Torento','A004'),
('C00009','Ramesh','Mumbai','A002'),
('C00010','Charles','Hampshair','A009'),
('C00011','Sundariya','Chennai','A010'),
('C00012','Steven','San Jose','A012'),
('C00013','Holmes','London','A003'),
('C00014','Rangarappa','Bangalore','A001'),
('C00015','Stuart','London','A003'),
('C00016','Venkatpati','Bangalore','A007'),
('C00017','Srinivas','Bangalore','A007'),
('C00018','Fleming','Brisban','A005'),
('C00019','Yearannaidu','Chennai','A010'),
('C00020','Albert','New York','A008'),
('C00021','Jacks','Brisban','A005'),
('C00022','Avinash','Mumbai','A002'),
('C00023','Karl','London','A006'),
('C00024','Cook','London','A006'),
('C00025','Ravindran','Bangalore','A011')

SELECT *FROM CUSTOMER1
SELECT *FROM AGENTS

--AGENTS - PARENT TABLE
--CUSTOMER1 - CHILD TABLE

--INSERT
---FOR INSERTING DATA, DATA NEEDS TO BE FIRST INSERTED INTO THE PRIMARY TABLE FIRST,THEN ONLY TO THE CHILD TABLE.

INSERT INTO AGENTS  VALUES('A013','ABC','TEXAS',0.55,'0123-23456789')

INSERT INTO CUSTOMER1 (CUST_CODE,CUST_NAME,CUST_CITY,AGENT_CODE)VALUES ('C00026','RAM','OHIO','A014')
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__CUSTOMER1__AGENT__4D5F7D71". The conflict occurred in database "Zorba_1024", table "dbo.AGENTS", column 'AGENT_CODE'.

INSERT INTO CUSTOMER1 (CUST_CODE,CUST_NAME,CUST_CITY,AGENT_CODE)VALUES ('C00026','RAM','OHIO','A013')

--UPDATE
UPDATE CUSTOMER1
SET CUST_NAME='SAM'
WHERE AGENT_CODE='A013'

UPDATE AGENTS
SET AGENT_CODE='A01'
WHERE AGENT_CODE = 'A001'
--The UPDATE statement conflicted with the REFERENCE constraint "FK__CUSTOMER1__AGENT__4D5F7D71". The conflict occurred in database "Zorba_1024", table "dbo.CUSTOMER1", column 'AGENT_CODE'.

--DELETE
DELETE FROM AGENTS WHERE AGENT_CODE='A001'
--The DELETE statement conflicted with the REFERENCE constraint "FK__CUSTOMER1__AGENT__4D5F7D71". The conflict occurred in database "Zorba_1024", table "dbo.CUSTOMER1", column 'AGENT_CODE'.

DELETE  FROM CUSTOMER1 WHERE AGENT_CODE='A001'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT POSSIBLE IN THE PARENT TABLE.
UPDATE POSSIBLE IN CHILD TABLE
DELETE POSSIBLE IN CHILD TABLE.







