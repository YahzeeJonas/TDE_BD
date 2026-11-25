
from pydantic import BaseModel, ConfigDict, Field, EmailStr


class FornecedorBase(BaseModel):
    razao_social: str = Field(min_length=2, max_length=150)
    cnpj: str = Field(min_length=1, max_length=18)
    telefone: str | None = Field(default=None, max_length=20)
    email: EmailStr | None = None


class FornecedorCreate(FornecedorBase):
    pass


class FornecedorUpdate(BaseModel):
    razao_social: str | None = Field(default=None, max_length=150)
    cnpj: str | None = Field(default=None, max_length=18)
    telefone: str | None = Field(default=None, max_length=20)
    email: EmailStr | None = None


class FornecedorResponse(FornecedorBase):
    id_fornecedor: int

    model_config = ConfigDict(from_attributes=True)
