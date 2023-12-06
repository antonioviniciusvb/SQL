-- Apagar Banco de Dados db_generation_game_online
-- Descomentar para usar
-- DROP DATABASE IF EXISTS db_generation_game_online;

-- criar o Banco de dados db_quitanda
CREATE DATABASE db_generation_game_online;

-- Selecionar o Banco de Dados db_quitanda
USE db_generation_game_online;

-- Criar a tabela tb_classe
CREATE TABLE tb_classe(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
primary key (id)
);

-- Criar a tabela tb_personagem
CREATE TABLE tb_personagem(
id bigInt AUTO_INCREMENT,
classe_id bigInt NOT NULL,
nome varchar(255) NOT NULL,
nivel int NOT NULL,
ataque int NOT NULL,
defesa int NOT NULL,
stamina int NOT NULL,
velocidade int NOT NULL,
primary key (id),
foreign key (classe_id) references tb_classe(id)
);

-- Inserir classes na tb_classe
INSERT INTO tb_classe (nome) VALUES
('Guerreiro'),
('Mago'),
('Arqueiro'),
('Lutador'),
('Cavaleiro'),
('Médico'),
('Feiticeiro'),
('Assassino'),
('Ladino'),
('Paladino');

-- Inserir personagens na tb_personagem
INSERT INTO tb_personagem (classe_id, nome, nivel, ataque, defesa, stamina, velocidade) VALUES
(1, 'DarkSide', 10, 5000, 300, 80, 40), -- Guerreiro
(2, 'MagoMaster', 15, 4000, 200, 60, 50), -- Mago
(3, 'Atirador', 8, 60, 250, 70000, 55), -- Arqueiro
(4, 'LutadorFeroz', 12, 700, 400, 75, 45), -- Lutador
(5, 'CavaleiroHonrado', 14000, 550, 60, 90, 35), -- Cavaleiro
(6, 'DoutorCuraTudo', 11, 300, 150, 40, 30), -- Médico
(7, 'MagoDasTrevas', 13, 450, 300, 55, 60), -- Feiticeiro
(8, 'SombraSilenciosa', 9, 650, 2000, 50, 70), -- Assassino
(9, 'LadrãoHabilidoso', 7, 550, 150, 60, 65), -- Ladino
(10, 'PaladinoJusto', 16, 6000, 7000, 85, 30); -- Paladino


-- querys
SELECT * FROM tb_personagem;
SELECT * FROM tb_classe;

-- Ataque menor que 2000
select tb_personagem.nome AS Nome, nivel, ataque, tb_classe.nome As Classe
from tb_personagem inner join tb_classe
on tb_personagem.classe_id = tb_classe.id
Where ataque > 2000;

-- Ataque entre 600 e 2000
select tb_personagem.nome AS Nome, nivel, ataque, tb_classe.nome As Classe
from tb_personagem inner join tb_classe
on tb_personagem.classe_id = tb_classe.id
Where ataque between 600 and 2000
order by Nome;

-- Todos os personagem com a letra c
select tb_personagem.nome AS Nome, nivel, ataque, defesa, tb_classe.nome As Classe
from tb_personagem inner join tb_classe
on tb_personagem.classe_id = tb_classe.id
Where tb_personagem.nome like '%c%'
order by Nome;


-- Todos os Magos
select tb_personagem.nome AS Nome, nivel, ataque, defesa, tb_classe.nome As Classe
from tb_personagem inner join tb_classe
on tb_personagem.classe_id = tb_classe.id
Where tb_classe.nome regexp '^mago$'
order by Nome;

-- Todos os personagem que sua classe termina com iro, como: cavaleiro
select tb_personagem.nome AS Nome, nivel, ataque, defesa, tb_classe.nome As Classe
from tb_personagem inner join tb_classe
on tb_personagem.classe_id = tb_classe.id
Where tb_classe.nome regexp 'iro$'
order by Nome;