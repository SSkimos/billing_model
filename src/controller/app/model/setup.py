import psycopg2

# ----------------------- Setup ----------------------- #
DB_SETTINGS = {
    'host': '127.0.0.1',
    'port': '5432',
    'database': 'billing_system',
    'user': 'postgresql',
    'password': '321'
}

BaseManager.set_connection(database_settings=DB_SETTINGS)
