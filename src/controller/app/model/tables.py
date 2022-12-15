import psycopg2

from .model import BaseModel
from .baseManager import BaseManager


# ----------------------- Tables ----------------------- #
class Customer(BaseModel):
    manager_class = BaseManager
    table_name = "customer"
