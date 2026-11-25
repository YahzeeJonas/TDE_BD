
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError

from backend.database import get_db
from backend.models.produto import Produto

router = APIRouter(prefix="/triggers", tags=["Gatilhos (Triggers)"])


@router.put("/produtos/{id_produto}/preco")
def atualizar_preco(
    id_produto: int,
    preco_venda: float = Query(ge=0),
    db: Session = Depends(get_db)
):
    produto = db.query(Produto).filter(
        Produto.id_produto == id_produto
    ).first()

    if produto is None:
        raise HTTPException(404, "Produto não encontrado")

    produto.preco_venda = preco_venda

    try:
        db.commit()

        return {
            "mensagem": "Preço atualizado com sucesso. A Trigger foi acionada."
        }

    except SQLAlchemyError:
        db.rollback()
        raise HTTPException(
            400,
            "Não foi possível atualizar o preço do produto."
        )
