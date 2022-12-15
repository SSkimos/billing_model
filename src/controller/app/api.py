from typing import Union
from fastapi import FastAPI
import sys

import model.baseManager
import model.tables


app = FastAPI()


@app.get("/")
def get_main():
    employees = Customer.objects.select('first_name', 'second_name')
    print(employees)


get_main()
