CREATE DATABASE trainbookingdb;

USE trainbookingdb;

CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT, 
full_name VARCHAR(30),
email VARCHAR(100)
);

CREATE TABLE tickets(
ticket_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
seat_number VARCHAR(100),
ticket_date DATE,
ticket_price DECIMAL(10, 2)
);


CREATE TABLE trains(
train_id INT PRIMARY KEY AUTO_INCREMENT,
train_name VARCHAR(100),
start_station Varchar(100),
end_station VARCHAR(100),
depart_time TIME,
arrival_time TIME
);


