package javasql;

import java.util.Properties;

//import simple producer packages
import org.apache.kafka.clients.producer.Producer;

//import KafkaProducer packages
import org.apache.kafka.clients.producer.KafkaProducer;

//import ProducerRecord packages
import org.apache.kafka.clients.producer.ProducerRecord;

public class SimplePublisher 
{
    public static short numberOfOutputCols;
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        publishKafka();
    }

    public static void publishKafka() {
        String topicName = "testTopic";

        Properties config = new Properties();
        config.put("client.id", "1");
        config.put("bootstrap.servers", "localhost:29092");
        config.put("acks", "all");

        config.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        config.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        Producer<String, String> producer = new KafkaProducer<String, String>(config);

        for (int i = 0; i < 10; i++) {
            producer.send(new ProducerRecord<String, String>(topicName, Integer.toString(i), Integer.toString(i)));
        }
        System.out.println("Messages sent successfully");
        producer.close();

        System.out.print("hello");

    }
}
