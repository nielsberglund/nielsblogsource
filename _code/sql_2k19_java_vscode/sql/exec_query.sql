DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'mypackage.App.myadder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
GO

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'javasqlcalc.MyCalculator.adder'
, @params = N'@CLASSPATH nvarchar(256), @x int, @y int'
, @CLASSPATH = N'C:/javacodepath/myCalculator-1.0.jar'
, @x = @p1
, @y = @p2 
GO


DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'xxx'
, @script = N'App.myadder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
GO