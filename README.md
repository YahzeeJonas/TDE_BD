# StockTech — Documentação do Projeto

## 1. Apresentação

O StockTech é um sistema de gerenciamento de estoque desenvolvido para uma loja fictícia de produtos de informática e eletrônicos.

O projeto tem como objetivo controlar produtos, fornecedores, clientes, funcionários, compras, vendas e movimentações de estoque, utilizando MySQL como sistema gerenciador de banco de dados e Python com FastAPI para realizar a integração com o banco.

## 2. Tecnologias utilizadas

- **MySQL:** gerenciamento e armazenamento dos dados.
- **Python:** linguagem utilizada no backend.
- **FastAPI:** criação dos endpoints da API.
- **SQLAlchemy:** conexão e comunicação entre Python e MySQL.
- **PyMySQL:** driver de conexão com MySQL.
- **Beekeeper Studio:** ferramenta utilizada para executar e administrar comandos SQL.
- **PyCharm:** ambiente de desenvolvimento Python.
- **Swagger:** documentação e testes dos endpoints da API.

## 3. Estrutura do banco de dados

O banco de dados `stocktech` foi organizado em 11 tabelas principais:

| Tabela | Finalidade |
|---|---|
| `categoria` | Armazena as categorias dos produtos. |
| `produto` | Armazena os produtos comercializados. |
| `fornecedor` | Registra os fornecedores. |
| `cliente` | Registra os clientes. |
| `funcionario` | Armazena os funcionários e seus cargos. |
| `compra` | Registra as compras realizadas com fornecedores. |
| `item_compra` | Armazena os produtos de cada compra. |
| `venda` | Registra as vendas realizadas. |
| `item_venda` | Armazena os produtos de cada venda. |
| `estoque` | Controla a quantidade disponível de cada produto. |
| `movimentacao_estoque` | Registra entradas e saídas de produtos. |

As tabelas foram relacionadas por meio de chaves primárias e estrangeiras, garantindo a integridade dos relacionamentos.

## 4. Restrições de integridade

Foram utilizadas restrições no próprio MySQL para evitar inconsistências nos dados.

Principais recursos utilizados:

- **PRIMARY KEY:** identifica exclusivamente cada registro.
- **FOREIGN KEY:** estabelece relacionamentos entre tabelas.
- **UNIQUE:** impede valores duplicados em campos específicos, como CPF, CNPJ e código de barras.
- **NOT NULL:** exige o preenchimento de campos obrigatórios.
- **CHECK:** valida condições, como preços não negativos e quantidades positivas.
- **ENUM:** limita os valores permitidos em campos de status e categorias de funcionários.

Essas restrições ajudam a garantir que os dados armazenados sejam válidos e consistentes.

## 5. Consultas avançadas e otimizadas

Foram desenvolvidas consultas utilizando recursos avançados do SQL, como:

- `INNER JOIN` e `LEFT JOIN`: relacionamento entre tabelas.
- `GROUP BY`: agrupamento de informações.
- `COUNT()`: contagem de registros.
- `SUM()`: soma de valores.
- `AVG()`: cálculo de médias.
- `HAVING`: filtragem de resultados agrupados.
- `ORDER BY`: ordenação dos resultados.
- `CASE`: criação de condições dentro das consultas.

### Consulta de vendas por funcionário

Foi desenvolvida uma consulta que apresenta o desempenho dos funcionários nas vendas finalizadas.

As informações retornadas são:

- Identificação do funcionário.
- Nome do funcionário.
- Quantidade de vendas realizadas.
- Valor total vendido.
- Ticket médio das vendas.

