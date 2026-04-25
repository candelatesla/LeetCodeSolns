# Write your MySQL query statement below
SELECT u.name, COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM USERS u
LEFT JOIN Rides r
ON u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance DESC, name ASC
