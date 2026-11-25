
from decimal import Decimal

from pydantic import BaseModel, ConfigDict, Field


class CategoriaBase(BaseModel):
    nome: str = Field(min_length=2, max_length=150)
    descricao: str | None = None


class CategoriaCreate(CategoriaBase):
    pass


class CategoriaResponse(CategoriaBase):
    id_categoria: int

    model_config = ConfigDict(from_attributes=True)


class ProdutoBase(BaseModel):
    id_categoria: int
    nome: str = Field(min_length=2, max_length=150)
    descricao: str | None = None
    codigo_barras: str = Field(min_length=1, max_length=50)
    preco_custo: Decimal = Field(ge=0, max_digits=10, decimal_places=2)
    preco_venda: Decimal = Field(ge=0, max_digits=10, decimal_places=2)
    estoque_minimo: int = Field(ge=0)
    ativo: bool = True


class ProdutoCreate(ProdutoBase):
    pass


class ProdutoUpdate(BaseModel):
    id_categoria: int | None = None
    nome: str | None = Field(default=None, min_length=2, max_length=150)
    descricao: str | None = None
    codigo_barras: str | None = Field(default=None, max_length=50)
    preco_custo: Decimal | None = Field(
        default=None, ge=0, max_digits=10, decimal_places=2
    )
    preco_venda: Decimal | None = Field(
        default=None, ge=0, max_digits=10, decimal_places=2
    )
    estoque_minimo: int | None = Field(default=None, ge=0)
    ativo: bool | None = None


class ProdutoResponse(ProdutoBase):
    id_produto: int

    model_config = ConfigDict(from_attributes=True)
