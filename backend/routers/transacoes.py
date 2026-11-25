
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import text
from sqlalchemy.exc import SQLAlchemyError

from backend.database.database import get_db
from backend.schemas.compra import RegistrarCompraRequest

router = APIRouter(prefix="/transacoes", tags=["Transações"])


@router.post("/registrar-compra")
def registrar_compra(
    dados: RegistrarCompraRequest,
    db: Session = Depends(get_db)
):
    try:
        db.execute(
            text("""
                CALL sp_registrar_compra(
                    :id_fornecedor,
                    :id_funcionario,
                    :id_produto,
                    :quantidade,
                    :valor_unitario
                )
            """),
            {
                "id_fornecedor": dados.id_fornecedor,
                "id_funcionario": dados.id_funcionario,
                "id_produto": dados.id_produto,
                "quantidade": dados.quantidade,
                "valor_unitario": dados.valor_unitario
            }
        )

        return {"mensagem": "Compra registrada com sucesso!"}

    except SQLAlchemyError as erro:
        db.rollback()
        raise HTTPException(400, detail=str(erro))
