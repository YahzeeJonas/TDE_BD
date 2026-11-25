
from datetime import datetime

from sqlalchemy import (
    ForeignKey,
    Integer,
    DateTime,
    String,
    Enum
)
from sqlalchemy.orm import Mapped, mapped_column, relationship

from database.database import Base


class MovimentacaoEstoque(Base):
    __tablename__ = "movimentacao_estoque"

    id_movimentacao: Mapped[int] = mapped_column(
        primary_key=True
    )

    id_produto: Mapped[int] = mapped_column(
        ForeignKey("produto.id_produto"),
        nullable=False
    )

    id_funcionario: Mapped[int] = mapped_column(
        ForeignKey("funcionario.id_funcionario"),
        nullable=False
    )

    tipo: Mapped[str] = mapped_column(
        Enum(
            "ENTRADA",
            "SAIDA",
            name="tipo_movimentacao"
        ),
        nullable=False
    )

    quantidade: Mapped[int] = mapped_column(
        Integer,
        nullable=False
    )

    data_movimentacao: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False
    )

    motivo: Mapped[str | None] = mapped_column(
        String(255),
        nullable=True
    )

    produto = relationship(
        "Produto",
        back_populates="movimentacoes"
    )

    funcionario = relationship(
        "Funcionario",
        back_populates="movimentacoes"
    )

