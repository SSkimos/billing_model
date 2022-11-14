from typing import Union
from fastapi import FastAPI

# TODO: refactoring
import psycopg2

app = FastAPI()


@app.get("/")
def basic():
    return {"Hello": "server.py"}


@app.get("/server")
def basic():
    return {"Hello": "server.py"}


@app.get("/customers/all")
def read_all_customers():
    # queue connect
    con = psycopg2.connect(
        database="test",
        user="admin",
        password="admin",
        host="127.0.0.1",
        port="5432"
    )
    cur = con.cursor()
    cur.execute("select * from customer;")
    rows = cur.fetchall()
    return rows
