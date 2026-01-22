SELECT
    ROUND(AVG(a2.player_id IS NOT NULL), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
) f
LEFT JOIN Activity a2
  ON a2.player_id = f.player_id
 AND a2.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY);
