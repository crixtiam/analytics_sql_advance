INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, DESCRIPTION) VALUES
('Electronics', 'Electronic devices and gadgets'),
('Clothing', 'Men and women clothing'),
('Books', 'Educational and fiction books'),
('Home Appliances', 'Household appliances'),
('Sports Equipment', 'Sports and fitness gear'),
('Toys', 'Kids and educational toys'),
('Furniture', 'Home and office furniture'),
('Beauty', 'Skincare and makeup products'),
('Jewelry', 'Fashion and luxury jewelry'),
('Footwear', 'Shoes and sandals');

INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS, CREATED_DATE) VALUES
('David', 'Miller', 'david.miller@example.com', '555-1101', '1101 Maple St, County', '2023-06-01'),
('Sarah', 'Taylor', 'sarah.taylor@example.com', '555-1102', '1202 Pine Ave, Borough', '2023-07-15'),
('James', 'Anderson', 'james.anderson@example.com', '555-1103', '1303 Oak Ln, District', '2023-08-20'),
('Lisa', 'Martinez', 'lisa.martinez@example.com', '555-1104', '1404 Elm Rd, Parish', '2023-09-10'),
('Thomas', 'Garcia', 'thomas.garcia@example.com', '555-1105', '1505 Birch Dr, Township', '2023-10-05'),
('Emma', 'Lopez', 'emma.lopez@example.com', '555-1106', '1606 Cedar St, Hamlet', '2024-05-01'),
('William', 'Hernandez', 'william.hernandez@example.com', '555-1107', '1707 Walnut Ave, Suburb', '2024-06-15'),
('Rachel', 'Gonzalez', 'rachel.gonzalez@example.com', '555-1108', '1808 Spruce Ln, Village', '2024-07-20'),
('Daniel', 'Wilson', 'daniel.wilson@example.com', '555-1109', '1909 Ash Rd, Town', '2025-08-01'),
('Olivia', 'Perez', 'olivia.perez@example.com', '555-1110', '2001 Cherry Dr, City', '2025-09-07');

INSERT INTO PRODUCT (NAME, DESCRIPTION, PRICE, STOCK_QUANTITY, CATEGORY_ID) VALUES
('Wireless Headphones', 'Noise-canceling over-ear headphones', 129.99, 180, 1),
('Leather Jacket', 'Classic black leather jacket', 199.99, 120, 2),
('Cookbook', 'Best recipes for beginners', 24.99, 250, 3),
('Electric Kettle', '1.7L stainless steel kettle', 39.99, 300, 4),
('Tennis Racket', 'Professional graphite racket', 89.99, 150, 5),
('Toy Car', 'Remote-controlled toy car', 49.99, 200, 6),
('Dining Table', 'Wooden dining table for 6', 299.99, 50, 7),
('Face Cream', 'Moisturizing face cream 50ml', 15.99, 350, 8),
('Gold Necklace', '18k gold necklace with pendant', 199.99, 80, 9),
('Running Shoes', 'Lightweight running shoes', 79.99, 300, 10);

INSERT INTO PURCHASE_ORDER (CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT, STATUS) VALUES
(1, '2023-06-15 09:30:00', 129.99, 'Completed'),
(2, '2023-07-20 14:15:00', 199.99, 'Shipped'),
(3, '2023-08-10 11:45:00', 44.98, 'Completed'),
(4, '2023-09-25 16:20:00', 89.99, 'Pending'),
(5, '2023-10-05 08:10:00', 149.99, 'Completed'),
(6, '2024-05-01 10:00:00', 49.99, 'Shipped'),
(7, '2024-06-15 13:30:00', 299.99, 'Processing'),
(8, '2024-07-20 15:45:00', 15.99, 'Completed'),
(9, '2025-08-01 09:15:00', 199.99, 'Shipped'),
(10, '2025-09-07 15:30:00', 79.99, 'Pending');