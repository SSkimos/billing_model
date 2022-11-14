from typing import Union
from fastapi import FastAPI

# TODO: refactoring
import psycopg2

app = FastAPI()


@app.get("/")
def basic():
    con = psycopg2.connect(
        database="billing",
        user="test_user",
        password="123",
        host="localhost",
        port="9876"
    )
    cur = con.cursor()
    cur.execute("select * from customer;")
    rows = cur.fetchall()
    return {"Hello": "database.py"}


@app.get("/server")
def basic():
    con = psycopg2.connect(
        database="billing",
        user="test_user",
        password="123",
        host="localhost",
        port="9876"
    )
    cur = con.cursor()
    cur.execute("select * from customer;")
    rows = cur.fetchall()
    return {"Hello": "database.py"}


@app.get("/all")
def read_all_customers():
    # queue connect
    con = psycopg2.connect(
        database="billing",
        user="test_user",
        password="123",
        host="localhost",
        port="9876"
    )
    cur = con.cursor()
    cur.execute("select * from customer;")
    rows = cur.fetchall()
    return rows
