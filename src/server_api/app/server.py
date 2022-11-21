from typing import Union
from fastapi import FastAPI
import json
import collections
import psycopg2

app = FastAPI()


class PostgreSQL:
    def __init__(self):
        self.conn = psycopg2.connect(
            database="billing_system",
            user="test_user",
            password="123",
            host="postgres_db",
            port="5432"
        )
        self.conn.autocommit = True

    def connect(self):
        return self.conn


@app.get("/customers/all")
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
        d['customer_type_id'] = row[1]
        d['first_name'] = row[2]
        d['second_name'] = row[3]
        d['address'] = row[4]
        d['mobile_number'] = row[5]
        objects_list.append(d)
    return objects_list

@app.get("/customers/by_id/{person_id}")
def read_all_customers(person_id: int):
    # queue connect
    postgres = PostgreSQL()
    con = postgres.connect()
    cur = con.cursor()
    cur.execute(f"select * from customer where id = {person_id};")
    sel = cur.fetchall()
    cur.connection.close()
    objects_list = []
    for row in sel:
        d = collections.OrderedDict()
        d['id'] = row[0]
        d['customer_type_id'] = row[1]
        d['first_name'] = row[2]
        d['second_name'] = row[3]
        d['address'] = row[4]
        d['mobile_number'] = row[5]
        objects_list.append(d)
    return objects_list

@app.get("/customers/by_id/{person_id}")
def read_all_customers(person_id: int):
    # queue connect
    postgres = PostgreSQL()
    con = postgres.connect()
    cur = con.cursor()
    cur.execute(f"select * from customer where id = {person_id};")
    sel = cur.fetchall()
    cur.connection.close()
    objects_list = []
    for row in sel:
        d = collections.OrderedDict()
        d['id'] = row[0]
        d['customer_type_id'] = row[1]
        d['first_name'] = row[2]
        d['second_name'] = row[3]
        d['address'] = row[4]
        d['mobile_number'] = row[5]
        objects_list.append(d)
    return objects_list

