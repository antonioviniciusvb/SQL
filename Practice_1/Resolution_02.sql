-- Create database db_ecommerce
CREATE DATABASE IF NOT EXISTS db_ecommerce;

-- able to change 2 fields
SET SQL_SAFE_UPDATES = 0;

-- Select database db_ecommerce
USE db_ecommerce;

-- Create Table tb_products
CREATE TABLE tb_products(
	id bigint auto_increment,
	nameProduct varchar(200) NOT NULL,
    price decimal(7,2) NOT NULL,
    color varchar(100) NOT NULL,
    manufacturer varchar(200) NOT NULL,
    quantity int NOT NULL,
    codeSku varchar(13) NOT NULL,
    PRIMARY KEY (id)
);

-- entering data
INSERT INTO tb_products(nameProduct, price, color, manufacturer, quantity, codeSku)
VALUES 
("Mouse", 99.99, "Black", "Dell", 2000, "7307240999998"),
("Notebook Gamer", 4999.99, "Black", "Sony", 30, "7307240459499"),
("Pen", 1.99, "blue", "Bic", 10000, "7307240775999"),
("Pencil", 4.99, "Green", "Faber Castell", 10000, "730724129999"),
("Ram memory ddr4 8gb", 399.99, "red", "Crucial", 1000, "730456099999"),
("Keyboard", 299.99, "White", "Dell", 2000, "730724099111"),
("Cellphone 20s", 7999.99, "Black", "Xaomi", 300, "730724099222"),
("Cable USB", 4.99, "Black", "Samsung", 9999, "730724099333"),
("Cable HDMI", 24.99, "Gray", "Apple", 40, "730724099344");

-- querys
select * from tb_products;

select nameProduct AS Nome, manufacturer as Fabricante, CONCAT("R$ ", FORMAT(price, 2, "pt-BR")) as Preço from tb_products
where price > 500.00
order by nameProduct;

select nameProduct AS Nome, manufacturer as Fabricante, CONCAT("R$ ", FORMAT(price, 2, "pt-BR")) as Preço from tb_products
where price < 500.00
order by price, nameProduct;

-- updates
UPDATE tb_products SET price = price - (price * 0.1)
where id = 3;




