CREATE TABLE [DBO].[BILLING]
(
BILLINGID INT NULL,
BILLINGDATEANDTIME DATETIME NULL,
CENTREID INT NULL,
PATIENTID INT NULL,
IPADMISSIONNO INT NULL,
PATIENTTYPE VARCHAR(20) NULL,
CHANNEL VARCHAR(20) NULL,
REFERRALDOCTORID INT NULL,
CONSULTINGDOCTORID INT NULL,
DEPARTMENTID INT NULL,
SERVICEID INT NULL,
PACKAGEPROFILEID INT NULL,
NETAMOUNT NUMERIC (18,0) NULL,
GROSSAMOUNT NUMERIC(18,0)NULL
)


CREATE TABLE [DBO].[CENTRE]
(
CENTREID INT NULL,
CENTRENAME VARCHAR(20) NULL,
CENTRETYPE VARCHAR(20) NULL,
CENTREACTIVE BIT NULL,
LOCATION VARCHAR(20) NULL
)


CREATE TABLE [DBO].[DEPARTMENTS]
(
DEPARTMENTID INT NULL,
DEPARTMENTNAME VARCHAR(20) NULL
)


CREATE TABLE [DBO].[DOCTORDETAIL]
(
DOCTORID INT NULL,
DOCTORNAME VARCHAR(20)NULL,
DEPARTMENTID INT NULL,
DEPARTMENTNAME VARCHAR(20) NULL,
SPECIALITY VARCHAR(20)NULL
)



CREATE TABLE DBO.IPADMISSION
(
PATIENTID INT NULL,
DATEOFADMISSION DATETIME NULL,
IPADMISSIONNO INT NULL,
CENTREID INT NULL,
CHANNEL VARCHAR(20) NULL,
REFERRALDOCTORID INT NULL,
CONSULTINGDOCTORID INT NULL,
DEPARTMENTID INT NULL,
ROOMNO VARCHAR(20)NULL,
BEDNO VARCHAR(20)NULL
)


CREATE TABLE DBO.IPDISCHARGE
(
PATIENTID INT NULL,
IPADMISSIONNO INT NULL,
CENTREID INT NULL,
DATEOFDISCHARGE DATE NULL,
DISCHARGESTATUS VARCHAR(20)NULL
)


CREATE TABLE DBO.ITEM
(
ITEMID INT NULL,
ITEMNAME VARCHAR(20)NULL
)


CREATE TABLE DBO.LABREPORT
(
BILLINGID INT NULL,
ORDERID INT NULL,
PATIENTID INT NULL,
IPADMISSIONNO INT NULL,
TESTNAME VARCHAR(20) NULL,
PARAMETERNAME VARCHAR(20)NULL,
RESULTVALUE VARCHAR(20)NULL,
UNIT VARCHAR(20)NULL,
RESULTDATETIME DATETIME NULL
)


CREATE TABLE PATIENTDEMOGRAPHICS
(
PATIENTID INT NULL,
NAME VARCHAR(20),
DATEOFREGISTRATION DATETIME NULL,
DATEOFBIRTH DATE NULL,
GENDER VARCHAR(20)NULL,
MOBILE VARCHAR(20)NULL,
CITY VARCHAR (20) NULL,
STATE VARCHAR (20) NULL
)


