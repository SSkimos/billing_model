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


def read_customer():
    cur = db_connect().cursor()
    cur.execute(
        "select first_name, second_name from customer where id = 1"
    )
    rows = cur.fetchall()
    print(rows)


read_customer()