--USER DEFINED FUNCTIONS

--SCALAR VALUED FUNCTION
CREATE FUNCTION FUNCTION_NAME
(
@PARAMETER 1 DATATYPE,
@PARAMETER 2 DATATYPE,..
@PARAMETER N DATATYPE
)
RETURNS RETURN_DATATYPE
AS
BEGIN
 FUNCTION BODY/SELECT STATEMENTS/BUSINESS LOGIC/CALCULATION
 RETURN RETURN_VARIABLE_SAME_AS_RETURN_DATATYPE
END

--------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION FunctionName 
(
 @INPUT1 DATATYPE -- OPTIONAL
)
RETURNS DATAYPE
AS
BEGIN 
 DECLARE VARIABLE
 SET VARIABLE = SELECT QUERY

 RETURN VARIABLE
END

-----------------------------------------------------------------------------------------------------------------------------

ALTER FUNCTION FunctionName 
(
 @INPUT1 DATATYPE -- OPTIONAL
)
RETURNS DATAYPE
AS
BEGIN 
 DECLARE VARIABLE
 SET VARIABLE = SELECT QUERY

 RETURN VARIABLE
END

-------------------------------------------------------------------------------------------------------------------------------
SELECT SCHEMANAME.FUNCTIONNAME('')

SELECT COL1, COL2, dbo.SCHEMANAME.FUNCTIONNAME(COL3) AS 'EXPECTED RESULT' FROM TABLE
WHERE dbo.SCHEMANAME.FUNCTIONNAME(COL3) = ''

DROP FUNCTION SCHEMANAME.FUNCTIONNAME 

-----------------------------------------------------------------------------------------------------

--Syntax for creating an inline table valued function 
CREATE FUNCTION Function_Name
(
  @Param1 DataType, 
  @Param2 DataType..., 
  @ParamN DataType
) 
RETURNS TABLE 
AS 
RETURN (Select_Statement)

--Calling the inline table valued  function 
Select * from fn_EmployeesByGender('Male') 

----------------------------------------------------------------------------------------------------------------------------
--MULTISTATEMENT TABLE VALUED FUNCTION
CREATE FUNCTION MultiStatement_TableValued_Function_Name
(
        @param1 DataType,
        @param2 DataType,
        @paramN DataType 
)
RETURNS @OutputTable TABLE
(
        @Column1 DataTypeForColumn1 ,
        @Column2 DataTypeForColumn2
)
AS
BEGIN
  --FunctionBody
RETURN
END


