
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError

from backend.database import get_db
from backend.models.produto import Produto
from backend.schemas.produto import (
    ProdutoCreate,
    ProdutoUpdate,
    ProdutoResponse
)

router = APIRouter(prefix="/produtos", tags=["Restrições de Integridade"])


@router.get("/", response_model=list[ProdutoResponse])
def listar_produtos(db: Session = Depends(get_db)):
    return db.query(Produto).order_by(Produto.nome).all()


@router.get("/{id_produto}", response_model=ProdutoResponse)
def consultar_produto(id_produto: int, db: Session = Depends(get_db)):
    produto = db.query(Produto).filter(
        Produto.id_produto == id_produto
    ).first()

    if produto is None:
        raise HTTPException(404, "Produto não encontrado")

    return produto


@router.post("/", response_model=ProdutoResponse, status_code=201)
def cadastrar_produto(
    dados: ProdutoCreate,
    db: Session = Depends(get_db)
):
    produto = Produto(**dados.model_dump())

    try:
        db.add(produto)
        db.commit()
        db.refresh(produto)
        return produto

    except IntegrityError:
        db.rollback()
        raise HTTPException(
            400,
            "Categoria inexistente ou código de barras já cadastrado"
        )


@router.put("/{id_produto}", response_model=ProdutoResponse)
def atualizar_produto(
    id_produto: int,
    dados: ProdutoUpdate,
    db: Session = Depends(get_db)
):
    produto = db.query(Produto).filter(
        Produto.id_produto == id_produto
    ).first()

    if produto is None:
        raise HTTPException(404, "Produto não encontrado")

    atualizacoes = dados.model_dump(exclude_unset=True)

    for campo, valor in atualizacoes.items():
        setattr(produto, campo, valor)

    try:
        db.commit()
        db.refresh(produto)
        return produto

    except IntegrityError:
        db.rollback()
        raise HTTPException(
            400,
            "Não foi possível atualizar o produto. Verifique os dados."
        )


@router.delete("/{id_produto}")
def excluir_produto(id_produto: int, db: Session = Depends(get_db)):
    produto = db.query(Produto).filter(
        Produto.id_produto == id_produto
    ).first()

    if produto is None:
        raise HTTPException(404, "Produto não encontrado")

    produto.ativo = False
    db.commit()

    return {"mensagem": "Produto desativado com sucesso"}
