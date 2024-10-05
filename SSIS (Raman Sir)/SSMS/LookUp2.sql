SELECT TOP 10 *FROM ORDERS$ ------ CONTAIN ALL ORDERS
SELECT TOP 10 *FROM RETURNS$------- CONTAIN RETURN ORDER ID

SELECT *FROM RETURNS$ WHERE [ORDER ID] = 'CA-2017-153822'
SELECT *FROM ORDERS$ WHERE [ORDER ID] = 'CA-2017-153822'


--TO KNOW ALL 592 ROWS OF ORDER DETAILS PLACED IN RETURN TABLE

--ALL RETURN TABLE ORDER DETAILS
--how many orders are placed by the customer that is returned by the user?

--FIRST WAY
SELECT *FROM RETURNS$ AS R
JOIN ORDERS$ AS O
ON R.[ORDER ID] = O.[ORDER ID]

--COMBINING TWO TABLES.RETURN TABLE IS A FIRST OR MAIN TABLE AND ORDER$ IS A SECOND TABLE.
--RETURN TABLE HAS 592 ROWS
--MULTIPLE ORDERS LYING IN THE ORDER TABLE,SO WE GET 1600 ROWS.

--SECOND WAY
SELECT *FROM RETURNS$ AS R
 INNER JOIN ORDERS$ AS O
ON R.[ORDER ID] = O.[ORDER ID]
--IF JOIN IS ONLY MENTIONED, IT REFERS TO INNER JOIN ONLY.

--THIRD WAY --JUST SWITCHING THE POSITION
SELECT *FROM RETURNS$ AS R
 INNER JOIN ORDERS$ AS O
ON O.[ORDER ID] = R.[ORDER ID]

--CREATE THE SOLUTION IN SSIS.

--IN THE LOOKUP WE ALWAYS NEED 2 TABLES
MAIN TABLE
LOOKUP TABLE

how many orders are placed by the customer that is returned by the user?

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CONDITION 1: ORDERS THAT ARE RETURNED BY THE USER
SELECT *FROM ORDERS$ AS O
JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]

--CONDITION 2: ORDER DETAILS THAT ARE  NEVER RETURNED BY THE USER

--HINT: ORDER ID PRESENT IN THE ORDER TABLE BUT NOT PRESENT IN THE RETURN TABLE

SELECT *FROM RETURNS$
SELECT *FROM ORDERS$ AS O
JOIN RETURNS$ AS R
ON O.[ORDER ID] <> R.[ORDER ID]..--5914848 ROWS........THIS SOLUTION IS WRONG

--WE NEED THE PORTION THAT IS AVAILABLE IN ORDER TABLE ONLY BUT NOT IN RETURN TABLE

SELECT *FROM ORDERS$ AS O
LEFT JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]
WHERE R.[ORDER ID] IS NULL
--ALL THE VALUES OF LEFT SIDE TABLE ie.ORDERS$ WHETHER THAT HAVE MATCHING RECORD OR NOT.
--LEFT SIDE TABLE IS ORDERS$ AND RIGHT SIDE TABLE IS RETURNS$.
--FIRST WE GOT ALL VALUES FROM ORDERS$ AND THEN ELIMINATE MATCHING RECORDS FROM BOTH TABLE

SELECT *FROM RETURNS$ 
WHERE [ORDER ID] ='CA-2016-152156'

SELECT *FROM ORDERS$ 
WHERE [ORDER ID] ='CA-2016-152156'

--WE HAVE ENTRY IN THE ORDERS$ TABLE BUT NOT IN THE RETURN$ TABLE

--CONDITION 3:  DISPLAY CUSTOMER NAME WITH TOTAL NUMBER OF RETURN ORDERS


SELECT *FROM ORDERS$ WHERE [CUSTOMER NAME] = 'CLAIRE GUTE'
SELECT *FROM RETURNS$ WHERE [ORDER ID] IN ('US-2015-123918','CA-2017-164098','CA-2016-152156')

CLAIRE GUTE  |  0

SELECT O.[CUSTOMER NAME],COUNT(R.[ORDER ID]) AS RETURNEDORDERS
FROM ORDERS$ AS O
LEFT JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]
--WHERE [CUSTOMER NAME] = 'CLAIRE GUTE'
GROUP BY O.[CUSTOMER NAME]
--HAVING COUNT(R.[ORDER ID])<>0

--CUSTOMER LIST WHO NEVER RETURNED ANY ORDER

