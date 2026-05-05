# Write your MySQL query statement below
WITH FreeTrial AS (
    SELECT 
        user_id,
        ROUND(AVG(activity_duration), 2) AS trial_avg_duration
    FROM UserActivity
    WHERE activity_type = 'free_trial'
    GROUP BY user_id
),
Paid AS (
    SELECT 
        user_id,
        ROUND(AVG(activity_duration), 2) AS paid_avg_duration
    FROM UserActivity
    WHERE activity_type = 'paid'
    GROUP BY user_id
)
SELECT 
    f.user_id,
    f.trial_avg_duration,
    p.paid_avg_duration
FROM FreeTrial f
INNER JOIN Paid p USING (user_id)
ORDER BY user_id ASC;
