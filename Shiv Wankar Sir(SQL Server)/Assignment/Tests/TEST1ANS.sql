DROP TABLE INSURANCEDETAILS
CREATE TABLE INSURANCEDETAILS
(
INSURANCEDETAILID			INT IDENTITY (1,1),
POLICYNO					INT NOT NULL,
EXPIRYDATE					DATE,
LOCATION					VARCHAR(50),
STATE						VARCHAR(20),
REGION						VARCHAR(30),
INSUREDVALUE				MONEY,
CONSTRUCTION				VARCHAR(30),
BUSINESSTYPE				VARCHAR(40),
EARTHQUAKE					VARCHAR(5),
FLOOD						VARCHAR(5),
ISACTIVE					BIT CONSTRAINT DF_INSURANCE_ISACTIVE DEFAULT (1),
CONSTRAINT CK_INSURANCEEXPIRYDATE CHECK (EXPIRYDATE >=GETDATE()),
CONSTRAINT PK_INSURANCE_INSID PRIMARY KEY (INSURANCEDETAILID)
)


INSERT INTO INSURANCEDETAILS (PolicyNo,ExpiryDate,LocatioN,State,Region,InsuredValue,Construction,BusinessType,Earthquake,Flood)
 VALUES
(100242, '2025-01-02','URBAN','NY','EAST',1617630,'FRAME','RETAIL','N','N'),
(100314, '2025-01-02','Urban','NY','East',8678500,'Fire Resist','Apartment','Y','Y'),
(100359, '2025-01-02','Rural','WI','Midwest',2052660,'Frame','Farming','N','N'),
(100315, '2025-01-03','Urban','NY','East',17580000,'Frame','Apartment','Y','Y'),
(100385, '2025-01-03','Urban','NY','East',1925000,'Masonry','Hospitality','N','N'),
(100388, '2025-01-04','Urban','IL','Midwest',12934500,'Frame','Apartment','Y','Y'),
(100358, '2025-01-05','Urban','WI','Midwest',928300,'Masonry','Office Bldg','N','N'),
(100264, '2025-01-07','Rural','NY','East',2219900,'Frame','Farming','N','N'),
(100265, '2025-01-07','Urban','NY','East',14100000,'Frame','Apartment','Y','Y'),
(100357,'2025-01-08','Urban','NY','East',4762808,'Masonry','Other','Y','Y'),
(100399,'2025-01-08','Urban','NY','East',13925190,'Frame','Apartment','Y','Y'),
(100329,'2025-01-09','Urban','NY','East',6350000,'Frame','Apartment','Y','Y'),
(100429,'2025-01-09','Urban','WI','Midwest',4036000,'Masonry','Medical','Y','Y'),
(100441,'2025-01-10','Urban','NJ','East',472800,'Masonry','Retail','Y','Y'),
(100442,'2025-01-10','Urban','WI','Midwest',11710880,'Masonry','Apartment','Y','Y'),
(100372,'2025-01-12','Urban','NY','East',1370300,'Frame','Apartment','Y','Y'),
(100281,'2025-01-13','Rural','WI','Midwest',1432835,'Frame','Farming','N','N'),
(100280,'2025-01-15','Urban','NY','East',82000,'Masonry','Organization','Y','Y'),
(100424,'2025-01-16','Urban','NY','East',192000,'Masonry','Retail','N','N'),
(100425,'2025-01-16','Urban','NY','East',4950000,'Frame','Office Bldg','Y','Y'),
(100426,'2025-01-16','Urban','VT','Northeast',2432875,'Fire Resist','Apartment','N','N'),
(100252,'2025-01-17','Urban','OH','Central',1529600,'Masonry','Apartment','N','N'),
(100279,'2025-01-18','Urban','NY','East',7677000,'Frame','Apartment','Y','Y'),
(100292,'2025-01-18','Urban','NY','East',13750000,'Frame','Apartment','Y','Y'),
(100398,'2025-01-18','Rural','NY','East',2529400,'Frame','Farming','N','N'),
(100382,'2025-01-19','Urban','NJ','East',2328650,'Frame','Organization','N','N'),
(100461,'2025-01-20','Urban','WI','Midwest',4380200,'Masonry','Office Bldg','Y','Y'),
(100263,'2025-01-22','Urban','NJ','East',2815000,'Metal Clad','Apartment','Y','Y'),
(100453,'2025-01-22','Urban','NY','East',1177700,'Frame','Hospitality','N','N'),
(100381,'2025-01-23','Urban','VT','Northeast',7203500,'Frame','Office Bldg','Y','Y'),
(100275,'2025-01-25','Urban','WI','Midwest',53410614,'Frame','Construction','Y','Y'),
(100277,'2025-01-25','Urban','NJ','East',3189300,'Masonry','Service','Y','Y'),
(100312,'2025-01-25','Rural','IL','Midwest',3145700,'Frame','Education','N','N'),
(100327,'2025-01-25','Urban','WI','Midwest',1451100,'Frame','Recreation','N','N'),
(100326,'2025-01-26','Urban','OH','Central',1787900,'Frame','Office Bldg','N','N'),
(100379,'2025-01-26','Urban','NY','East',18777355,'Frame','Apartment','Y','Y'),
(100310,'2025-01-28','Urban','WI','Midwest',8800000,'Fire Resist','Office Bldg','Y','Y'),
(100341,'2025-01-28','Urban','NY','East',1123000,'Frame','Office Bldg','Y','Y'),
(100289,'2025-01-29','Rural','NY','East',2145420,'Frame','Farming','N','N'),
(100290,'2025-01-29','Urban','NY','East',18933000,'Frame','Office Bldg','Y','Y'),
(100291,'2025-01-29','Urban','NY','East',21400000,'Fire Resist','Apartment','Y','Y'),
(100340,'2025-01-30','Urban','NY','East',3754000,'Frame','Office Bldg','Y','Y'),
(100415,'2025-01-31','Urban','NY','East',9650000,'Frame','Office Bldg','Y','Y'),
(100421,'2025-01-31','Urban','NY','East',9503000,'Frame','Office Bldg','Y','Y'),
(100304,'2025-02-01','Urban','NJ','East',1688300,'Frame','Hospitality','N','Y'),
(100414,'2025-02-02','Urban','WI','Midwest',17856705,'Masonry','Apartment','Y','Y'),
(100420,'2025-02-02','Urban','NY','East',7577000,'Frame','Apartment','Y','Y'),
(100481,'2025-02-02','Urban','WI','Midwest',1990915,'Masonry','Office Bldg','N','N'),
(100352,'2025-02-03','Urban','NJ','East',1245000,'Frame','Hospitality','Y','Y'),
(100496,'2025-02-04','Urban','IL','Midwest',1895000,'Masonry','Office Bldg','N','N')

