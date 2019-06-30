


exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10); 
          d<-42'
               , @input_data_1 = N'
              SELECT TOP(1) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_1M'