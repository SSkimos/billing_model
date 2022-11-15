from typing import Union
from fastapi import FastAPI
import json
import collections
import psycopg2

app = FastAPI()


class PostgreSQL:
    def __init__(self):
        self.conn = psycopg2.connect(
            database="billing",
            user="test_user",
            password="123",
            host="postgres_db",
            port="5432"
        )
        self.conn.autocommit = True

    def connect(self):
        return self.conn


@app.get("/")
def read_all_customers():
    # queue connect
    postgres = PostgreSQL()
    con = postgres.connect()
    cur = con.cursor()
    cur.execute("select * from customer;")
    sel = cur.fetchall()
    cur.connection.close()
    objects_list = []
    for row in sel:
        d = collections.OrderedDict()
        d['id'] = row[0]
        d['test'] = row[1]
        objects_list.append(d)
    return objects_list

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
