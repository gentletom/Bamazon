DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
    item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(100) NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    price INTEGER(11) DEFAULT 0,
	stock_quantity INTEGER(11) NOT NULL,
    PRIMARY KEY(item_id)
);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Claymore", "Sword", 11, 19);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Jian", "Sword", 10, 7);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Longsword", "Sword", 7, 5);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Broadsword", "Sword", 13, 12);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Great Sword", "Sword", 6, 8);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Boar Spear", "Spear", 19, 1);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Dory", "Spear", 19, 9);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Halberd", "Spear", 30, 10);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Brandistock", "Spear", 19, 9);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Flail", "Mace", 10, 5);

SELECT * FROM products;