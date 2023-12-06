-- Apagar Banco de Dados db_pizzaria_legal
-- Descomentar para usar
-- DROP DATABASE IF EXISTS db_pizzaria_legal;

-- criar o Banco de dados db_pizzaria_legal
CREATE DATABASE db_pizzaria_legal;

-- Selecionar o Banco de Dados db_pizzaria_legal
USE db_pizzaria_legal;

-- Criar a tabela tb_classe
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
primary key (id)
);

-- Criar a tabela tb_personagem
CREATE TABLE tb_pizza(
id bigInt AUTO_INCREMENT,
categoria_id bigInt NOT NULL,
sabor varchar(255) NOT NULL,
price decimal(6,2) NOT NULL,
primary key (id),
foreign key (categoria_id) references tb_categoria(id)
);

-- Inserir categorias na tb_categoria
INSERT INTO tb_categoria (nome) VALUES
('Queijo'),
('Vegetariana'),
('Frango'),
('Pepperoni'),
('Calabresa'),
('Peixe'),
('Outro');

-- Inserir pizzas na tb_pizza
INSERT INTO tb_pizza (categoria_id, sabor, price) VALUES
(1, 'Três Queijos', 45.50),
(2, 'Vegetariana Suprema', 60.00),
(3, 'Frango com Catupiry', 58.75),
(4, 'Pepperoni Delight', 76.90),
(5, 'Calabresa Especial', 82.80),
(1, 'Quatro Queijos Gourmet', 132.25),
(1, 'Margherita Tradicional', 49.50),
(7, 'Portuguesa Premium', 79.75),
(7, 'Pizza do Chef', 135.00),
(6, 'Marítima Suprema', 133.20),
(6, 'Pizza de Atum', 67.50),
(7, 'Bacon Lovers', 39.90),
(7, 'Napolitana Clássica', 31.25),
(7, 'Pizza Caprese', 26.80),
(2, 'Rúcula com Tomate Seco', 80.50);

-- querys
SELECT * FROM tb_pizza;
SELECT * FROM tb_categoria;

update tb_pizza set price = 99.99
where id = 4;

update tb_pizza set price = 129.99
where id = 1;

SELECT * FROM tb_pizza
where price > 45.00;

SELECT * FROM tb_pizza
where price between 45.00 and 100.00;

-- Pizza que tenha a letra m em seu sabor
select tb_pizza.sabor as Sabor, price as preço, tb_categoria.nome As Categoria
from tb_pizza inner join tb_categoria
on tb_pizza.categoria_id = tb_categoria.id
Where tb_pizza.sabor like '%m%'
order by Sabor;

-- Agrupar por categoria, exibir categoria, quantidade e maior preco formatado
select tb_categoria.nome as Categoria, count(*) as Total, concat('R$ ', format(max(tb_pizza.price), 2, 'pt-br')) as Maior_Valor
from tb_pizza inner join tb_categoria
on tb_pizza.categoria_id = tb_categoria.id
Group by tb_categoria.nome
Order by total;

INSERT INTO tb_categoria (nome) VALUES
('Doce');

-- Inserir pizzas doces 
INSERT INTO tb_pizza (categoria_id, sabor, price) VALUES
(8, 'Chocolate com Morango', 58.90),
(8, 'Banana Caramelizada', 66.50),
(8, 'Romeu e Julieta', 90.25),
(8, 'Doce de Leite com Amendoim', 49.80),
(8, 'Morango com Nutella', 72.50);

-- Encontrar todas as pizzas com doces
select tb_categoria.nome as Categoria, tb_pizza.sabor, concat('R$ ', format(tb_pizza.price, 2, 'pt-br')) as Preço
from tb_pizza inner join tb_categoria
on tb_pizza.categoria_id = tb_categoria.id
where tb_categoria.nome regexp "^doce$";


-- Reajustar o preço de todas as pizzas em 10%
SET SQL_SAFE_UPDATES = 0;
UPDATE tb_pizza set price = price * 1.10;

select * from tb_pizza;







