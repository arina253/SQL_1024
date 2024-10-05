--SQL SERVER FUNCTIONS
EXPAND PROGRAMMABILITY - GET FUNCTIONS TAB - WE GET DIFFERENT TYPES OF FUNCTIONS

--SQL SERVER STRING FUNCTIONS

--EVERY APPLICATION,WHERE TRANSACTION IS GOING, DATA IS CREATED, FETCH DATA FROM SOURCE

--OLTP: ONLINE TRANSACTION PROCESSING -REAL TIME DATA THAT IS INSERTED, UPDATED, DELETED EVERY DAY
--OLAP: ONLINE ANALYTICAL PROCESSING - DATA USED FOR ANALYSIS. FOR GENERATING REPORT FOR ANALYSIS, OLAP IS USED.

--SSIS,POWERBI ARE OLAP.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM [AdventureWorks2022].[Person].[Person]

1. ASCII - Return the ASCII value of the first character in "Shivraj":

SELECT ASCII('Thursday') AS NumCodeOfFirstChar 

2. CHAR - The CHAR() function returns the character based on the ASCII code.

Syntax : CHAR(code)

Example : SELECT CHAR(65) AS CodeToCharacter;
SELECT CHAR(84) AS CodeToCharacter;

The DATALENGTH() function returns the number of bytes used to represent an expression.
Note: The DATALENGTH() function counts both leading and trailing spaces when calculating the 
length of the expression.
Syntax : DATALENGTH(expression)
Example : 
SELECT DATALENGTH('   Shivraj   ') AS CharacterLength -- LEADING & TRAILING BOTH SPACES CONSIDERED
SELECT LEN('   Shivraj   ') AS CharacterLength		  -- ONLY LEADING SPACES CONSIDERED

The LOWER() function converts a string to lower-case.
Syntax : LOWER(text)
SELECT lower('SHIVRAJ') AS CharacterLength
SELECT DISTINCT FIRSTNAME, LASTNAME FROM [Person].[Person]
SELECT DISTINCT lower(FIRSTNAME), lower(LASTNAME) FROM [Person].[Person]

The UPPER() function converts a string to Upper-case.
Syntax : Upper(Text)
SELECT upper('Shivraj') AS CharacterLength
SELECT DISTINCT TOP 5 FIRSTNAME, LASTNAME FROM [Person].[Person]
SELECT DISTINCT TOP 5 Upper(FIRSTNAME), Upper(LASTNAME) FROM [Person].[Person]

The RIGHT() function extracts a number of characters from a string starting from right.
The LEFT() function extracts a number of characters from a string starting from left.

Syntax : 
RIGHT(string, number_of_chars) and 
Left(string, number_of_chars)

SELECT RIGHT('Shivraj',3)
SELECT EMAILADDRESS FROM [Person].EmailAddress

SELECT * FROM [Person].EmailAddress WHERE RIGHT(EMAILADDRESS,4) <> '.com'
SELECT * FROM [Person].EmailAddress WHERE RIGHT(EMAILADDRESS,4) NOT LIKE '%.com'

Example : SELECT LEFT(Name,3),Name, right(Name,2) FROM Departments

SELECT LEFT('Shivraj',1)

SELECT EMAILADDRESS, LEFT(EMAILADDRESS,CHARINDEX('@',EMAILADDRESS)-1) 
FROM [Person].EmailAddress 

SELECT EMAILADDRESS, LEFT(EMAILADDRESS,5) 
FROM [Person].EmailAddress 

SELECT * FROM [Person].EmailAddress WHERE RIGHT(EMAILADDRESS,4) NOT LIKE '%.com'

The LTRIM() function removes leading spaces from a string.
The RTRIM() function removes trailing spaces from a string.
The TRIM() function removes the space character OR other specified characters from the start or end of 
a string.

By default, the TRIM() function removes leading and trailing spaces from a string.
Syntax : TRIM([characters FROM ]string) or LTRIM([characters FROM ]string)
Example : SELECT trim(' SQL Tutorial! ') AS TrimmedString;

SELECT DATALENGTH(LTRIM(' SQL Tutorial! ')) REMOVESPACE,DATALENGTH(' SQL Tutorial! ') WITHSPACE
SELECT DATALENGTH(RTRIM(' SQL Tutorial! ')) REMOVESPACE,DATALENGTH(' SQL Tutorial! ') WITHSPACE
SELECT DATALENGTH(TRIM(' SQL Tutorial! ')) REMOVESPACE,DATALENGTH(' SQL Tutorial! ') WITHSPACE

