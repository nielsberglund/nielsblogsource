
--script to copy data into the MortgageData table


SET NOCOUNT ON;
GO

USE MortgageDb;
GO

-- change this variable to point to the folder where the mortDefault20xy.csv files reside
DECLARE @path nvarchar(256) = ;


DECLARE @file nvarchar (256) = 'mortDefault'
DECLARE @fullPath nvarchar (256);
DECLARE @fileName nvarchar (50);
DECLARE @q nvarchar(1024);

DROP TABLE IF EXISTS #t

CREATE TABLE #t (CreditScore varchar(50), HouseAge varchar(50), YearsEmp varchar(50), CreditCardDebt varchar(50), [Year] varchar(50), DidDefault varchar(50))

TRUNCATE TABLE dbo.tb_MortgageData

--variable for looping
DECLARE @year int = 2000;

WHILE (@year < 2010)
BEGIN
  SET @fullPath = @path + @file + CAST(@year AS varchar(10)) + '.csv';
  SET @fileName =  @file + CAST(@year AS varchar(10)) + '.csv'
  SET @q = 'BULK INSERT #t FROM ' + ''''  + @fullPath + '''' + ' WITH (FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')';
  RAISERROR( 'Processing: %s.',0,1, @fileName) WITH NOWAIT
  EXEC(@q);

  DELETE #t WHERE CreditScore = '"creditScore"'

  INSERT INTO dbo.tb_MortgageData
  SELECT CAST(CreditScore AS int),  CAST(HouseAge AS int), CAST(YearsEmp AS int), CAST(CreditCardDebt AS int), CAST([Year] AS int), CAST(DidDefault AS bit)  FROM #t

  TRUNCATE TABLE #t

  SET @year += 1;

END

DECLARE @rows int;
SELECT @rows = COUNT(*) FROM dbo.tb_MortgageData
RAISERROR( '%d rows inserted.',0,1, @rows) WITH NOWAIT

GO