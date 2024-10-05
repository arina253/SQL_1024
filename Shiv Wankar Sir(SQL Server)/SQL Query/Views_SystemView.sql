
Database --------- Views ---------- System views

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SPECIFIC_CATALOG]
      ,[SPECIFIC_SCHEMA]
      ,[SPECIFIC_NAME]
      ,[ORDINAL_POSITION]
      ,[PARAMETER_MODE]
      ,[IS_RESULT]
      ,[AS_LOCATOR]
      ,[PARAMETER_NAME]
      ,[DATA_TYPE]
      ,[CHARACTER_MAXIMUM_LENGTH]
      ,[CHARACTER_OCTET_LENGTH]
      ,[COLLATION_CATALOG]
      ,[COLLATION_SCHEMA]
      ,[COLLATION_NAME]
      ,[CHARACTER_SET_CATALOG]
      ,[CHARACTER_SET_SCHEMA]
      ,[CHARACTER_SET_NAME]
      ,[NUMERIC_PRECISION]
      ,[NUMERIC_PRECISION_RADIX]
      ,[NUMERIC_SCALE]
      ,[DATETIME_PRECISION]
      ,[INTERVAL_TYPE]
      ,[INTERVAL_PRECISION]
      ,[USER_DEFINED_TYPE_CATALOG]
      ,[USER_DEFINED_TYPE_SCHEMA]
      ,[USER_DEFINED_TYPE_NAME]
      ,[SCOPE_CATALOG]
      ,[SCOPE_SCHEMA]
      ,[SCOPE_NAME]
  FROM [AdventureWorks2022].[INFORMATION_SCHEMA].[PARAMETERS]

  SELECT * FROM [INFORMATION_SCHEMA].[PARAMETERS]


  EXEC sp_helptext 'dbo.uspGetEmployeeManagers'
  EXEC sp_helptext 'sp_helptext'

CREATE VIEW INFORMATION_SCHEMA.PARAMETERS
AS
SELECT
 DB_NAME()      AS SPECIFIC_CATALOG,
 SCHEMA_NAME(o.schema_id)  AS SPECIFIC_SCHEMA,
 o.name       AS SPECIFIC_NAME,
 c.parameter_id     AS ORDINAL_POSITION,
 convert(nvarchar(10), CASE
  WHEN c.parameter_id = 0 THEN 'OUT'
  WHEN c.is_output = 1 THEN 'INOUT'
  ELSE 'IN' END)     AS PARAMETER_MODE,
 convert(nvarchar(10), CASE WHEN
  c.parameter_id = 0 THEN 'YES' ELSE 'NO' END) AS IS_RESULT,
 convert(nvarchar(10), 'NO')    AS AS_LOCATOR,
 c.name       AS PARAMETER_NAME,
 ISNULL(TYPE_NAME(c.system_type_id), u.name)  AS DATA_TYPE,
 COLUMNPROPERTY(c.object_id, c.name, 'charmaxlen') AS CHARACTER_MAXIMUM_LENGTH,
 COLUMNPROPERTY(c.object_id, c.name, 'octetmaxlen') AS CHARACTER_OCTET_LENGTH,
 convert(sysname, null)     AS COLLATION_CATALOG,
 convert(sysname, null) collate catalog_default   AS COLLATION_SCHEMA,
 convert(sysname, CASE
  WHEN c.system_type_id IN (35, 99, 167, 175, 231, 239) THEN -- [n]char/[n]varchar/[n]text
  SERVERPROPERTY('collation') END)  AS COLLATION_NAME,
 convert( sysname, null)     AS CHARACTER_SET_CATALOG,
 convert( sysname, null) collate catalog_default   AS CHARACTER_SET_SCHEMA,
 convert( sysname, CASE
  WHEN c.system_type_id IN (35, 167, 175) THEN SERVERPROPERTY('sqlcharsetname') -- char/varchar/text
  WHEN c.system_type_id IN (99, 231, 239) THEN N'UNICODE' -- nchar/nvarchar/ntext
  END)      AS CHARACTER_SET_NAME,
 convert(tinyint, CASE -- int/decimal/numeric/real/float/money
  WHEN c.system_type_id IN (48, 52, 56, 59, 60, 62, 106, 108, 122, 127) THEN c.precision
  END)          AS NUMERIC_PRECISION,
 convert(smallint, CASE -- int/money/decimal/numeric
  WHEN c.system_type_id IN (48, 52, 56, 60, 106, 108, 122, 127) THEN 10
  WHEN c.system_type_id IN (59, 62) THEN 2 END) AS NUMERIC_PRECISION_RADIX, -- real/float
 convert(int, CASE -- datetime/smalldatetime
  WHEN c.system_type_id IN (40, 41, 42, 43, 58, 61) THEN NULL
  ELSE ODBCSCALE(c.system_type_id, c.scale) END) AS NUMERIC_SCALE,
 convert(smallint, CASE -- datetime/smalldatetime
  WHEN c.system_type_id IN (40, 41, 42, 43, 58, 61) THEN ODBCSCALE(c.system_type_id, c.scale) END) AS DATETIME_PRECISION,
 convert(nvarchar(30), null)    AS INTERVAL_TYPE,
 convert(smallint, null)     AS INTERVAL_PRECISION,
 convert(sysname, CASE WHEN u.schema_id <> 4
  THEN DB_NAME() END)      AS USER_DEFINED_TYPE_CATALOG,
 convert(sysname, CASE WHEN u.schema_id <> 4
  THEN SCHEMA_NAME(u.schema_id) END)  AS USER_DEFINED_TYPE_SCHEMA,
 convert(sysname, CASE WHEN u.schema_id <> 4
  THEN u.name END)       AS USER_DEFINED_TYPE_NAME,
 convert(sysname, null)     AS SCOPE_CATALOG,
 convert(sysname, null) collate catalog_default  AS SCOPE_SCHEMA,
 convert(sysname, null) collate catalog_default  AS SCOPE_NAME
FROM
 sys.objects o JOIN sys.parameters c ON c.object_id = o.object_id
 JOIN sys.types u ON u.user_type_id = c.user_type_id
WHERE
 o.type IN ('P','FN','TF', 'IF', 'IS', 'AF','PC', 'FS', 'FT')

 create procedure sys.sp_hel