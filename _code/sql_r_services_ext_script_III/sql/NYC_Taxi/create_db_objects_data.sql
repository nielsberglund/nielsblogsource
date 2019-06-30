SET ANSI_PADDING            ON
SET ANSI_WARNINGS           ON
SET ARITHABORT              ON
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS              ON
SET QUOTED_IDENTIFIER       ON
SET NUMERIC_ROUNDABORT      OFF 
GO

USE master;
GO

SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS TaxiNYC_Sample;

CREATE DATABASE TaxiNYC_Sample;
GO

USE TaxiNYC_Sample;
GO

CREATE TABLE dbo.tb_NYCityTaxi
(
  medallion varchar(50) not null,
  hack_license varchar(50)  not null,
  vendor_id char(3),
  rate_code char(3),
  store_and_fwd_flag char(3),
  pickup_datetime datetime  not null,
  dropoff_datetime datetime, 
  passenger_count int,
  trip_time_in_secs bigint,
  trip_distance float,
  pickup_longitude varchar(30),
  pickup_latitude varchar(30),
  dropoff_longitude varchar(30),
  dropoff_latitude varchar(30),
  payment_type char(3),
  fare_amount float,
  surcharge float,
  mta_tax float,
  tolls_amount float,
  total_amount float,
  tip_amount float,
  tipped int,
  tip_class int
)
CREATE CLUSTERED COLUMNSTORE INDEX [cci_NYCityTaxi] ON dbo.tb_NYCityTaxi WITH (DROP_EXISTING = OFF);
GO

CREATE TABLE dbo.tb_Model
(
  RowID int identity primary key,
  ModelName nvarchar(50) NOT NULL,
	ModelBin varbinary(max) NOT NULL
);
GO

BULK INSERT TaxiNYC_Sample.dbo.tb_NYCityTaxi
   	FROM 'c:\data\nyctaxi1pct.csv'
   	WITH ( FIELDTERMINATOR =',', FIRSTROW = 2, ROWTERMINATOR = '\n' );
GO

/*

SELECT * FROM dbo.tb_NYCityTaxi

*/

DROP FUNCTION IF EXISTS dbo.fn_CalculateDistance;
GO
CREATE FUNCTION dbo.fn_CalculateDistance (@Lat1 float, @Long1 float, @Lat2 float, @Long2 float)
-- User-defined function calculate the direct distance between two geographical coordinates.
RETURNS float
AS
BEGIN
  DECLARE @distance decimal(28, 10)
  -- Convert to radians
  SET @Lat1 = @Lat1 / 57.2958;
  SET @Long1 = @Long1 / 57.2958;
  SET @Lat2 = @Lat2 / 57.2958;
  SET @Long2 = @Long2 / 57.2958;
  -- Calculate distance
  SET @distance = (SIN(@Lat1) * SIN(@Lat2)) + (COS(@Lat1) * COS(@Lat2) * COS(@Long2 - @Long1));
  --Convert to miles
  IF @distance <> 0
  BEGIN
    SET @distance = 3958.75 * ATAN(SQRT(1 - POWER(@distance, 2)) / @distance);
  END
  RETURN @distance
END
GO