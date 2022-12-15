import psycopg2

from src.controller.app.model.baseManager import BaseManager
from src.controller.app.model.model import BaseModel


# ----------------------- Tables ----------------------- #
class Customer(BaseModel):
    manager_class = BaseManager
    table_name = "customer"
