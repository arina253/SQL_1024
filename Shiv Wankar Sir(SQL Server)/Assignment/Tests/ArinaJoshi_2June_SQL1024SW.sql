
--Q.NO.1--CREATE TABLE

CREATE TABLE INSURANCEDETAILS
(
INSURANCEDETAILID			INT PRIMARY KEY,
POLICYNO					INT NOT NULL,
EXPIRYDATE					DATE CHECK (EXPIRYDATE>=GETDATE()),
LOCATION					VARCHAR(50),
STATE						VARCHAR(20),
REGION						VARCHAR(30),
INSUREDVALUE				MONEY,
CONSTRUCTION				VARCHAR(30),
BUSINESSTYPE				VARCHAR(40),
EARTHQUAKE					VARCHAR(5),
FLOOD						VARCHAR(5),
ISACTIVE					BIT DEFAULT 1
)

SELECT *FROM INSURANCEDETAILS

--Q.NO.2-INSERT RECORDS

INSERT INTO INSURANCEDETAILS(INSURANCEDETAILID,POLICYNO,EXPIRYDATE,LOCATION,STATE,REGION,INSUREDVALUE,CONSTRUCTION,BUSINESSTYPE,EARTHQUAKE,FLOOD)
VALUES
(1,100242,'URBAN','NY','EAST',1617630,'FRAME','RETAIL','N','N'),
(2,100314,'Urban','NY','East',8678500,'Fire Resist','Apartment','Y','Y'),
(3,100359,'Rural','WI','Midwest',2052660,'Frame','Farming','N','N'),
(4,100315,'Urban','NY','East',17580000,'Frame','Apartment','Y','Y'),
(5,100385,'Urban','NY','East',1925000,'Masonry','Hospitality','N','N'),
(6,100388,'Urban','IL','Midwest',12934500,'Frame','Apartment','Y','Y'),
(7,100358,'Urban','WI','Midwest',928300,'Masonry','Office Bldg','N','N'),
(8,100264,'Rural','NY','East',2219900,'Frame','Farming','N','N'),
(9,100265,'Urban','NY','East',14100000,'Frame','Apartment','Y','Y'),
(10,100357,'Urban','NY','East',4762808,'Masonry','Other','Y','Y'),
(11,100399,'Urban','NY','East',13925190,'Frame','Apartment','Y','Y'),
(12,100329,'Urban','NY','East',6350000,'Frame','Apartment','Y','Y'),
(13,100429,'Urban','WI','Midwest',4036000,'Masonry','Medical','Y','Y'),
(14,100441,'Urban','NJ','East',472800,'Masonry','Retail','Y','Y'),
(15,100442,'Urban','WI','Midwest',11710880,'Masonry','Apartment','Y','Y'),
(16,100372,'Urban','NY','East',1370300,'Frame','Apartment','Y','Y'),
(17,100281,'Rural','WI','Midwest',1432835,'Frame','Farming','N','N'),
(18,100280,'Urban','NY','East',82000,'Masonry','Organization','Y','Y'),
(19,100424,'Urban','NY','East',192000,'Masonry','Retail','N','N'),
(20,100425,'Urban','NY','East',4950000,'Frame','Office Bldg','Y','Y'),
(21,100426,'Urban','VT','Northeast',2432875,'Fire Resist','Apartment','N','N'),
(22,100252,'Urban','OH','Central',1529600,'Masonry','Apartment','N','N'),
(23,100279,'Urban','NY','East',7677000,'Frame','Apartment','Y','Y'),
(24,100292,'Urban','NY','East',13750000,'Frame','Apartment','Y','Y'),
(25,100398,'Rural','NY','East',2529400,'Frame','Farming','N','N'),
(26,100382,'Urban','NJ','East',2328650,'Frame','Organization','N','N'),
(27,100461,'Urban','WI','Midwest',4380200,'Masonry','Office Bldg','Y','Y'),
(28,100263,'Urban','NJ','East',2815000,'Metal Clad','Apartment','Y','Y'),
(29,100453,'Urban','NY','East',1177700,'Frame','Hospitality','N','N'),
(30,100381,'Urban','VT','Northeast',7203500,'Frame','Office Bldg','Y','Y'),
(31,100275,'Urban','WI','Midwest',53410614,'Frame','Construction','Y','Y'),
(32,100277,'Urban','NJ','East',3189300,'Masonry','Service','Y','Y'),
(33,100312,'Rural','IL','Midwest',3145700,'Frame','Education','N','N'),
(34,100327,'Urban','WI','Midwest',1451100,'Frame','Recreation','N','N'),
(35,100326,'Urban','OH','Central',1787900,'Frame','Office Bldg','N','N'),
(36,100379,'Urban','NY','East',18777355,'Frame','Apartment','Y','Y'),
(37,100310,'Urban','WI','Midwest',8800000,'Fire Resist','Office Bldg','Y','Y'),
(38,100341,'Urban','NY','East',1123000,'Frame','Office Bldg','Y','Y'),
(39,100289,'Rural','NY','East',2145420,'Frame','Farming','N','N'),
(40,100290,'Urban','NY','East',18933000,'Frame','Office Bldg','Y','Y'),
(41,100291,'Urban','NY','East',21400000,'Fire Resist','Apartment','Y','Y'),
(42,100340,'Urban','NY','East',3754000,'Frame','Office Bldg','Y','Y'),
(43,100415,'Urban','NY','East',9650000,'Frame','Office Bldg','Y','Y'),
(44,100421,'Urban','NY','East',9503000,'Frame','Office Bldg','Y','Y'),
(45,100304,'Urban','NJ','East',1688300,'Frame','Hospitality','N','Y'),
(46,100414,'Urban','WI','Midwest',17856705,'Masonry','Apartment','Y','Y'),
(47,100420,'Urban','NY','East',7577000,'Frame','Apartment','Y','Y'),
(48,100481,'Urban','WI','Midwest',1990915,'Masonry','Office Bldg','N','N'),
(49,100352,'Urban','NJ','East',1245000,'Frame','Hospitality','Y','Y'),
(50,100496,'Urban','IL','Midwest',1895000,'Masonry','Office Bldg','N','N')

