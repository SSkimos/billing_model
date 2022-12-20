import psycopg2


def show_balance():
    conn = psycopg2.connect(database="billing_system", user="postgres",
                            password="321", host="localhost", port=9876)
    cur = conn.cursor()
    cur.execute("""
    SELECT balance from customer
    where cus_name = 'Alex';
    """)
    return cur.fetchall()


print("Alex balance:", show_balance()[0][0])
