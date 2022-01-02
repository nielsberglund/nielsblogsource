from confluent_kafka import Producer
import socket
import sys
import gameplay
import random
import time

numberLoops = 100
minLatency = 10
maxLatency = 50

# EventHub

# conf = {'bootstrap.servers': 'eventhubadx.servicebus.windows.net:9093',
#         'security.protocol': 'SASL_SSL',
#         'sasl.mechanisms': 'PLAIN',
#         'sasl.username': "$ConnectionString",
#         'sasl.password': "Endpoint=sb://eventhubadx.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=P6W8hpkdSLGFbIoPSrezBqRZ68c7+w/8wkZvAgzkzVg=",
#         'client.id': socket.gethostname()}



# Kafka

conf = {'bootstrap.servers': 'pkc-lz6r3.northeurope.azure.confluent.cloud:9092',
        'security.protocol': 'SASL_SSL',
        'sasl.mechanisms': 'PLAIN',
        'sasl.username': "Q7FN4WW55VR2OXKV",
        'sasl.password': "km6UBNnJPL8LMxE3i3AdDOnu5auxtAu2/ZuqQ2i/rTdZq7BteNCoPjV2fwie9/ql",
        'client.id': socket.gethostname()}

producer = Producer(conf)

def acked(err, msg):
    if err is not None:
        print("Failed to deliver message: %s: %s" % (str(msg), str(err)))
    else:
        print("Message produced: %s" % (str(msg)))


for i in range(numberLoops) :
  keyVal, jsonObj = gameplay.generateGamePlay()
  latency = random.randint(minLatency, maxLatency)
  producer.produce("gameplay", key=str(keyVal), value=jsonObj, callback=acked)
  time.sleep(latency / 1000)

producer.poll(5)
# print("Hit any key to exit")
# a = sys.stdin.readline()
producer.flush()