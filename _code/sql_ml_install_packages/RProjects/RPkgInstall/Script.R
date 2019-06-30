

sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=daneb; uid=dane1; pwd=!@#$%A1"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)
sqlPackages <- rxInstalledPackages(computeContext = sqlCC)
sqlPackages


