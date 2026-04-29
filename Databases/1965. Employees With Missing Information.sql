# Write your MySQL query statement below
SELECT employee_id
FROM (
    SELECT employee_id FROM Employees
    UNION ALL
    SELECT employee_id FROM Salaries
) AS combined_table
GROUP BY employee_id
HAVING COUNT(employee_id) = 1
ORDER BY employee_id ASC;

# UNION ALL: We stack all employee_ids from both tables. We use UNION ALL instead of UNION because we want to see duplicates.

# GROUP BY: We group the results by the ID.

# HAVING COUNT(employee_id) = 1: This is the "magic" part.
# If an employee has both a name and a salary, their ID appears twice (once in each table), so the count is 2.
# If an employee is missing information, their ID only appears once (in only one of the tables).

# ORDER BY: Per the instructions, we sort the missing IDs in ascending order.
