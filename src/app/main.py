from typing import Union
from fastapi import FastAPI
import psycopg2


def db_connect():
    con = psycopg2.connect(
        database="postgres",
        user="sskimos",
        password="",
        host="127.0.0.1",
        port="5432"
    )
    return con


app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/customer/{customer_id}")
def read_customer(customer_id: int):
    cur = db_connect().cursor()
    cur.execute(
        f"select * from customer where id = {customer_id}"
    )
    rows = cur.fetchall()
    return rows


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
