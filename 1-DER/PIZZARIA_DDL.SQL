
/* Table: T001_SABOR, Owner: SYSDBA */

CREATE TABLE "T001_SABOR"
(
  "T001_SABOR_IU"	CHAR(2) NOT NULL,
  "T001_DESCRICAO"	CHAR(20) NOT NULL,
CONSTRAINT "PK_T001_SABOR" PRIMARY KEY ("T001_SABOR_IU")
);


/* Table: T002_PIZZA, Owner: SYSDBA */

CREATE TABLE "T002_PIZZA"
(
  "T002_PIZZA_IU"	INTEGER NOT NULL,
  "T002_DESCRICAO"	VARCHAR(30) NOT NULL,
  "T002_PRECO"	        DECIMAL (10,2) NOT NULL,
  "T002_SABOR_E"	CHAR(2) NOT NULL,
  "T002_DATA_CAD"	DATE NOT NULL,
  "T002_STATUS"	CHAR(1) NOT NULL,
CONSTRAINT "PK_T002_PIZZA" PRIMARY KEY ("T002_PIZZA_IU")
);
ALTER TABLE "T002_PIZZA" ADD CONSTRAINT "FK_T002_T001" FOREIGN KEY ("T002_SABOR_E") REFERENCES "T001_SABOR" ("T001_SABOR_IU");


/* Table: T003_CLIENTES, Owner: SYSDBA */

CREATE TABLE "T003_CLIENTES"
(
  "T003_CPF_IU"	INT64 NOT NULL,
  "T003_FONE"	CHAR(8) NOT NULL,
  "T003_CEP"	INTEGER NOT NULL,
  "T003_BAIRRO"	CHAR(20) NOT NULL,
  "T003_DATA"	DATE NOT NULL,
  "T003_COBRA_ENTREGA"	CHAR(1) NOT NULL,
CONSTRAINT "PK_T003_CLIENTES" PRIMARY KEY ("T003_CPF_IU")
);


/* Table: T004_CONSUMACAO, Owner: SYSDBA */

CREATE TABLE "T004_CONSUMACAO"
(
  "T004_DATA_IU"	DATE NOT NULL,
  "T004_SENHA_IU"	INTEGER NOT NULL,
  "T004_CPF_E"	INT64 NOT NULL,
  "T004_ENTREGA"	CHAR(1) NOT NULL,
  "T004_HORA_FIM_COZINHA"	DATE NOT NULL,
  "T004_HORA_PREV_ENTREGA"	DATE NOT NULL,
  "T004_HORA_REAL_ENTREGA"	DATE NOT NULL,
  "T004_TOTAL_CONTA"	INT64 NOT NULL,
  "T004_FORMA_PAGTO"	CHAR(1) NOT NULL,
  "T004_DOCTO"	CHAR(10) NOT NULL,
CONSTRAINT "PK_T004_CONSUMACAO" PRIMARY KEY ("T004_DATA_IU", "T004_SENHA_IU")
);
ALTER TABLE "T004_CONSUMACAO" ADD CONSTRAINT "FK_T004_T003" FOREIGN KEY ("T004_CPF_E") REFERENCES "T003_CLIENTES" ("T003_CPF_IU");



/* Table: T005_CONSUMACAO_PIZZA, Owner: SYSDBA */

CREATE TABLE "T005_CONSUMACAO_PIZZA"
(
  "T005_DATA_IE"	DATE NOT NULL,
  "T005_SENHA_IE"	INTEGER NOT NULL,
  "T005_SEQ_CONSUMO_IU"	SMALLINT NOT NULL,
  "T005_PIZZA_1_E"	INTEGER NOT NULL,
  "T005_PRECO_1"	INT64 NOT NULL,
  "T005_PIZZA_2_E"	INTEGER NOT NULL,
  "T005_PRECO_2"	INT64 NOT NULL,
CONSTRAINT "PK_T005_CONSUMACAO_PIZZA" PRIMARY KEY ("T005_DATA_IE", "T005_SENHA_IE", "T005_SEQ_CONSUMO_IU")
);
ALTER TABLE "T005_CONSUMACAO_PIZZA" ADD CONSTRAINT "FK_T005_T002_SABOR_1" FOREIGN KEY ("T005_PIZZA_1_E") REFERENCES "T002_PIZZA" ("T002_PIZZA_IU");
ALTER TABLE "T005_CONSUMACAO_PIZZA" ADD CONSTRAINT "FK_T005_T002_SABOR_2" FOREIGN KEY ("T005_PIZZA_2_E") REFERENCES "T002_PIZZA" ("T002_PIZZA_IU");
ALTER TABLE "T005_CONSUMACAO_PIZZA" ADD CONSTRAINT "FK_T005_T004" FOREIGN KEY ("T005_DATA_IE", "T005_SENHA_IE") REFERENCES "T004_CONSUMACAO" ("T004_DATA_IU", "T004_SENHA_IU");



