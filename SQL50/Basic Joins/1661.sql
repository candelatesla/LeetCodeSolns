--1661. Average Time of Process per Machine
SELECT w1.machine_id, ROUND(AVG(w2.timestamp - w1.timestamp),3) AS processing_time
FROM Activity w1
INNER JOIN Activity w2
ON w1.machine_id = w2.machine_id
WHERE w1.activity_type = "start" AND w2.activity_type = "end"
GROUP BY w1.machine_id
