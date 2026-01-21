-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT c.customer_id, COUNT(c.visit_id) AS count_no_trans
FROM Visits c
LEFT JOIN Transactions t
ON c.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY c.customer_id
