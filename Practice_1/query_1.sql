-- Deletar tabela
DROP TABLE IF EXISTS tb_produtos;

CREATE DATABASE db_quitanda;

-- Sempre utilizar esse comando antes de começar realizar as consultas
USE db_quitanda;

-- Criando a tabela 
CREATE TABLE tb_produtos(
	id bigint auto_increment,
	nome_produto varchar(255) NOT NULL,
	quantidade int,
	data_validade date,
	preco decimal(6,2) NOT NULL,
	PRIMARY KEY (id)
);

-- Inserir dados
INSERT INTO tb_produtos(nome_produto, quantidade, data_validade, preco)
VALUES 
("tomate", 100, "2023-12-20", 8.00),
("maçã", 100, "2023-01-02", 11.00),
("laranja", 100, "2023-11-11", 15.00),
("banana", 100, "2023-07-14", 11.90),
("uva", 100, "2023-06-5", 30.00),
("melância", 100, "2023-02-10", 20.00),
("jaboticaba", 500, "2024-01-24", 30.00);


SELECT @@collation_database;

-- Realizar consultas
SELECT * FROM tb_produtos;

-- Realizar consultas
SELECT nome_produto, preco FROM tb_produtos;

-- Realizar consultas
SELECT * FROM tb_produtos
WHERE id = 1;

-- Realiza consultas
SELECT * FROM tb_produtos
WHERE data_validade = "2023-01-02";

SELECT * FROM tb_produtos
WHERE preco >  20;

SELECT * FROM tb_produtos
WHERE preco >  10.00 OR nome_produto = "Maça";

SELECT * FROM tb_produtos
WHERE quantidade >  100 AND preco >= 15;

SELECT * FROM tb_produtos WHERE NOT id = 1;

SELECT nome_produto, Concat('R$ ', FORMAT(preco, 2, 'pt_BR')) AS preço FROM tb_produtos;

SELECT nome_produto, DATE_FORMAT(data_validade,  '%d/%m/%Y') AS Data_Validade FROM tb_produtos;

-- Para estruturas
ALTER TABLE tb_produtos MODIFY preco decimal(6,2);

-- Adicionar atributo
ALTER TABLE tb_produtos ADD descricao varchar(255);

-- Remover atributo
ALTER TABLE tb_produtos DROP descricao;

-- Alterar o nome do atributo existente
ALTER TABLE tb_produtos Change nome nome_produto varchar(255);

-- Para dados
UPDATE tb_produtos SET nome = "melância"
Where id = 6;

-- 0 - desativa, 1 - ativa 
-- Não permitir UPDATE sem Where
SET SQL_SAFE_UPDATES = 1;

-- Deltar um registro
DELETE FROM tb_produtos WHERE id = 8;


