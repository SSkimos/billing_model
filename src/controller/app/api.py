from fastapi import FastAPI

from model.tables import Customer

app = FastAPI()


@app.get("/")
def get_main():
    employees = Customer.objects.select('first_name', 'second_name')
    print(employees)


get_main()