package sql;

import com.microsoft.sqlserver.javalangextension.PrimitiveDataset;

import java.sql.Types;
import java.util.LinkedHashMap;
import com.microsoft.sqlserver.javalangextension.AbstractSqlServerExtensionExecutor;
public class JavaTest2 extends AbstractSqlServerExtensionExecutor {
    

    public JavaTest2() {
        executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
        executorInputDatasetClassName = PrimitiveDataset.class.getName();
        executorOutputDatasetClassName = PrimitiveDataset.class.getName();
    }

    public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {

        /*
          grab the RowID, x and y columns
          and convert them into arrays
        */
        int[] rowIds = input.getIntColumn(0);
        int[] xCol = input.getIntColumn(1);
        int[] yCol = input.getIntColumn(2);
        int rowCount = rowIds.length;

        //arrays for output data
        int[] outIds = new int[rowCount];
        int[] outRes = new int[rowCount];

        for(int i = 0; i < rowCount; i++) {
            int x = xCol[i];
            int y = yCol[i];
            outIds[i] = rowIds[i];
            outRes[i] = x + y;
        }

        //Create the return dataset
        PrimitiveDataset outData = new PrimitiveDataset();
        outData.addColumnMetadata(0, "RowID", java.sql.Types.INTEGER, 0, 0);
        outData.addColumnMetadata(1, "Result", java.sql.Types.INTEGER, 0, 0);

        outData.addIntColumn(0, outIds, null);
        outData.addIntColumn(1, outRes, null);
                
        return outData;

    }
}