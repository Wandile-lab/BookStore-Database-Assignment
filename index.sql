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
   
   -- Book languages
INSERT INTO book_language (language_name) VALUES ('English'), ('French');

-- Publishers
INSERT INTO publisher (publisher_name) VALUES ('Penguin'), ('HarperCollins'), ('Random House');

-- Books 
INSERT INTO book (title, publication_date) VALUES
('The Great Gatsby', '1925'),
('To Kill a Mockingbird', '1960'),
('1984', '1949-06-08'),
('Pride and Prejudice', '1813'),
('The Catcher in the Rye', '1951');

-- Authors 
INSERT INTO author (first_name, last_name)
VALUES 
('F. Scott', 'Fitzgerald'),
('Miguel', 'de Cervantes'),
('Victor', 'Hugo'),
('Johann', 'Goethe');

-- Book-Author relationship 
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Countries
INSERT INTO country (country_name)
VALUES ('USA'), ('Spain'), ('France'), ('Germany');

-- Addresses 
INSERT INTO address (street, city, postal_code, country_id)
VALUES 
('123 Main St', 'New York', '10001', 1),
('456 Plaza Ave', 'Madrid', '28001', 2),
('789 Rue de Paris', 'Paris', '75001', 3),
('321 Berlin Str', 'Berlin', '10115', 4);

-- Address statuses
INSERT INTO address_status (status_name)
VALUES ('current'), ('old');

-- Customers 
INSERT INTO customer (full_name, email)
VALUES 
('Llian Sision', 'sisionkitiyo@gmail.com'),
('Jackline Muturi', 'jacklinemuturi@gmail.com'),
('Wandz Twos', 'wandztwos@gmail.com');

-- Customer Addresses 
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- Shipping methods
INSERT INTO shipping_method (method_name, cost)
VALUES 
('Standard', 5.99),
('Express', 9.99),
('Overnight', 19.99);

-- Order statuses
INSERT INTO order_status (status_name) VALUES ('Pending'), ('Shipped'), ('Delivered');

-- Orders 
INSERT INTO cust_order (customer_id, order_date, order_status_id, shipping_method_id) VALUES 
(1, '2025-04-01', 1, 1),
(2, '2025-04-02', 2, 2),
(3, '2025-04-02', 3, 3);

-- Order lines 
INSERT INTO order_line (order_id, book_id, quantity) VALUES 
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);

-- Order history
INSERT INTO order_history (order_id, history_status, change_date) VALUES 
(1, 'Pending', '2025-04-01 09:00:00'),
(2, 'Shipped', '2025-04-02 10:30:00'),
(3, 'Pending', '2025-04-02 11:45:00');
