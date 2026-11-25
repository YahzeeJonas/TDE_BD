
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import text
from sqlalchemy.exc import SQLAlchemyError

from backend.database import get_db

router = APIRouter(prefix="/mysql", tags=["Procedures e Functions"])


# FUNCTION: calcular valor do estoque
@router.get("/functions/estoque/{id_produto}")
def consultar_valor_estoque(
    id_produto: int,
    db: Session = Depends(get_db)
):
    resultado = db.execute(
        text("""
            SELECT fn_valor_estoque(:id_produto) AS valor_estoque
        """),
        {"id_produto": id_produto}
    ).mappings().first()

    if resultado is None or resultado["valor_estoque"] is None:
        raise HTTPException(
            404,
            "Produto não encontrado ou sem estoque cadastrado."
        )

    return {
        "id_produto": id_produto,
        "valor_estoque": resultado["valor_estoque"]
    }


# PROCEDURE: consultar estoque
@router.get("/procedures/estoque/{id_produto}")
def consultar_estoque(
    id_produto: int,
    db: Session = Depends(get_db)
):
    try:
        resultado = db.execute(
            text("CALL sp_consultar_estoque(:id_produto)"),
            {"id_produto": id_produto}
        )

        return resultado.mappings().all()

    except SQLAlchemyError as erro:
        raise HTTPException(400, detail=str(erro))


# PROCEDURE: produtos mais vendidos
@router.get("/procedures/produtos-mais-vendidos")
def produtos_mais_vendidos(
    limite: int = 5,
    db: Session = Depends(get_db)
):
    try:
        resultado = db.execute(
            text("CALL sp_produtos_mais_vendidos(:limite)"),
            {"limite": limite}
        )

        return resultado.mappings().all()

    except SQLAlchemyError as erro:
        raise HTTPException(400, detail=str(erro))
