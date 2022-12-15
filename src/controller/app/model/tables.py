import psycopg2
from model import model


# ----------------------- Tables ----------------------- #
class Customer(BaseModel):
    manager_class = BaseManager
    table_name = "customer"
