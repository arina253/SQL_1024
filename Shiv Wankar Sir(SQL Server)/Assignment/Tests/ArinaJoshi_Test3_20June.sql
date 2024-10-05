--1.Write DDL scripts for all the 3 Tables. Use constraints wherever applicable

DROP TABLE CUSTOMERS
CREATE TABLE CUSTOMERS
(
CUSTOMERID INT IDENTITY PRIMARY KEY,
FIRSTNAME VARCHAR (15),
LASTNAME VARCHAR(15),
CITY VARCHAR(30) DEFAULT 'NEW YORK',
STATE VARCHAR(6),
ZIP VARCHAR(8) NOT NULL
)

DROP TABLE PRODUCTS
CREATE TABLE PRODUCTS
(
PRODUCTID INT IDENTITY PRIMARY KEY,
PRODNAME VARCHAR(25),
RECOMMENDEDPRICE MONEY CHECK (RECOMMENDEDPRICE > 25 ),
CATEGORY VARCHAR(30) NOT NULL
)

DROP TABLE SALES
CREATE TABLE SALES
(
SALEID INT IDENTITY,
PRODUCTID INT,
CUSTOMERID INT,
SALEPRICE MONEY,
SALEDATE DATE
CONSTRAINT FK_SALES_PRODUCTID FOREIGN KEY(PRODUCTID)REFERENCES PRODUCTS(PRODUCTID),
CONSTRAINT FK_SALES_CUSTOMERID FOREIGN KEY(CUSTOMERID)REFERENCES CUSTOMERS(CUSTOMERID)
)

--2.Write DML scripts for inserting data into Customers and Products table.

INSERT INTO CUSTOMERS(FIRSTNAME,LASTNAME,CITY,STATE,ZIP) VALUES
('John','Miller','Asbury','NYK','23433'),
('Fred','Hammill','Basham','AK','85675'),
('Stan','Mellish','Callahan','WY','38556'),
('Adrian','Caparzo','Denver','CO','12377'),
('Mike','Horvath','Easton','IN','47130'),
('Irwin','Irwin','Frankfurt','KYC','45902'),
('George','Marshall','Gallipoli','ND','34908'),
('Frank','Costello','Honolulu','HI','23905'),
('Billy','Costigan','Immice','SC','75389'),
('Shelly','Lights','Lights','AZ','35263'),
('Chirsty','Melton','Spade','CAN','97505'),
('Amanda','Owens','Flask','CN','50386'),
('Brittany','Smits','Bourbon','KY','24207'),
('Kristy','Bryant','Tarp','FL','58960'),
('Kelly','Street','TableTop','ID','57732'),
('Tricia','Hill','Camera','ME','46738'),
('Holly','Raines','Compact','MS','35735'),
('Natalie','Woods','Woods','IN','87219'),
('Wendy','Hilton','Action','KYC','47093')


INSERT INTO PRODUCTS VALUES 
('DVD',105,'LIVINGROOM'),
('MICROWAVE',98,'KITCHEN'),
('MONITOR',200,'OFFICE'),
('SPEAKERS',85,'OFFICE'),
('REFRIGERATOR',900,'KITCHEN'),
('COFFEEPOT',165,'KITCHEN'),
('VCR',35,'LIVINGROOM')


INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(1,1,130,'2/6/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(2,2,97,'1/7/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,3,200,'8/8/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(4,4,80,'4/9/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(5,5,899,'10/10/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(6,6,150,'10/11/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,7,209,'12/12/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(4,8,90,'5/13/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(6,9,130,'6/14/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(2,14,85,'6/19/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,15,240,'9/20/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(1,16,99,'7/21/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(1,17,87,'3/22/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(2,18,99,'1/23/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(6,19,150,'3/24/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(5,5,900,'3/10/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(4,6,86,'8/11/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(2,7,88,'8/12/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,8,198,'12/13/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(1,9,150,'5/14/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(6,14,99,'7/19/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(6,15,104,'9/20/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,16,270,'2/21/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(4,17,90,'7/22/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(1,1,130,'3/6/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(2,2,102,'4/7/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(1,3,114,'11/8/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(5,4,1000,'5/9/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(5,5,1100,'10/10/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,6,285,'6/11/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(2,7,87,'10/12/2005')
INSERT INTO Sales(ProductID, CustomerID, SalePrice, SaleDate) VALUES(3,8,300,'7/13/2005')


--3.Write a SQL query to rename column ‘ProdName’ to ‘ProductName’
METHOD 1:
Right click on database name ----->Table -----> Columns ------ProdName -------Right click ------Rename ----- ProductName

METHOD 2:
EXEC sp_rename 'Products.ProdName', 'ProductName', 'COLUMN';

--execute sp_rename'ProdName','ProductName','Column' FROM [Zorba_1024].[dbo].[PRODUCTS]

--4.Write select query for ProductId, SaleProce and Sale Date for all products sold in the month of June 2005.
SELECT *FROM SALES
SELECT
PRODUCTID,SALEPRICE,SALEDATE
FROM SALES
WHERE YEAR(SALEDATE)=2005 AND MONTH(SALEDATE)=6


--5.	Create MS SQL query for Unique CustomerID, First Name, and Last Name of those individuals in the Customer table.
SELECT
DISTINCT CUSTOMERID,FIRSTNAME,LASTNAME
FROM CUSTOMERS


6.	Write Query for Number of Sales by ProductId where the average Sale Price is more than or equal to 100 dollars.
SELECT *FROM SALES

SELECT PRODUCTID, COUNT(PRODUCTID)NUMBEROFSALES,AVG(SALEPRICE) AVERAGESALE
FROM SALES
GROUP BY PRODUCTID
HAVING AVG(SALEPRICE) >= 100



--7.	Write a select query to display First, Last Name, City and Zip of all the customers where the state having 3 characters.
SELECT * FROM CUSTOMERS
SELECT
FIRSTNAME,LASTNAME,CITY,ZIP,STATE
FROM CUSTOMERS
WHERE LEN(STATE)=3


--8.	Find count of customers by State. Display Count and respective state.
SELECT *FROM CUSTOMERS
SELECT
COUNT(1) AS COUNT,STATE
FROM CUSTOMERS
GROUP BY STATE

--9.	Write a select query to display Full name (Column Name – FullName) and City of all the customers. Include one more column in select list for Name abbreviation and store the value as First letter of both First Name and Last Name.
SELECT *FROM CUSTOMERS
/*SELECT
CONCAT(FIRSTNAME,' ',LASTNAME,' ',CITY) FULLNAMECITY,
CONCAT (FIRSTNAME LIKE '_[A-Z]' , (LASTNAME LIKE '_[A-Z]'))NAME
FROM CUSTOMERS*/

SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    City,
    CONCAT(LEFT(FirstName, 1), LEFT(LastName, 1)) AS NameAbbreviation
FROM 
    Customers;


--10.	Update year of SaleDate to 2006.
SELECT * FROM SALES
UPDATE SALES
SET SALEDATE = '2006'
WHERE YEAR(SALEDATE)='2005'

--SECOND WAY
UPDATE SALES
SET SALEDATE = REPLACE(SALEDATE,'2005','2006')

--THIRD WAY
UPDATE SALES
SET SALEDATE = REPLACE(SALEDATE,YEAR(SALEDATE),'2007')


--11.	Find total Sale Price for each product which are sold between Jan 2006 to July 2006.
SELECT * FROM SALES
SELECT
PRODUCTID,
SUM(SALEPRICE)
FROM SALES
WHERE SALEDATE BETWEEN '2006-01-01' AND '2006-07-01'
GROUP BY PRODUCTID

--12.	Add column Email to Customers Table and update Email values for all customer as FirstName.LastName@yahoo.com.
ALTER TABLE CUSTOMERS ADD EMAIL VARCHAR(30)
SELECT *FROM CUSTOMERS
UPDATE CUSTOMERS
SET EMAIL = 'FIRSTNAME.LASTNAME@YAHOO.COM'


--13.	What is the average recommended price?
SELECT *FROM PRODUCTS
SELECT AVG(RECOMMENDEDPRICE)AS [AVERAGE RECOMMENDED PRICE] FROM PRODUCTS


--14.	Find count of products by category.

SELECT *FROM PRODUCTS
SELECT 
COUNT(PRODUCTID)COUNTOFPRODUCT,CATEGORY
FROM PRODUCTS
GROUP BY CATEGORY


15.	What is the highest SalesPrice for Monitors?? 
SELECT *FROM SALES
SELECT
MAX(SALEPRICE)
FROM SALES
WHERE PRODUCTID = 3

