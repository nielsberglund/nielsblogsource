

EXEC sp_execute_external_script  
@language =N'Python', 
@script= N'print("The Answer Is 42!!!")';

    import sys 
import os
print("****************************************************") 


EXEC sp_execute_external_script  @language =N'R', 
                                 @script=N'OutputDataSet<-InputDataSet', 
                                 @input_data_1 =N'SELECT 42' 
      WITH RESULT SETS (([TheAnswer] int not null));  
GO           