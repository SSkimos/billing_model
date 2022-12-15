from typing import Union
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def get_main():
    return {"Hello": "api"}