CREATE TABLE DBO.SERVICE
(
SERVICEID INT NULL,
SERVICENAME VARCHAR(20)NULL
)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Billing (billingid, billingdateandtime, centreid, patientid, ipadmissionno, patienttype, channel, referraldoctorid, consultingdoctorid, departmentid, serviceid, packageprofileid, netamount, grossamount) VALUES
(1, '2024-01-15 08:30:00', 1, 1, 101, 'Inpatient', 'Online', 201, 301, 401, 501, 601, 1500.00, 2000.00),
(2, '2024-01-16 09:00:00', 2, 2, 102, 'Outpatient', 'Walk-in', 202, 302, 402, 502, 602, 1200.00, 1500.00),
(3, '2024-01-17 10:15:00', 3, 3, 103, 'Inpatient', 'Online', 203, 303, 403, 503, 603, 1800.00, 2200.00),
(4, '2024-01-18 11:45:00', 1, 4, 104, 'Outpatient', 'Referral', 204, 304, 404, 504, 604, 1300.00, 1700.00),
(5, '2024-01-19 13:30:00', 2, 5, 105, 'Inpatient', 'Walk-in', 205, 305, 405, 505, 605, 1600.00, 2100.00),
(6, '2024-01-20 15:00:00', 3, 6, 106, 'Outpatient', 'Online', 206, 306, 406, 506, 606, 1100.00, 1400.00),
(7, '2024-01-21 16:30:00', 1, 7, 107, 'Inpatient', 'Referral', 207, 307, 407, 507, 607, 1700.00, 2000.00),
(8, '2024-01-22 18:00:00', 2, 8, 108, 'Outpatient', 'Walk-in', 208, 308, 408, 508, 608, 1400.00, 1800.00),
(9, '2024-01-23 19:30:00', 3, 9, 109, 'Inpatient', 'Online', 209, 309, 409, 509, 609, 1500.00, 2000.00),
(10, '2024-01-24 08:30:00', 1, 10, 110, 'Outpatient', 'Referral', 210, 310, 410, 510, 610, 1200.00, 1600.00),
(11, '2024-01-25 09:00:00', 2, 11, 111, 'Inpatient', 'Walk-in', 211, 311, 411, 511, 611, 1800.00, 2300.00),
(12, '2024-01-26 10:15:00', 3, 12, 112, 'Outpatient', 'Online', 212, 312, 412, 512, 612, 1300.00, 1700.00),
(13, '2024-01-27 11:45:00', 1, 13, 113, 'Inpatient', 'Referral', 213, 313, 413, 513, 613, 1600.00, 2100.00),
(14, '2024-01-28 13:30:00', 2, 14, 114, 'Outpatient', 'Walk-in', 214, 314, 414, 514, 614, 1100.00, 1400.00),
(15, '2024-01-29 15:00:00', 3, 15, 115, 'Inpatient', 'Online', 215, 315, 415, 515, 615, 1700.00, 2200.00),
(16, '2024-01-30 16:30:00', 1, 16, 116, 'Outpatient', 'Referral', 216, 316, 416, 516, 616, 1400.00, 1800.00),
(17, '2024-01-31 18:00:00', 2, 17, 117, 'Inpatient', 'Walk-in', 217, 317, 417, 517, 617, 1500.00, 2000.00),
(18, '2024-02-01 19:30:00', 3, 18, 118, 'Outpatient', 'Online', 218, 318, 418, 518, 618, 1200.00, 1600.00),
(19, '2024-02-02 08:30:00', 1, 19, 119, 'Inpatient', 'Referral', 219, 319, 419, 519, 619, 1800.00, 2300.00),
(20, '2024-02-03 09:00:00', 2, 20, 120, 'Outpatient', 'Walk-in', 220, 320, 420, 520, 620, 1300.00, 1700.00),
(21, '2024-02-04 10:15:00', 3, 21, 121, 'Inpatient', 'Online', 221, 321, 421, 521, 621, 1600.00, 2100.00),
(22, '2024-02-05 11:45:00', 1, 22, 122, 'Outpatient', 'Referral', 222, 322, 422, 522, 622, 1100.00, 1400.00),
(23, '2024-02-06 13:30:00', 2, 23, 123, 'Inpatient', 'Walk-in', 223, 323, 423, 523, 623, 1700.00, 2200.00),
(24, '2024-02-07 15:00:00', 3, 24, 124, 'Outpatient', 'Online', 224, 324, 424, 524, 624, 1400.00, 1800.00),
(25, '2024-02-08 16:30:00', 1, 25, 125, 'Inpatient', 'Referral', 225, 325, 425, 525, 625, 1500.00, 2000.00),
(26, '2024-02-09 18:00:00', 2, 26, 126, 'Outpatient', 'Walk-in', 226, 326, 426, 526, 626, 1200.00, 1600.00),
(27, '2024-02-10 19:30:00', 3, 27, 127, 'Inpatient', 'Online', 227, 327, 427, 527, 627, 1800.00, 2300.00),
(28, '2024-02-11 08:30:00', 1, 28, 128, 'Outpatient', 'Referral', 228, 328, 428, 528, 628, 1300.00, 1700.00),
(29, '2024-02-12 09:00:00', 2, 29, 129, 'Inpatient', 'Walk-in', 229, 329, 429, 529, 629, 1600.00, 2100.00),
(30, '2024-02-13 10:15:00', 3, 30, 130, 'Outpatient', 'Online', 230, 330, 430, 530, 630, 1100.00, 1400.00),
(31, '2024-02-14 11:45:00', 1, 31, 131, 'Inpatient', 'Referral', 231, 331, 431, 531, 631, 1700.00, 2200.00),
(32, '2024-02-15 13:30:00', 2, 32, 132, 'Outpatient', 'Walk-in', 232, 332, 432, 532, 632, 1400.00, 1800.00),
(33, '2024-02-16 15:00:00', 1, 33, 133, 'Inpatient', 'Referral', 233, 333, 433, 533, 633, 1700.00, 2200.00),
(34, '2024-02-17 16:30:00', 2, 34, 134, 'Outpatient', 'Walk-in', 234, 334, 434, 534, 634, 1400.00, 1800.00),
(35, '2024-02-18 18:00:00', 3, 35, 135, 'Inpatient', 'Online', 235, 335, 435, 535, 635, 1500.00, 2000.00),
(36, '2024-02-19 19:30:00', 1, 36, 136, 'Outpatient', 'Referral', 236, 336, 436, 536, 636, 1200.00, 1600.00),
(37, '2024-02-20 08:30:00', 2, 37, 137, 'Inpatient', 'Walk-in', 237, 337, 437, 537, 637, 1800.00, 2300.00),
(38, '2024-02-21 09:00:00', 3, 38, 138, 'Outpatient', 'Online', 238, 338, 438, 538, 638, 1300.00, 1700.00),
(39, '2024-02-22 10:15:00', 1, 39, 139, 'Inpatient', 'Referral', 239, 339, 439, 539, 639, 1600.00, 2100.00),
(40, '2024-02-23 11:45:00', 2, 40, 140, 'Outpatient', 'Walk-in', 240, 340, 440, 540, 640, 1100.00, 1400.00),
(41, '2024-02-24 13:30:00', 3, 41, 141, 'Inpatient', 'Online', 241, 341, 441, 541, 641, 1700.00, 2200.00),
(42, '2024-02-25 15:00:00', 1, 42, 142, 'Outpatient', 'Referral', 242, 342, 442, 542, 642, 1400.00, 1800.00),
(43, '2024-02-26 16:30:00', 2, 43, 143, 'Inpatient', 'Walk-in', 243, 343, 443, 543, 643, 1500.00, 2000.00),
(44, '2024-02-27 18:00:00', 3, 44, 144, 'Outpatient', 'Online', 244, 344, 444, 544, 644, 1200.00, 1600.00),
(45, '2024-02-28 19:30:00', 1, 45, 145, 'Inpatient', 'Referral', 245, 345, 445, 545, 645, 1800.00, 2300.00),
(46, '2024-02-29 08:30:00', 2, 46, 146, 'Outpatient', 'Walk-in', 246, 346, 446, 546, 646, 1300.00, 1700.00),
(47, '2024-03-01 09:00:00', 3, 47, 147, 'Inpatient', 'Online', 247, 347, 447, 547, 647, 1600.00, 2100.00),
(48, '2024-03-02 10:15:00', 1, 48, 148, 'Outpatient', 'Referral', 248, 348, 448, 548, 648, 1100.00, 1400.00),
(49, '2024-03-03 11:45:00', 2, 49, 149, 'Inpatient', 'Walk-in', 249, 349, 449, 549, 649, 1700.00, 2200.00),
(50, '2024-03-04 13:30:00', 3, 50, 150, 'Outpatient', 'Online', 250, 350, 450, 550, 650, 1400.00, 1800.00);


