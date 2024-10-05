
-- SELECT dbo.FN_NumberToWords(234)

CREATE OR ALTER FUNCTION dbo.FN_NumberToWords
(
 @Number BIGINT
)
RETURNS VARCHAR(1000)
AS 
BEGIN
 DECLARE @Below20 TABLE
 (
  ID INT IDENTITY(0,1),
  Word VARCHAR(50)
  )

  DECLARE @Below100 TABLE
 (
  ID INT IDENTITY(2,1),
  Word VARCHAR(50)
  )


  INSERT INTO @Below20 (Word) values
  ('Zero'),
  ('One'),
  ('Two'),
  ('Three'),
  ('Four'),
  ('Five'),
  ('Six'),
  ('Seven'),
  ('Eight'),
  ('Nine'),
  ('Ten'),
  ('Eleven'),
  ('Twelve'),
  ('Thirteen'),
  ('Fourteen'),
  ('Fifteen'),
  ('Sixteen'),
  ('Seventeen'),
  ('Eighteen'),
  ('Nineteen')

  INSERT INTO @Below100 (Word) values
  ('Twenty'), 
  ('Thirty'), 
  ('Fourty'), 
  ('Fifty'), 
  ('Sixty'), 
  ('Seventy'), 
  ('Eighty'), 
  ('Ninety'), 
  ('Hundred')

  DECLARE @Eng_Word  VARCHAR(1000)
  = (
  SELECT 
   CASE WHEN @Number = 0 THEN 'Zero'
    WHEN @Number BETWEEN 1 AND 19
     THEN (SELECT WORD FROM @Below20 WHERE ID = @Number)
    WHEN @Number BETWEEN 20 AND 99 -- THIRY FIVE 101 1
     THEN (SELECT WORD FROM @Below100 WHERE ID = @Number/10) + ' ' + dbo.FN_NumberToWords(@Number%10)
    WHEN @Number BETWEEN 100 AND 999
     THEN (dbo.FN_NumberToWords(@Number/100)) + ' Hundred ' + dbo.FN_NumberToWords(@Number%100)
    WHEN @Number BETWEEN 1000 AND 999999
     THEN (dbo.FN_NumberToWords(@Number/1000)) + ' Thousand ' + dbo.FN_NumberToWords(@Number%1000)
    WHEN @Number BETWEEN 1000000 AND 999999999
     THEN (dbo.FN_NumberToWords(@Number/1000000)) + ' Million ' + dbo.FN_NumberToWords(@Number%1000000)
    WHEN @Number BETWEEN 1000000000 AND 999999999999
     THEN (dbo.FN_NumberToWords(@Number/1000000000)) + ' Billion ' + dbo.FN_NumberToWords(@Number%1000000000)
    WHEN @Number BETWEEN 1000000000000 AND 999999999999999
     THEN (dbo.FN_NumberToWords(@Number/100000000000)) + ' Trillion ' + dbo.FN_NumberToWords(@Number%100000000000)
    ELSE 'INVALID INPUT'
   END
  )

 SELECT @Eng_Word = RTRIM(@Eng_Word)

 SELECT  @Eng_Word = RTRIM(LEFT(@Eng_Word, LEN(@Eng_Word)-1)) WHERE RIGHT(@Eng_Word,1)=' ' 
 RETURN (@Eng_Word)

END