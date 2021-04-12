USE PIZZARIA;

DROP TABLE IF EXISTS PIZZARIA.INGREDIENTE;
CREATE TABLE IF NOT EXISTS PIZZARIA.INGREDIENTE (
	COD_INGREDIENTE			INT				NOT NULL	AUTO_INCREMENT,
	NOME_INGREDIENTE		VARCHAR(100)	NOT NULL,
	CONSTRAINT PK_INGREDIENTE PRIMARY KEY (COD_INGREDIENTE)
);

INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ABOBRINHA PRÉ ASSADA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('AÇÚCAR');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ALHO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ALHO FRITO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ALHO PORÓ');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ALICHE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ATUM');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('BACON');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('BANANA FATIADA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('BATATA PALHA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('BERINGELA REFOGADA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('BRÓCOLIS NO ALHO/ÓLEO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CALABRESA FATIADA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CALABRESA MOÍDA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CALABRESA MOÍDA SEM PIMENTA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CAMARÃO TEMPERADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CANELA EM PÓ');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CARNE SECA DESFIADA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CATUPIRY');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CEBOLA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CHAMPIGNON');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CHEDAR');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CHOCOLATE AO LEITE EM LASCAS');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CHOCOLATE BRANCO EM LASCAS');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CHOCOLATE GRANULADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('COBERTURA DE CHOCOLATE AO LEITE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('COCO RALADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CREAM CHEESE PHILADELPHIA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CREME DE BRIGADEIRO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('CREME DE CEBOLA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ERVAS FINAS');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ERVILHA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('ESCAROLA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('GOIABADA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('GORGONZOLA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('LOMBO CANADENSE FATIADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('M&M');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MANJERICÃO FRESCO EM FOLHAS');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MILHO VERDE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MOLHO DE TOMATE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MOLHO ROSÉ');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MONTE AO SEU GOSTO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MUZZARELA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('MUZZARELA DE BÚFALA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('OVOS');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PALMITO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PARMESÃO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PEDAÇOS DE SONHO DE VALSA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PEITO DE FRANGO DESFIADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PEITO DE PERU DEFUMADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PEPERONE EM RODELAS');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PIMENTA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PRESUNTO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PRESUNTO PARMA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('PROVOLONE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('RICOTA TEMPERADA COM AZEITE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('RODELAS DE TOMATE');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('SALMÃO FESCO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('SALSINHA');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('TOMATE PICADO');
INSERT INTO PIZZARIA.INGREDIENTE (NOME_INGREDIENTE) VALUES ('TOMATE SECO');


DROP TABLE IF EXISTS PIZZARIA.PIZZA_USA_INGREDIENTE;
CREATE TABLE IF NOT EXISTS PIZZARIA.PIZZA_USA_INGREDIENTE (
	COD_PIZZA				INT				NOT NULL,
	COD_INGREDIENTE			INT				NOT NULL,
	CONSTRAINT PK_PIZZA_USA_INGREDIENTE PRIMARY KEY (COD_PIZZA, COD_INGREDIENTE),
	CONSTRAINT FK_PIZZA_USA_INGREDIENTE_2_PIZZA
		FOREIGN KEY (COD_PIZZA) REFERENCES PIZZA (COD_PIZZA),
	CONSTRAINT FK_PIZZA_USA_INGREDIENTE_2_INGREDIENTE
		FOREIGN KEY (COD_INGREDIENTE) REFERENCES INGREDIENTE (COD_INGREDIENTE)
);

DROP TABLE IF EXISTS PIZZARIA.TABELA_PRECO;
CREATE TABLE IS NOT EXISTS PIZZARIA.TABELA_PRECO (
	COD_PRECO				INT				NOT NULL	AUTO_INCREMENT,
	PRECO_PIZZA_INTEIRA		DECIMAL(10,2)	DEFAULT 0,
	PRECO_PIZZA_BROTO		DECIMAL(10,2)	DEFAULT 0,
	NOME_COR_PRECO			VARCHAR(50)		NOT NULL,
	COD_COR_HTML			VARCHAR(10)		DEFAULT '#C71585',
	CONSTRAINT PK_TABELA_PRECO PRIMARY KEY (COD_PRECO)
);

INSERT INTO PIZZARIA.TABELA_PRECO (PRECO_PIZZA_INTEIRA, PRECO_PIZZA_BROTO, NOME_COR_PRECO, COD_COR_HTML)
VALUES (43.90, 30.50, 'VERDE', '#3CB371');
INSERT INTO PIZZARIA.TABELA_PRECO (PRECO_PIZZA_INTEIRA, PRECO_PIZZA_BROTO, NOME_COR_PRECO, COD_COR_HTML)
VALUES (50.90, 32.50, 'VERMELHO', '#DC143C');
INSERT INTO PIZZARIA.TABELA_PRECO (PRECO_PIZZA_INTEIRA, PRECO_PIZZA_BROTO, NOME_COR_PRECO, COD_COR_HTML)
VALUES (52.90, 34.50, 'AZUL', '#1E90FF');
INSERT INTO PIZZARIA.TABELA_PRECO (PRECO_PIZZA_INTEIRA, PRECO_PIZZA_BROTO, NOME_COR_PRECO, COD_COR_HTML)
VALUES (58.90, 36.50, 'PRETA', '#000000');
INSERT INTO PIZZARIA.TABELA_PRECO (PRECO_PIZZA_INTEIRA, PRECO_PIZZA_BROTO, NOME_COR_PRECO, COD_COR_HTML)
VALUES (62.90, 37.50, 'AMARELA', '#FFD700');
INSERT INTO PIZZARIA.TABELA_PRECO (PRECO_PIZZA_INTEIRA, PRECO_PIZZA_BROTO, NOME_COR_PRECO, COD_COR_HTML)
VALUES (68.90, 38.50, 'ROXA', '#3CB371');


ALTER TABLE PIZZARIA.PIZZA ADD COD_PRECO INT;

UPDATE PIZZARIA.PIZZA SET
	COD_PRECO = (SELECT TBP.COD_PRECO
				   FROM TABELA_PRECO TBP
				  WHERE TBP.PRECO_PIZZA_INTEIRA IN (SELECT PRECO_TAMANHO_PIZZA
				 								 	  FROM TAMANHO_PIZZA TMP
			 										 WHERE TMP.COD_PIZZA = 1
													   AND TMP.DESC_TAMANHO_PIZZA = 'INTEIRA'));
											
ALTER TABLE PIZZARIA.PIZZA ADD COD_PRECO INT NOT NULL;		   

ALTER TABLE PIZZARIA.PIZZA ADD 
	CONSTRAINT FK_PIZZA_2_TABELA_PRECO
		FOREIGN KEY (COD_PRECO) REFERENCES TABELA_PRECO (COD_PRECO);

ALTER TABLE PIZZARIA.CONTEM ADD TAMANHO VARCHAR(1) DEFAULT 'I' COMMENT="I-INTEIRA; B-BROTO";
ALTER TABLE PIZZARIA.CONTEM ADD 
	CONSTRAINT CK_CONTEM_TAMANHO CHECK (TAMANHO IN ('I','B'));
ALTER TABLE PIZZARIA.CONTEM ADD
	CONSTRAINT FK_CONTEM_2_PIZZA
		FOREIGN KEY (COD_PIZZA) REFERENCES PIZZA (COD_PIZZA);
ALTER TABLE PIZZARIA.CONTEM DROP FOREIGN KEY FK_CONTEM_2_TAMANHO_PIZZA;

UPDATE PIZZARIA.CONTEM SET 
	TAMANHO = SUBSTRING(DESC_TAMANHO_PIZZA, 1, 1);

ALTER TABLE PIZZARIA.CONTEM DROP COLUMN DESC_TAMANHO_PIZZA;
