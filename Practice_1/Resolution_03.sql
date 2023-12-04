-- Create database db_school
CREATE DATABASE IF NOT EXISTS db_school;

-- able to change 2 fields
SET SQL_SAFE_UPDATES = 0;

-- Select database db_school
USE db_school;

-- Create Table tb_student
CREATE TABLE tb_student(
	id bigint auto_increment,
	nameStudent varchar(200) NOT NULL,
    cpf varchar(11) NOT NULL,
    cellPhone varchar(15) NOT NULL,
    email varchar(200) NOT NULL,
    grade decimal(4,2) NOT NULL,
    dateOfBirth date not null,
    PRIMARY KEY (id)
);

-- entering data
INSERT INTO tb_student (nameStudent, cpf, cellPhone, email, grade, dateOfBirth) VALUES
('Ana Silva', '12345678901', '(11) 98765-4321', 'ana.silva@email.com', 7.5, '2003-05-15'),
('Carlos Oliveira', '23456789012', '(22) 98765-4321', 'carlos.oliveira@email.com', 9.14, '2005-08-20'),
('Luiza Pereira', '34567890123', '(33) 98765-4321', 'luiza.pereira@email.com', 10, '2004-11-10'),
('Rafael Santos', '45678901234', '(44) 98765-4321', 'rafael.santos@email.com', 8.75, '2002-07-28'),
('Juliana Lima', '56789012345', '(55) 98765-4321', 'juliana.lima@email.com', 4.33, '2006-02-03'),
('Lucas Costa', '67890123456', '(66) 98765-4321', 'lucas.costa@email.com', 3.77, '2004-04-12'),
('Fernanda Rocha', '78901234567', '(77) 98765-4321', 'fernanda.rocha@email.com', 0, '2003-09-30'),
('Pedro Almeida', '89012345678', '(88) 98765-4321', 'pedro.almeida@email.com', 8, '2007-01-18'),
('Isabela Oliveira', '90123456789', '(99) 98765-4321', 'isabela.oliveira@email.com', 9, '2005-12-08'),
('Gustavo Silva', '01234567890', '(10) 98765-4321', 'gustavo.silva@email.com', 6, '2006-06-25');

-- querys
select * from tb_student;

select nameStudent AS Nome, grade AS Nota, "Aprovado" AS Situação from tb_student
where grade > 7
order by nameStudent;

-- updates all e-mails
UPDATE tb_student SET email = "my.email@mail.com";





