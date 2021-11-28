/*
select dbo.FN_CheckIdentityNumber(FirstName) from [Employees]

select [dbo].[FN_CheckIdentityNumber]('A123456789') 回傳 1
select [dbo].[FN_CheckIdentityNumber]('A1A3456789') 回傳 0
select [dbo].[FN_CheckIdentityNumber]('A3A3456789') 回傳 0


是身分證正確回傳 1，反之回傳 0
*/
Create FUNCTION [dbo].[FN_CheckIdentityNumber] 
(
	@identityNumber varchar(50)
)
RETURNS bit
AS
BEGIN
  DECLARE @weights varchar(11) = '19876543211'; --權重
  DECLARE @total int = 0;
  DECLARE @i tinyint = 0;
  DECLARE @temp varchar(11);
  DECLARE @result bit = 0;

  --長度不是10
  IF (LEN(@identityNumber) != 10)
    SET @result = 0;
  ELSE
  BEGIN
    SET @temp =CASE SUBSTRING(@identityNumber, 1, 1)
                 WHEN 'A' THEN '10'
                 WHEN 'B' THEN '11'
                 WHEN 'C' THEN '12'
                 WHEN 'D' THEN '13'
                 WHEN 'E' THEN '14'
                 WHEN 'F' THEN '15'
                 WHEN 'G' THEN '16'
                 WHEN 'H' THEN '17'
                 WHEN 'I' THEN '34'
                 WHEN 'J' THEN '18'
                 WHEN 'K' THEN '19'
                 WHEN 'L' THEN '20'
                 WHEN 'M' THEN '21'
                 WHEN 'N' THEN '22'
                 WHEN 'O' THEN '35'
                 WHEN 'P' THEN '23'
                 WHEN 'Q' THEN '24'
                 WHEN 'R' THEN '25'
                 WHEN 'S' THEN '26'
                 WHEN 'T' THEN '27'
                 WHEN 'U' THEN '28'
                 WHEN 'V' THEN '29'
                 WHEN 'W' THEN '32'
                 WHEN 'X' THEN '30'
                 WHEN 'Y' THEN '31'
                 WHEN 'Z' THEN '33'
                 ELSE '-1'
               END;
    --第一個字母不是大寫英文字
    IF (@temp = '-1')
      SET @result = 0;
    ELSE
		--第二碼只能 1 或 2 
		IF (SUBSTRING(@identityNumber, 2, 1) NOT IN ('1', '2'))
			BEGIN
			  SET @result = 0;
			END
		ELSE
			BEGIN
				--第2碼到第10碼必須為數字
				IF (ISNUMERIC(SUBSTRING(@identityNumber, 2, 9)) = 0)
					BEGIN
					  SET @result = 0;
					END
				ELSE
					BEGIN
					  SET @temp = @temp + SUBSTRING(@identityNumber, 2, 9);

					  WHILE (@i < 11)
						BEGIN
						  SET @i += 1;
						  SET @total += CAST(SUBSTRING(@temp, @i, 1) AS int) * CAST(SUBSTRING(@weights, @i, 1) AS int);
						END

					  IF (@total % 10 = 0)
						 SET @result = 1;
					  ELSE
						 SET @result = 0;
					END
			END
  END
  RETURN @result;
END
GO