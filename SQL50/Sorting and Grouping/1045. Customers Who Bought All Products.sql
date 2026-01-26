SELECT c.customer_id
FROM Customer c
LEFT JOIN Product p
ON c.product_key = p.product_key
GROUP BY c.customer_id
HAVING count(DISTINCT c.product_key) = (SELECT count(DISTINCT product_key) FROM Product)
