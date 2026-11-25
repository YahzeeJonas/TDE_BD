
from sqlalchemy import String, Boolean, Enum
from sqlalchemy.orm import Mapped, mapped_column, relationship

from backend.database import Base


class Funcionario(Base):
    __tablename__ = "funcionario"

    id_funcionario: Mapped[int] = mapped_column(
        primary_key=True
    )

    nome: Mapped[str] = mapped_column(
        String(150),
        nullable=False
    )

    cpf: Mapped[str] = mapped_column(
        String(14),
        unique=True,
        nullable=False
    )

    email: Mapped[str] = mapped_column(
        String(150),
        unique=True,
        nullable=False
    )

    cargo: Mapped[str] = mapped_column(
        Enum(
            "ADMINISTRADOR",
            "VENDEDOR",
            "ESTOQUISTA",
            name="cargo_funcionario"
        ),
        nullable=False
    )

    ativo: Mapped[bool] = mapped_column(
        Boolean,
        nullable=False
    )

    compras = relationship(
        "Compra",
        back_populates="funcionario"
    )

    vendas = relationship(
        "Venda",
        back_populates="funcionario"
    )

    movimentacoes = relationship(
        "MovimentacaoEstoque",
        back_populates="funcionario"
    )

