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


@app.get("/all")
def read_all_customers():
    # queue connect
    con = psycopg2.connect(
        database="billing",
        user="postgres",
        password="321",
        host="localhost",
        port="5432"
    )
    cur = con.cursor()
    cur.execute("select * from customer;")
    rows = cur.fetchall()
    return rows
