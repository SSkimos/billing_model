from typing import Union
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def basic():
    return {"Hello": "transaction.py"}
