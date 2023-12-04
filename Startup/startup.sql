/*criando tabela */

create table Funcionarios
(
	codigo int not null,
	nome varchar(30),
	cargo varchar(30),
	departamento char(2),
	cidade varchar(30),
	salario decimal(8,2),
	primary key (codigo)

);

/* Apagando uma tabela */

drop table  Funcionarios

/* utilizando alter table para adicionar um campo em uma tabela */

alter table Funcionarios
add column endereco varchar (60);

/*  utilzando alter table para apagr um campo em uma tabela */

alter table funcionarios
drop column endereco;

/*  inserindo dados em uma tabela */

insert into funcionarios 
(codigo, nome, cargo, departamento, endereco, cidade,salario)

values
(11, 'ronaldo alberto', 'vendedor', 'vn', 'rua um, 1000 - santa cecila', 'sao paulo',1530.00),
(10,'FRANCISCO SILVA', 'ANALISTA DE MARKETING', 'MK', 'RUA DOS SABIAS, 290 - FABRICIO', 'UBERABA', 2000.00),
(32, 'JUNIOR OLIVEIRA', 'ANALISTA DE SISTEMAS', 'TI', 'VERGUEIRO, 4000 - PARAISO', 'São Paulo', 4000.00),
(21, 'roberta miranda', 'psicologa','rh','rua dez - 432 - esperança', 'santo andre', 3500.00),
(27, 'JADDE SANTOS', 'VENDEDOR', 'VN', 'AV. FLORIANO PEIXOTO, 456 - CENTRO', 'unbderaba', 1500.00),
(15, 'SANDRA AMALIA', 'ANALISTA DE MARKETING', 'MK', 'RUA INDONESIA, 4566 - VILA ROMANA', 'SANTO ANDRE', 3200.00),
(55, 'SANDRA DE SA', 'RECURSOS HUMANOS', 'RH', 'AV. SANTOS DUMMONT, 3567 - CENTRO', 'UBERABA', 1999.90),
(18, 'JOAQUIM OLIVEIRA', 'TECNOLOGIA', 'TI', 'RUA DAS ROSAS, 244 - VILA GUIOMAR', 'SÃO PAULO', 4000.00),
(33, 'ANA GABRIELA', 'ESTAGIARIA', 'RH', 'RUA  LEOPOLDINO DE OLIVEIRA, 5678 - CENTRO', 'UBERABA', 590.00),
(23, 'MARIANA ROSA', 'ANALISTA DE MARKETING JUNIOR', 'MK', 'RUA DAS LARANJEIRAS, 765 - FRUTAS', 'SANTO ANDRE', 2356.00);

/*     comandos de selação    
----selecionando todos os campos da tabela de funcionarios -----*/

select *from funcionarios;

/*----listar nome e funcao dos funcionarios -----*/
select nome, cargo from funcionarios;

/* ----- listar nome de todos os funcioanrios de cada departamento ----*/

select nome, departamento from funcionarios
where departamento = 'vn';

select nome, departamento from funcionarios
where departameNto = 'MK';

SELECT NOME, DEPARTAMENTO FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'TI';

/*     COMANDOS DE ORDENAÇÃO  

----LISTAR NOME E SALARIO DOS FUNCIONARIOS ORDENANDO A LISTA POR NOME */

SELECT nome, salario from funcionarios
order by  nome;

/*   lista nome e salario dos funcionarios e ordenar por nome de trás para frente */

select nome, salario from funcionarios
order by  nome desc;

/*   listar nome e salario dos funcionarios e ordenar por salario */

select nome, salario from funcionarios 
order by salario;

/*   lista nome e salario dos funcinarios ordenando os salrios de formas descendentes */

select nome, salario from funcionarios 
order by salario desc;

/*  listar nome e salario dos funcionarios e ordenar por departamnrto, dentro do mesmo departamento, ordenar por nome de trás para frente */

select nome, salario, departamento from funcionarios
order by departamento, nome desc;

/* ---------------- comandos de atualização de dados - UPDATE 

---- o funcionário de código de registro 18 teve um aumento de salário para 4300,56
vamos atualizar o banco de dados: */

update funcionarios set salario = 4300.56
where codigo = 18;

/* -ronaldo alberto foi transferido do departamento vn para o departamento mk */
update funcionarios set departamento = 'mk'
where nome = 'ronaldo alberto';

/* suponhamos que todos os funcionarios dsa empresa terão um aumento de 10% */

update funcionarios set salario = salario * 1.10;

/*comandos para excluir dados - delete

nossa pequena startup está passando por um período difícil então para economizar
recursos uma  decisão muito inteligente foi tomada e o departsmento TI foi extinto e 
teceirado.

sendo assim, vamos remover os funcionários do extinto departamento TI da tabela de funcionários.*/

delete from funcionarios
where departamento = 'TI';

/* suponhamos que o funcionario JADDE SANTOS, esteja insatisfetio com as mudanças da empresa
e solicitou sua demissão, portanto esse registro precissa ser eliminado da tabela*/

delete from funcionarios
where nome = 'JADDE SANTOS';

/* --------- COMANDOS PARA ALTERAÇÃO DA ESTRUTURA DA TABELA - ALTER TABLE --------

Vamos criar um novo campo para gaurdar a data de demissão do funcionário na tabela funcionários.*/


alter table funcionarios
add  data_admissao date;


