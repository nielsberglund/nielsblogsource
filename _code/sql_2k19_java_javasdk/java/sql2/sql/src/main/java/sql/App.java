package sql;



import com.microsoft.sqlserver.javalangextension.PrimitiveDataset;

import java.util.LinkedHashMap;


/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        LinkedHashMap<String, Object> lhm = new LinkedHashMap<String, Object>();
        lhm.put("p1", 42);

        JavaTest1 j1 = new JavaTest1();

        j1.execute(null, lhm);

        System.out.println( "Hello World!" );
    }
}
