-- Create database db_rh
CREATE DATABASE IF NOT EXISTS db_rh;

-- Select database db_rh
USE db_rh;

-- Create Table tb_collaborators
CREATE TABLE tb_collaborators(
	id bigint auto_increment,
	firstName varchar(150) NOT NULL,
    lastName varchar(150) NOT NULL,
    position varchar(150) NOT NULL,
	salary decimal(7,2) NOT NULL,
    dateOfBirth date NOT NULL,
    hireDate date NOT NULL,
    PRIMARY KEY (id)
);

-- entering data
INSERT INTO tb_collaborators(firstName, lastName, position, salary, dateOfBirth, hireDate)
VALUES 
("Antonio","Bandeira", "FullSatck Developer Java Level 1", 4000.00, "1998-01-20", "2023-12-04"),
("Carla","Antunes", "FullSatck Developer Java Level 2", 7000.00, "2001-07-10", "2019-01-25"),
("José","Carlos", "Developer Mobile Level 3", 14700.00, "1990-11-07", "2010-01-22"),
("Matilda","Rodrigues", "FullSatck Developer CSharp Level 2", 6300.00, "2004-11-18", "2022-02-28"),
("Carlos","Silvestre", "Informatic technician Level 1", 2500.00, "2007-05-20", "2023-03-21"),
("Simone","Franca", "Secretary", 2000.00, "201-08-11", "2015-03-08"),
("Gustavo","Borges", "Trainee", 1000.00, "1995-11-11", "2023-10-04"),
("Camila","Pitanga", "Trainee", 800.00, "2010-07-10", "2023-10-10");

-- querys
select * from tb_collaborators;

select firstName AS Nome, position as Cargo, CONCAT("R$ ", FORMAT(salary, 2, "pt-BR")) as Salário from tb_collaborators
where salary > 2000.00
order by firstName;

select firstName AS Nome, position as Cargo, CONCAT("R$ ", FORMAT(salary, 2, "pt-BR")) as Salário from tb_collaborators
where salary < 2000.00
order by firstName Desc;

select firstName AS Nome, position as Cargo, CONCAT("R$ ", FORMAT(salary, 2, "pt-BR")) as Salário from tb_collaborators
where salary = 2000.00;

-- updates
UPDATE tb_collaborators SET salary = salary * 1.10
where id = 2;

select * from tb_collaborators
where id = 2;

-- able to change 2 fields
SET SQL_SAFE_UPDATES = 0;

 -- update 2 fields
UPDATE tb_collaborators SET position = "FullSatck Developer Java Level 1",  salary = 4000
where firstName = "Camila" AND lastName = "Pitanga";





