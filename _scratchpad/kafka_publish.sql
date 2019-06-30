

EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'javasql.SimplePublisher.publishKafka'
, @params = N'@CLASSPATH nvarchar(256)'
, @CLASSPATH = N'C:/javacodepath/myApp2-1.0.jar'
GO