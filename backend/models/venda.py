
from datetime import datetime
from decimal import Decimal

from sqlalchemy import (
    ForeignKey,
    DateTime,
    Numeric,
    Enum
)
from sqlalchemy.orm import Mapped, mapped_column, relationship

from backend.database.database import Base


class Venda(Base):
    __tablename__ = "venda"

    id_venda: Mapped[int] = mapped_column(
        primary_key=True
    )

    id_cliente: Mapped[int | None] = mapped_column(
        ForeignKey("cliente.id_cliente"),
        nullable=True
    )

    id_funcionario: Mapped[int] = mapped_column(
        ForeignKey("funcionario.id_funcionario"),
        nullable=False
    )

    data_venda: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False
    )

    valor_total: Mapped[Decimal] = mapped_column(
        Numeric(12, 2),
        nullable=False
    )

    status: Mapped[str] = mapped_column(
        Enum(
            "PENDENTE",
            "FINALIZADA",
            "CANCELADA",
            name="status_venda"
        ),
        nullable=False
    )

    cliente = relationship(
        "Cliente",
        back_populates="vendas"
    )

    funcionario = relationship(
        "Funcionario",
        back_populates="vendas"
    )

    itens = relationship(
        "ItemVenda",
        back_populates="venda"
    )


class ItemVenda(Base):
    __tablename__ = "item_venda"

    id_item_venda: Mapped[int] = mapped_column(
        primary_key=True
    )

    id_venda: Mapped[int] = mapped_column(
        ForeignKey("venda.id_venda"),
        nullable=False
    )

    id_produto: Mapped[int] = mapped_column(
        ForeignKey("produto.id_produto"),
        nullable=False
    )

    quantidade: Mapped[int] = mapped_column(
        nullable=False
    )

    valor_unitario: Mapped[Decimal] = mapped_column(
        Numeric(10, 2),
        nullable=False
    )

    subtotal: Mapped[Decimal] = mapped_column(
        Numeric(12, 2),
        nullable=False
    )

    venda = relationship(
        "Venda",
        back_populates="itens"
    )

    produto = relationship(
        "Produto",
        back_populates="itens_venda"
    )

