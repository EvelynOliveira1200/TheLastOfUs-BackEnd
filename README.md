# 🧠 The Last of Us — Back-End

### 📝 Descrição

API REST desenvolvida em **Node.js + Express + PostgreSQL** para gerenciar entidades inspiradas no universo de *The Last of Us*: **Personagens**, **Infectados** e **Armas**.

Conta com suporte a **operações CRUD completas**, **upload de imagens**, **filtros dinâmicos**, **validação de dados** e estrutura modular e escalável para facilitar manutenção e futuras expansões.

---

## 📚 Sumário

* [⚙️ Pré-requisitos](#️-pré-requisitos)
* [🧩 Estrutura do projeto](#-estrutura-do-projeto)
* [🚀 Instalação (passo a passo)](#-instalação-passo-a-passo)
* [🔑 Variáveis de ambiente (`.env`)](#-variáveis-de-ambiente-env)
* [🖥️ Inicialização](#️-inicialização)
* [🧱 Banco de dados](#-banco-de-dados)
* [🔗 Rotas principais](#-rotas-principais)

  * [🧍 Characters (Personagens)](#-characters-personagens)
  * [☣️ Infecteds (Infectados)](#️-infecteds-infectados)
  * [🔫 Weapons (Armas)](#-weapons-armas)
* [🖼️ Upload de imagens](#️-upload-de-imagens)
* [🧩 Soluções de problemas (Troubleshooting)](#-soluções-de-problemas-troubleshooting)
* [🔒 Boas práticas e segurança](#-boas-práticas-e-segurança)
* [🧰 Ferramentas utilizadas](#-ferramentas-utilizadas)
* [🤝 Como contribuir](#-como-contribuir)
* [🧾 Licença](#-licença)
* [📬 Contato](#-contato)

---

## ⚙️ Pré-requisitos

Antes de começar, garanta que possui instalado:

* [Node.js](https://nodejs.org/) (v18+ recomendado)
* npm ou yarn
* [PostgreSQL](https://www.postgresql.org/)
* (Opcional) pgAdmin ou outro cliente SQL

> 💡 **Dica:** use o [pgAdmin](https://www.pgadmin.org/) para criar e gerenciar o banco de dados visualmente.

---

## 🧩 Estrutura do projeto

```
.
├── backup/
├── src/
│   ├── config/
│   │   └── database.js
│   ├── controllers/
│   ├── database/
│   │   └── schema.sql
│   ├── models/
│   ├── routes/
│   └── uploads/
├── .env
├── .gitignore
├── package.json
├── package-lock.json
├── README.md
├── server.js
```

> 💡 **Notas:**
>
> * `uploads/`: diretório de imagens enviadas via **Multer**.
> * `src/database/schema.sql`: script de criação das tabelas e relacionamentos.

---

## 🚀 Instalação (passo a passo)

### 1️⃣ Clone o repositório

```bash
git clone https://github.com/EvelynOliveira1200/TheLastOfUs-BackEnd.git
cd the-last-of-us-backend
code .
```

### 2️⃣ Instale as dependências

```bash
npm install
# ou
yarn
```

### 3️⃣ Configure o arquivo `.env`

Crie o arquivo `.env` na raiz e adicione suas credenciais do PostgreSQL (veja o exemplo abaixo).

### 4️⃣ Crie o banco de dados

💡 **Via psql:**

```sql
CREATE DATABASE the_last_of_us;
\c the_last_of_us;
```

💡 **Via pgAdmin:**

1. Clique com o botão direito → *Create Database*
2. Depois: *Restore* → selecione o backup em `/backup/`

---

## 🧱 Banco de dados

Você pode usar o arquivo `schema.sql` ou restaurar um backup existente.

💡 **Com psql:**

```bash
psql -U postgres -d the_last_of_us -f src/database/schema.sql
```

💡 **Com pgAdmin:**

1. Clique no banco desejado
2. Vá em **Query Tool**
3. Clique em **Open File** e selecione o `.sql` ou `.backup`
4. Pressione **Run ▶️** para executar o script

---

## 🔑 Variáveis de ambiente (`.env`)

```bash
PORT=4000
DB_USER=postgres
DB_HOST=localhost
DB_NAME=the_last_of_us
DB_PASSWORD=sua_senha
DB_PORT=sua_porta
```

> ⚠️ **Atenção:**
>
> * Verifique se o Postgres está rodando.
> * As credenciais devem coincidir com as configuradas no seu banco local.

---

## 🖥️ Inicialização

Scripts recomendados no `package.json`:

```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js"
}
```

### ▶️ Executar o servidor

```bash
npm run dev
# ou
npm start
```

✅ **Servidor rodando em:** `http://localhost:4000` (ou porta definida no `.env`)

---

## 🔗 Rotas principais

> Base URL: `http://localhost:4000/api`

### 🧍 Characters (Personagens)

| Método | Rota                  | Descrição                       |
| :----- | :-------------------- | :------------------------------ |
| GET    | `/api/characters`     | Lista todos os personagens      |
| GET    | `/api/characters/:id` | Busca um personagem por ID      |
| POST   | `/api/characters`     | Cria um novo personagem         |
| PUT    | `/api/characters/:id` | Atualiza dados de um personagem |
| DELETE | `/api/characters/:id` | Remove um personagem            |

**Exemplo de criação (`multipart/form-data`):**

```bash
curl -X POST http://localhost:4000/api/characters \
  -F "name=Ellie Williams" \
  -F "description=Adolescente imune ao Cordyceps..." \
  -F "game=Parte I" \
  -F "role=Co-protagonista" \
  -F "quotes=Depois de tudo..." \
  -F "favorite_weapon=13" \
  -F "photo=@/caminho/para/ellie.jpg"
```

✅ **Resposta esperada:**

```json
{
  "message": "Character created successfully.",
  "newCharacter": { /* objeto do novo personagem */ }
}
```

---

### ☣️ Infecteds (Infectados)

| Método | Rota                 | Descrição                   |
| :----- | :------------------- | :-------------------------- |
| GET    | `/api/infecteds`     | Lista todos os infectados   |
| GET    | `/api/infecteds/:id` | Busca um infectado por ID   |
| POST   | `/api/infecteds`     | Cria um novo infectado      |
| PUT    | `/api/infecteds/:id` | Atualiza dados de infectado |
| DELETE | `/api/infecteds/:id` | Remove um infectado         |

---

### 🔫 Weapons (Armas)

| Método | Rota               | Descrição              |
| :----- | :----------------- | :--------------------- |
| GET    | `/api/weapons`     | Lista todas as armas   |
| GET    | `/api/weapons/:id` | Busca uma arma por ID  |
| POST   | `/api/weapons`     | Cria uma nova arma     |
| PUT    | `/api/weapons/:id` | Atualiza dados da arma |
| DELETE | `/api/weapons/:id` | Remove uma arma        |

---

## 🖼️ Upload de imagens

📸 As imagens são enviadas via `multipart/form-data` com o campo **`photo`**.
São armazenadas na pasta `uploads/` local e gerenciadas com **Multer**.

💡 **Boas práticas:**

* Limite os tipos de arquivo aceitos (ex: `.png`, `.jpg`).
* Defina um tamanho máximo para os uploads.
* Valide nomes e extensões antes do salvamento.

---

## 🧩 Soluções de problemas (Troubleshooting)

| ⚠️ Problema               | 🔍 Causa provável             | 🧰 Solução                         |
| :------------------------ | :---------------------------- | :--------------------------------- |
| `ECONNREFUSED`            | Postgres não está rodando     | Inicie o serviço e revise o `.env` |
| Uploads não aparecem      | Pasta `uploads/` ausente      | Crie a pasta manualmente           |
| Erro de CORS              | Falta configuração no Express | Use `app.use(cors())`              |
| Backup falha ao restaurar | Versão incompatível           | Gere um novo `.backup`             |

---

## 🔒 Boas práticas e segurança

✅ Valide e sanitize todos os dados recebidos.

✅ Restrinja tipos e tamanhos de uploads no Multer.

✅ Use variáveis de ambiente (não exponha credenciais).

✅ Utilize queries parametrizadas com `pg` para evitar SQL Injection.

✅ Adicione autenticação (ex: JWT) se o projeto for público.

✅ Configure logs e tratamento de erros globais.

---

## 🧰 Ferramentas utilizadas

* **Node.js** — Ambiente de execução
* **Express.js** — Framework web
* **PostgreSQL** — Banco de dados relacional
* **Multer** — Upload de arquivos
* **Cors** — Controle de acesso
* **Dotenv** — Gerenciamento de variáveis de ambiente
* **Nodemon** — Monitoramento durante o desenvolvimento

---

## 🤝 Como contribuir

1. Faça um fork do repositório.
2. Crie uma nova branch:

   ```bash
   git checkout -b feature/minha-melhoria
   ```
3. Faça commit das alterações:

   ```bash
   git commit -m "Melhoria: descrição da mudança"
   ```
4. Envie e abra um Pull Request.

> 💡 Antes de abrir o PR, verifique se o código passou pelos testes e segue o padrão do projeto.

---

## 🧾 Licença

Este projeto é licenciado sob a **MIT License**.
Consulte o arquivo `LICENSE` para mais detalhes.

---

## 📬 Contato

* **GitHub:** [EvelynOliveira1200](https://github.com/EvelynOliveira1200)
* **LinkedIn:** *(adicione aqui o link do seu perfil)*
* **E-mail:** [evelyn.g.oliveira7@aluno.senai.br](mailto:evelyn.g.oliveira7@aluno.senai.br)

---

> 💬 *“Quando você está perdido na escuridão... procure a luz.” — Fireflies*
