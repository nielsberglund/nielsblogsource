from confluent_kafka import Consumer
import socket
import sys
import random
import time

# eventhub
conf = {'bootstrap.servers': 'dbzeventhubs.servicebus.windows.net:9093',
        'security.protocol': 'SASL_SSL',
        'sasl.mechanisms': 'PLAIN',
        'sasl.username': "$ConnectionString",
        'sasl.password': "Endpoint=sb://dbzeventhubs.servicebus.windows.net/;SharedAccessKeyName=KafkaConnect;SharedAccessKey=b5uscFZr+rHUzToTfBuLm37FNDlZVFQI0MSzJGXsLhM=",
        'group.id': 'consumer1',
        'auto.offset.reset': 'earliest'
       }

c = Consumer(conf)

c.subscribe(['debeziumtestserver.dbo.tb_cdctab1'])

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