--IF THE CUSTOMER DIDN'T RETURN WE GET NULL

--CONDITION 4: TO KNOW TOTAL NUMBER OF ORDERS PLACED BY THE CUSTOMER??

SELECT O.[CUSTOMER NAME],COUNT(R.[ORDER ID]) AS RETURNEDORDERS,COUNT(O.[ORDER ID]) AS TOTALORDERS
FROM ORDERS$ AS O
LEFT JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]
--WHERE [CUSTOMER NAME] = 'CLAIRE GUTE'
GROUP BY O.[CUSTOMER NAME]

Order ID	Customer Name
7	Greg Guthrie
3	Thomas Thornton
3	Luke Schmidt
2	Stuart Calhoun
1	Allen Goldenen
5	Marc Harrigan
5	Bruce Stewart
4	Rick Reed
3	Raymond Buch
3	Corey Catlett
4	Juliana Krohn
2	Chad McGuire
1	Troy Blackwell
3	Duane Noonan
1	Jason Klamczynski
3	Fred McMath
2	Henia Zydlo
4	Adrian Barton
3	Mike Pelletier
5	Guy Armstrong
2	Deborah Brumfield
2	Anna Gayman
3	Joy Daniels
3	Saphhira Shifley
2	Beth Paige
1	Maribeth Schnelling
2	Edward Becker
3	Joseph Holt
10	Dan Reichenbach
1	Robert Dilbeck
1	Larry Hughes
7	Ken Black
2	Lena Hernandez
3	Zuschuss Donatelli
9	Brosina Hoffman
1	Anthony Jacobs
7	Dave Hallsten
2	Bart Watters
2	Barry Pond
1	Sara Luxemburg
1	Larry Tron
4	Nat Gilpin
3	Stephanie Phelps
3	Kunst Miller
5	Nick Zandusky
6	Jay Kimmel
4	Dianna Vittorini
6	Joni Blumstein
6	Theresa Swint
1	Ben Wallace
2	Michael Grace
3	Liz Willingham
1	Doug O'Connell
14	Seth Vernon
2	Roland Fjeld
1	Christy Brittain
3	Marina Lichtenstein
4	Chuck Clark
6	Pamela Stobb
3	Russell Applegate
6	Sanjit Chand
10	Clay Ludtke
6	Jamie Kunitz
4	Chris Cortes
2	Carl Weiss
2	Eric Murdock
5	Brian Dahlen
3	Dean Braden
1	Denny Joy
5	Patrick Bzostek
2	Sung Pak
3	Bill Eplett
1	Lindsay Shagiari
1	Vivek Sundaresam
2	Ruben Dartt
6	Luke Foster
5	Mike Kennedy
1	Sue Ann Reed
3	Craig Carroll
1	Benjamin Venier
1	Ken Dana
3	Shui Tom
2	Craig Yedwab
2	Clay Cheatham
1	Bruce Degenhardt
3	Cathy Prescott
1	Anna Andreadi
1	Bill Donatelli
5	Christine Kargatis
5	Barry Franz
3	Henry Goldwyn
3	Lisa Ryan
5	Jack Lebron
2	John Stevenson
2	Marc Crier
2	Alejandro Savely
1	Amy Hunt
4	Nona Balk
1	Helen Wasserman
8	Resi Pölking
4	Charles Crestani
1	Mark Hamilton
2	Beth Thompson
5	Erin Ashbrook
2	Heather Kirkland
2	Ed Jacobs
3	Sally Hughsby
7	Natalie Webber
1	Bill Tyler
4	Maureen Fritzler
3	Jennifer Patt
4	Harold Ryan
1	Shahid Shariari
1	Carol Triggs
1	Emily Ducich
5	Bradley Talbott
2	Logan Haushalter
1	Susan Pistek
1	Jill Stevenson
1	Eileen Kiefer
3	Erin Smith
3	Andrew Gjertsen
2	Richard Bierner
1	John Grady
2	John Lee
6	Michelle Tran
10	Stefania Perrino
1	Heather Jas
7	Adrian Hane
2	David Smith
4	John Murray
11	William Brown
1	Fred Hopkins
2	Greg Hansen
1	Rob Lucas
2	Tamara Chand
4	Zuschuss Carroll
8	Andy Yotov
1	Sarah Jordon
3	Duane Benoit
2	Helen Abelman
2	Katherine Murray
2	Naresj Patel
3	Ralph Arnett
1	Gene McClure
2	Dario Medina
1	Christina Anderson
4	Lena Cacioppo
4	Darren Budd
3	Julia Barnett
1	Noel Staavos
1	Benjamin Patterson
1	Sonia Sunley
4	Arthur Gainer
4	Logan Currie
6	Deanra Eno
1	Steven Roelle
4	Philisse Overcash
6	Lena Radford
7	Thomas Seio
2	Julie Prescott
3	Neoma Murray
1	Steven Cartwright
1	Ionia McGrath
3	Jay Fein
4	Eugene Moren
2	Arthur Prichep
2	Steven Ward
2	Evan Henry
4	Bradley Nguyen
1	Lori Olson
1	Sean Miller
3	Jim Sink
1	Alejandro Ballentine
5	Tanja Norvell
5	Victoria Wilson
7	Patrick Ryan
6	Eugene Hildebrand
2	Phillina Ober
7	Anna Häberlin
2	Ken Heidel
3	Brian Derr
2	Emily Burns
3	Dave Brooks
1	Eric Hoffmann
6	Hilary Holden
2	Brian Moss
1	Chris McAfee
1	Erica Hernandez
5	Laurel Workman
1	Penelope Sewall
5	Carlos Daly
5	Justin MacKendrick
2	Rick Bensley
2	Michael Nguyen
2	Grace Kelly
1	Matt Connell
1	Philip Brown
1	Matthew Clasen
11	Anthony Johnson
3	Magdelene Morse
9	Lena Creighton
2	Roland Schwarz
2	Sean O'Donnell
6	Berenike Kampe
1	Corey Roper
5	Linda Southworth
1	Dorris liebe
3	Xylona Preis
3	Edward Hooks
3	Craig Carreira
1	Amy Cox
5	Cari Sayre
2	Helen Andreada
5	Mark Van Huff
2	Andy Reiter
7	Darrin Martin
2	Roland Murray
1	Matt Hagelstein
1	Yoseph Carroll
5	Maribeth Yedwab
2	Joel Eaton
3	Greg Matthias
5	Mark Haberlin
9	Sandra Glassco
7	Rick Wilson
1	Tracy Collins
3	Muhammed MacIntyre
4	Rob Dowd
1	Ivan Gibson
2	Karen Bern
1	Toby Carlisle
4	Laurel Beltran
7	Cynthia Voltz
13	Ted Butterfield
1	Frank Preis
1	Pete Kriz
1	Mitch Willingham
6	Carlos Soltero
2	Erica Bern
8	Joe Elijah
3	Kristina Nunn
6	Valerie Dominguez
1	Justin Hirsh
5	Patrick Gardner
1	Jonathan Howell
1	Alan Schoenberger

