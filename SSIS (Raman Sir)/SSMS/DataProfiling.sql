
--DATA PROFILING
--Not related to the developer.

SELECT [CUSTOMER NAME] FROM ORDERS$
--TO KNOW HOW MANY NULL VALUE IN COLUMN
COUNT
RATIO = SUM OF VALUES/COUNT
LENGTH DISTRIBUTION

We are checking data properties, how many unique values in a column and data frequency

SELECT [CUSTOMER NAME],COUNT(1)FROM ORDERS$
GROUP  BY [CUSTOMER NAME]

SELECT LEN [CUSTOMER NAME],COUNT(1)FROM ORDERS$
GROUP  BY LEN[CUSTOMER NAME]

We are presenting the properties of data and that is data profiling.
If we are showing data properties then data profiling.

SELECT LEN (CATEGORY)AS LENGTH,COUNT(1) AS COUNT FROM ORDERS$
GROUP  BY LEN(CATEGORY)
--Confirmed via Column length Distribution Profile in Data Profiling Task - Open Profile Viewer

SELECT *FROM ORDERS$ WHERE [CUSTOMER NAME] LIKE 'A%'
SELECT *FROM ORDERS$ WHERE CITY LIKE 'SAN%'

