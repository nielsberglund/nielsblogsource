
DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator.adder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
GO

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'mycalculator.Calculator.adder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Hello.world'


EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Hello.world'
, @params = N'@CLASSPATH nvarchar(256)'
, @CLASSPATH = N'C:/javacodepath/testjar1.jar'
GO

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator2.adder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2 
GO

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'Calculator.adder'
, @params = N'@CLASSPATH nvarchar(256), @x int, @y int'
, @CLASSPATH = N'C:/javacodepath/testjar1.jar'
, @x = @p1
, @y = @p2 
GO

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'mycalculator.Calculator.adder'
, @params = N'@CLASSPATH nvarchar(256), @x int, @y int'
, @CLASSPATH = N'C:/testpath/testjar1.jar'
, @x = @p1
, @y = @p2 
GO
