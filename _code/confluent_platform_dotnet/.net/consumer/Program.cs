using System;
using System.Threading;
using Confluent.Kafka;

namespace consumer
{
    class KafkaConsumer
    {
        static CancellationTokenSource cts = new CancellationTokenSource();
        static ConsumerConfig consumerConfig = null;
        static void Main(string[] args)
        {
           CreateConfig();
           CreateConsumerAndConsume();
        }

        static void CreateConfig() {
            consumerConfig = new ConsumerConfig {
                BootstrapServers = "172.24.244.44:9092",
                GroupId = "test-group",
                AutoOffsetReset = AutoOffsetReset.Earliest
            };
        }

        static void CreateConsumerAndConsume() {

            var cb = new ConsumerBuilder<string, string>(consumerConfig);
                      
            Console.WriteLine("Press Ctrl+C to exit");
                       
            Console.CancelKeyPress += new ConsoleCancelEventHandler(OnExit);
                    
            using(var consumer = cb.Build() ) {
                consumer.Subscribe("testTopic");

                try {
           
                  while(!cts.IsCancellationRequested) {
                      var cr = consumer.Consume(cts.Token);
                      Console.WriteLine($"Consumed message '{cr.Value}' at: '{cr.TopicPartitionOffset}'.");
                  }
                }
                catch (Exception e) {
                    Console.WriteLine(e.Message);
                    consumer.Close();
                }
            }
        }

        static void OnExit(object sender, ConsoleCancelEventArgs args)
        {
            args.Cancel = true;
            Console.WriteLine("In OnExit");
            cts.Cancel();
            
        }
    }
}