INSERT INTO Centre (centreid, centreName, centretype, centreactive, location) VALUES
(1, 'Centre A', 'Type 1', 1, 'Location 1'),
(2, 'Centre B', 'Type 2', 1, 'Location 2'),
(3, 'Centre C', 'Type 1', 0, 'Location 3'),
(4, 'Centre D', 'Type 2', 1, 'Location 4'),
(5, 'Centre E', 'Type 1', 1, 'Location 5'),
(6, 'Centre F', 'Type 2', 0, 'Location 6'),
(7, 'Centre G', 'Type 1', 1, 'Location 7'),
(8, 'Centre H', 'Type 2', 1, 'Location 8'),
(9, 'Centre I', 'Type 1', 0, 'Location 9'),
(10, 'Centre J', 'Type 2', 1, 'Location 10'),
(11, 'Centre K', 'Type 1', 1, 'Location 11'),
(12, 'Centre L', 'Type 2', 0, 'Location 12'),
(13, 'Centre M', 'Type 1', 1, 'Location 13'),
(14, 'Centre N', 'Type 2', 1, 'Location 14'),
(15, 'Centre O', 'Type 1', 0, 'Location 15'),
(16, 'Centre P', 'Type 2', 1, 'Location 16'),
(17, 'Centre Q', 'Type 1', 1, 'Location 17'),
(18, 'Centre R', 'Type 2', 0, 'Location 18'),
(19, 'Centre S', 'Type 1', 1, 'Location 19'),
(20, 'Centre T', 'Type 2', 1, 'Location 20'),
(21, 'Centre U', 'Type 1', 0, 'Location 21'),
(22, 'Centre V', 'Type 2', 1, 'Location 22'),
(23, 'Centre W', 'Type 1', 1, 'Location 23'),
(24, 'Centre X', 'Type 2', 0, 'Location 24'),
(25, 'Centre Y', 'Type 1', 1, 'Location 25'),
(26, 'Centre Z', 'Type 2', 1, 'Location 26'),
(27, 'Centre AA', 'Type 1', 0, 'Location 27'),
(28, 'Centre AB', 'Type 2', 1, 'Location 28'),
(29, 'Centre AC', 'Type 1', 1, 'Location 29'),
(30, 'Centre AD', 'Type 2', 0, 'Location 30'),
(31, 'Centre AE', 'Type 1', 1, 'Location 31'),
(32, 'Centre AF', 'Type 2', 1, 'Location 32'),
(33, 'Centre AG', 'Type 1', 0, 'Location 33'),
(34, 'Centre AH', 'Type 2', 1, 'Location 34'),
(35, 'Centre AI', 'Type 1', 1, 'Location 35'),
(36, 'Centre AJ', 'Type 2', 0, 'Location 36'),
(37, 'Centre AK', 'Type 1', 1, 'Location 37'),
(38, 'Centre AL', 'Type 2', 1, 'Location 38'),
(39, 'Centre AM', 'Type 1', 0, 'Location 39'),
(40, 'Centre AN', 'Type 2', 1, 'Location 40'),
(41, 'Centre AO', 'Type 1', 1, 'Location 41'),
(42, 'Centre AP', 'Type 2', 0, 'Location 42'),
(43, 'Centre AQ', 'Type 1', 1, 'Location 43'),
(44, 'Centre AR', 'Type 2', 1, 'Location 44'),
(45, 'Centre AS', 'Type 1', 0, 'Location 45'),
(46, 'Centre AT', 'Type 2', 1, 'Location 46'),
(47, 'Centre AU', 'Type 1', 1, 'Location 47'),
(48, 'Centre AV', 'Type 2', 0, 'Location 48'),
(49, 'Centre AW', 'Type 1', 1, 'Location 49'),
(50, 'Centre AX', 'Type 2', 1, 'Location 50')


INSERT INTO DEPARTMENTs (departmentid, departmentname) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'Oncology'),
(6, 'Dermatology'),
(7, 'Radiology'),
(8, 'Gastroenterology'),
(9, 'Ophthalmology'),
(10, 'Psychiatry'),
(11, 'Urology'),
(12, 'Gynecology'),
(13, 'Anesthesiology'),
(14, 'Nephrology'),
(15, 'Endocrinology'),
(16, 'Rheumatology'),
(17, 'Hematology'),
(18, 'Pulmonology'),
(19, 'Allergy & Immunology'),
(20, 'Infectious Disease'),
(21, 'Physical Medicine'),
(22, 'Emergency Medicine'),
(23, 'Geriatrics'),
(24, 'Pathology'),
(25, 'Nuclear Medicine'),
(26, 'Plastic Surgery'),
(27, 'General Surgery'),
(28, 'Thoracic Surgery'),
(29, 'Vascular Surgery'),
(30, 'Otolaryngology'),
(31, 'Pain Management'),
(32, 'Sports Medicine'),
(33, 'Sleep Medicine'),
(34, 'Clinical Genetics'),
(35, 'Clinical Pharmacol'),
(36, 'Palliative Care'),
(37, 'Critical Care Med'),
(38, 'Preventive Med'),
(39, 'Occupational Med'),
(40, 'Forensic Medicine'),
(41, 'Family Medicine'),
(42, 'Internal Medicine'),
(43, 'Adolescent Med'),
(44, 'Neonatology'),
(45, 'Transplant Surgery'),
(46, 'Trauma Surgery'),
(47, 'Breast Surgery'),
(48, 'Colorectal Surgery'),
(49, 'Hepatology'),
(50, 'Bariatric Surgery')

