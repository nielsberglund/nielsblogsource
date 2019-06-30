USE DataScienceDB;
GO


-- DROP EXTERNAL LIBRARY randomForest;

EXECUTE AS USER = 'nielsb2';

REVERT


CREATE EXTERNAL LIBRARY randomForest
AUTHORIZATION dbo
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');  

SELECT * FROM sys.external_libraries

--EXECUTE AS USER = 'dane';

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');  


REVERT

GRANT CREATE EXTERNAL LIBRARY TO Dane;

EXECUTE AS USER = 'dane';

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');

REVERT

EXECUTE AS USER = 'nielsb';

CREATE EXTERNAL LIBRARY randomForest
FROM (CONTENT = 'W:\randomForest_4.6-14.zip') 
WITH (LANGUAGE = 'R');

sp_who



REVERT

EXECUTE AS USER = 'dane';

EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'library("randomForest")'

REVERT

EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'library("randomForest")'


EXECUTE AS USER = 'dane'

EXEC sp_execute_external_script 
                    @language = N'R', 
                    @script = N'
                    OutputDataSet <- data.frame(
                    installed.packages()[,c("Package", "LibPath")]);'
WITH RESULT SETS ((Package nvarchar(255), LibPath nvarchar(2000)));                    