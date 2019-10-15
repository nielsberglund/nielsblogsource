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
        // JavaTest1 j1 = new JavaTest1();
        // LinkedHashMap<String, Object> lh = new LinkedHashMap<String, Object>();
        // lh.put("x", 21);
        // lh.put("y", 21);

        // j1.execute(null, lh);

        int y = 33;
        int l = 10;

        double res = (double)y / l;

        System.out.printf("Average value of y is: %f", res);

    }
}
