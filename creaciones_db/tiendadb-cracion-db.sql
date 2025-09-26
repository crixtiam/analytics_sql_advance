-- Crear base de datos
CREATE DATABASE IF NOT EXISTS tiendadb;
USE tiendadb;

-- ==========================
-- ELIMINAR TABLAS (si existen) - EN ORDEN CORRECTO
-- ==========================
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

-- ==========================
-- CREAR TABLAS - EN ORDEN JERÁRQUICO
-- ==========================

-- Tablas independientes primero
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    customer_group VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50)
);

-- Tabla orders (depende de customers y employees)
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Tabla order_details (depende de orders y products)
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ==========================
-- INSERTAR DATOS - EN ORDEN CORRECTO
-- ==========================

-- 1. Insertar clientes
INSERT INTO customers (name, city, customer_group) VALUES
('Juan Pérez', 'Bogotá', 'Retail'),
('María Gómez', 'Medellín', 'Retail'),
('Carlos López', 'Cali', 'Corporate'),
('Ana Torres', 'Barranquilla', 'Retail'),
('Pedro Sánchez', 'Cartagena', 'Corporate');

-- 2. Insertar empleados
INSERT INTO employees (name, hire_date, department) VALUES
('Luis Ramírez', '2020-01-15', 'Ventas'),
('Laura Ríos', '2019-03-20', 'Soporte'),
('Andrés Castillo', '2021-07-10', 'Ventas'),
('Marta Díaz', '2018-11-05', 'Logística');

-- 3. Insertar productos
INSERT INTO products (name, price, category) VALUES
('Laptop HP', 2500.00, 'Tecnología'),
('Teléfono Samsung', 1200.00, 'Tecnología'),
('Escritorio Madera', 800.00, 'Muebles'),
('Silla Ergonómica', 400.00, 'Muebles'),
('Audífonos Sony', 200.00, 'Accesorios');

-- 4. Insertar órdenes
INSERT INTO orders (customer_id, employee_id, order_date, total) VALUES
(1, 1, '2023-01-10', 3700.00),
(2, 3, '2023-02-15', 1600.00),
(3, 1, '2023-03-05', 1200.00),
(4, 2, '2023-04-20', 200.00),
(5, 4, '2023-05-18', 1200.00);

-- 5. Insertar detalles de órdenes (CON order_id ÚNICOS para evitar confusión)
INSERT INTO order_details (order_id, product_id, quantity, unit_price, subtotal) VALUES
(1, 1, 1, 2500.00, 2500.00),
(2, 3, 2, 800.00, 1600.00),
(3, 2, 1, 1200.00, 1200.00),
(4, 5, 1, 200.00, 200.00),
(5, 4, 3, 400.00, 1200.00);