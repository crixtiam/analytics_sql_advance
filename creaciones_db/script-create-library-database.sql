-- Create the database
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Create table for authors
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

-- Create table for books
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    publication_year INT,
    isbn VARCHAR(13) UNIQUE,
    genre VARCHAR(50),
    copies_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create table for borrowers
CREATE TABLE IF NOT EXISTS borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    join_date DATE
);

-- Create table for loans
CREATE TABLE IF NOT EXISTS loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    due_date DATE NOT NULL,
    status ENUM('borrowed', 'returned', 'overdue') DEFAULT 'borrowed',
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Insert sample data into authors
INSERT INTO authors (first_name, last_name, birth_year, nationality) VALUES
('J.K.', 'Rowling', 1965, 'British'),
('George', 'Orwell', 1903, 'British'),
('Jane', 'Austen', 1775, 'British'),
('Gabriel', 'García Márquez', 1927, 'Colombian'),
('Agatha', 'Christie', 1890, 'British'),
('Haruki', 'Murakami', 1949, 'Japanese'),
('Toni', 'Morrison', 1931, 'American'),
('Isaac', 'Asimov', 1920, 'American'),
('Chinua', 'Achebe', 1930, 'Nigerian'),
('Virginia', 'Woolf', 1882, 'British');

-- Insert sample data into books
INSERT INTO books (title, author_id, publication_year, isbn, genre, copies_available) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 1997, '9780747532699', 'Fantasy', 3),
('1984', 2, 1949, '9780451524935', 'Dystopian', 2),
('Pride and Prejudice', 3, 1813, '9780141439518', 'Romance', 4),
('One Hundred Years of Solitude', 4, 1967, '9780060883287', 'Magical Realism', 2),
('Murder on the Orient Express', 5, 1934, '9780062693662', 'Mystery', 3),
('Norwegian Wood', 6, 1987, '9780375704024', 'Literary Fiction', 1),
('Beloved', 7, 1987, '9781400033416', 'Historical Fiction', 2),
('Foundation', 8, 1951, '9780553293357', 'Science Fiction', 3),
('Things Fall Apart', 9, 1958, '9780385474542', 'Literary Fiction', 2),
('Mrs Dalloway', 10, 1925, '9780156628709', 'Modernist', 1),
('Harry Potter and the Chamber of Secrets', 1, 1998, '9780747538493', 'Fantasy', 2),
('Animal Farm', 2, 1945, '9780451526342', 'Dystopian', 3),
('Sense and Sensibility', 3, 1811, '9780141439662', 'Romance', 2),
('Love in the Time of Cholera', 4, 1985, '9780307389732', 'Romance', 1),
('And Then There Were None', 5, 1939, '9780062073488', 'Mystery', 2);

-- Insert sample data into borrowers
INSERT INTO borrowers (first_name, last_name, email, phone, join_date) VALUES
('Alice', 'Smith', 'alice.smith@email.com', '555-0101', '2023-01-15'),
('Bob', 'Johnson', 'bob.johnson@email.com', '555-0102', '2023-02-20'),
('Clara', 'Williams', 'clara.w@email.com', '555-0103', '2023-03-10'),
('David', 'Brown', 'david.brown@email.com', '555-0104', '2023-04-05'),
('Emma', 'Davis', 'emma.davis@email.com', '555-0105', '2023-05-12'),
('Frank', 'Wilson', 'frank.w@email.com', '555-0106', '2023-06-18'),
('Grace', 'Lee', 'grace.lee@email.com', '555-0107', '2023-07-22'),
('Henry', 'Moore', 'henry.moore@email.com', '555-0108', '2023-08-30');

-- Insert sample data into loans
INSERT INTO loans (book_id, borrower_id, loan_date, return_date, due_date, status) VALUES
(1, 1, '2025-07-01', NULL, '2025-08-01', 'borrowed'),
(2, 2, '2025-06-15', '2025-07-10', '2025-07-15', 'returned'),
(3, 3, '2025-07-20', NULL, '2025-08-20', 'borrowed'),
(4, 4, '2025-06-01', '2025-07-01', '2025-07-01', 'returned'),
(5, 5, '2025-08-01', NULL, '2025-09-01', 'borrowed'),
(6, 6, '2025-07-15', NULL, '2025-08-15', 'borrowed'),
(7, 7, '2025-06-10', '2025-07-05', '2025-07-10', 'returned'),
(8, 8, '2025-08-10', NULL, '2025-09-10', 'borrowed'),
(9, 1, '2025-07-05', NULL, '2025-08-05', 'borrowed'),
(10, 2, '2025-08-15', NULL, '2025-09-15', 'borrowed');

-- Create indexes for performance
CREATE INDEX idx_isbn ON books(isbn);
CREATE INDEX idx_email ON borrowers(email);
CREATE INDEX idx_loan_dates ON loans(loan_date, due_date);