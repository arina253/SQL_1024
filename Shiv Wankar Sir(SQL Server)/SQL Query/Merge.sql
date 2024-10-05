--Merge statement
To merge data from one table to other table on the basis of some conditions.

--Requires two tables: 
1.Source Table : base table
2.Target Table
Both tables will be joined on the basis of some condition.

IF EXISTS (SELECT 1 FROM TABLE WHERE ID = @ID)
BEGIN 
	UPDATE STATEMENT
END
ELSE IF
BEGIN
  INSERT
END

MERGE [TARGET] AS T
USING [SOURCE] AS S
  ON [JOIN CONDITIONS]
WHEN MATCHED THEN 
  [UPDATE STATEMENT]
WHEN NOT MATCHED BY TARGET THEN
  [INSERT STATEMENT]
WHEN NOT MATCHED BY SOURCE THEN
  [DELETE STATEMENT]


  Create table StudentSource
(
     ID int primary key,
     Name nvarchar(20)
)
GO

Insert into StudentSource values (1, 'Mike')
Insert into StudentSource values (2, 'Sara')
GO

Create table StudentTarget
(
     ID int primary key,
     Name nvarchar(20)
)
GO

--merge statement mostly used for data transfer task.

Insert into StudentS
Insert into StudentTarget values (1, 'Mike M')
Insert into StudentTarget values (3, 'John')

--Merge statements should ne terminated awith a semicolon

Another name of Merge = UPSERT

Reports need to be represented in a business

---------------------------------------------------------------------------------------------------------------------------------

--CLASS NOTES

-- What is the use of MERGE statement in SQL Server

Merge statement introduced in SQL Server 2008 allows us to perform Inserts, Updates and Deletes in one statement. 
This means we no longer have to use multiple statements for performing Insert, Update and Delete.

With merge statement we require 2 tables
1. Source Table - Contains the changes that needs to be applied to the target table
2. Target Table - The table that require changes (Inserts, Updates and Deletes)

The merge statement joins the target table to the source table by using a common column in both the tables. 
Based on how the rows match up as a result of the join, we can then perform insert, update, and delete on the target table. 

-- Merge statement syntax
MERGE [TARGET] AS T
USING [SOURCE] AS S
   ON [JOIN_CONDITIONS]
 WHEN MATCHED THEN 
      [UPDATE STATEMENT]
 WHEN NOT MATCHED BY TARGET THEN
      [INSERT STATEMENT] 
 -- WHEN NOT MATCHED BY SOURCE THEN
 --     [DELETE STATEMENT]

Example 1 : In the example below, INSERT, UPDATE and DELETE are all performed in one statement
1. When matching rows are found, StudentTarget table is UPDATED (i.e WHEN MATCHED)
2. When the rows are present in StudentSource table but not in StudentTarget table those rows are INSERTED into StudentTarget table (i.e WHEN NOT MATCHED BY TARGET)
3. When the rows are present in StudentTarget table but not in StudentSource table those rows are DELETED from StudentTarget table (i.e WHEN NOT MATCHED BY SOURCE)

DROP TABLE IF EXISTS StudentSource
Create table StudentSource
(
     ID int primary key,
     Name nvarchar(20)
)
GO

Insert into StudentSource values (1, 'Mike')
Insert into StudentSource values (2, 'Sara')
GO

SELECT * FROM StudentSource
SELECT * FROM StudentTarget

DROP TABLE IF EXISTS StudentTarget
Create table StudentTarget
(
     ID int primary key,
     Name nvarchar(20)
)
GO

Insert into StudentTarget values (1, 'Mike M')
Insert into StudentTarget values (3, 'John')
GO

-- UPSERT --
MERGE dbo.StudentTarget AS T
USING dbo.StudentSource AS S
ON T.ID = S.ID
WHEN MATCHED THEN
     UPDATE SET T.NAME = S.NAME
WHEN NOT MATCHED BY TARGET THEN
     INSERT (ID, NAME) VALUES (S.ID, S.NAME);
--WHEN NOT MATCHED BY SOURCE THEN
--     DELETE;




Please Note : Merge statement should end with a semicolon, otherwise you would get an error stating - 
A MERGE statement must be terminated by a semi-colon (;)

In real time we mostly perform INSERTS and UPDATES. The rows that are present in target table but not in source table are usually not deleted from the target table.

Example 2 : In the example below, only INSERT and UPDATE is performed. We are not deleting the rows that are present in the target table but not in the source table.

Truncate table StudentSource
Truncate table StudentTarget
GO


UPDATE StudentSource SET NAME = 'Max' WHERE ID =1 
Insert into StudentSource values (4, 'Jack')

Insert into StudentSource values (1, 'Mike')
Insert into StudentSource values (2, 'Sara')
Insert into StudentSource values (3, 'Jack')
GO

Insert into StudentTarget values (1, 'Mike M')
Insert into StudentTarget values (3, 'John')
GO

MERGE StudentTarget AS T
USING StudentSource AS S
ON T.ID = S.ID
WHEN MATCHED THEN
     UPDATE SET T.NAME = S.NAME
WHEN NOT MATCHED BY TARGET THEN
     INSERT (ID, NAME) VALUES(S.ID, S.NAME);