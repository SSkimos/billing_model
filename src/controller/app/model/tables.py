import psycopg2

from .model import BaseModel


# ----------------------- Tables ----------------------- #
class Customer(BaseModel):
    manager_class = BaseManager
    table_name = "customer"
