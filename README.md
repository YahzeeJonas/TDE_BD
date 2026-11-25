



























































































































































































































































# StockTech --- Documentação do Projeto

> **Sistema de Gerenciamento de Estoque**
>
> Projeto acadêmico desenvolvido com MySQL, Python e FastAPI para o
> gerenciamento de uma loja fictícia de produtos de informática e
> eletrônicos.

------------------------------------------------------------------------

## 1. Apresentação

O StockTech é um sistema de gerenciamento de estoque desenvolvido para
uma loja fictícia de produtos de informática e eletrônicos.

O projeto tem como objetivo controlar produtos, fornecedores, clientes,
funcionários, compras, vendas e movimentações de estoque, utilizando
MySQL como sistema gerenciador de banco de dados e Python com FastAPI
para realizar a integração com o banco.

## 2. Tecnologias utilizadas

  -----------------------------------------------------------------------
  Tecnologia                          Utilização
  ----------------------------------- -----------------------------------
  **MySQL 8.0**                       Gerenciamento e armazenamento dos
                                      dados.

  **Python**                          Linguagem utilizada no backend.

  **FastAPI**                         Criação dos endpoints da API.

  **SQLAlchemy**                      Conexão e comunicação entre Python
                                      e MySQL.

  **PyMySQL**                         Driver de conexão com MySQL.

  **Beekeeper Studio**                Ferramenta utilizada para executar
                                      e administrar comandos SQL.

  **PyCharm**                         Ambiente de desenvolvimento Python.

  **Swagger**                         Documentação e testes dos endpoints
                                      da API.
  -----------------------------------------------------------------------

## 3. Estrutura do banco de dados

O banco de dados `stocktech` foi organizado em 11 tabelas principais:

  Tabela                   Finalidade
  ------------------------ ---------------------------------------------------
  `categoria`              Armazena as categorias dos produtos.
  `produto`                Armazena os produtos comercializados.
  `fornecedor`             Registra os fornecedores.
  `cliente`                Registra os clientes.
  `funcionario`            Armazena os funcionários e seus cargos.
  `compra`                 Registra as compras realizadas com fornecedores.
  `item_compra`            Armazena os produtos de cada compra.
  `venda`                  Registra as vendas realizadas.
  `item_venda`             Armazena os produtos de cada venda.
  `estoque`                Controla a quantidade disponível de cada produto.
  `movimentacao_estoque`   Registra entradas e saídas de produtos.

Além dessas tabelas principais, foi criada a tabela auxiliar
`historico_preco_produto`, utilizada pela trigger de histórico de
preços.

As tabelas foram relacionadas por meio de chaves primárias e
estrangeiras, garantindo a integridade dos relacionamentos.

## 4. Como executar o projeto

Esta seção apresenta os procedimentos necessários para baixar o projeto,
configurar o banco de dados MySQL e executar o backend Python.

### 4.1. Pré-requisitos

Antes de executar o projeto, é necessário instalar:

