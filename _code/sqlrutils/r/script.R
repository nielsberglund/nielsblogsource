
library(sqlrutils)


#women2 <- readRDS("C:/Users/nielsb/AppData/Local/Temp/RtmpKygB6O/libloc_228_b463ce1.rds")
## or examine the object via a connection, which will be opened as needed.
con <- gzfile("C:/Temp/sqlrutils.rdb")

close(con)

print(OutputParameter)

print(StoredProcedure)


spParams <- spProcessParams(list(...))

op <- OutputParameter("out", "numeric")


download.packages("sqlrutils", destdir = "c:\\temp", repos = "https://mran.microsoft.com/packages/",  type = " source ")

download.packages(pkgs, destdir, available = NULL,
                  repos = getOption("repos"),
                  contriburl = contrib.url(repos, type),
                  method, type = getOption("pkgType"), ...)


testfunc <- function(multiplier) {
  iris_dataset <- iris
  iris_dataset$Sepal.Length <- iris_dataset$Sepal.Length * multiplier
  out <- 5.1
  return(iris_dataset)
}

inparam <- InputParameter("multiplier", "numeric")

InputData(


setInputDataQuery(

sp <- StoredProcedure(testfunc, 
                      "sp_TestFunc",
                      inparam, #function to create into a S.P. and the S.P. name
                      OutputData("iris_dataset"),
                      OutputParameter("out", "numeric"),
                      filePath = "C:\\Temp"
                      )

# registerStoredProcedure(sp)

#sp <- StoredProcedure(testfunc,
                      #"sp_TestFunc",
                      #inparam, #function to create into a S.P. and the S.P. name
                      #OutputData("iris_dataset"),
## OutputParameter("out", "numeric"),
                      #connectionString = paste("Driver={ODBC Driver 13 for SQL Server};",
                                             #"Server=EUR-RISKDBTST02;Database=RSandbox;",
                                             #"Trusted_Connection=Yes;", sep = "")
                      #)


print(setOutputParameter")



myproc <- function(func, spName, ..., filePath = NULL, batchSeparator = "GO") {
  funcName <- ""
  if (is.function(func)) {
    funcName <- deparse(substitute(func))
  }
  else {
    if (!is.character(func))
      stop(paste("you must provide either", "a function object or a function func"))
    funcName <- func
    func <- match.fun(func)
  }
  if (!is.character(spName) || length(spName) > 1 || spName ==
        "")
          stop("stored procedure name must be a non empty string")
  if (!(is.null(filePath) || is.character(filePath)) || (is.character(filePath) &&
        !dir.exists(filePath)))
          stop(paste("path must be either NULL or a string specifying",
            "a path to a valid directory"))
  spParams <- spProcessParams(list(...))
  inputParameters <- spParams$inputParameters
  if (!is.null(spParams$inputData)) {
    inputParameters[[spParams$inputData$name]] <- spParams$inputData
  }
  funcInputNames <- paste(names(inputParameters), names(inputParameters),
        sep = " = ")
  funcInputNames <- paste(funcInputNames, collapse = ", ")
  sqlSP <- structure(list(func = list(name = funcName, func = func),
        spName = spName, inputParamsAndData = inputParameters,
        outputParameters = spParams$outputParameters, connectionString = connectionString,
        registrationVec = spGenerateTSQL(list(name = funcName,
            func = func, params = funcInputNames), spName, dbName,
            spParams)), class = "MyStoredProcedure")
  if (!is.null(filePath)) {
    spWriteToFile(filePath, spName, sqlSP$registrationVec,
            batchSeparator)
  }
  return(sqlSP)
}

print(spGenerateTSQL)
methods(class = "StoredProcedure")