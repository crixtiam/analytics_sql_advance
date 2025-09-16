-- Crear base de datos
CREATE DATABASE IF NOT EXISTS ventas_demo;
USE ventas_demo;

-- Crear tabla de clientes
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Crear tabla de ventas
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insertar clientes
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Ana'),
(2, 'Carlos'),
(3, 'María');

-- Insertar ventas (diferentes fechas y clientes)
INSERT INTO sales (sale_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-10', 150.00),
(102, 1, '2024-02-15', 200.00),
(103, 1, '2024-03-01', 180.00),
(104, 2, '2024-01-05', 300.00),
(105, 2, '2024-02-20', 250.00),
(106, 2, '2024-03-05', 400.00),
(107, 3, '2024-01-25', 120.00),
(108, 3, '2024-02-10', 180.00),
(109, 3, '2024-03-12', 220.00);