INSERT INTO DoctorDetail (doctorid, doctorname, departmentid, departmentname, speciality) VALUES
(1, 'John Smith', 1, 'Cardiology', 'Cardiologist'),
(2, 'Jane Doe', 2, 'Neurology', 'Neurologist'),
(3, 'Emily Davis', 3, 'Orthopedics', 'Orthopedic Surg'),
(4, 'Michael Brown', 4, 'Pediatrics', 'Pediatrician'),
(5, 'Sarah Johnson', 5, 'Oncology', 'Oncologist'),
(6, 'Chris Wilson', 6, 'Dermatology', 'Dermatologist'),
(7, 'Jessica Martinez', 7, 'Radiology', 'Radiologist'),
(8, 'David Lee', 8, 'Gastroenterol', 'Gastroenterolog'),
(9, 'Laura Clark', 9, 'Ophthalmology', 'Ophthalmologist'),
(10, 'James Allen', 10, 'Psychiatry', 'Psychiatrist'),
(11, 'Rachel Scott', 11, 'Urology', 'Urologist'),
(12, 'Daniel White', 12, 'Gynecology', 'Gynecologist'),
(13, 'Megan Harris', 13, 'Anesthesiology', 'Anesthesiolog'),
(14, 'Andrew Walker', 14, 'Nephrology', 'Nephrologist'),
(15, 'Nicole Hall', 15, 'Endocrinology', 'Endocrinologist'),
(16, 'Joshua Young', 16, 'Rheumatology', 'Rheumatologist'),
(17, 'Amanda King', 17, 'Hematology', 'Hematologist'),
(18, 'Brandon Wright', 18, 'Pulmonology', 'Pulmonologist'),
(19, 'Samantha Hill', 19, 'Allergy & Immuno', 'Allergist/Immun'),
(20, 'Justin Green', 20, 'Infectious Dis', 'Infectious Dis'),
(21, 'Olivia Adams', 21, 'Physical Med', 'Physiatrist'),
(22, 'Alexander Baker', 22, 'Emergency Med', 'Emergency Phys'),
(23, 'Chloe Nelson', 23, 'Geriatrics', 'Geriatrician'),
(24, 'Benjamin Carter', 24, 'Pathology', 'Pathologist'),
(25, 'Natalie Mitchell', 25, 'Nuclear Med', 'Nuclear Med Spec'),
(26, 'Kevin Perez', 26, 'Plastic Surg', 'Plastic Surgeon'),
(27, 'Victoria Roberts', 27, 'General Surg', 'General Surgeon'),
(28, 'Jonathan Evans', 28, 'Thoracic Surg', 'Thoracic Surgeon'),
(29, 'Laura Collins', 29, 'Vascular Surg', 'Vascular Surgeon'),
(30, 'Matthew Edwards', 30, 'Otolaryngology', 'Otolaryngologist'),
(31, 'Stephanie Murphy', 31, 'Pain Manage', 'Pain Management'),
(32, 'Nathan Rivera', 32, 'Sports Med', 'Sports Medicine'),
(33, 'Lisa Rodriguez', 33, 'Sleep Med', 'Sleep Med Spec'),
(34, 'Tyler Martinez', 34, 'Clinical Genet', 'Geneticist'),
(35, 'Kimberly Turner', 35, 'Clinical Pharma', 'Clinical Pharmac'),
(36, 'Eric Phillips', 36, 'Palliative Care', 'Palliative Care'),
(37, 'Julia Parker', 37, 'Critical Care', 'Critical Care'),
(38, 'Adam Hughes', 38, 'Preventive Med', 'Preventive Med'),
(39, 'Sophia Flores', 39, 'Occupational Med', 'Occupational Med'),
(40, 'Luke Reed', 40, 'Forensic Med', 'Forensic Path'),
(41, 'Emma Morris', 41, 'Family Med', 'Family Physician'),
(42, 'Jack Bell', 42, 'Internal Med', 'Internist'),
(43, 'Isabella Sanders', 43, 'Adolescent Med', 'Adolescent Med'),
(44, 'William Price', 44, 'Neonatology', 'Neonatologist'),
(45, 'Evelyn Butler', 45, 'Transplant Surg', 'Transplant Surg'),
(46, 'Joseph James', 46, 'Trauma Surg', 'Trauma Surgeon'),
(47, 'Lily Howard', 47, 'Breast Surg', 'Breast Surgeon'),
(48, 'Ryan Ramirez', 48, 'Colorectal Surg', 'Colorectal Surg'),
(49, 'Grace Ward', 49, 'Hepatology', 'Hepatologist'),
(50, 'Samuel Cox', 50, 'Bariatric Surg', 'Bariatric Surg')

INSERT INTO IpAdmission (patientid, dateofadmission, ipadmissionno, centreid, channel, referraldoctorid, consultingdoctorid, departmentid, roomno, bedno) VALUES
(1, '2024-01-15', 101, 1, 'Online', 201, 301, 401, 'Room 1', 'Bed 1'),
(2, '2024-01-16', 102, 2, 'Walk-in', 202, 302, 402, 'Room 2', 'Bed 2'),
(3, '2024-01-17', 103, 3, 'Online', 203, 303, 403, 'Room 3', 'Bed 3'),
(4, '2024-01-18', 104, 1, 'Referral', 204, 304, 404, 'Room 4', 'Bed 4'),
(5, '2024-01-19', 105, 2, 'Walk-in', 205, 305, 405, 'Room 5', 'Bed 5'),
(6, '2024-01-20', 106, 3, 'Online', 206, 306, 406, 'Room 6', 'Bed 6'),
(7, '2024-01-21', 107, 1, 'Referral', 207, 307, 407, 'Room 7', 'Bed 7'),
(8, '2024-01-22', 108, 2, 'Walk-in', 208, 308, 408, 'Room 8', 'Bed 8'),
(9, '2024-01-23', 109, 3, 'Online', 209, 309, 409, 'Room 9', 'Bed 9'),
(10, '2024-01-24', 110, 1, 'Referral', 210, 310, 410, 'Room 10', 'Bed 10'),
(11, '2024-01-25', 111, 2, 'Walk-in', 211, 311, 411, 'Room 11', 'Bed 11'),
(12, '2024-01-26', 112, 3, 'Online', 212, 312, 412, 'Room 12', 'Bed 12'),
(13, '2024-01-27', 113, 1, 'Referral', 213, 313, 413, 'Room 13', 'Bed 13'),
(14, '2024-01-28', 114, 2, 'Walk-in', 214, 314, 414, 'Room 14', 'Bed 14'),
(15, '2024-01-29', 115, 3, 'Online', 215, 315, 415, 'Room 15', 'Bed 15'),
(16, '2024-01-30', 116, 1, 'Referral', 216, 316, 416, 'Room 16', 'Bed 16'),
(17, '2024-01-31', 117, 2, 'Walk-in', 217, 317, 417, 'Room 17', 'Bed 17'),
(18, '2024-02-01', 118, 3, 'Online', 218, 318, 418, 'Room 18', 'Bed 18'),
(19, '2024-02-02', 119, 1, 'Referral', 219, 319, 419, 'Room 19', 'Bed 19'),
(20, '2024-02-03', 120, 2, 'Walk-in', 220, 320, 420, 'Room 20', 'Bed 20'),
(21, '2024-02-04', 121, 3, 'Online', 221, 321, 421, 'Room 21', 'Bed 21'),
(22, '2024-02-05', 122, 1, 'Referral', 222, 322, 422, 'Room 22', 'Bed 22'),
(23, '2024-02-06', 123, 2, 'Walk-in', 223, 323, 423, 'Room 23', 'Bed 23'),
(24, '2024-02-07', 124, 3, 'Online', 224, 324, 424, 'Room 24', 'Bed 24'),
(25, '2024-02-08', 125, 1, 'Referral', 225, 325, 425, 'Room 25', 'Bed 25'),
(26, '2024-02-09', 126, 2, 'Walk-in', 226, 326, 426, 'Room 26', 'Bed 26'),
(27, '2024-02-10', 127, 3, 'Online', 227, 327, 427, 'Room 27', 'Bed 27'),
(28, '2024-02-11', 128, 1, 'Referral', 228, 328, 428, 'Room 28', 'Bed 28'),
(29, '2024-02-12', 129, 2, 'Walk-in', 229, 329, 429, 'Room 29', 'Bed 29'),
(30, '2024-02-13', 130, 3, 'Online', 230, 330, 430, 'Room 30', 'Bed 30'),
(31, '2024-02-14', 131, 1, 'Referral', 231, 331, 431, 'Room 31', 'Bed 31'),
(32, '2024-02-15', 132, 2, 'Walk-in', 232, 332, 432, 'Room 32', 'Bed 32'),
(33, '2024-02-16', 133, 3, 'Online', 233, 333, 433, 'Room 33', 'Bed 33'),
(34, '2024-02-17', 134, 1, 'Referral', 234, 334, 434, 'Room 34', 'Bed 34'),
(35, '2024-02-18', 135, 2, 'Walk-in', 235, 335, 435, 'Room 35', 'Bed 35'),
(36, '2024-02-19', 136, 3, 'Online', 236, 336, 436, 'Room 36', 'Bed 36'),
(37, '2024-02-20', 137, 1, 'Referral', 237, 337, 437, 'Room 37', 'Bed 37'),
(38, '2024-02-21', 138, 2, 'Walk-in', 238, 338, 438, 'Room 38', 'Bed 38'),
(39, '2024-02-22', 139, 3, 'Online', 239, 339, 439, 'Room 39', 'Bed 39'),
(40, '2024-02-23', 140, 1, 'Referral', 240, 340, 440, 'Room 40', 'Bed 40'),
(41, '2024-02-24', 141, 2, 'Walk-in', 241, 341, 441, 'Room 41', 'Bed 41'),
(42, '2024-02-25', 142, 3, 'Online', 242, 342, 442, 'Room 42', 'Bed 42'),
(43, '2024-02-26', 143, 1, 'Referral', 243, 343, 443, 'Room 43', 'Bed 43'),
(44, '2024-02-27', 144, 2, 'Walk-in', 244, 344, 444, 'Room 44', 'Bed 44'),
(45, '2024-02-28', 145, 3, 'Online', 245, 345, 445, 'Room 45', 'Bed 45'),
(46, '2024-02-29', 146, 1, 'Referral', 246, 346, 446, 'Room 46', 'Bed 46'),
(47, '2024-03-01', 147, 2, 'Walk-in', 247, 347, 447, 'Room 47', 'Bed 47'),
(48, '2024-03-02', 148, 3, 'Online', 248, 348, 448, 'Room 48', 'Bed 48'),
(49, '2024-03-03', 149, 1, 'Referral', 249, 349, 449, 'Room 49', 'Bed 49'),
(50, '2024-03-04', 150, 2, 'Walk-in', 250, 350, 450, 'Room 50', 'Bed 50')

