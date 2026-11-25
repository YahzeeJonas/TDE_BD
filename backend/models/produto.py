
from sqlalchemy import String, Integer, Numeric, Boolean, Text, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from backend.database import Base


class Categoria(Base):
    __tablename__ = "categoria"

    id_categoria: Mapped[int] = mapped_column(
        Integer,
        primary_key=True
    )

    nome: Mapped[str] = mapped_column(
        String(150),
        nullable=False
    )

    descricao: Mapped[str | None] = mapped_column(
        Text,
        nullable=True
    )

    produtos = relationship("Produto", back_populates="categoria")


class Produto(Base):
    __tablename__ = "produto"

    id_produto: Mapped[int] = mapped_column(
        Integer,
        primary_key=True
    )

    id_categoria: Mapped[int] = mapped_column(
        ForeignKey("categoria.id_categoria"),
        nullable=False
    )

    nome: Mapped[str] = mapped_column(
        String(150),
        nullable=False
    )

    descricao: Mapped[str | None] = mapped_column(
        Text,
        nullable=True
    )

    codigo_barras: Mapped[str] = mapped_column(
        String(50),
        unique=True,
        nullable=False
    )

    preco_custo: Mapped[float] = mapped_column(
        Numeric(10, 2),
        nullable=False
    )

    preco_venda: Mapped[float] = mapped_column(
        Numeric(10, 2),
        nullable=False
    )

    estoque_minimo: Mapped[int] = mapped_column(
        Integer,
        nullable=False
    )

    ativo: Mapped[bool] = mapped_column(
        Boolean,
        nullable=False
    )
    estoque = relationship(
        "Estoque",
        back_populates="produto",
        uselist=False
    )

    itens_compra = relationship(
        "ItemCompra",
        back_populates="produto"
    )

    itens_venda = relationship(
        "ItemVenda",
        back_populates="produto"
    )

    movimentacoes = relationship(
        "MovimentacaoEstoque",
        back_populates="produto"
    )

    categoria = relationship("Categoria", back_populates="produtos")
