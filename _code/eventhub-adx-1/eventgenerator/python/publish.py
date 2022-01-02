from confluent_kafka import Producer
import socket
import random
import datetime

# Kafka

def acked(err, msg):
    if err is not None:
        print("Failed to deliver message: %s: %s" % (str(msg), str(err)))
    else:
        print("Message produced: %s" % (str(msg)))


# EventHub

conf = {'bootstrap.servers': 'kafkaeventhubs.servicebus.windows.net:9093',
        'security.protocol': 'SASL_SSL',
        'sasl.mechanisms': 'PLAIN',
        'sasl.username': "$ConnectionString",
        'sasl.password': "Endpoint=sb://kafkaeventhubs.servicebus.windows.net/;SharedAccessKeyName=publishconsumepolicy;SharedAccessKey=p/yYvM6gIGbWN+2TuO3fpoUf+BtMCAi4kq0pM0pMxc4=;EntityPath=testtopic",
        'client.id': socket.gethostname()}

# conf = {'bootstrap.servers': 'pkc-lz6r3.northeurope.azure.confluent.cloud:9092',
#       'security.protocol': 'SASL_SSL',
#        'sasl.mechanisms': 'PLAIN',
#        'sasl.username': "CWNDR3KOT26TYB33",
#        'sasl.password': "JbE43vz02mm2j3Gj5u7iuwpEsRXuVCKMKOB9/jiVIhBzqlwb5b7bP4omiDmhZwsy",
#        'client.id': socket.gethostname()}

producer = Producer(conf)

while(True):
  
    user_input = input(" Please enter Y to publish, N to exit: ")
      
    if user_input == "Y":
        # generate a random number for key value
        keyVal = random.randint(1, 10)
        msg = str(keyVal) + ", Hello World, " + datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S.%f")
        producer.produce("testtopic", key=str(keyVal), value=msg, callback=acked)     
    elif user_input == "N":
        break
  
    else:
        print("Retry (Y/N)")

producer.poll(5)
producer.flush()



# EventHub

# conf = {'bootstrap.servers': 'kafkaeventhubs.servicebus.windows.net:9093',
#         'security.protocol': 'SASL_SSL',
#         'sasl.mechanisms': 'PLAIN',
#         'sasl.username': "$ConnectionString",
#         'sasl.password': "Endpoint=sb://kafkaeventhubs.servicebus.windows.net/;SharedAccessKeyName=publishconsumepolicy;SharedAccessKey=p/yYvM6gIGbWN+2TuO3fpoUf+BtMCAi4kq0pM0pMxc4=;EntityPath=testtopic",
#         'client.id': socket.gethostname()}


