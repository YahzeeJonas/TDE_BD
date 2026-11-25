
from datetime import datetime

from sqlalchemy import ForeignKey, Integer, DateTime
from sqlalchemy.orm import Mapped, mapped_column, relationship

from backend.database.database import Base


class Estoque(Base):
    __tablename__ = "estoque"

    id_estoque: Mapped[int] = mapped_column(
        primary_key=True
    )

    id_produto: Mapped[int] = mapped_column(
        ForeignKey("produto.id_produto"),
        unique=True,
        nullable=False
    )

    quantidade_atual: Mapped[int] = mapped_column(
        Integer,
        nullable=False
    )

    data_atualizacao: Mapped[datetime] = mapped_column(
        DateTime,
        nullable=False
    )

    produto = relationship(
        "Produto",
        back_populates="estoque"
    )
