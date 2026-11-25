
from fastapi import APIRouter

from backend.routers import (
    produtos,
    consultas,
    views,
    transacoes,
    triggers,
    procedures
)

router = APIRouter()

router.include_router(produtos.router)
router.include_router(consultas.router)
router.include_router(views.router)
router.include_router(transacoes.router)
router.include_router(triggers.router)
router.include_router(procedures.router)
