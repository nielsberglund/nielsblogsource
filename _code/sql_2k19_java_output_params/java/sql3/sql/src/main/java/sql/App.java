package sql;

import com.microsoft.sqlserver.javalangextension.PrimitiveDataset;

import java.sql.Types;
import java.util.*;
/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        PrimitiveDataset ds = new PrimitiveDataset();

        ds.getColumnNullMap(0);

        ds.addColumnMetadata(0, "RowID", Types.INTEGER, 0, 0);
        //ds.addColumnMetadata(1, "x", Types.INTEGER, 0, 0);

        //int[] col1 = new int[5];
        //int[] col2 = new int[5];
        //ArrayList nullMap = new ArrayList();

        


        //for(int rownum = 0; rownum <5; rownum++){
//
  //      }
        
        
        // JavaTest1 j1 = new JavaTest1();
        // LinkedHashMap<String, Object> lh = new LinkedHashMap<String, Object>();
        // lh.put("x", 21);
        // lh.put("y", 21);

        // j1.execute(null, lh);

        // int y = 33;
        // int l = 10;

        // double res = (double)y / l;

        // System.out.printf("Average value of y is: %f", res);

    }
}
