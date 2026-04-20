# Write your MySQL query statement below
SELECT DISTINCT sp.name
FROM SalesPerson sp
LEFT JOIN Orders o
ON sp.sales_id = o.sales_id
WHERE sp.sales_id NOT IN (
    SELECT o.sales_id 
    FROM Orders o
    LEFT JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = "RED"
    GROUP BY sp.sales_id
    )
