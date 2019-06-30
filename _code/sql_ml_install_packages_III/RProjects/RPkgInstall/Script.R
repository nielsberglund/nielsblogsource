

sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=DataScienceDB; uid=dane; pwd=password1234$"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)

pkgs <- c("abc")
rxInstallPackages(pkgs = pkgs, verbose = TRUE, scope = "shared", computeContext = sqlCC)


#pkgs <- c("abc")
#rxRemovePackages(pkgs = pkgs, verbose = TRUE, scope = "private", computeContext = sqlCC)