using System;
using System.Threading;
using Confluent.Kafka;

namespace publisher
{
    class KafkaPublishTest
    {
        private static readonly AutoResetEvent _closing = new AutoResetEvent(false);
        static IProducer<string, string> producer = null;
        static ProducerConfig producerConfig = null;
        
        static void CreateConfig() {
            producerConfig = new ProducerConfig
                {
                    BootstrapServers = "localhost:9092"
                };
        }

        static void CreateProducer() {
            producer = new ProducerBuilder<string, string>(producerConfig).Build();
        }

        static void Main(string[] args)
        {
            CreateConfig();
            CreateProducer();
            Console.WriteLine("Press Ctrl+C to exit");
            
            Console.CancelKeyPress += new ConsoleCancelEventHandler(OnExit);
            int x = 0;
      
            while(x < 100) {
             SendMessage("testTopic", $"This test: {x}");
             x++;
             Thread.Sleep(200);
            }
            
            _closing.WaitOne();
        }
        protected static void OnExit(object sender, ConsoleCancelEventArgs args)
        {
            Console.WriteLine("Exit");
            _closing.Set();
        }

  

        static async void SendMessage(string topic, string message) {
            var msg = new Message<string, string> {
                Key = null,
                Value = message
            };

            var delRep = await producer.ProduceAsync(topic, msg);
            var topicOffset = delRep.TopicPartitionOffset;

            Console.WriteLine($"Delivered '{delRep.Value}' to: {topicOffset}");
        }

    }
}



