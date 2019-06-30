


sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=daneb; uid=daneb; pwd=!@#$%A1"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)

pth <- rxSqlLibPaths(sqlCC)
print(pth)


EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      # set up the connection string
      sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=daneb; uid=sqlUser; pwd=!@#$%A1"
      sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)      
      rxSetComputeContext(sqlCC)
      sqlPackages <- rxInstalledPackages(computeContext = sqlCC)
      sqlPackages
      #pth <- rxSqlLibPaths(sqlCC)
      #print(pth);'


EXEC [dbo].[rpackages_get_packages_metadata.1.1]




EXEC sp_execute_external_script
      @language = N'R'
    , @script = N'
      # set up the connection string
      d <- 42;'

