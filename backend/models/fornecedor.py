
from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from database.database import Base


class Fornecedor(Base):
    __tablename__ = "fornecedor"

    id_fornecedor: Mapped[int] = mapped_column(
        primary_key=True
    )

    razao_social: Mapped[str] = mapped_column(
        String(150),
        nullable=False
    )

    cnpj: Mapped[str] = mapped_column(
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

    compras = relationship(
        "Compra",
        back_populates="fornecedor"
    )
