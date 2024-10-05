Questions -- Write a query for below:
--Top 5 centers based on patient registration for the period Jan 2021 to Dec 2022.
--Top 5 departments based on No. of OPD consultations across centers for the period Jan2021 toNDec 2022.
--4. Top 5 services based on a) Revenue b) No of billing
--5. Top 5 department based on a) No of Patient taking service b) Based on revenue
--5. Top 5 department based on a) No of Patient taking service b) Based on revenue
-- 7 Write a query to find count of patient across all the yeards by centres who's discharge status was 'Dead'  
-- 8. Average length of stay in days
-- 9. Top 50 tests based on no of tests done for each year
--10. Top 10 packages based on revenue for each centre for each year






SELECT * FROM HumanResources.Employee
CREATE TABLE #TempAge (GENDER VARCHAR(10), Age VARCHAR(20))
INSERT INTO #TempAge (GENDER, AGE) 
SELECT GENDER, CASE WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) < 10 THEN 'below 10'
					WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) BETWEEN 10 AND 20 THEN '10 to 20'
					WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) BETWEEN 21 AND 35 THEN '21 to 35'
					WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) BETWEEN 35 AND 50 THEN '35 to 50'
					WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) BETWEEN 51 AND 60 THEN '51 to 60'
					WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) > 60 THEN 'more than 60'
				END AS Age
FROM HumanResources.Employee

SELECT Age,M,F,OTHERS FROM 
( SELECT AGE, GENDER  FROM #TempAge) AS SourceTable
PIVOT 
(COUNT(GENDER) FOR GENDER IN ([M],[F],[OTHERS]))
AS PivotTable

DROP TABLE #TempAge

SELECT * FROM Centre
SELECT * FROM DoctorDetail
SELECT * FROM Item
SELECT * FROM LabReport
SELECT * FROM PateintDemographics
SELECT * FROM DEPARTMENTs
SELECT * FROM SERVICE
SELECT * FROM Billing
SELECT * FROM IpDischarge
SELECT * FROM IpAdmission

--Top 5 centers based on patient registration for the period Jan 2021 to Dec 2022.
SELECT TOP 5 COUNT(IP.patientid) AS PatientCount, C.centrenName 
FROM IpAdmission IP 
JOIN PateintDemographics PD ON PD.patientid=IP.patientid		-- JOIN FOR PATIENT REGISTRATION CHECK
JOIN Centre C ON C.centreid = IP.centreid						-- JOIN FOR CENTRE NAME
WHERE YEAR(PD.dateOfRegistration) IN ('2021','2022')			-- DATE FILTER FOR REGISTRATION IN YEAR 2021 & 2022
GROUP BY C.centrenName											-- TO FIND COUNT PER CENTRE
ORDER BY COUNT(IP.patientid) DESC

--Top 5 departments based on No. of OPD consultations across centers for the period Jan2021 toNDec 2022.
SELECT TOP 5 COUNT(IP.consultingdoctorid) AS OPDConsultantCount, departmentname, centrenName 
FROM IpAdmission IP
JOIN DEPARTMENTs D ON D.departmentid=IP.departmentid			-- JOIN FOR DEPARTMENT NAME
JOIN Centre C ON C.centreid=IP.centreid							-- JOIN FOR CENTRE NAME
JOIN Billing B ON B.patientid=IP.patientid						-- JOIN TO CHECK PATIENT TYPE (OP)
JOIN PateintDemographics PD ON PD.patientid=IP.patientid		-- JOIN FOR PATIENT REGISTRATION CHECK
WHERE YEAR(PD.dateOfRegistration) IN ('2021','2022')			-- DATE FILTER FOR REGISTRATION IN YEAR 2021 & 2022
AND B.patienttype='OP'											-- FILTER ONLY OP 
GROUP BY D.departmentname, C.centrenName						-- TO FIND COUNT PER CENTRE , PER DEPARTMENT
ORDER BY COUNT(IP.consultingdoctorid) DESC

--4. Top 5 services based on a) Revenue b) No of billing

SELECT servicename,SUM(GROSSAMOUNT) AS TotalRevenue
FROM Billing B 
JOIN SERVICE S ON S.serviceid=B.serviceid
GROUP BY servicename
ORDER BY SUM(GROSSAMOUNT) DESC

SELECT servicename,COUNT(B.BILLINGID) AS NoOfBilling
FROM Billing B 
JOIN SERVICE S ON S.serviceid=B.serviceid
GROUP BY servicename
ORDER BY COUNT(B.BILLINGID) DESC

--5. Top 5 department based on a) No of Patient taking service b) Based on revenue

SELECT departmentname, COUNT(PatientId) AS PatientCount
FROM Billing B
JOIN DEPARTMENTs D ON D.departmentid=B.departmentid
GROUP BY departmentname
Order BY COUNT(PatientId) DESC

SELECT departmentname,SUM(GROSSAMOUNT) AS TotalRevenue
FROM Billing B 
JOIN DEPARTMENTs D ON D.departmentid=B.departmentid
GROUP BY departmentname
ORDER BY SUM(GROSSAMOUNT) DESC

-- 7 Write a query to find count of patient across all the yeards by centres who's discharge status was 'Dead'

SELECT YEAR(dateofdischarge) AS [Year],COUNT(patientid) AS NoOfDeaths, centrenName  
FROM IpDischarge ID
JOIN Centre C ON C.centreid=ID.centreid
WHERE ID.dischargestatus='Death'
GROUP BY YEAR(dateofdischarge),centrenName

-- 8. Average length of stay in days

SELECT AVG(DATEDIFF(DAY,dateofadmission,dateofdischarge)) AS AverageStay 
FROM IpAdmission IP
JOIN IpDischarge ID ON ID.patientid=IP.patientid

-- 9. Top 50 tests based on no of tests done for each year

SELECT TOP 50 COUNT(orderid) [COUNT],testname ,YEAR(resultdatetime) [YEAR] FROM LabReport
GROUP BY YEAR(resultdatetime),testname

--10. Top 10 packages based on revenue for each centre for each year

SELECT SUM(grossamount) AS [Revenue], centrenName, YEAR(billingdateandtime) AS [BillingYear] FROM Billing B
JOIN Centre C ON C.centreid=B.centreid
GROUP BY centrenName, YEAR(billingdateandtime)