INSERT INTO IpDischarge (patientid, ipadmissionno, centreid, dateofdischarge, dischargestatus) VALUES
(1, 101, 1, '2024-02-15', 'Recovered'),
(2, 102, 2, '2024-02-16', 'Recovered'),
(3, 103, 3, '2024-02-17', 'Transferred'),
(4, 104, 1, '2024-02-18', 'Recovered'),
(5, 105, 2, '2024-02-19', 'Recovered'),
(6, 106, 3, '2024-02-20', 'Deceased'),
(7, 107, 1, '2024-02-21', 'Recovered'),
(8, 108, 2, '2024-02-22', 'Recovered'),
(9, 109, 3, '2024-02-23', 'Transferred'),
(10, 110, 1, '2024-02-24', 'Recovered'),
(11, 111, 2, '2024-02-25', 'Recovered'),
(12, 112, 3, '2024-02-26', 'Deceased'),
(13, 113, 1, '2024-02-27', 'Recovered'),
(14, 114, 2, '2024-02-28', 'Recovered'),
(15, 115, 3, '2024-02-29', 'Transferred'),
(16, 116, 1, '2024-03-01', 'Recovered'),
(17, 117, 2, '2024-03-02', 'Recovered'),
(18, 118, 3, '2024-03-03', 'Deceased'),
(19, 119, 1, '2024-03-04', 'Recovered'),
(20, 120, 2, '2024-03-05', 'Recovered'),
(21, 121, 3, '2024-03-06', 'Transferred'),
(22, 122, 1, '2024-03-07', 'Recovered'),
(23, 123, 2, '2024-03-08', 'Recovered'),
(24, 124, 3, '2024-03-09', 'Deceased'),
(25, 125, 1, '2024-03-10', 'Recovered'),
(26, 126, 2, '2024-03-11', 'Recovered'),
(27, 127, 3, '2024-03-12', 'Transferred'),
(28, 128, 1, '2024-03-13', 'Recovered'),
(29, 129, 2, '2024-03-14', 'Recovered'),
(30, 130, 3, '2024-03-15', 'Deceased'),
(31, 131, 1, '2024-03-16', 'Recovered'),
(32, 132, 2, '2024-03-17', 'Recovered'),
(33, 133, 3, '2024-03-18', 'Transferred'),
(34, 134, 1, '2024-03-19', 'Recovered'),
(35, 135, 2, '2024-03-20', 'Recovered'),
(36, 136, 3, '2024-03-21', 'Deceased'),
(37, 137, 1, '2024-03-22', 'Recovered'),
(38, 138, 2, '2024-03-23', 'Recovered'),
(39, 139, 3, '2024-03-24', 'Transferred'),
(40, 140, 1, '2024-03-25', 'Recovered'),
(41, 141, 2, '2024-03-26', 'Recovered'),
(42, 142, 3, '2024-03-27', 'Deceased'),
(43, 143, 1, '2024-03-28', 'Recovered'),
(44, 144, 2, '2024-03-29', 'Recovered'),
(45, 145, 3, '2024-03-30', 'Transferred'),
(46, 146, 1, '2024-03-31', 'Recovered'),
(47, 147, 2, '2024-04-01', 'Recovered'),
(48, 148, 3, '2024-04-02', 'Deceased'),
(49, 149, 1, '2024-04-03', 'Recovered'),
(50, 150, 2, '2024-04-04', 'Recovered');


INSERT INTO Item (itemid, itemname) VALUES
(1, 'Item A'),
(2, 'Item B'),
(3, 'Item C'),
(4, 'Item D'),
(5, 'Item E'),
(6, 'Item F'),
(7, 'Item G'),
(8, 'Item H'),
(9, 'Item I'),
(10, 'Item J'),
(11, 'Item K'),
(12, 'Item L'),
(13, 'Item M'),
(14, 'Item N'),
(15, 'Item O'),
(16, 'Item P'),
(17, 'Item Q'),
(18, 'Item R'),
(19, 'Item S'),
(20, 'Item T'),
(21, 'Item U'),
(22, 'Item V'),
(23, 'Item W'),
(24, 'Item X'),
(25, 'Item Y'),
(26, 'Item Z'),
(27, 'Item AA'),
(28, 'Item AB'),
(29, 'Item AC'),
(30, 'Item AD'),
(31, 'Item AE'),
(32, 'Item AF'),
(33, 'Item AG'),
(34, 'Item AH'),
(35, 'Item AI'),
(36, 'Item AJ'),
(37, 'Item AK'),
(38, 'Item AL'),
(39, 'Item AM'),
(40, 'Item AN'),
(41, 'Item AO'),
(42, 'Item AP'),
(43, 'Item AQ'),
(44, 'Item AR'),
(45, 'Item AS'),
(46, 'Item AT'),
(47, 'Item AU'),
(48, 'Item AV'),
(49, 'Item AW'),
(50, 'Item AX');

