



exec sp_execute_external_script
		@language = N'R'
		, @script = N'
		OutputDataSet <- data.frame(installed.packages()[,c("Package", "Version", "Depends", "License", "Built", "LibPath")]);'
	with result sets ((Package nvarchar(255), Version nvarchar(100), 
  Depends nvarchar(4000), License nvarchar(1000), 
  Built nvarchar(100), LibPath nvarchar(2000)));

  exec sp_execute_external_script
		@language = N'R'
		, @script = N'
		OutputDataSet <- data.frame(installed.packages()[,c("Package", "Version")]);'
	with result sets ((Package nvarchar(255), Version nvarchar(100)));
