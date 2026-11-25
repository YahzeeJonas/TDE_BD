
from typing import Literal

from pydantic import BaseModel, ConfigDict, Field, EmailStr


CargoFuncionario = Literal[
    "ADMINISTRADOR",
    "VENDEDOR",
    "ESTOQUISTA"
]


class FuncionarioBase(BaseModel):
    nome: str = Field(min_length=2, max_length=150)
    cpf: str = Field(min_length=1, max_length=14)
    email: EmailStr
    cargo: CargoFuncionario
    ativo: bool = True


class FuncionarioCreate(FuncionarioBase):
    pass


class FuncionarioUpdate(BaseModel):
    nome: str | None = Field(default=None, max_length=150)
    cpf: str | None = Field(default=None, max_length=14)
    email: EmailStr | None = None
    cargo: CargoFuncionario | None = None
    ativo: bool | None = None


class FuncionarioResponse(FuncionarioBase):
    id_funcionario: int

    model_config = ConfigDict(from_attributes=True)
