
SELECT r.contest_id, ROUND(COUNT(r.contest_id)/(SELECT COUNT(user_id) FROM Users)*100,2) AS percentage
FROM Users u
JOIN Register r
ON r.user_id = u.user_id
GROUP BY  r.contest_id
ORDER BY percentage DESC, r.contest_id ASC
