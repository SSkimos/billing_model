import psycopg2

from src.controller.app.model.baseManager import BaseManager

# ----------------------- Setup ----------------------- #
DB_SETTINGS = {
    'host': '127.0.0.1',
    'port': '5432',
    'database': 'billing_system',
    'user': 'postgresql',
    'password': '321'
}

BaseManager.set_connection(database_settings=DB_SETTINGS)
