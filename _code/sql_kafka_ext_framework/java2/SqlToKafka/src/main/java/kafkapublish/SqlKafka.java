package kafkapublish;
import java.util.Properties;

//import simple producer packages
import org.apache.kafka.clients.producer.Producer;

import java.sql.Types;
import java.util.LinkedHashMap;

//import KafkaProducer packages
import org.apache.kafka.clients.producer.KafkaProducer;
//import ProducerRecord packages
import org.apache.kafka.clients.producer.ProducerRecord;

import com.microsoft.sqlserver.javalangextension.*;

public class SqlKafka  extends AbstractSqlServerExtensionExecutor
{

    public SqlKafka() 
    {
        executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
        executorInputDatasetClassName = PrimitiveDataset.class.getName();
        executorOutputDatasetClassName = PrimitiveDataset.class.getName();
    }

    public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) 
    {  
        String[] brokers = input.getStringColumn(0);
        String[] partitions = input.getStringColumn(1);
        String[] topics = input.getStringColumn(2);
        String message = (String)params.get("msg");

        int rowCount = brokers.length;

        for(int i= 0; i < rowCount; i++)
        {
          //grab the column values  
          String broker = (String)brokers[i];
          String partition = (String)partitions[i];
          String topic = (String)topics[i];
          
          sqlPublishToKafka(topic, partition, broker, message);
        }
        return null;
    }

    public void sqlPublishToKafka(String topic, String partition, String broker, String message) {
        
        Properties config = new Properties();
        config.put("client.id", "1");
        config.put("bootstrap.servers", broker);
        config.put("acks", "all");

        config.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        config.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        Producer<String, String> producer = new KafkaProducer<String, String>(config);
        producer.send(new ProducerRecord<String, String>(topic, partition, message));
        producer.close();
    }
    
    
    
    
    public static void main( String[] args )
    {
        SqlKafka sq = new SqlKafka();
        //sq.publishToKafka();

        PrimitiveDataset ds = new PrimitiveDataset();

        ds.addColumnMetadata(0, "Broker", Types.VARCHAR, 0, 0);
        ds.addColumnMetadata(1, "Partition", Types.VARCHAR, 0, 0);
        ds.addColumnMetadata(2, "Topic", Types.VARCHAR, 0, 0);

        String[] brokers = new String[1];
        brokers[0] = "localhost:9092";
        String[] partitions = new String[1];
        partitions[0] = null;
        String[] topics = new String[1];
        topics[0] = "testTopic";


        ds.addStringColumn(0, brokers);
        ds.addStringColumn(1, partitions);
        ds.addStringColumn(2, topics);

        LinkedHashMap<String, Object> params = new LinkedHashMap<String, Object>();
        params.put("msg", "Hello World");

        sq.execute(ds, params);


    }

    public void publishToKafka() {
        String topicName = "testTopic";

        Properties config = new Properties();
        config.put("client.id", "1");
        config.put("bootstrap.servers", "localhost:9092");
        config.put("acks", "all");

        config.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        config.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        Producer<String, String> producer = new KafkaProducer<String, String>(config);

        for (int i = 0; i < 10; i++) {
            producer.send(new ProducerRecord<String, String>(topicName, null, String.format("Hello number: %s", i)));
        }
        producer.close();

    }
}
