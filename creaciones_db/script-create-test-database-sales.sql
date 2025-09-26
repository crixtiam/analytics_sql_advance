-- Create database
CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerName, Region, JoinDate) VALUES
('Alice Johnson', 'North', '2023-01-15'),
('Bob Smith', 'East', '2023-03-10'),
('Carlos Lopez', 'West', '2023-05-22'),
('Diana Chen', 'South', '2023-07-05'),
('Ethan Brown', 'North', '2023-09-18');

-- Insert sample data into Orders
INSERT INTO Orders (CustomerID, OrderDate, Product, Quantity, UnitPrice) VALUES
(1, '2023-02-01', 'Laptop', 2, 800.00),
(1, '2023-02-15', 'Mouse', 5, 20.00),
(2, '2023-03-20', 'Keyboard', 3, 35.00),
(2, '2023-04-02', 'Monitor', 1, 200.00),
(3, '2023-06-01', 'Laptop', 1, 850.00),
(3, '2023-06-15', 'Headphones', 2, 50.00),
(4, '2023-08-01', 'Tablet', 1, 400.00),
(4, '2023-08-20', 'Stylus Pen', 2, 25.00),
(5, '2023-10-01', 'Laptop', 3, 780.00),
(5, '2023-10-10', 'Monitor', 2, 210.00);

-- Query for Power BI check
SELECT 
    o.OrderID,
    c.CustomerName,
    c.Region,
    o.OrderDate,
    o.Product,
    o.Quantity,
    o.UnitPrice,
    (o.Quantity * o.UnitPrice) AS TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
