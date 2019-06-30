
EXECUTE AS USER = 'nielsb';
GO
SELECT SUSER_NAME()
EXECUTE sp_execute_external_script
             @language = N'R'
           , @script = N'
               d<-42
               OutputDataSet <- as.data.frame(d)'





REVERT

USE master
CREATE USER user1
FROM LOGIN user1;
GRANT EXECUTE ON sp_execute_external_script to user1;

USE master
GRANT EXECUTE ON sp_execute_external_script to public;

REVOKE EXECUTE ON sp_execute_external_script to user1;
DROP USER user1


Permissions on server scoped catalog views or system stored procedures or extended stored procedures can be granted only when the current database is master.

REVOKE EXECUTE on sp_execute_external_script TO PUBLIC

SELECT DB_NAME() AS 'DBName'
      ,p.[name] AS 'PrincipalName'
      ,p.[type_desc] AS 'PrincipalType'
      ,p2.[name] AS 'GrantedBy'
      ,dbp.[permission_name]
      ,dbp.[state_desc]
      ,so.[Name] AS 'ObjectName'
      ,so.[type_desc] AS 'ObjectType'
  FROM [sys].[database_permissions] dbp LEFT JOIN [sys].[objects] so
    ON dbp.[major_id] = so.[object_id] LEFT JOIN [sys].[database_principals] p
    ON dbp.[grantee_principal_id] = p.[principal_id] LEFT JOIN [sys].[database_principals] p2
    ON dbp.[grantor_principal_id] = p2.[principal_id]

WHERE p.[name] = 'user1'


SELECT DP1.name AS DatabaseRoleName,   
   isnull (DP2.name, 'No members') AS DatabaseUserName   
 FROM sys.database_role_members AS DRM  
 RIGHT OUTER JOIN sys.database_principals AS DP1  
   ON DRM.role_principal_id = DP1.principal_id  
 LEFT OUTER JOIN sys.database_principals AS DP2  
   ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name;  


SELECT * FROM sys.database_principals

SELECT * FROM sys.server_role_members

SELECT * FROM sys.server_principals


EXEC sp_addrolemember 'public', 'user1';  


SELECT * FROM fn_builtin_permissions('database')
WHERE permission_name LIKE '%EXTERNAL%'
  

GRANT EXECUTE ANY EXTERNAL SCRIPT TO user1

