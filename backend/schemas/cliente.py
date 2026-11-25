
from pydantic import BaseModel, ConfigDict, Field, EmailStr


class ClienteBase(BaseModel):
    nome: str = Field(min_length=2, max_length=150)
    cpf_cnpj: str = Field(min_length=1, max_length=18)
    telefone: str | None = Field(default=None, max_length=20)
    email: EmailStr | None = None


class ClienteCreate(ClienteBase):
    pass


class ClienteUpdate(BaseModel):
    nome: str | None = Field(default=None, max_length=150)
    cpf_cnpj: str | None = Field(default=None, max_length=18)
    telefone: str | None = Field(default=None, max_length=20)
    email: EmailStr | None = None


class ClienteResponse(ClienteBase):
    id_cliente: int

    model_config = ConfigDict(from_attributes=True)