INSERT INTO LabReport (billingid, orderid, patientid, ipadmissionno, testname, parametername, resultvalue, unit, resultdatetime) VALUES
(1, 1, 1, 101, 'Blood Test', 'Hemoglobin', '13.5', 'g/dL', '2024-01-15 10:00:00'),
(2, 2, 2, 102, 'Blood Test', 'Hemoglobin', '12.8', 'g/dL', '2024-01-16 11:00:00'),
(3, 3, 3, 103, 'Urine Test', 'Protein', 'Negative', '', '2024-01-17 12:00:00'),
(4, 4, 4, 104, 'Urine Test', 'Glucose', 'Negative', '', '2024-01-18 13:00:00'),
(5, 5, 5, 105, 'X-Ray', 'Chest', 'Normal', '', '2024-01-19 14:00:00'),
(6, 6, 6, 106, 'X-Ray', 'Abdomen', 'Normal', '', '2024-01-20 15:00:00'),
(7, 7, 7, 107, 'CT Scan', 'Head', 'Normal', '', '2024-01-21 16:00:00'),
(8, 8, 8, 108, 'CT Scan', 'Chest', 'Normal', '', '2024-01-22 17:00:00'),
(9, 9, 9, 109, 'MRI', 'Brain', 'Normal', '', '2024-01-23 18:00:00'),
(10, 10, 10, 110, 'MRI', 'Spine', 'Normal', '', '2024-01-24 19:00:00'),
(11, 11, 11, 111, 'Blood Test', 'Hemoglobin', '13.1', 'g/dL', '2024-01-25 10:00:00'),
(12, 12, 12, 112, 'Blood Test', 'Hemoglobin', '14.2', 'g/dL', '2024-01-26 11:00:00'),
(13, 13, 13, 113, 'Urine Test', 'Protein', 'Negative', '', '2024-01-27 12:00:00'),
(14, 14, 14, 114, 'Urine Test', 'Glucose', 'Negative', '', '2024-01-28 13:00:00'),
(15, 15, 15, 115, 'X-Ray', 'Chest', 'Normal', '', '2024-01-29 14:00:00'),
(16, 16, 16, 116, 'X-Ray', 'Abdomen', 'Normal', '', '2024-01-30 15:00:00'),
(17, 17, 17, 117, 'CT Scan', 'Head', 'Normal', '', '2024-01-31 16:00:00'),
(18, 18, 18, 118, 'CT Scan', 'Chest', 'Normal', '', '2024-02-01 17:00:00'),
(19, 19, 19, 119, 'MRI', 'Brain', 'Normal', '', '2024-02-02 18:00:00'),
(20, 20, 20, 120, 'MRI', 'Spine', 'Normal', '', '2024-02-03 19:00:00'),
(21, 21, 21, 121, 'Blood Test', 'Hemoglobin', '13.0', 'g/dL', '2024-02-04 10:00:00'),
(22, 22, 22, 122, 'Blood Test', 'Hemoglobin', '13.9', 'g/dL', '2024-02-05 11:00:00'),
(23, 23, 23, 123, 'Urine Test', 'Protein', 'Negative', '', '2024-02-06 12:00:00'),
(24, 24, 24, 124, 'Urine Test', 'Glucose', 'Negative', '', '2024-02-07 13:00:00'),
(25, 25, 25, 125, 'X-Ray', 'Chest', 'Normal', '', '2024-02-08 14:00:00'),
(26, 26, 26, 126, 'X-Ray', 'Abdomen', 'Normal', '', '2024-02-09 15:00:00'),
(27, 27, 27, 127, 'CT Scan', 'Head', 'Normal', '', '2024-02-10 16:00:00'),
(28, 28, 28, 128, 'CT Scan', 'Chest', 'Normal', '', '2024-02-11 17:00:00'),
(29, 29, 29, 129, 'MRI', 'Brain', 'Normal', '', '2024-02-12 18:00:00'),
(30, 30, 30, 130, 'MRI', 'Spine', 'Normal', '', '2024-02-13 19:00:00'),
(31, 31, 31, 131, 'Blood Test', 'Hemoglobin', '13.4', 'g/dL', '2024-02-14 10:00:00'),
(32, 32, 32, 132, 'Blood Test', 'Hemoglobin', '14.0', 'g/dL', '2024-02-15 11:00:00'),
(33, 33, 33, 133, 'Urine Test', 'Protein', 'Negative', '', '2024-02-16 12:00:00'),
(34, 34, 34, 134, 'Urine Test', 'Glucose', 'Negative', '', '2024-02-17 13:00:00'),
(35, 35, 35, 135, 'X-Ray', 'Chest', 'Normal', '', '2024-02-18 14:00:00'),
(36, 36, 36, 136, 'X-Ray', 'Abdomen', 'Normal', '', '2024-02-19 15:00:00'),
(37, 37, 37, 137, 'CT Scan', 'Head', 'Normal', '', '2024-02-20 16:00:00'),
(38, 38, 38, 138, 'CT Scan', 'Chest', 'Normal', '', '2024-02-21 17:00:00'),
(39, 39, 39, 139, 'MRI', 'Brain', 'Normal', '', '2024-02-22 18:00:00'),
(40, 40, 40, 140, 'MRI', 'Spine', 'Normal', '', '2024-02-23 19:00:00'),
(41, 41, 41, 141, 'Blood Test', 'Hemoglobin', '13.2', 'g/dL', '2024-02-24 10:00:00'),
(42, 42, 42, 142, 'Blood Test', 'Hemoglobin', '13.7', 'g/dL', '2024-02-25 11:00:00'),
(43, 43, 43, 143, 'Urine Test', 'Protein', 'Negative', '', '2024-02-26 12:00:00'),
(44, 44, 44, 144, 'Urine Test', 'Glucose', 'Negative', '', '2024-02-27 13:00:00'),
(45, 45, 45, 145, 'X-Ray', 'Chest', 'Normal', '', '2024-02-28 14:00:00'),
(46, 46, 46, 146, 'X-Ray', 'Abdomen', 'Normal', '', '2024-02-29 15:00:00'),
(47, 47, 47, 147, 'CT Scan', 'Head', 'Normal', '', '2024-03-01 16:00:00'),
(48, 48, 48, 148, 'CT Scan', 'Chest', 'Normal', '', '2024-03-02 17:00:00'),
(49, 49, 49, 149, 'MRI', 'Brain', 'Normal', '', '2024-03-03 18:00:00'),
(50, 50, 50, 150, 'MRI', 'Spine', 'Normal', '', '2024-03-04 19:00:00');