SELECT * FROM [Person].PERSON WHERE TRIM(MIDDLENAME) = 'M'
SELECT * FROM [Person].PERSON WHERE MIDDLENAME = 'M'

--UPDATE  [Person].PERSON SET MIDDLENAME = '  M' WHERE MIDDLENAME = 'M'

The REPLACE() function replaces all occurrences of a substring within a string, with a new substring.
Note: The search is case-insensitive.
Syntax : REPLACE(string, old_string, new_string)

SELECT 'SQL Tutorial'
SELECT REPLACE('SQL Tutorial','Tutorial','Classes')

SELECT * FROM [Person].EmailAddress

SELECT EmailAddress,REPLACE(EmailAddress,'@adventure-works.com','@yahoo.com') ReplacedEmail 
FROM [Person].EmailAddress

SELECT EmailAddress,REPLACE(EmailAddress,RIGHT(EmailAddress,(LEN(EmailAddress) - CHARINDEX('@',EmailAddress)-1)),'@gmail.com') ReplacedEmail 
FROM [Person].EmailAddress

--SELECT EmailAddress,RIGHT(EmailAddress,CHARINDEX('@',EmailAddress)),CHARINDEX('@',EmailAddress) FROM [Person].EmailAddress

The SUBSTRING() function extracts some characters from a string.
Syntax : SUBSTRING(string, start, length)
Example : SELECT SUBSTRING(NAME,1,8),NAME FROM Departments

SELECT SUBSTRING('SHIVRAJ',3,4)

SELECT EmailAddress,
REPLACE(EmailAddress,SUBSTRING(EmailAddress,CHARINDEX('@',EmailAddress),LEN(EmailAddress)-CHARINDEX('@',EmailAddress)+1),'@gmail.com') ReplacedEmail 
FROM [Person].EmailAddress

SELECT EmailAddress,SUBSTRING(EmailAddress,CHARINDEX('@',EmailAddress),LEN(EmailAddress)-CHARINDEX('@',EmailAddress)+1) FROM [Person].EmailAddress
WHERE BusinessEntityID IN (4,5,6,7,9)

SELECT LEN(EmailAddress)-CHARINDEX('@',EmailAddress)+1 FROM [Person].EmailAddress
SELECT  CHARINDEX('@',EmailAddress) FROM [Person].EmailAddress
SELECT SUBSTRING('ken0@adventure-works.com',5,20)
SELECT * FROM [Person].EmailAddress

UPDATE [Person].EmailAddress
SET EmailAddress = REPLACE(EmailAddress,'@adventure-works.com','@yahoo.com')
WHERE BusinessEntityID IN (4,5,6)

The REPLICATE() function repeats a string a specified number of times.
Syntax : REPLICATE(string, integer)
Example : SELECT REPLICATE(CustomerName, 2)FROM Customers

SELECT REPLICATE('SHIVRAJ',5)

The STUFF() function deletes a part of a string and then inserts another part into the string, starting at 
a specified position.
Syntax : STUFF(string, start, length, new_string)

String --> Column values in which you want to replace/delete values
start	--> Starting position in string, 
length	--> Number of characters to delete
new_string --> New values to replace in place of deleted value

Example : SELECT STUFF('SQL Tutorial!', 5, 8, ' is fun!')

SELECT STUFF('SQL Tutorial!', 9, 3, 'Class')

The PATINDEX() function returns the position of a pattern in a string.
If the pattern is not found, this function returns 0.
Note: The search is case-insensitive and the first position in string is 1.
Syntax : PATINDEX(%pattern%, string)
Example : 
SELECT PATINDEX('%schools%', 'W3Schools.com');
SELECT PATINDEX('%3%com%', 'W3Schools.com');

SELECT EmailAddress, PATINDEX('%yahoo.com%',EmailAddress) FROM [Person].EmailAddress
ORDER BY BusinessEntityID

SELECT * FROM [Person].EmailAddress
WHERE PATINDEX('%yahoo.com%',EmailAddress) = 0

The SOUNDEX() function accepts a string and converts it to a four-character code based on how the 
string sounds when it is spoken.

SELECT SOUNDEX('Lenovo')

The DIFFERENCE() function compares two SOUNDEX values, and returns an integer. The integer value 
indicates the match for the two SOUNDEX values, from 0 to 4.
0 indicates weak or no similarity between the SOUNDEX values. 4 indicates strong similarity or identically 
SOUNDEX values.

SELECT DIFFERENCE('Lenovo','MAX')