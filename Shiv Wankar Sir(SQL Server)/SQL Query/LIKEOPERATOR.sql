--LIKE OPERATOR
DROP TABLE [dbo].[MatchEmail]
CREATE TABLE [dbo].[MatchEmail](
 [Flat File Source.CustomerKey] [varchar](50) NULL,
 [Flat File Source.FirstName] [varchar](50) NULL,
 [Flat File Source.MiddleName] [varchar](50) NULL,
 [Flat File Source.LastName] [varchar](50) NULL,
 [BirthDate] [varchar](50) NULL,
 [Gender] [varchar](50) NULL,
 [EmailAddress] [varchar](50) NULL,
 [Lookup.FirstName] [varchar](50) NULL,
 [Lookup.MiddleName] [varchar](50) NULL,
 [Lookup.LastName] [varchar](50) NULL,
 [Lookup.CustomerKey] [varchar](50) NULL
) 


INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11000', N'Jon', N'V', N'Yang', N'10/6/1971', N'M', N'jon24@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11001', N'Eugene', N'L', N'Huang', N'5/10/1976', N'M', N'eugene10@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11002', N'Ruben', N'NULL', N'Torres', N'2/9/1971', N'M', N'ruben35@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11003', N'Christy', N'NULL', N'Zhu', N'8/14/1973', N'F', N'christy12@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11004', N'Elizabeth', N'NULL', N'Johnson', N'8/5/1979', N'F', N'elizabeth5@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11006', N'Janet', N'G', N'Alvarez', N'12/2/1976', N'F', N'janet9@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11007', N'Marco', N'NULL', N'Mehta', N'11/6/1969', N'M', N'marco14@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11008', N'Rob', N'NULL', N'Verhoff', N'7/4/1975', N'F', N'rob4@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11009', N'Shannon', N'C', N'Carlson', N'9/29/1969', N'M', N'shannon38@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11010', N'Jacquelyn', N'C', N'Suarez', N'8/5/1969', N'F', N'jacquelyn20@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11011', N'Curtis', N'NULL', N'Lu', N'5/3/1969', N'M', N'curtis9@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11012', N'Lauren', N'M', N'Walker', N'1/14/1979', N'F', N'lauren41@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11013', N'Ian', N'M', N'Jenkins', N'8/3/1979', N'M', N'ian47@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11014', N'Sydney', N'NULL', N'Bennett', N'11/6/1973', N'F', N'sydney23@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11015', N'Chloe', N'NULL', N'Young', N'8/26/1984', N'F', N'chloe23@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11016', N'Wyatt', N'L', N'Hill', N'10/25/1984', N'M', N'wyatt32@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11017', N'Shannon', N'NULL', N'Wang', N'12/24/1949', N'F', N'shannon1@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11022', N'Ethan', N'G', N'Zhang', N'4/10/1984', N'M', N'ethan20@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11023', N'Seth', N'M', N'Edwards', N'4/9/1984', N'M', N'seth46@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11024', N'Russell', N'NULL', N'Xie', N'3/16/1984', N'M', N'russell7@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11025', N'Alejandro', N'NULL', N'Beck', N'6/22/1951', N'M', N'alejandro45@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11026', N'Harold', N'NULL', N'Sai', N'10/1/1951', N'M', N'harold3@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11027', N'Jessie', N'R', N'Zhao', N'6/5/1952', N'M', N'jessie16@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11028', N'Jill', N'NULL', N'Jimenez', N'10/9/1951', N'F', N'jill13@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11029', N'Jimmy', N'L', N'Moreno', N'6/19/1952', N'M', N'jimmy9@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11030', N'Bethany', N'G', N'Yuan', N'2/18/1958', N'F', N'bethany10@Gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11032', N'Denise', N'NULL', N'Stone', N'12/8/1952', N'F', N'denise10@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11033', N'Jaime', N'NULL', N'Nath', N'9/19/1958', N'M', N'jaime41@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11034', N'Ebony', N'NULL', N'Gonzalez', N'12/16/1952', N'F', N'ebony19@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11035', N'Wendy', N'NULL', N'Dominguez', N'8/23/1953', N'F', N'wendy12@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11036', N'Jennifer', N'C', N'Russell', N'6/16/1984', N'F', N'jennifer93@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11037', N'Chloe', N'M', N'Garcia', N'5/27/1983', N'F', N'chloe27@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11038', N'Diana', N'F', N'Hernandez', N'9/20/1953', N'F', N'diana2@Outlook.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11043', N'Nathan', N'M', N'Simmons', N'8/23/1981', N'M', N'nathan11@Hotmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11044', N'Adam', N'L', N'Flores', N'11/21/1954', N'M', N'adam10@Hotmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11047', N'Jaclyn', N'D', N'Lu', N'8/27/1955', N'F', N'jaclyn12@Hotmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11048', N'Jeremy', N'NULL', N'Powell', N'5/21/1956', N'M', N'jeremy26@Hotmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11049', N'Carol', N'C', N'Rai', N'1/15/1986', N'F', N'carol8@Hotmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11008', N'Rob', N'NULL', N'Verhoff', N'7/4/1975', N'F', N'rob4@adventure-works.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MatchEmail] ([Flat File Source.CustomerKey], [Flat File Source.FirstName], [Flat File Source.MiddleName], [Flat File Source.LastName], [BirthDate], [Gender], [EmailAddress], [Lookup.FirstName], [Lookup.MiddleName], [Lookup.LastName], [Lookup.CustomerKey]) VALUES (N'11022', N'Ethan', N'G', N'Zhang', N'4/10/1984', N'M', N'ethan20@Gmail.com', NULL, NULL, NULL, NULL)
GO

