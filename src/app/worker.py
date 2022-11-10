import pika
import time
import psycopg2

# queue connect
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
channel.queue_declare(queue='rpc_queue')

def read_from_db(body):
    # database connect
    con = psycopg2.connect(
        database="postgres",
        user="sskimos",
        password="",
        host="127.0.0.1",
        port="5432"
    )
    cur = con.cursor()
    cur.execute(body)
    rows = cur.fetchall()
    return rows


def on_request(ch, method, props, body):
    response = read_from_db(body)
    ch.basic_publish(exchange='',
                     routing_key=props.reply_to,
                     properties=pika.BasicProperties(correlation_id= \
                                                         props.correlation_id),
                     body=str(response))
    ch.basic_ack(delivery_tag=method.delivery_tag)


channel.basic_qos(prefetch_count=1)
channel.basic_consume(queue='rpc_queue', on_message_callback=on_request)

print(" [x] Awaiting RPC requests")
channel.start_consuming()
