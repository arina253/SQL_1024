

DROP TABLE TERMLOOKUPDATA
create table termlookupData(
ID INT IDENTITY,
data nvarchar(250)
)

INSERT INTO termlookupData values('Heard Touch Screen')
INSERT INTO termlookupData values('Smooth sliding')
INSERT INTO termlookupData values('Getting problem in installing new application ')
INSERT INTO termlookupData values('Application get hangs during call')
INSERT INTO termlookupData values('Touch screen not working properly')
INSERT INTO termlookupData values('no long battery backup')
INSERT INTO termlookupData values('Phone get hang while playing games')
INSERT INTO termlookupData values('screen size is too small')
INSERT INTO termlookupData values('Quality of screen guard is bad')
INSERT INTO termlookupData values('Built in memory is too small')
INSERT INTO termlookupData values('vibration not working properly')

INSERT INTO termlookupData values('SCREEN,Screen,screen ')

DROP TABLE TERMSEARCHVALUE
Create table termSearchValue
(ID INT IDENTITY,
 data nvarchar(250))

INSERT INTO termSearchValue VALUES('screen')
INSERT INTO termSearchValue VALUES('not working properly')
INSERT INTO termSearchValue VALUES('is too small')
INSERT INTO termSearchValue VALUES('no long battery')



UPDATE TERMSEARCHVALUE
SET DATA = 'SCREEN'
WHERE DATA = 'screen'

SELECT *FROM TERMSEARCHVALUE
SELECT *FROM TERMLOOKUPDATA

UPDATE TERMSEARCHVALUE
SET DATA = 'Screen'
WHERE DATA = 'SCREEN'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE LOOKUPSOURCE 
(
PLAYERID INT IDENTITY,
PLAYERINFORMATION NVARCHAR(300)
)

INSERT INTO LOOKUPSOURCE VALUES ('TENDULKAR IS HONOURED IN AUSTRALIA')
INSERT INTO LOOKUPSOURCE VALUES ('BRAVO IS FROM WEST INDIES')
INSERT INTO LOOKUPSOURCE VALUES ('MAXWELL IS FROM AUSTRALIA')
INSERT INTO LOOKUPSOURCE VALUES ('BOPARA IS FROM UNITED KINGDOM')
INSERT INTO LOOKUPSOURCE VALUES ('AUSTRALIA WON THE WORLD CUP 2015')
INSERT INTO LOOKUPSOURCE VALUES ('UNITED STATES IS NOT INTERESTED IN CRICKET')
INSERT INTO LOOKUPSOURCE VALUES ('ANDERSON IS NEW ZEALAND ALL ROUNDER')

INSERT INTO LOOKUPSOURCE VALUES ( 'australia,berlin,australia, AUSTRALIA')

CREATE TABLE LOOKUPTABLE
(
CID INT IDENTITY,
COUNTRYNAME VARCHAR(15)
)

INSERT INTO LOOKUPTABLE VALUES ('AUSTRALIA')
INSERT INTO LOOKUPTABLE VALUES ('CANADA')
INSERT INTO LOOKUPTABLE VALUES ('UNITED KINGDOM')
INSERT INTO LOOKUPTABLE VALUES ('UNITED STATES')
INSERT INTO LOOKUPTABLE VALUES ('CHINA')

SELECT *FROM LOOKUPSOURCE
SELECT *FROM LOOKUPTABLE


SELECT *FROM [TERM LOOKUP OUTPUT2]

-- Rename table from 'Term LookUp Output2' to 'TERM LOOKUP OUTPUT'
EXEC SP_RENAME 'Term LookUp Output2', 'TERM LOOKUP OUTPUT'