-   [Python](https://www.python.org/downloads/)
-   [MySQL Server 8.0](https://dev.mysql.com/downloads/mysql/)
-   [Git](https://git-scm.com/downloads)
-   [Beekeeper Studio](https://www.beekeeperstudio.io/) ou outro cliente
    MySQL.

### 4.2. Baixar o projeto

Clone o repositório:

``` bash
git clone https://github.com/SEU_USUARIO/StockTech.git
```

Entre na pasta do projeto:

``` bash
cd StockTech
```

> Substitua `SEU_USUARIO` pelo seu usuário do GitHub.

### 4.3. Configurar e importar o banco de dados

O projeto disponibiliza um arquivo SQL com a estrutura e os dados do
banco:

``` text
database/
└── stocktech_completo.sql
```

Esse arquivo contém a criação do banco, as tabelas, os relacionamentos,
os dados iniciais, as views, procedures, functions e triggers.

Primeiro, certifique-se de que o serviço do MySQL Server esteja em
execução.

**Importação pelo terminal (Windows):**

Abra o CMD na pasta raiz do projeto e execute:

``` cmd
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p < database\stocktech_completo.sql
```

Digite a senha do MySQL quando solicitado.

O arquivo SQL já contém a criação do banco `stocktech`, portanto não é
necessário criá-lo manualmente antes da importação.

> Caso o MySQL esteja instalado em outro diretório, ajuste o caminho do
> executável `mysql.exe`.

### 4.4. Verificar a importação

Após a importação:

1.  Abra o Beekeeper Studio.
2.  Conecte-se ao servidor MySQL utilizando suas credenciais.
3.  Localize o banco de dados `stocktech`.
4.  Verifique se as tabelas foram criadas.
5.  Confira também as views, procedures, functions e triggers.

### 4.5. Criar e ativar o ambiente virtual

Na pasta raiz do projeto, crie um ambiente virtual:

``` bash
python -m venv .venv
```

Ative o ambiente virtual no Windows PowerShell:

``` powershell
.venv\Scripts\Activate.ps1
```

Ou, no Prompt de Comando (CMD):

``` cmd
.venv\Scripts\activate
```

### 4.6. Instalar as dependências

Com o ambiente virtual ativado, execute:

``` bash
pip install -r requirements.txt
```

O arquivo `requirements.txt` contém as bibliotecas necessárias para
executar o backend.

### 4.7. Configurar as variáveis de ambiente

Na pasta `backend`, crie um arquivo chamado `.env`.

Configure as informações de conexão com o MySQL:

``` env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=sua_senha
DB_NAME=stocktech
```

Substitua `sua_senha` pela senha configurada no seu MySQL.

> **Importante:** o arquivo `.env` contém credenciais de acesso e não
> deve ser enviado ao GitHub. Utilize o `.env.example` como modelo, se
> ele estiver disponível no projeto.

### 4.8. Executar a aplicação

Com o banco importado, as dependências instaladas e as variáveis de
ambiente configuradas, execute o comando abaixo na pasta raiz do
projeto:

``` bash
uvicorn backend.main:app --reload
```

Se tudo estiver configurado corretamente, a API estará disponível em:

``` text
http://127.0.0.1:8000
```

### 4.9. Acessar o Swagger

O FastAPI disponibiliza uma documentação interativa por meio do Swagger.

Acesse:

**http://127.0.0.1:8000/docs**

Por meio dessa interface, é possível visualizar e testar os endpoints da
aplicação.

## 5. Restrições de integridade

Foram utilizadas restrições no próprio MySQL para evitar inconsistências
nos dados.

  -----------------------------------------------------------------------
  Restrição                           Finalidade
  ----------------------------------- -----------------------------------
  `PRIMARY KEY`                       Identifica exclusivamente cada
                                      registro.

  `FOREIGN KEY`                       Estabelece relacionamentos entre
                                      tabelas.

  `UNIQUE`                            Impede valores duplicados em campos
                                      específicos, como CPF, CNPJ e
                                      código de barras.

  `NOT NULL`                          Exige o preenchimento de campos
                                      obrigatórios.

  `CHECK`                             Valida condições, como preços não
                                      negativos e quantidades positivas.

  `ENUM`                              Limita os valores permitidos em
                                      campos de status e categorias de
                                      funcionários.
  -----------------------------------------------------------------------

Essas restrições ajudam a garantir que os dados armazenados sejam
válidos e consistentes.

## 6. Consultas avançadas e otimizadas

Foram desenvolvidas consultas utilizando recursos avançados do SQL:

  Recurso                      Finalidade
  ---------------------------- --------------------------------------------
  `INNER JOIN` e `LEFT JOIN`   Relacionamento entre tabelas.
  `GROUP BY`                   Agrupamento de informações.
  `COUNT()`                    Contagem de registros.
  `SUM()`                      Soma de valores.
  `AVG()`                      Cálculo de médias.
  `HAVING`                     Filtragem de resultados agrupados.
  `ORDER BY`                   Ordenação dos resultados.
  `CASE`                       Criação de condições dentro das consultas.

### 6.1. Consulta de vendas por funcionário

Foi desenvolvida uma consulta que apresenta o desempenho dos
funcionários nas vendas finalizadas.

As informações retornadas são:

-   Identificação do funcionário;
-   Nome do funcionário;
-   Quantidade de vendas realizadas;
-   Valor total vendido;
-   Ticket médio das vendas.

A consulta utiliza `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `COUNT`, `SUM`
e `AVG`.

### 6.2. Índices

Foram considerados índices para melhorar o desempenho das consultas em
colunas frequentemente utilizadas em filtros e relacionamentos.

Exemplos:

-   `venda.id_funcionario`
-   `venda.data_venda`
-   `produto.nome`
-   `movimentacao_estoque.id_produto`

Os índices permitem que o MySQL localize informações com maior
eficiência, reduzindo a necessidade de percorrer todos os registros da
tabela.

## 7. Views (Visões)

Foram criadas quatro views para facilitar consultas e relatórios:

  -----------------------------------------------------------------------
  View                                Finalidade
  ----------------------------------- -----------------------------------
  `vw_estoque_produtos`               Apresenta informações dos produtos
                                      e suas quantidades em estoque.

  `vw_produtos_estoque_baixo`         Identifica produtos com estoque
                                      abaixo do mínimo estabelecido.

  `vw_compras_detalhadas`             Apresenta informações detalhadas
                                      das compras e seus itens.

  `vw_vendas_detalhadas`              Apresenta informações detalhadas
                                      das vendas e seus itens.
  -----------------------------------------------------------------------

As views permitem reutilizar consultas e facilitam a visualização dos
dados sem precisar escrever novamente todos os relacionamentos.

## 8. Transações

Foram utilizadas transações para garantir que operações compostas sejam
executadas corretamente.

Foi desenvolvida a procedure `sp_registrar_compra`, responsável por:

1.  Validar os dados da compra.
2.  Iniciar uma transação.
3.  Registrar a compra.
4.  Registrar o item da compra.
5.  Confirmar a operação com `COMMIT`.

Caso ocorra algum erro, a operação é desfeita com `ROLLBACK`.

Dessa forma, evita-se que uma compra seja registrada parcialmente.

## 9. Triggers (Gatilhos)

Foram desenvolvidos gatilhos para executar ações automaticamente diante
de alterações nos dados.

### 9.1. `trg_historico_preco`

Executado após uma atualização na tabela `produto`.

Sua função é registrar o histórico de alterações nos preços dos
produtos, armazenando os valores anteriores e novos.

Para isso, foi criada a tabela auxiliar `historico_preco_produto`.

### 9.2. `trg_validar_estoque_venda`

Executado antes da inserção de um item na tabela `item_venda`.

Sua função é verificar se a quantidade solicitada é válida e se existe
estoque suficiente para realizar a venda.

## 10. Procedures (Procedimentos armazenados)

Foram desenvolvidas procedures para centralizar operações e consultas
diretamente no MySQL.

  -----------------------------------------------------------------------
  Procedure                           Finalidade
  ----------------------------------- -----------------------------------
  `sp_consultar_compra`               Consulta os dados de uma compra
                                      específica.

  `sp_itens_compra`                   Retorna os itens de uma compra.

  `sp_consultar_estoque`              Consulta a quantidade disponível e
                                      a situação do estoque de um
                                      produto.

  `sp_produtos_mais_vendidos`         Apresenta os produtos com maior
                                      quantidade de vendas finalizadas.

  `sp_registrar_compra`               Registra uma compra e seu item
                                      utilizando transação.
  -----------------------------------------------------------------------

As procedures permitem executar operações previamente definidas no banco
de dados por meio do comando `CALL`.

## 11. Functions (Funções)

Foram criadas funções para realizar cálculos e retornar informações
específicas.

  -----------------------------------------------------------------------
  Function                            Finalidade
  ----------------------------------- -----------------------------------
  `fn_calcular_lucro`                 Calcula a diferença entre o preço
                                      de venda e o preço de custo.

  `fn_valor_estoque`                  Calcula o valor do estoque de um
                                      produto com base no custo unitário
                                      e na quantidade disponível.

  `fn_total_vendido`                  Retorna a quantidade total vendida
                                      de um produto em vendas
                                      finalizadas.
  -----------------------------------------------------------------------

As funções podem ser utilizadas diretamente em consultas SQL.

## 12. Integração com Python e FastAPI

Foi desenvolvido um backend utilizando FastAPI para conectar a aplicação
Python ao banco de dados MySQL.

A comunicação é realizada por meio do SQLAlchemy e do driver PyMySQL.

A conexão utiliza variáveis de ambiente armazenadas no arquivo `.env`,
evitando deixar as credenciais diretamente no código.

### 12.1. Organização do backend

``` text
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

### 12.2. Organização das rotas

  -----------------------------------------------------------------------
  Arquivo                             Responsabilidade
  ----------------------------------- -----------------------------------
  `produtos.py`                       Operações CRUD de produtos.

  `consultas.py`                      Consultas avançadas, como vendas
                                      por funcionário.

  `views.py`                          Acesso às views do MySQL.

  `transacoes.py`                     Execução da procedure de registro
                                      de compras.

  `triggers.py`                       Operações que permitem demonstrar a
                                      execução automática dos gatilhos.

  `procedures.py`                     Chamadas de procedures e functions
                                      do MySQL.
  -----------------------------------------------------------------------

### 12.3. Testes da API

A API pode ser executada com:

``` bash
uvicorn backend.main:app --reload
```

A documentação interativa e os testes dos endpoints são realizados pelo
Swagger:

**http://127.0.0.1:8000/docs**

Foi testada a integração com a procedure `sp_consultar_estoque`,
demonstrando a comunicação entre Python e MySQL.

## 13. Estrutura geral do projeto

``` text
StockTech/
├── backend/
│   ├── main.py
│   ├── database.py
│   ├── models/
│   ├── schemas/
│   └── routers/
├── database/
│   └── stocktech_completo.sql
├── .env.example
├── .gitignore
├── README.md
└── requirements.txt
```

## 14. Conclusão

O projeto StockTech foi desenvolvido para demonstrar a aplicação prática
dos principais recursos de um banco de dados relacional e sua integração
com uma aplicação backend.

Foram trabalhados conceitos de integridade de dados, relacionamentos,
consultas avançadas, índices, views, transações, triggers, procedures e
functions.

A integração com Python e FastAPI permite acessar os dados e executar
operações do banco por meio de uma API, demonstrando como esses recursos
podem ser utilizados em um sistema de gerenciamento de estoque.

------------------------------------------------------------------------

**StockTech --- Sistema de Gerenciamento de Estoque**

Ensine seu estilo de escrita ao ChatGPT
Faça upgrade para o Plus para que o ChatGPT aprenda e reutilize sua voz, seu tom e suas preferências de escrita.




⋮⋮⋮⋮