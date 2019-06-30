library(RevoScaleR); 
rxIgnoreResult <- .Call('RxSqlSatelliteCall', 
          list(sessionId='1C49FD9B-BA79-4C1E-993B-E04669259CD8', 
               taskId=0, 
               port=51318, 
               logPath='', 
               pipeName='DataSet1_1Col_Int_1Row', 
               sqlSatellitePath='C:\\<sql_inst_binn_path>\\
                                  sqlsatellite.dll',
               errorToStdError=T));