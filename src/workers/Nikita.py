import psycopg2
import pika
import uuid
import time

class Worker(object):
    def __init__(self):
        self.connection = pika.BlockingConnection(
            pika.ConnectionParameters(host='localhost'))

        self.channel = self.connection.channel()

        result = self.channel.queue_declare(queue='', exclusive=True)
        self.callback_queue = result.method.queue

        self.channel.basic_consume(
            queue=self.callback_queue,
            on_message_callback=self.on_response,
            auto_ack=True)

        self.response = None
        self.corr_id = None

    def on_response(self, ch, method, props, body):
        if self.corr_id == props.correlation_id:
            self.response = body

    def call(self):
        self.response = None
        self.corr_id = str(uuid.uuid4())
        self.channel.basic_publish(
            exchange='',
            routing_key='rpc_queue',
            properties=pika.BasicProperties(
                reply_to=self.callback_queue,
                correlation_id=self.corr_id,
            ),
            body=str("BEGIN; insert into transaction (id, s_id, r_id, count) values (1, 1, 2, 50); COMMIT;"))
        self.connection.process_data_events(time_limit=None)
        return self.response


def show_balance():
    conn = psycopg2.connect(database="billing_system", user="postgres",
                            password="321", host="localhost", port=9876)
    cur = conn.cursor()
    cur.execute("""
    SELECT balance from customer
    where cus_name = 'Nikita';
    """)
    return cur.fetchall()


# print("Nikita balance before operation:", show_balance()[0][0])
worker = Worker()
response = worker.call()
time.sleep(5)
print("Nikita balance after operation:", show_balance()[0][0])
