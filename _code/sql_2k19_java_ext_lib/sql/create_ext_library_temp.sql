
SET NOCOUNT ON;

--set the following parameters:
-- @jarBinary and @extLibName
--leave the rest as is
DECLARE @jarBinary NVARCHAR(MAX)
SET @jarBinary = '<replaceJarBinary>';

--the following name needs also to be used
-- in the CREATE and ALTER statements below
DECLARE @extLibName sysname = '<replaceExtLibName>';

--end setting parameters

IF NOT EXISTS (SELECT * FROM sys.external_libraries WHERE name = @extLibName)
BEGIN
  DECLARE @sExec nvarchar(max) = 'CREATE EXTERNAL LIBRARY ' + @extLibName + '  FROM (CONTENT = ' + @jarBinary + ') WITH (LANGUAGE = ''Java'');';
  EXEC(@sExec);

END  
ELSE
BEGIN
  IF NOT EXISTS(SELECT 1 FROM sys.external_library_files WHERE content = @jarBinary)
  BEGIN
  
    ALTER ASSEMBLY [Disruptor3-Net]
    FROM @AssemblyData
    WITH PERMISSION_SET = UNSAFE;

  END
  ELSE
  BEGIN
    PRINT 'The assembly already exists. It is not being altered.'
  END
  
END
GO
