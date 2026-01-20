-- 1378. Replace Employee ID With The Unique Identifier
SELECT uni.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI uni
ON e.id = uni.id
