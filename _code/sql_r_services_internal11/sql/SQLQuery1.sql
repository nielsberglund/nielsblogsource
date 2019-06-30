

exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42';


exec sp_execute_external_script
    @language = N'R' ,
    @script = N'Sys.sleep(10) 
           d<-42'
  , @input_data_1 = N'SELECT 42';