/*  ---------- COMANDOS DE ATUALIZAÇÃO DE DADOS - UPDATE -----------

Vamos atualizar com as datas de admissao dos funcionarios ativos 
para tanto usamos o comando upadte */


update funcionarios set data_admissao = '2011.10.21'
where codigo = 10;

update funcionarios set data_admissao = '2013.5.16'
where codigo = 11;

update funcionarios set data_admissao = '2010-12-11'
where codigo =21;

update funcionarios set data_admissao ='2012-2-2'
where codigo = 55;

update funcionarios set data_admissao = '2014-9-16'
where codigo =33;

update funcionarios set data_admissao = '2015-1-10'
where codigo = 23;


/* ----- atualizando o endereço -----*/

update funcionarios set endereco = 'rua das acacias, 566 - vila roma'
where codigo = 15;

update funcionarios set endereco ='rua arduino, 099 - boa vista'
where codigo = 10;

/* elabore uma consulta que msotre todos os nomes dos funcionários que foram admitos em 16/05/2013.*/

select *from funcionarios
where data_admissao = '16-05-2013';

/* elabore uma uma consulta que efetue a apresentação da listagem dos nomes dos funcionários 
que foram admitidos depois de 1/1/2010.*/

select *from funcionarios
where data_admissao > '1-1-2010';

/* A terceirização do departamento de TI não foi bem sucedida.
Logo foram admitidos 3 novos funcionarios para compor uma nova equipe.*/

insert into funcionarios 
(codigo, nome, cargo, departamento, endereco, cidade,salario, data_admissao)

values 
(4,'Pedro godoy','programador','ti','rua das sibeiras, 432 - vila alpina', 'sao paulo', 4000.00,'21-07-2014');

insert into funcionarios
(codigo, nome, cargo, departamento, endereco, cidade,salario, data_admissao)

values 
(6, 'pietro arruda','analista de sistemas','ti','rua cartafina, 222 -boa vista','sao paulo',3800.00,'23/07/2014');

insert into funcionarios 
(codigo, nome, cargo, departamento, endereco, cidade, salario,data_admissao)

values 
(9, 'andre toledo','programdor senior','ti','ruas das americas, 9875 - abadia','sao paulo', 9500.00,'26/07/2014');


select *from funcionarios
order by salario;

/*  criando tabela de ex funcionarios */

create table exfuncionarios
(

	codigo int not null,
	nome varchar (50) not null,
	cargo varchar(30) not null,
	departamento char (2),
	endereco varchar (60),
	cidade varchar (30),
	salario decimal (8,2),
	data_admissao date,
	primary key (codigo)
);

/*   copiando dados de uma tabela para outra */

insert into exfuncionarios 
select codigo, nome, cargo, departamento, endereco, cidade, salario,data_Admissao
from funcionarios
where codigo =11;


select *from exfuncionarios;

/*       apagando dados */

delete from funcionarios
where codigo = 11;

/*  operadores relacionais - >, <, >=,<= 
Efetue um comando que mostre todos os funcionarios que ganham abaixo de 3000*/


select *from funcionarios
where salario < 3000.00;

/*   operador NOT
Apresentar todos os funcionarios que não são do departamento ti*/

select *from funcionarios
where NOT  departamento = 'ti'; 

 /*  COMANDO BETWEEN    
Apresentar os salários de todos os funcionários que recebem entre 1600 e 3000*/

SELECT  *from funcionarios
where salario BETWEEN 1600 AND 3000;

/*   OPERADOR IN 
Apresentar os dados dos funcionários que ocupem a função de programador ou psicilogia 
ou estagiaria*/

select *from funcionarios 
where cargo IN('programador','psicologa','ESTAGIARIA');

/*     OPERADOR LIKE 
Apresentar todos os funcionários cujos nomes se inciem com a letra p */

SELECT *FROM funcionarios
WHERE nome LIKE'P%';

/*Apresentar todos os funcionários que tenham a sequencia AN no nome*/

SELECT *FROM funcionarios 
WHERE nome LIKE 'AN';

/*    OPERADOR IS NULL 
Para verificar se determinado campo está em branco, usamos o operador IS NULL*/

SELECT *FROM funcionarios
WHERE data_admissao IS NULL;

UPDATE funcionarios SET data_admissao = '03/07/2015'
WHERE data_admissao IS NULL;

/*  Funções de agregação - AVG, MAX, MIN, COUNT 
Elabore uma consulta que apresente a média de salário dos funcionários do departamento TI */

SELECT AVG(salario)FROM funcionarios
WHERE departamento = 'ti';

/*Calcular a soma dos salários de todos os funcionários do departamento MK */

SELECT SUM(salario)FROM funcionarios
WHERE departamento = 'MK';

/*Apresentar o maior salário existente entre todos os funcionários */

SELECT MAX(salario)FROM funcionarios;

/*Apresentar o menor salário existente entre todos os funcionários */

SELECT MIN(salario)FROM funcionarios;

/* FUNÇÃO COUNT - FAZ UMA CONTAGEM 
Exibir o número de funcionários que pertencem ao departamento RH */

SELECT COUNT(*)FROM funcionarios 
WHERE departamento ='RH';

/*Elabore uma consulta que apresente o número de departamento existentes na tabela funcionários */

SELECT COUNT(DISTINCT departamento)
FROM funcionarios;

SELECT *FROM funcionarios
ORDER BY codigo;

SELECT *FROM exfuncionarios;