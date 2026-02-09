SELECT
  t.request_at AS Day,
  ROUND(
    SUM(CASE WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)
    / COUNT(*),
    2
  ) AS `Cancellation Rate`
FROM Trips t
JOIN Users c
  ON c.users_id = t.client_id
JOIN Users d
  ON d.users_id = t.driver_id
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
  AND c.banned = 'No'
  AND d.banned = 'No'
GROUP BY t.request_at;
