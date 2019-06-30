

USE DataScienceDB;

SELECT * FROM rpackages WITH(NOLOCK)

EXECUTE AS USER = 'dane'


EXEC sp_execute_external_script
              @language = N'R'
              , @script = N'library("abc.data")'

EXEC sp_execute_external_script 
  @language=N'R', 
  @script=N'
    myPackages <- rxInstalledPackages();
    OutputDataSet <- as.data.frame(myPackages)';

EXEC sp_execute_external_script 
  @language=N'R', 
  @script=N'install.packages("abc.data")';



REVERT


exec sp_execute_external_script 
 @language = N'R',
 @script = N'
   # define a function to be passed to rxExec
   usePackageInRxFunction <- function()
   {
     library("abc.data")
     data(human)
     return(stat.voight)
   }
   # the "normal" SQLCC stuff
   sqlCCConnString <- "Driver=SQL Server; server=.; database=DataScienceDB; uid=user3; pwd=password1234$"
   sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
   rxSetComputeContext(sqlCC)

   ret <- rxExec(usePackageInRxFunction)
   OutputDataSet <- data.frame(ret)'
WITH RESULT SETS(([pi] float, [TajD.m] float, [TajD.v] float ))

exec sp_execute_external_script 
 @language = N'R',
 @script = N'
   sqlCCConnString <- "Driver=SQL Server; server=.; database=DataScienceDB; uid=dane; pwd=password1234$"
   sqlCC <- RxInSqlServer(connectionString = sqlCCConnString, numTasks = 1)
   rxSetComputeContext(sqlCC)
   usePackageRxFunction <- function()
   {
     require(abc.data)
     data(musigma2)
     ?musigma2
     ## The rejection algorithm
     ##
     rej <- abc(target=stat.obs, param=par.sim, sumstat=stat.sim, tol=.1, method =
                "rejection")
   }
  rxSetComputeContext(sqlCC)
  rxExec(usePackageRxFunction)'




exec sp_execute_external_script 
         @language = N'R',
         @script = N'
                library("abc.data")
                data(human)
                OutputDataSet <-  data.frame(stat.voight)'
WITH RESULT SETS(([pi] float, [TajD.m] float, [TajD.v] float ))