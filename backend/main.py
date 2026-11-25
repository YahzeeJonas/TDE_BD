
from fastapi import FastAPI
from backend.routers import router

app = FastAPI(title="StockTech API")

app.include_router(router)


@app.get("/")
def home():
    return {"mensagem": "StockTech API funcionando!"}
