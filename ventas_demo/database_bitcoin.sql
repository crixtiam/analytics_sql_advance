CREATE DATABASE IF NOT EXISTS Bitcoins;
USE Bitcoins;
drop table crypto_prices;
drop table crypto_prices_second_table;

CREATE TABLE IF NOT EXISTS crypto_prices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    datetime DATETIME,
    price_usd FLOAT,
    volume FLOAT
);

INSERT INTO crypto_prices (datetime, price_usd, volume) VALUES
('2025-09-07 00:00:00', 55000.50, 100.5),
('2025-09-07 00:05:00', 55100.75, 120.0),
('2025-09-07 00:10:00', 54950.25, 80.3),
('2025-09-07 00:15:00', 55200.00, 150.7),
('2025-09-07 00:20:00', 55350.10, 200.2),
('2025-09-07 00:25:00', 55275.80, 90.1),
('2025-09-07 00:30:00', 55400.00, 110.4),
('2025-09-07 00:35:00', NULL, 95.0); -- Precio nulo para probar manejo de casos


CREATE TABLE IF NOT EXISTS crypto_prices_second_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    datetime DATETIME,
    price_usd FLOAT,
    volume FLOAT
);

INSERT INTO crypto_prices_second_table (datetime, price_usd, volume) VALUES
('2025-09-06 23:00:00', 54800.00, 90.2),
('2025-09-06 23:05:00', 54950.25, 110.0),
('2025-09-06 23:10:00', 55000.50, 100.5),
('2025-09-06 23:15:00', 55100.75, 120.0),
('2025-09-06 23:20:00', 54950.25, 80.3),
('2025-09-07 00:00:00', 55000.50, 100.5),
('2025-09-07 00:05:00', 55100.75, 120.0),
('2025-09-07 00:10:00', 54950.25, 80.3),
('2025-09-07 00:15:00', 55200.00, 150.7),
('2025-09-07 00:20:00', 55350.10, 200.2),
('2025-09-07 00:25:00', 55275.80, 90.1),
('2025-09-07 00:30:00', 55400.00, 110.4),
('2025-09-07 00:35:00', NULL, 95.0),
('2025-09-07 01:00:00', 55500.00, 130.0),
('2025-09-07 01:05:00', 55450.25, NULL);