--TRY IN SSIS WITH AND WITHOUT LOOKUP.

--MERGE JOIN
--INNER JOIN - ONLY MATCHING RECORD FROM BOTH TABLES
SELECT O.[CUSTOMER NAME],O.[ORDER ID],R.RETURNED FROM ORDERS$ AS O
JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]

--ANOTHER WAY OF WRITING INNER JOIN
SELECT O.[CUSTOMER NAME],O.[ORDER ID],R.RETURNED FROM ORDERS$ AS O
, RETURNS$ AS R
WHERE O.[ORDER ID] = R.[ORDER ID]

SELECT O.[CUSTOMER NAME],O.[ORDER ID],R.RETURNED FROM ORDERS$ AS O
, RETURNS$ AS R
WHERE O.[ORDER ID] <> R.[ORDER ID]
--59,14,848 ROWS
A^B- CARTESIAN PRODUCT ---PICK ONE RECORD AND HOW MANY ORDER IN RETURN TABLE NOT EQUIVALENT TO ORDER$


SELECT O.[CUSTOMER NAME],O.[ORDER ID],R.RETURNED FROM ORDERS$ AS O
LEFT JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]

**SELECT O.[CUSTOMER NAME],O.[ORDER ID],R.RETURNED FROM RETURNS$ AS R
RIGHT JOIN ORDERS$ AS O
ON R.[ORDER ID] = O.[ORDER ID]


-- RIGHT JOIN -ALL RECORDS COMING FROM RIGHT TABLE WHETHER IT IS MATCHED OR NOT
SELECT O.[CUSTOMER NAME],O.[ORDER ID],R.RETURNED FROM ORDERS$ AS O
RIGHT JOIN RETURNS$ AS R
ON O.[ORDER ID] = R.[ORDER ID]