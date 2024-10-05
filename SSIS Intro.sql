
SSIS (SQL Server Integration Service)
If we want to perform any operation on data, it needs to be present in SQL Server.
Apple phone = amazon,iphone store. local shop, ebay, telecom vendor
is amazon says all sales done by amazon can be stored in a sql server,iphone store in oracle local shop in excel files , ebay say store data in postgrace SQL AND TELECOM VENDOR IN csv file.
if end of month apple wants to know total sale in May month ,we need to understand all the terminology of Sql server,oracleexcel file,postgrace SQL, csv file, need to install multiple software and time consuming, 
this is a time consuming task 
Past :MIS team - come to office, collect data from different sources and generate report which took around 5 hours.
MIS team is dissolved. Manual task
Provide a option to connect SQL Server. Oracle,Excel file, Postgrace SWL, csv file
Retrieve data from different sources and dump data into SQL Server or Oracle,....
Data format: DD/MM/YYY,MM/DD/YYYY
all datE in one format can be done by SSIS.
In data we look for similarity and exact match.
US
USA
United State
United States of America
U.S.A
SSIS allow to solve this problem.
how twitter calculate trending topic- people used dhoni word for 102 times.This is called Terms lookup.
We have predefined term and looking how many times it is used.
Amazon - search product-----how many ratings?
to search a specific word in a ssentence, this is called Terms lookup.

Price table - 1|10 dollar , 2|20
SCD problem can be solved in SSIS, Business always change product price
SCD - Slowing Change Dimension

We create data from different sources, compile and can generate report.
SSIS have the option of scheduling SSIS package and it runs automatically.
Generate data and can be send in mail.

Tools similar to SSIS - ETL (Oracle) Informatica, ADF
SSIS is a Microsoft product.

START ---- VISUAL STUDIO ---- CREATE NEW PROJECT ---- TYPE INT --- INTEGTATION SERVICES PROJECT NEW FROM SCRATCH ---- GIVE THE PROJECT NAME SSIS_SQL1024

In SSIS  we create package.
Extension of ssis package is .dtsx.
We can create multiple ssis package 
We write everything in ssis package.
No int services mean 
All packages can be created under SSIS_SQL 1024 and under SSIS package folder

Middle window is called package explorer.
Tool box helps us to perform SSIS operation
Control flow used for transferring control - which task to run first and which to last.

When selecting any task, green arrow- drag and leave means they are connected.
Which task connected to the tail of the arrow is the first task
Head of the arrow is second task -
if we want to define order of execution, with the help of arrow, we can do it.
If no arrow, no need to connect and both run parallelly. We use this for independent task.
If we want to achieve parallelilsm create task which is independent.
Number of resource is high when we go with parallel task
Eg: railway station - buy ticket from multiple windows.
If its one window, long queue and less resource.
If multiple window, multiple resource.
If want to make multiple , procurement to higher resource.
Resource means computer RAM,processor,
Parallelism is costly.
If we have high configurable resource, we can go with parallel system