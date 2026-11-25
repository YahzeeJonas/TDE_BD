
from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from backend.database.database import Base


class Cliente(Base):
    __tablename__ = "cliente"

    id_cliente: Mapped[int] = mapped_column(
        primary_key=True
    )

    nome: Mapped[str] = mapped_column(
        String(150),
        nullable=False
    )

    cpf_cnpj: Mapped[str] = mapped_column(
        String(18),
        unique=True,
        nullable=False
    )

    telefone: Mapped[str | None] = mapped_column(
        String(20),
        nullable=True
    )

    email: Mapped[str | None] = mapped_column(
        String(150),
        nullable=True
    )

    vendas = relationship(
        "Venda",
        back_populates="cliente"
    )
