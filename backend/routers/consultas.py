
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from sqlalchemy import text

from backend.database import get_db

router = APIRouter(
    prefix="/consultas",
    tags=["Consultas Avançadas e Otimizadas"]
)


@router.get("/vendas-por-funcionario")
def vendas_por_funcionario(db: Session = Depends(get_db)):
    resultado = db.execute(
        text("""
            SELECT
                f.id_funcionario,
                f.nome AS funcionario,
                COUNT(v.id_venda) AS total_vendas,
                SUM(v.valor_total) AS valor_total_vendido
            FROM funcionario f
            INNER JOIN venda v
                ON v.id_funcionario = f.id_funcionario
            WHERE v.status = 'FINALIZADA'
            GROUP BY f.id_funcionario, f.nome
            HAVING SUM(v.valor_total) > 0
            ORDER BY valor_total_vendido DESC
        """)
    )

    return resultado.mappings().all()
