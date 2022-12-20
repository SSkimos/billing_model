#!/usr/bin/env python
import pika
import psycopg2

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))

channel = connection.channel()

channel.queue_declare(queue='rpc_queue')


def create_node(message):
    conn = psycopg2.connect(database="billing_system", user="postgres",
                            password="321", host="localhost", port=9876)
    cur = conn.cursor()
    cur.execute(message)
    conn.commit()

def on_request(ch, method, props, body):

    print(" [.] operation received %s" % body)
    ch.basic_publish(exchange='',
                     routing_key=props.reply_to,
                     properties=pika.BasicProperties(correlation_id = \
                                                         props.correlation_id),
                     body=str(body))
    ch.basic_ack(delivery_tag=method.delivery_tag)
    create_node(body)

channel.basic_qos(prefetch_count=1)
channel.basic_consume(queue='rpc_queue', on_message_callback=on_request)

print(" [x] Awaiting RPC requests")
channel.start_consuming()
