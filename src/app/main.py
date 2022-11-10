from typing import Union
from fastapi import FastAPI
import pika
import uuid

app = FastAPI()


class Server(object):
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

    def call(self, message):
        self.response = None
        self.corr_id = str(uuid.uuid4())
        self.channel.basic_publish(
            exchange='',
            routing_key='rpc_queue',
            properties=pika.BasicProperties(
                reply_to=self.callback_queue,
                correlation_id=self.corr_id,
            ),
            body=message)
        self.connection.process_data_events(time_limit=None)
        return self.response



def queue_connect():
    con = pika.BlockingConnection(
        pika.ConnectionParameters(host='localhost'))
    return con


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/customer/{customer_id}")
def read_customer(customer_id: int):
    server_rpc = Server()
    response = server_rpc.call(f"select * from customer where id = {customer_id}")
    return response

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
