-- Question Ambiguous 

SELECT 
    s.product_id, 
    f.first_year, 
    s.quantity AS quantity,
    MAX(s.price) AS price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) f
    ON s.product_id = f.product_id
    AND s.year = f.first_year
GROUP BY s.product_id, f.first_year;
