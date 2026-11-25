
from datetime import datetime

from pydantic import BaseModel, ConfigDict, Field


class EstoqueResponse(BaseModel):
    id_estoque: int
    id_produto: int
    quantidade_atual: int
    data_atualizacao: datetime

    model_config = ConfigDict(from_attributes=True)


class EstoqueUpdate(BaseModel):
    quantidade_atual: int = Field(ge=0)
