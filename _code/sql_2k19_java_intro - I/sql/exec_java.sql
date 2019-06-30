EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'JavaTest1.helloWorld'
GO

DECLARE @p1 int = 21;
DECLARE @p2 int = 21;
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'JavaTest1.adder'
, @params = N'@x int, @y int'
, @x = @p1
, @y = @p2   
GO