INSERT INTO PatientDemographics (patientid, Name, dateofregistration, dateofbirth, gender, mobile, city, state) VALUES
(1, 'John Doe', '2024-01-15', '1985-05-15', 'Male', '1234567890', 'New York', 'NY'),
(2, 'Jane Smith', '2024-01-16', '1990-08-25', 'Female', '2345678901', 'Los Angeles', 'CA'),
(3, 'Robert Brown', '2024-01-17', '1975-02-10', 'Male', '3456789012', 'Chicago', 'IL'),
(4, 'Emily Davis', '2024-01-18', '1988-07-30', 'Female', '4567890123', 'Houston', 'TX'),
(5, 'Michael Wilson', '2024-01-19', '1982-11-22', 'Male', '5678901234', 'Phoenix', 'AZ'),
(6, 'Sarah Martinez', '2024-01-20', '1995-03-15', 'Female', '6789012345', 'Philadelphia', 'PA'),
(7, 'David Anderson', '2024-01-21', '1978-09-05', 'Male', '7890123456', 'San Antonio', 'TX'),
(8, 'Laura Johnson', '2024-01-22', '1987-12-10', 'Female', '8901234567', 'San Diego', 'CA'),
(9, 'James Lee', '2024-01-23', '1992-01-20', 'Male', '9012345678', 'Dallas', 'TX'),
(10, 'Jessica White', '2024-01-24', '1984-06-15', 'Female', '0123456789', 'San Jose', 'CA'),
(11, 'Daniel Harris', '2024-01-25', '1976-04-05', 'Male', '1234509876', 'Austin', 'TX'),
(12, 'Ashley Clark', '2024-01-26', '1989-11-30', 'Female', '2345609876', 'Jacksonville', 'FL'),
(13, 'Matthew Lewis', '2024-01-27', '1983-07-25', 'Male', '3456709876', 'San Francisco', 'CA'),
(14, 'Olivia Robinson', '2024-01-28', '1991-09-10', 'Female', '4567809876', 'Indianapolis', 'IN'),
(15, 'Christopher Walker', '2024-01-29', '1977-08-15', 'Male', '5678909876', 'Columbus', 'OH'),
(16, 'Megan Young', '2024-01-30', '1986-03-20', 'Female', '6789009876', 'Fort Worth', 'TX'),
(17, 'Andrew King', '2024-01-31', '1981-05-25', 'Male', '7890109876', 'Charlotte', 'NC'),
(18, 'Emma Hall', '2024-02-01', '1993-11-10', 'Female', '8901209876', 'Detroit', 'MI'),
(19, 'Joshua Allen', '2024-02-02', '1979-06-15', 'Male', '9012309876', 'El Paso', 'TX'),
(20, 'Samantha Wright', '2024-02-03', '1980-12-20', 'Female', '0123409876', 'Memphis', 'TN'),
(21, 'Alexander Scott', '2024-02-04', '1985-07-25', 'Male', '1234560987', 'Baltimore', 'MD'),
(22, 'Hannah Green', '2024-02-05', '1994-04-10', 'Female', '2345670987', 'Boston', 'MA'),
(23, 'Ryan Baker', '2024-02-06', '1987-10-15', 'Male', '3456780987', 'Milwaukee', 'WI'),
(24, 'Sophia Gonzalez', '2024-02-07', '1982-01-20', 'Female', '4567890987', 'Denver', 'CO'),
(25, 'Tyler Perez', '2024-02-08', '1978-08-25', 'Male', '5678900987', 'Seattle', 'WA'),
(26, 'Abigail Lee', '2024-02-09', '1989-03-30', 'Female', '6789010987', 'Nashville', 'TN'),
(27, 'Ethan Young', '2024-02-10', '1984-07-15', 'Male', '7890120987', 'Oklahoma City', 'OK'),
(28, 'Isabella Mitchell', '2024-02-11', '1991-11-25', 'Female', '8901230987', 'Las Vegas', 'NV'),
(29, 'Lucas Martinez', '2024-02-12', '1976-02-05', 'Male', '9012340987', 'Louisville', 'KY'),
(30, 'Grace Thomas', '2024-02-13', '1983-09-10', 'Female', '0123450987', 'Portland', 'OR'),
(31, 'Aiden Lee', '2024-02-14', '1988-04-20', 'Male', '1234567891', 'Tucson', 'AZ'),
(32, 'Natalie Harris', '2024-02-15', '1986-05-25', 'Female', '2345678902', 'Albuquerque', 'NM'),
(33, 'Jacob Robinson', '2024-02-16', '1975-07-30', 'Male', '3456789013', 'Sacramento', 'CA'),
(34, 'Chloe Clark', '2024-02-17', '1990-08-10', 'Female', '4567890124', 'Kansas City', 'MO'),
(35, 'Lucas Lewis', '2024-02-18', '1984-09-15', 'Male', '5678901235', 'Mesa', 'AZ'),
(36, 'Victoria Walker', '2024-02-19', '1993-11-05', 'Female', '6789012346', 'Atlanta', 'GA'),
(37, 'Henry King', '2024-02-20', '1981-12-10', 'Male', '7890123457', 'Omaha', 'NE'),
(38, 'Ella Hill', '2024-02-21', '1989-01-20', 'Female', '8901234568', 'Raleigh', 'NC'),
(39, 'Jack Adams', '2024-02-22', '1978-03-30', 'Male', '9012345679', 'Miami', 'FL'),
(40, 'Amelia Thompson', '2024-02-23', '1986-05-25', 'Female', '0123456780', 'Oakland', 'CA'),
(41, 'Oliver Baker', '2024-02-24', '1980-07-15', 'Male', '1234509871', 'Tulsa', 'OK'),
(42, 'Zoe Davis', '2024-02-25', '1994-09-25', 'Female', '2345609872', 'Minneapolis', 'MN'),
(43, 'William Scott', '2024-02-26', '1987-11-30', 'Male', '3456709873', 'Arlington', 'TX'),
(44, 'Emily Harris', '2024-02-27', '1983-02-05', 'Female', '4567809874', 'New Orleans', 'LA'),
(45, 'James Turner', '2024-02-28', '1988-03-15', 'Male', '5678909875', 'Wichita', 'KS'),
(46, 'Sophia Lee', '2024-03-01', '1991-04-25', 'Female', '6789009876', 'Cleveland', 'OH'),
(47, 'David Young', '2024-03-02', '1979-06-30', 'Male', '7890109877', 'Bakersfield', 'CA'),
(48, 'Mia Martinez', '2024-03-03', '1985-08-10', 'Female', '8901209878', 'Aurora', 'CO'),
(49, 'Jackson Harris', '2024-03-04', '1981-10-25', 'Male', '9012309879', 'Anaheim', 'CA'),
(50, 'Lily Clark', '2024-03-05', '1986-12-05', 'Female', '0123409870', 'Honolulu', 'HI');


