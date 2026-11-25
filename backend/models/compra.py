
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


class Compra(Base):
    __tablename__ = "compra"

    id_compra: Mapped[int] = mapped_column(
        primary_key=True
    )

    id_fornecedor: Mapped[int] = mapped_column(
        ForeignKey("fornecedor.id_fornecedor"),
        nullable=False
    )

    id_funcionario: Mapped[int] = mapped_column(
        ForeignKey("funcionario.id_funcionario"),
        nullable=False
    )

    data_compra: Mapped[datetime] = mapped_column(
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
            "RECEBIDA",
            "CANCELADA",
            name="status_compra"
        ),
        nullable=False
    )

    fornecedor = relationship(
        "Fornecedor",
        back_populates="compras"
    )

    funcionario = relationship(
        "Funcionario",
        back_populates="compras"
    )

    itens = relationship(
        "ItemCompra",
        back_populates="compra"
    )


class ItemCompra(Base):
    __tablename__ = "item_compra"

    id_item_compra: Mapped[int] = mapped_column(
        primary_key=True
    )

    id_compra: Mapped[int] = mapped_column(
        ForeignKey("compra.id_compra"),
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

    compra = relationship(
        "Compra",
        back_populates="itens"
    )

    produto = relationship(
        "Produto",
        back_populates="itens_compra"
    )
