sqlCCConnString <- "Driver=SQL Server; server=.\\inst2k17; database=DataScienceDB; uid=dane; pwd=password1234$"
#sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=DataScienceDB; uid=sa; pwd=!@#$%A1"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)

pkgs <- c("dplyr")
sqlPackages <- rxInstalledPackages(computeContext = sqlCC)
sqlPackages
#rxInstallPackages(pkgs = "dplyrxxxxxxx", verbose = true, scope="shared", computeContext = sqlCC)




sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=DataScienceDB; uid=dane; pwd=password1234$"
#sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=DataScienceDB; uid=sa; pwd=!@#$%A1"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)
sqlPackages <- rxInstalledPackages(computeContext = sqlCC, allNodes = TRUE, fields = c("Package", "LibPath"))
sqlPackages





#pkgs <- c("abc")
#rxInstallPackages(pkgs = pkgs, verbose = TRUE, computeContext = sqlCC)

#rxRemovePackages(pkgs = pkgs, verbose = TRUE, scope = "shared", computeContext = sqlCC)




sqlCCConnString <- "Driver=SQL Server; server=192.168.57.3; database=DataScienceDB; uid=dane; pwd=password1234$"
sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
rxSetComputeContext(sqlCC)
pkgs <- c("abc")
rxInstallPackages(pkgs = pkgs, verbose = TRUE, computeContext = sqlCC)

rxRemovePackages(pkgs = pkgs, verbose = TRUE, scope = "private", computeContext = sqlCC)