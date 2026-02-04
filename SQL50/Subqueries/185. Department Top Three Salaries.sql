WITH Ranked_Employees AS (
    SELECT 
        name AS employee_name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId 
            ORDER BY salary DESC
        ) as salary_rank
    FROM Employee
)

SELECT 
    d.name AS Department,
    r.employee_name AS Employee,
    r.salary AS Salary
FROM Ranked_Employees r
INNER JOIN Department d 
    ON r.departmentId = d.id
WHERE r.salary_rank <= 3;
