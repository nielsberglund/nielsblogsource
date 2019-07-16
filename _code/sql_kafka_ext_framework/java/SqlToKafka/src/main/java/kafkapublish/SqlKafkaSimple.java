package kafkapublish;
import java.util.Properties;

//import simple producer packages
import org.apache.kafka.clients.producer.Producer;
import java.util.LinkedHashMap;

//import KafkaProducer packages
import org.apache.kafka.clients.producer.KafkaProducer;
//import ProducerRecord packages
import org.apache.kafka.clients.producer.ProducerRecord;

import com.microsoft.sqlserver.javalangextension.*;

public class SqlKafkaSimple extends AbstractSqlServerExtensionExecutor {
  
  public SqlKafkaSimple() 
  {
    executorExtensionVersion = SQLSERVER_JAVA_LANG_EXTENSION_V1;
    executorInputDatasetClassName = PrimitiveDataset.class.getName();
    executorOutputDatasetClassName = PrimitiveDataset.class.getName();
  }

  public PrimitiveDataset execute(PrimitiveDataset input, LinkedHashMap<String, Object> params) {
    
    String message = (String)params.get("msg");
    String broker = (String)params.get("broker");
    String topic = (String)params.get("topic");
    String partition = (String)params.get("partition");

    sqlPublishToKafka(topic, partition, broker, message);

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



}