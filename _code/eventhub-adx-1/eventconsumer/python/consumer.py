from confluent_kafka import Consumer
import socket
import sys
import random
import time

# eventhub
# conf = {'bootstrap.servers': 'eventhubadx.servicebus.windows.net:9093',
#         'security.protocol': 'SASL_SSL',
#         'sasl.mechanisms': 'PLAIN',
#         'sasl.username': "$ConnectionString",
#         'sasl.password': "Endpoint=sb://eventhubadx.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=P6W8hpkdSLGFbIoPSrezBqRZ68c7+w/8wkZvAgzkzVg=",
#         'group.id': 'consumer1',
#         'auto.offset.reset': 'earliest'
#        }

# kafka
conf = {'bootstrap.servers': 'pkc-lz6r3.northeurope.azure.confluent.cloud:9092',
        'security.protocol': 'SASL_SSL',
        'sasl.mechanisms': 'PLAIN',
        'sasl.username': "Q7FN4WW55VR2OXKV",
        'sasl.password': "km6UBNnJPL8LMxE3i3AdDOnu5auxtAu2/ZuqQ2i/rTdZq7BteNCoPjV2fwie9/ql",
        'group.id': 'consumer1',
        'auto.offset.reset': 'earliest'
        }        


c = Consumer(conf)

c.subscribe(['gameplay'])

msgCount = 0

while True:
    msg = c.poll(1.0)

    if msg is None:
        continue
    if msg.error():
        print("Consumer error: {}".format(msg.error()))
        continue
    # if (msgCount == 0 or msgCount % 10 == 0):
    print('Received message: {}'.format(msg.value().decode('utf-8')))
    msgCount += 1



c.close()