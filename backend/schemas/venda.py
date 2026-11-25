
from datetime import datetime
from decimal import Decimal
from typing import Literal

from pydantic import BaseModel, ConfigDict, Field


StatusVenda = Literal[
    "PENDENTE",
    "FINALIZADA",
    "CANCELADA"
]


class ItemVendaBase(BaseModel):
    id_produto: int
    quantidade: int = Field(gt=0)
    valor_unitario: Decimal = Field(ge=0)


class ItemVendaResponse(ItemVendaBase):
    id_item_venda: int
    id_venda: int
    subtotal: Decimal

    model_config = ConfigDict(from_attributes=True)


class VendaBase(BaseModel):
    id_cliente: int | None = None
    id_funcionario: int
    data_venda: datetime
    valor_total: Decimal = Field(ge=0)
    status: StatusVenda


class VendaCreate(VendaBase):
    pass


class VendaResponse(VendaBase):
    id_venda: int
    itens: list[ItemVendaResponse] = []

    model_config = ConfigDict(from_attributes=True)


class RegistrarVendaRequest(BaseModel):
    id_cliente: int | None = None
    id_funcionario: int
    id_produto: int
    quantidade: int = Field(gt=0)
