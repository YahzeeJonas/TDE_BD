from backend.schemas.produto import (
    CategoriaCreate,
    CategoriaResponse,
    ProdutoCreate,
    ProdutoUpdate,
    ProdutoResponse
)

from backend.schemas.fornecedor import (
    FornecedorCreate,
    FornecedorUpdate,
    FornecedorResponse
)

from backend.schemas.cliente import (
    ClienteCreate,
    ClienteUpdate,
    ClienteResponse
)

from backend.schemas.funcionario import (
    FuncionarioCreate,
    FuncionarioUpdate,
    FuncionarioResponse
)

from backend.schemas.compra import (
    CompraCreate,
    CompraResponse,
    ItemCompraResponse,
    RegistrarCompraRequest
)

from backend.schemas.venda import (
    VendaCreate,
    VendaResponse,
    ItemVendaResponse,
    RegistrarVendaRequest
)

from backend.schemas.estoque import (
    EstoqueResponse,
    EstoqueUpdate
)

from backend.schemas.movimentacao import (
    MovimentacaoCreate,
    MovimentacaoResponse
)