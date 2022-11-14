from typing import Union
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def basic():
    return {"Hello": "server.py"}

@app.get("/server")
def basic():
    return {"Hello": "server.py"}
