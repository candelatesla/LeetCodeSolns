WITH all_endpoints AS (
  SELECT requester_id AS id
  FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id
  FROM RequestAccepted
),
friend_counts AS (
  SELECT id, COUNT(*) AS num
  FROM all_endpoints
  GROUP BY id
)
SELECT id, num
FROM friend_counts
ORDER BY num DESC
LIMIT 1;
