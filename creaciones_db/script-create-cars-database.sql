CREATE DATABASE IF NOT EXISTS carsdb;
USE carsdb;

-- Create the table with proper MySQL types
CREATE TABLE cars (
    listing_id BIGINT,
    vin VARCHAR(50),
    make VARCHAR(100),
    model VARCHAR(100),
    year INT,
    trim VARCHAR(100),
    body_type VARCHAR(100),
    fuel_type VARCHAR(100),
    transmission VARCHAR(100),
    mileage BIGINT,
    price DOUBLE,
    `condition` VARCHAR(50),   -- condition is a reserved word, so use backticks
    location VARCHAR(255),
    seller_type VARCHAR(100),
    features TEXT              -- features may contain long text or JSON-like
);

-- Load the CSV file
LOAD DATA LOCAL INFILE 'C:/Users/CristiamAlbertoLoaiz/Downloads/cars.csv'
INTO TABLE cars
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
