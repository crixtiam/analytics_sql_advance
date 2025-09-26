WITH LoanCounts AS (
    SELECT 
        b.genre,
        COUNT(l.loan_id) AS total_loans,
        SUM(l.fines) AS total_fines
    FROM 
        loans l
        JOIN books b ON l.book_id = b.book_id
        JOIN time_dimension td ON l.loan_date_id = td.date_id
    WHERE 
        td.year = 2025
    GROUP BY 
        b.genre
)
SELECT 
    genre,
    total_loans,
    total_fines,
    ROUND((total_loans / SUM(total_loans) OVER ()) * 100, 2) AS percentage_of_total
FROM 
    LoanCounts
ORDER BY 
    total_loans DESC;