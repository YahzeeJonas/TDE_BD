
from datetime import datetime
from typing import Literal

from pydantic import BaseModel, ConfigDict, Field


TipoMovimentacao = Literal[
    "ENTRADA",
    "SAIDA"
]


class MovimentacaoCreate(BaseModel):
    id_produto: int
    id_funcionario: int
    tipo: TipoMovimentacao
    quantidade: int = Field(gt=0)
    motivo: str | None = Field(default=None, max_length=255)


class MovimentacaoResponse(MovimentacaoCreate):
    id_movimentacao: int
    data_movimentacao: datetime

    model_config = ConfigDict(from_attributes=True)