--3.Write a query to Update Region from ‘Midwest’  ‘west’

UPDATE INSURANCEDETAILS
SET REGION = 'WEST'
WHERE REGION = 'MIDWEST'
Hint: WRITE WHERE CLAUSE FIRST FOR DELETE AND UPDATE.

SELECT *FROM INSURANCEDETAILS WHERE REGION = 'WEST'

--4.WRITE A QUERY TO GIVE COUNT BASED ON LOCATION
 SELECT DISTINCT LOCATION FROM INSURANCEDETAILS

 SELECT COUNT(1) AS COUNTBASEDONLOCATION,LOCATION AS AREANAME
 FROM INSURANCEDETAILS
 GROUP BY LOCATION
 --CAN WRITE EITHER COUNT(*) OR COUNT(1) OR COUNT(LOCATION)

 SELECT *FROM INSURANCEDETAILS WHERE LOCATION='RURAL'

 --5. Write a query to display all columns where Flood status is ‘Y’ and Earthquake in ‘N’

 SELECT INSURANCEDETAILID,POLICYNO,EXPIRYDATE,LOCATION,STATE,REGION,INSUREDVALUE,CONSTRUCTION,BUSINESSTYPE,EARTHQUAKE,FLOOD*FROM INSURANCEDETAILS
 FROM INSURANCEDETAILS 
 WHERE 

 --6.6.	Display state and respective count of policy for that state.
 SELECT COUNT(POLICYNO)AS POLICYCOUNTFORSTATE,STATE
 FROM INSURANCEDETAILS
 GROUP BY STATE

 --7.Update all the records. Add 5 years to Ecpiry date

 SELECT *FROM INSURANCEDETAILS
 UPDATE INSURANCEDETAILS
 SET EXPIRYDATE = DATEADD(YEAR,5,EXPIRYDATE)

 --8.Write a query to display all columns whose construction is ‘frame’ and BussinessType is ‘Apartment’ 
 SELECT *FROM INSURANCEDETAILS 
 WHERE CONSTRUCTION = 'FRAME' AND BUSINESSTYPE='APARTMENT'

 --9 Write a query to display count of policies per region. Display only those records who’s count is more that 5

 SELECT COUNT(POLICYNO)AS POLICYCOUNTFORSTATE, REGION AS POLICYREGION
 FROM INSURANCEDETAILS
 GROUP BY REGION
 HAVING COUNT(POLICYNO) > 5
 --CANNOT USE WHERE CLAUSE TO FILTER RECORDS WITH AGGREGATE FUNCTIONS LIKE COUNT,MAX,MIN