INSERT INTO SERVICE (serviceid, servicename) VALUES
(1, 'Consultation'),
(2, 'X-Ray'),
(3, 'MRI'),
(4, 'CT Scan'),
(5, 'Ultrasound'),
(6, 'Blood Test'),
(7, 'Urine Test'),
(8, 'ECG'),
(9, 'Echo'),
(10, 'Treadmill Test'),
(11, 'Holter Monitoring'),
(12, 'Endoscopy'),
(13, 'Colonoscopy'),
(14, 'Biopsy'),
(15, 'Dialysis'),
(16, 'Chemotherapy'),
(17, 'Radiotherapy'),
(18, 'Physiotherapy'),
(19, 'Occupational Ther'),
(20, 'Speech Therapy'),
(21, 'Dietary Consult'),
(22, 'Vaccination'),
(23, 'Minor Surgery'),
(24, 'Major Surgery'),
(25, 'Emergency Serv'),
(26, 'Inpatient Care'),
(27, 'Outpatient Care'),
(28, 'Home Care'),
(29, 'Telemedicine'),
(30, 'Ambulance Serv'),
(31, 'Blood Donation'),
(32, 'Organ Donation'),
(33, 'Prenatal Care'),
(34, 'Postnatal Care'),
(35, 'Pediatric Care'),
(36, 'Geriatric Care'),
(37, 'Mental Health'),
(38, 'Substance Abuse'),
(39, 'Family Planning'),
(40, 'HIV/AIDS Serv'),
(41, 'Diabetes Care'),
(42, 'Hypertension Mgmt'),
(43, 'Asthma Management'),
(44, 'Allergy Testing'),
(45, 'Immunology Serv'),
(46, 'Neonatal Care'),
(47, 'Oncology Serv'),
(48, 'Cardiology Serv'),
(49, 'Neurology Serv'),
(50, 'Orthopedic Serv')

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Questions -- Write a query for below:
--Top 5 centers based on patient registration for the period Jan 2021 to Dec 2022.

--SELECT TOP 5 *FROM DBO.BILLING
SELECT TOP 5 *FROM DBO.CENTRE
SELECT TOP 5 *FROM IPADMISSION
SELECT TOP 5 *FROM PATIENTDEMOGRAPHICS

SELECT *FROM CENTRE
SELECT *FROM PATIENTDEMOGRAPHICS

SELECT TOP 5 C.CENTRENAME
FROM  PATIENTDEMOGRAPHICS PD
JOIN IPADMISSION AS IP ON PD.PATIENTID = IP.PATIENTID 
JOIN CENTRE AS C ON IP.CENTREID = C.CENTREID
WHERE DATEOFREGISTRATION BETWEEN '2021-01-01' AND '2022-12-31'
ORDER BY DATEOFREGISTRATION DESC

--Top 5 departments based on No. of OPD consultations across centers for the period Jan2021 toNDec 2022.

SELECT *FROM DEPARTMENTS
SELECT *FROM DOCTORDETAIL
SELECT *FROM BILLING

SELECT TOP 5 DEPARTMENTNAME 
FROM DEPARTMENTS AS D
JOIN BILLING  AS B ON D.DEPARTMENTID = B.DEPARTMENTID
WHERE PATIENTTYPE='OUTPATIENT' 
AND BILLINGDATEANDTIME BETWEEN '2021-01-01' AND '2022-12-31' 

--Top 5 services based on a) Revenue b) No of billing

SELECT *FROM SERVICE
SELECT *FROM BILLING

SELECT TOP 5 S.SERVICENAME
FROM SERVICE AS S
JOIN BILLING AS B ON S.SERVICEID = B.SERVICEID
ORDER BY B.GROSSAMOUNT DESC

----5. Top 5 department based on a) No of Patient taking service b) Based on revenue

SELECT *FROM DEPARTMENTS

SELECT *FROM SERVICE
SELECT *FROM BILLING

SELECT TOP 5 DEPARTMENTNAME
FROM SERVICE S
JOIN BILLING B ON S.SERVICEID = B.SERVICEID
JOIN DEPARTMENTS D ON B.DEPARTMENTID = D.DEPARTMENTID


--7 Write a query to find count of patient across all the yeards by centres who's discharge status was 'Dead' 

SELECT *FROM IPDISCHARGE
SELECT *FROM CENTRE

SELECT COUNT(*)
FROM IPDISCHARGE ID
JOIN CENTRE C ON ID.CENTREID = C.CENTREID
WHERE DISCHARGESTATUS ='DEAD'

--8  Average length of stay in days

SELECT *FROM IPADMISSION
SELECT *FROM IPDISCHARGE

SELECT AVG(DATEDIFF(DAY,DATEOFDISCHARGE,DATEOFADMISSION))AS LENGTHOFSTAY
FROM IPADMISSION AS IA
JOIN IPDISCHARGE AS ID ON IA.PATIENTID =ID.PATIENTID

--9 --Top 50 tests based on no of tests done for each year

SELECT *FROM LABREPORT
SELECT TOP 50 LR.TESTNAME 
FROM LABREPORT LR
JOIN BILLING B ON LR.BILLINGID = LR.BILLINGID

--10  Top 10 packages based on revenue for each centre for each year

SELECT *FROM BILLING
SELECT *FROM CENTRE

SELECT TOP 10 B.PACKAGEPROFILEID
FROM BILLING B
JOIN CENTRE C ON B.CENTREID = B.CENTREID
ORDER BY B.GROSSAMOUNT






