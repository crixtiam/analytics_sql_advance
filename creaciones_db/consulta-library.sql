USE library_management;


SELECT 
    b.genre,
    COUNT(l.loan_id) AS total_loans
FROM 
    loans l
    JOIN books b ON l.book_id = b.book_id
WHERE 
    YEAR(l.loan_date) = 2025
GROUP BY 
    b.genre;
    