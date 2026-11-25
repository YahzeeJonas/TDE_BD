
from datetime import datetime
from decimal import Decimal
from typing import Literal

from pydantic import BaseModel, ConfigDict, Field


StatusCompra = Literal[
    "PENDENTE",
    "RECEBIDA",
    "CANCELADA"
]


class ItemCompraBase(BaseModel):
    id_produto: int
    quantidade: int = Field(gt=0)
    valor_unitario: Decimal = Field(
        ge=0, max_digits=10, decimal_places=2
    )


class ItemCompraResponse(ItemCompraBase):
    id_item_compra: int
    id_compra: int
    subtotal: Decimal

    model_config = ConfigDict(from_attributes=True)


class CompraBase(BaseModel):
    id_fornecedor: int
    id_funcionario: int
    data_compra: datetime
    valor_total: Decimal = Field(ge=0)
    status: StatusCompra


class CompraCreate(CompraBase):
    pass


class CompraResponse(CompraBase):
    id_compra: int
    itens: list[ItemCompraResponse] = []

    model_config = ConfigDict(from_attributes=True)


class RegistrarCompraRequest(BaseModel):
    id_fornecedor: int
    id_funcionario: int
    id_produto: int
    quantidade: int = Field(gt=0)
    valor_unitario: Decimal = Field(
        ge=0, max_digits=10, decimal_places=2
    )

