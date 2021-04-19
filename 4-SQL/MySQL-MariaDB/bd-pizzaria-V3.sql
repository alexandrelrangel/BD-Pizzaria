-- Há duas maneiras para transformar a tabela CONTEM em ITEM
-- 1) Renomear a tabela, remover as chaves estrangeiras, adicionar a coluna NUM_ITEM_PEDIDO, modificar a chave primária, Recriar as chaves extrangeiras.
-- 2) Criar a tabela ITEM, inserir os dados com base na tabela CONTEM, Destruir a tabela CONTEM.


--**********************************************************************
--*                                MÉTODO 1                            *
--**********************************************************************
-- 1) Renomear a tabela CONTEM para ITEM, 
--    remover as chaves estrangeiras, 
--    adicionar a coluna NUM_ITEM_PEDIDO, 
--    modificar a chave primária, 
--    Recriar as chaves extrangeiras.

-- Renomeando a tabela CONTEM para ITEM
ALTER TABLE PIZZARIA.CONTEM RENAME TO PIZZARIA.ITEM;

-- Removendo a chave estrangeira para a tabela PEDIDO
ALTER TABLE PIZZARIA.ITEM DROP FOREIGN KEY FK_CONTEM_2_PEDIDO;

-- Removendo a chave estrangeira para a tabela PIZZA
ALTER TABLE PIZZARIA.ITEM DROP FOREIGN KEY FK_CONTEM_2_PIZZA;
ALTER TABLE PIZZARIA.ITEM DROP INDEX FK_CONTEM_2_PIZZA;

-- adicionando a coluna NUM_ITEM_PEDIDO
ALTER TABLE PIZZARIA.ITEM ADD NUM_ITEM_PEDIDO INT FIRST;

-- Alterando a chave primária para NUM_ITEM_PEDIDO. Precisa no mesmo comando modificá-la para adicionar o AUTO_INCREMent
ALTER TABLE PIZZARIA.ITEM DROP PRIMARY KEY, ADD CONSTRAINT PK_ITEM PRIMARY KEY( NUM_ITEM_PEDIDO ), MODIFY COLUMN NUM_ITEM_PEDIDO INT NOT NULL AUTO_INCREMENT; 

-- Adicionando novamente a chave estrangeira para a tabela PEDIDO
ALTER TABLE PIZZARIA.ITEM ADD CONSTRAINT FK_ITEM_2_PEDIDO
	FOREIGN KEY (NUM_PEDIDO) REFERENCES PIZZARIA.PEDIDO (NUM_PEDIDO);

-- Adicionando novamente a chave estrangeira para a tabela PIZZA
ALTER TABLE PIZZARIA.ITEM ADD CONSTRAINT FK_ITEM_2_PIZZA
	FOREIGN KEY (COD_PIZZA) REFERENCES PIZZARIA.PIZZA (COD_PIZZA);


--**********************************************************************
--*                                MÉTODO 2                            *
--**********************************************************************
-- Criando a tabela ITEM
DROP TABLE IF EXISTS PIZZARIA.ITEM;
CREATE TABLE IF NOT EXISTS PIZZARIA.ITEM (
	NUM_ITEM_PEDIDO	INT			NOT NULL	AUTO_INCREMENT,
	NUM_PEDIDO		INT			NOT NULL,
	COD_PIZZA		INT			NOT NULL,
	TAMANHO			VARCHAR(1)	NOT NULL,
	QUANTIDADE		DECIMAL(5,2),
	PRECO			DECIMAL(10,2),
	CONSTRAINT PK_ITEM PRIMARY KEY (NUM_ITEM_PEDIDO),
	CONSTRAINT FK_ITEM_2_PEDIDO
		FOREIGN KEY (NUM_PEDIDO) REFERENCES PIZZARIA.PEDIDO (NUM_PEDIDO),
	CONSTRAINT FK_ITEM_2_PIZZA
		FOREIGN KEY (COD_PIZZA) REFERENCES PIZZARIA.PIZZA (COD_PIZZA)
);

-- Inserindo os dados na tabela ITEM
INSERT INTO PIZZARIA.ITEM (NUM_PEDIDO, COD_PIZZA, TAMANHO, QUANTIDADE, PRECO)
SELECT CON.NUM_PEDIDO
      ,CON.COD_PIZZA
      ,CON.TAMANHO
      ,CON.QUANTIDADE
      ,CON.PRECO
  FROM PIZZARIA.CONTEM CON
 ORDER BY CON.NUM_PEDIDO, CON.COD_PIZZA, CON.TAMANHO;
 
-- apagando a tabela CONTEM
DROP TABLE IF EXISTS PIZZARIA.CONTEM;

/*
-- FUNCIONA APENAS NO MYSQL 8.0
SELECT ROW_NUMBER() OVER (ORDER BY CON.NUM_PEDIDO, CON.COD_PIZZA, CON.TAMANHO)
      ,CON.NUM_PEDIDO
      ,CON.COD_PIZZA
      ,CON.TAMANHO
      ,CON.QUANTIDADE
      ,CON.PRECO
  FROM PIZZARIA.ITEM CON
 ORDER BY CON.NUM_PEDIDO, CON.COD_PIZZA, CON.TAMANHO;

-- Funciona em qualquer MySQL 
SELECT 
    (@row_number := @row_number + 1) AS NUM_ITEM_PEDIDO
  FROM PIZZARIA.ITEM CON,
	   (SELECT @row_number := 0) AS x
 ORDER BY CON.NUM_PEDIDO, CON.COD_PIZZA, CON.TAMANHO;
*/

