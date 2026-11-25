
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import text

from database.database import get_db

router = APIRouter(prefix="/views", tags=["Visões (Views)"])


@router.get("/estoque")
def listar_estoque(db: Session = Depends(get_db)):
    resultado = db.execute(
        text("SELECT * FROM vw_estoque_produtos")
    )

    return resultado.mappings().all()
