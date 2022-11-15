from typing import Union
from fastapi import FastAPI
import json

# TODO: refactoring
import psycopg2

app = FastAPI()


@app.get("/")
def read_all_customers():
    # queue connect
    con = psycopg2.connect(
        database="billing",
        user="test_user",
        password="123",
        host="postgres_db",
        port="5432"
    )
    cur = con.cursor()
    cur.execute("select * from customer;")
    rows = json.loads(cur.fetchone())
    cur.connection.close()
    return rows

# @app.get("/")
# def read_all_customers():
#     # queue connect
#     con = psycopg2.connect(
#         database="billing",
#         user="test_user",
#         password="123",
#         host="postgres_db",
#         port="5432"
#     )
#     cur = con.cursor()
#     cur.execute("select * from customer;")
#     rows = cur.fetchall()
#     cur.connection.close()
#     return rows