INSERT INTO INSURANCEDETAILS (INSURANCEDETAILID,POLICYNO,EXPIRYDATE,LOCATION,STATE,REGION,INSUREDVALUE,CONSTRUCTION,BUSINESSTYPE,EARTHQUAKE,FLOOD)VALUES
(51,100242,'2021-01-02','URBAN','NY','EAST',1617630,'FRAME','RETAIL','N','N')
--The INSERT statement conflicted with the CHECK constraint "CK__INSURANCE__EXPIR__10566F31". The conflict occurred in database "Zorba_1024", table "dbo.INSURANCEDETAILS", column 'EXPIRYDATE'.

--Q.NO.3 WRITE A QUERY TO UPDATE REGION FROM 'MIDWEST --> 'WEST'

UPDATE INSURANCEDETAILS
SET REGION = 'WEST' WHERE REGION = 'MIDWEST'

--Q.NO.4 WRITE A QUERY TO GIVE COUNT BASED ON LOCATION

--Q.NO.5 WRITE A QUERY TO DISPLAY ALL COLUMNS WHERE FLOOD STATUS IS 'Y' AND EARTHQUAKE IS 'N'

SELECT *FROM INSURANCEDETAILS 
WHERE FLOOD = 'Y' AND EARTHQUAKE = 'N'

--Q.NO.6 DISPLAY STATE AND RESPECTIVE COUNT OF POLICY FOR THAT STATE

--Q.NO.7 UPDATE ALL THE RECORDS.ADD 5 YEARS TO EXPIRY DATE

UPDATE INSURANCEDETAILS
SET EXPIRYDATE=GETDATE()+5

--Q.NO.8 WRITE A QUERY TO DISPLAY ALL COLUMNS WHOSE CONSTRUCTION IS 'FRAME' AND 'BUSINESSTYPE' IS 'APARTMENT'

SELECT *FROM INSURANCEDETAILS
WHERE CONSTRUCTION = 'FRAME' AND BUSINESSTYPE = 'APARTMENT'

--Q.NO.9 WRITE A QUERY TO DISPLAY COUNT OF POLICIES PER REGION.DISPLAY ONLY THOSE RECORDS WHO'S COUNT IS MORE THAN 5
