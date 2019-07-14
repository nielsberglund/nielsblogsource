
EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE;

CREATE DATABASE GamePlayDB;
GO


USE GamePlayDB
GO

DROP EXTERNAL LANGUAGE Java

CREATE EXTERNAL LANGUAGE Java
FROM (CONTENT = 'W:\javaextension-3.1.zip', FILE_NAME = 'javaextension.dll');
GO

SELECT * FROM sys.external_languages
GO

CREATE EXTERNAL LIBRARY javaSDK 
FROM (CONTENT = 'W:\mssql-java-lang-extension-3.1.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries


CREATE EXTERNAL LIBRARY javaKafkaClient 
FROM (CONTENT = 'W:\kafka-clients-2.3.0.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries

DROP EXTERNAL LIBRARY javaSDK
DROP EXTERNAL LIBRARY javaKafkaClient                     
DROP EXTERNAL LIBRARY javaPublishToKafka
DROP EXTERNAL LIBRARY slf4jNop
DROP EXTERNAL LIBRARY slf4j
DROP EXTERNAL LIBRARY javaTest

CREATE EXTERNAL LIBRARY javaPublishToKafka
FROM (CONTENT = 'W:\SqlToKafka-1.0.jar')
WITH (LANGUAGE = 'Java');
GO 

SELECT * FROM sys.external_libraries

CREATE EXTERNAL LIBRARY javaTest
FROM (CONTENT = 'W:\sql-1.0.jar')
WITH (LANGUAGE = 'Java');
GO 




CREATE EXTERNAL LIBRARY slf4jNop
FROM (CONTENT = 'W:\slf4j-nop-1.5.3.jar')
WITH (LANGUAGE = 'Java');
GO 



SELECT * FROM sys.external_libraries