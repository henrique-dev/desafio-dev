# File Parser

O propósito dessa aplicação é ler um arquivo de texto, converter e salvar os dados em um banco de dados.

A aplicação é acessivel pelo navegador e pelo consumo via API.

Ao importar um arquivo com os dados, o processamento é feito em background, e quando finalizado, o usuário é alertado com uma notificação via action cable.

Um arquivo de exemplo pra ser importado é o [CNAB.txt](./CNAB.txt).

O backend é construído com Ruby on Rails, e o PostgreSQL é utilizado como banco de dados.

## Sumário
Foi utilizado o padrão de serviço, onde toda a lógica relacionada a uma ação é delegada a um serviço.

Vale destacar o uso de algumas gems importantes no projeto:

- [Faker](https://github.com/faker-ruby/faker): Usada para gerar dados durante os testes.
- [Dry-validation](https://github.com/dry-rb/dry-validation): Adiciona uma camada de validação à aplicação, permitindo que a lógica de validação seja extraída dos modelos e colocada em contratos.
- [Rswag](https://github.com/rswag/rswag): Para gerar documentação da API.
- [Rspec](https://github.com/rspec/rspec-rails): Para escrever testes da aplicação.
- [Rubocop](https://github.com/rubocop/rubocop): Para garantir que a aplicação siga os padrões de código definidos.
- [Omniauth](https://github.com/omniauth/omniauth): Para padronizar a autenticação com múltiplos provedores para aplicações web.

## Autenticação
Para a autenticação, foi escolhido o uso do OAuth para acessar pelo navegador e um token passado no cabeçalho para se comunicar com a API, fornecendo o token no cabeçalho `Authorization`.

O provedor disponível para login com OAuth é o Google, então será necessário obter o `GOOGLE_CLIENT_ID` e o `GOOGLE_CLIENT_SECRET` em https://console.developers.google.com/apis/credentials.

## Rodando a aplicação
A aplicação pode ser executada usando Docker ou localmente na máquina host.

### No Docker

No diretório `bin`, existem alguns scripts utilitários para uso com o Docker Compose:
- `bin/docker-build`: Constrói a imagem da aplicação.
- `bin/docker-doc`: Gera a documentação da aplicação.
- `bin/docker-lint`: Executa o RuboCop na aplicação.
- `bin/docker-start`: Inicia o container da aplicação em segundo plano.
- `bin/docker-stop`: Interrompe o container da aplicação.
- `bin/docker-test`: Executa os testes da aplicação.
- `bin/docker-up`: Inicia o container da aplicação no terminal atual.

#### Requisitos
- Docker
- Docker Compose
- Credenciais do Google OAuth (GOOGLE_CLIENT_ID e GOOGLE_CLIENT_SECRET)

#### Executando a Aplicação

Primeiro é necessário criar o arquivo de variaveis de ambiente copiando do arquivo `.env-example` para `.env`.
Entao e necessario alterar o `.env` e colocar os valores em:

```
API_SECRET - Token para acessar a API.
GOOGLE_CLIENT_ID - ID do cliente da API do Google.
GOOGLE_CLIENT_SECRET - Segredo do cliente da API do Google.
```

Depois que o arquivo .env estiver configurado, você pode construir a imagem da aplicação executando o seguinte comando:
```
./bin/docker-build
```

E depois disso, você pode iniciar a aplicação com o comando:
```
./bin/docker-start
```

A aplicação estará disponível em `http://localhost:3000`.

A documentação da API estará disponível em `http://localhost:3000/api-docs/index.html`.

Ao usar a documentação, para fins de desenvolvimento, o usuário padrão é `swagger` e a senha padrão é `swagger`.

Por padrão, a aplicação estará acessível na porta 3000, mas isso pode ser alterado modificando a porta no arquivo `.env`.

#### Testando a Aplicação

Para rodar os testes, rode o comando:
```
./bin/docker-test
```

### No ambiente local

No diretório `bin`, existem alguns scripts utilitários para uso com o Docker Compose:
- `bin/doc`: Gera a documentação da aplicação.
- `bin/lint`: Executa o RuboCop na aplicação.
- `bin/dev`: Inicia a aplicação.
- `bin/test`: Executa os testes da aplicação.

#### Requisitos
- Ruby 3.3.4
- Rails 7
- PostgreSQL 13 ou superior
- Redis 7.4.1 ou superior
- Credenciais do Google OAuth (GOOGLE_CLIENT_ID e GOOGLE_CLIENT_SECRET)

Primeiro, é necessário criar o arquivo de variáveis de ambiente copiando o arquivo `.env-example` para `.env`.
Em seguida, é necessário editar o arquivo `.env` e definir os valores das seguintes variáveis:

```
API_SECRET - Token para acessar a API.
GOOGLE_CLIENT_ID - ID do cliente da API do Google.
GOOGLE_CLIENT_SECRET - Segredo do cliente da API do Google.
CACHE_URL - URL do Redis.
JOB_WORKER_URL - URL do Redis.
DATABASE_DEVELOPMENT_HOST - URL do banco de dados PostgreSQL para desenvolvimento.
DATABASE_DEVELOPMENT_PORT - Porta do banco de dados PostgreSQL para desenvolvimento.
DATABASE_DEVELOPMENT_USER - Usuário do banco de dados PostgreSQL para desenvolvimento.
DATABASE_DEVELOPMENT_PASSWORD - Senha do banco de dados PostgreSQL para desenvolvimento.
DATABASE_TEST_HOST - URL do banco de dados PostgreSQL para testes.
DATABASE_TEST_PORT - Porta do banco de dados PostgreSQL para testes.
DATABASE_TEST_USER - Usuário do banco de dados PostgreSQL para testes.
DATABASE_TEST_PASSWORD - Senha do banco de dados PostgreSQL para testes.
```

Depois que o arquivo .env estiver configurado, você pode iniciar a aplicação com o comando:
```
./bin/dev
```

A aplicação estará disponível em `http://localhost:3000`.

A documentação da API estará disponível em `http://localhost:3000/api-docs/index.html`.

Ao usar a documentação, para fins de desenvolvimento, o usuário padrão é `swagger` e a senha padrão é `swagger`.

Por padrão, a aplicação estará acessível na porta 3000, mas isso pode ser alterado modificando a porta no arquivo `.env`.

#### Testando a Aplicação

Para rodar os testes, rode o comando:
```
./bin/test
```
