EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
             #Sys.sleep(30)
             pid <- Sys.getpid()
             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
 
             coef <- r$coefficients
             icept <- coef[1];
              OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
       , @input_data_1 = N'
              SELECT  y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_30M'
WITH RESULT SETS ((pid INT NOT NULL, nRows INT NOT NULL, intercept FLOAT NULL)
); 