SELECT *FROM DBO.MATCHEMAIL

--SQL LIKE OPERATOR
--LIKE IS USED TO FILTER THE DATA WITH PATTERN OR SEARCH A SPECIFIC PATTERN IN COLUMN

--SQL WILDCARD CHARACTERS
--TO SUBSTITUTE ONE OR MORE CHARACTERS IN A STRING
--WILDCARD CHARACTERS ARE USED WITH THE LIKE OPERATOR
--LIKE OPERATOR IS BAD IN PERFORMANCE.
--LIKE OPERATOR IS USED IN WHERE CLAUSE TO SEARCH FOR A SPECIFIED PATTERN IN A COLUMN

% - TO REPRESENT O OR MORE CHARACTERS. EG: bl% finds BL,BLACK,BLUE,AND BLO

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE 'E%'.........STARTS WITH E AND O OR ANY NUMBER OF CHARACTERS THEREAFTER.

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE '%E'.........STARTS WITH 0 OR ANY CHARACTERS BEFORE IT ENDS WITH E.

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE '%E'
AND [FLAT FILE SOURCE.LASTNAME] LIKE '%G'

--STARTING WITH N AND ENDING WITH N
SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE 'N%N'

--_ (UNDERSCORE) REPRESENTS A SINGLE CHARACTER H_T FINDS HOT,HAT AND HIT
--EACH UNDERSCORE REPRESENTS A SINGLE CHARACTER
SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE '_O_'

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE 'M_R%'

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE '%O_' .......O AS THE SECOND LAST CHARACTER

SELECT *FROM DBO.MATCHEMAIL WHERE EMAILADDRESS LIKE '%@YAHOO.COM'
LIKE '%@HOTMAIL.COM'

--FOR VALID EMAIL
SELECT *FROM DBO.MATCHEMAIL WHERE EMAILADDRESS LIKE '%@HOTMAIL.COM'

--FOR INVALID EMAIL
SELECT *FROM DBO.MATCHEMAIL WHERE EMAILADDRESS NOT LIKE '%@%.COM'

--[]-REPRESENTS ANY SINGLE CHARACTER WITHIN THE BRACKETS
--H[OA]T FINDS HOT AND HAT BUT NOT HIT
--USED FOR FINDING ALPHANUMERIC VALUE IN A COLUMN

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE 'A[OE]%'

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.CUSTOMERKEY] LIKE '[ABCDEF]%'

-- ^ - REPRESENTS ANY CHARACTER NOT IN THE BRACKETS H[^OA]T FINDS HIT BUT NOT HOT AND HAT
SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE 'R[^OEABA]%' ...SECOND CHARACTER SHOULD NOT BE ANYTHING FROM BRACKET

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE 'R[^OEABA] [^OEABA]%' ...SECOND AND THIRD CHARACTER SHOULD NOT BE ANYTHING FROM BRACKET

--[] USED TO FIND  ONE CHARACTER  ONLY.

/* - REPRESENTS ANY SINGLE CHARACTER WITHIN THE SPECIFIED RANGE
C[A-B]T FINDS CAT AND CB*/
--REPRESENTS SINGLE CHARACTER BUT WITH A SPECIFIC RANGE

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME]LIKE 'R[-]%'

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE '[A-Z]%'

SELECT *FROM DBO.MATCHEMAIL WHERE [FLAT FILE SOURCE.FIRSTNAME] LIKE '_%'

--REAL WORLD - TO FIND CHARACTERS THAT ARE ENTERED INTO NUMERIC COLUMN.

UPDATE DBO.MATCHEMAIL 
SET [FLAT FILE SOURCE.CUSTOMERKEY] = '11015B'
WHERE [FLAT FILE SOURCE.CUSTOMERKEY] = '11015'

UPDATE DBO.MATCHEMAIL 
SET [FLAT FILE SOURCE.CUSTOMERKEY] = '11015B'
WHERE [FLAT FILE SOURCE.CUSTOMERKEY] = '11015'

1a345
a2345
12345
12345
How can we find out the mistake here sir?