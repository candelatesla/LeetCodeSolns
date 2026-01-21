-- 570. Managers with at Least 5 Direct Reports
SELECT m.name
FROM Employee m
JOIN Employee e
  ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;

-- Esrlier Version
# Write your MySQL query statement below
SELECT e1.name
FROM Employee e1
JOIN Employee e2
ON e1.id = e2.id
HAVING count(e1.managerId) >= 5

-- ---Your query fails because it doesn’t count direct reports at all.

-- What your query is actually doing

-- JOIN Employee e2 ON e1.id = e2.id

-- This joins each row to itself (same id), so you get one row per employee.

-- HAVING COUNT(e1.managerId) >= 5

-- COUNT(column) counts non-NULL values of that column within each group.

-- But you have no GROUP BY, so this becomes one group over the whole result set (or behaves inconsistently across SQL modes).

-- Also, e1.managerId for John is NULL, so John contributes 0 to that count.

-- Why it returns John in your run (but shouldn’t)

-- MySQL can behave oddly when you select non-aggregated columns without GROUP BY (depends on SQL mode like ONLY_FULL_GROUP_BY).

-- It may pick an arbitrary e1.name from the single aggregated group.

-- Correct logic for “5 direct reports”

-- You must count how many employees have managerId = manager.id. 