A consulta utiliza `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `COUNT`, `SUM` e `AVG`.

### Índices

Foram considerados índices para melhorar o desempenho das consultas em colunas frequentemente utilizadas em filtros e relacionamentos.

Exemplos:

- `venda.id_funcionario`
- `venda.data_venda`
- `produto.nome`
- `movimentacao_estoque.id_produto`

Os índices permitem que o MySQL localize informações com maior eficiência, reduzindo a necessidade de percorrer todos os registros da tabela.

## 6. Views (Visões)

Foram criadas quatro views para facilitar consultas e relatórios.

| View | Finalidade |
|---|---|
| `vw_estoque_produtos` | Apresenta informações dos produtos e suas quantidades em estoque. |
| `vw_produtos_estoque_baixo` | Identifica produtos com estoque abaixo do mínimo estabelecido. |
| `vw_compras_detalhadas` | Apresenta informações detalhadas das compras e seus itens. |
| `vw_vendas_detalhadas` | Apresenta informações detalhadas das vendas e seus itens. |

As views permitem reutilizar consultas e facilitam a visualização dos dados sem precisar escrever novamente todos os relacionamentos.

## 7. Transações

Foram utilizadas transações para garantir que operações compostas sejam executadas corretamente.

Foi desenvolvida a procedure `sp_registrar_compra`, responsável por:

1. Validar os dados da compra.
2. Iniciar uma transação.
3. Registrar a compra.
4. Registrar o item da compra.
5. Confirmar a operação com `COMMIT`.

Caso ocorra algum erro, a operação é desfeita com `ROLLBACK`.

Dessa forma, evita-se que uma compra seja registrada parcialmente.

## 8. Triggers (Gatilhos)

Foram desenvolvidos gatilhos para executar ações automaticamente diante de alterações nos dados.

### `trg_historico_preco`

Executado após uma atualização na tabela `produto`.

Sua função é registrar o histórico de alterações nos preços dos produtos, armazenando os valores anteriores e novos.

Para isso, foi criada uma tabela de histórico de preços.

### `trg_validar_estoque_venda`

Executado antes da inserção de um item na tabela `item_venda`.

Sua função é verificar se a quantidade solicitada é válida e se existe estoque suficiente para realizar a venda.

## 9. Procedures (Procedimentos armazenados)

Foram desenvolvidas procedures para centralizar operações e consultas diretamente no MySQL.

| Procedure | Finalidade |
|---|---|
| `sp_consultar_compra` | Consulta os dados de uma compra específica. |
| `sp_itens_compra` | Retorna os itens de uma compra. |
| `sp_consultar_estoque` | Consulta a quantidade disponível e a situação do estoque de um produto. |
| `sp_produtos_mais_vendidos` | Apresenta os produtos com maior quantidade de vendas finalizadas. |
| `sp_registrar_compra` | Registra uma compra e seu item utilizando transação. |

As procedures permitem executar operações previamente definidas no banco de dados por meio do comando `CALL`.

## 10. Functions (Funções)

Foram criadas funções para realizar cálculos e retornar informações específicas.

| Function | Finalidade |
|---|---|
| `fn_calcular_lucro` | Calcula a diferença entre o preço de venda e o preço de custo. |
| `fn_valor_estoque` | Calcula o valor do estoque de um produto com base no custo unitário e na quantidade disponível. |
| `fn_total_vendido` | Retorna a quantidade total vendida de um produto em vendas finalizadas. |

As funções podem ser utilizadas diretamente em consultas SQL.

## 11. Integração com Python e FastAPI

Foi desenvolvido um backend utilizando FastAPI para conectar a aplicação Python ao banco de dados MySQL.

A comunicação é realizada por meio do SQLAlchemy e do driver PyMySQL.

A conexão utiliza variáveis de ambiente armazenadas no arquivo `.env`, evitando deixar as credenciais diretamente no código.

### Organização do backend

```text
backend/
├── main.py
├── database.py
├── models/
│   ├── __init__.py
│   ├── produto.py
│   ├── fornecedor.py
│   ├── cliente.py
│   ├── funcionario.py
│   ├── compra.py
│   ├── venda.py
│   ├── estoque.py
│   └── movimentacao.py
├── schemas/
│   ├── __init__.py
│   ├── produto.py
│   ├── fornecedor.py
│   ├── cliente.py
│   ├── funcionario.py
│   ├── compra.py
│   ├── venda.py
│   ├── estoque.py
│   └── movimentacao.py
└── routers/
    ├── __init__.py
    ├── produtos.py
    ├── consultas.py
    ├── views.py
    ├── transacoes.py
    ├── triggers.py
    └── procedures.py
```

### Organização das rotas

| Arquivo | Responsabilidade |
|---|---|
| `produtos.py` | Operações CRUD de produtos. |
| `consultas.py` | Consultas avançadas, como vendas por funcionário. |
| `views.py` | Acesso às views do MySQL. |
| `transacoes.py` | Execução da procedure de registro de compras. |
| `triggers.py` | Operações que permitem demonstrar a execução automática dos gatilhos. |
| `procedures.py` | Chamadas de procedures e functions do MySQL. |

### Testes da API

A API pode ser executada com:

```bash
uvicorn backend.main:app --reload
```

A documentação interativa e os testes dos endpoints são realizados pelo Swagger:

```text
http://127.0.0.1:8000/docs
```

Foi testada a integração com a procedure `sp_consultar_estoque`, demonstrando a comunicação entre Python e MySQL.

## 12. Conclusão

O projeto StockTech foi desenvolvido para demonstrar a aplicação prática dos principais recursos de um banco de dados relacional e sua integração com uma aplicação backend.

Foram trabalhados conceitos de integridade de dados, relacionamentos, consultas avançadas, índices, views, transações, triggers, procedures e functions.

A integração com Python e FastAPI permite acessar os dados e executar operações do banco por meio de uma API, demonstrando como esses recursos podem ser utilizados em um sistema de gerenciamento de estoque.