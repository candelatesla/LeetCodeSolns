WITH daily AS (
  SELECT
    visited_on,
    SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
roll AS (
  SELECT
    visited_on,
    amount,
    SUM(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS sum_7
  FROM daily
)
SELECT
  visited_on,
  sum_7 AS amount,
  ROUND(sum_7 / 7, 2) AS average_amount
FROM roll
WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY FROM daily)
ORDER BY visited_on;
