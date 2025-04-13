CREATE DATABASE bookstoredb;

USE bookstoredb;

CREATE TABLE book(
book_id INT PRIMARY KEY AUTO_INCREMENT, 
title VARCHAR(100),
publication_date VARCHAR(100)
);
CREATE INDEX idx_book_title ON book(title);

CREATE TABLE book_author(
book_id INT,
author_id INT
);

CREATE TABLE author(
author_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100),
last_name VARCHAR(100)
);
CREATE INDEX idx_author_name ON author(first_name, last_name);


CREATE TABLE book_language(
language_id INT PRIMARY KEY AUTO_INCREMENT,
language_name VARCHAR(100)
);


CREATE TABLE publisher(
publisher_id INT PRIMARY KEY AUTO_INCREMENT,
publisher_name VARCHAR(100)
);
CREATE INDEX idx_publisher_name ON publisher(publisher_name);


CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE customer_address (
    customer_address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
	address_status_id INT 
    );
    
CREATE TABLE address_status (
address_status_id INT PRIMARY KEY AUTO_INCREMENT,
status_name VARCHAR(100)
);

CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(100),
    country_id INT 
);

CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100)
);

CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_status_id INT,
    shipping_method_id INT
);

CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT
);

CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);
CREATE INDEX idx_shipping_method_name ON shipping_method(method_name);

CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    history_status VARCHAR(100),
    change_date DATETIME
);

CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(100)
);
   
