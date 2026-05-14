# Write your MySQL query statement below
WITH week_meeting_hours AS (
    SELECT
        employee_id,
        YEAR(meeting_date - INTERVAL (WEEKDAY(meeting_date)) DAY) AS yr,
        WEEK(meeting_date, 3)                                      AS iso_week,
        SUM(duration_hours)                                        AS hours
    FROM meetings
    GROUP BY employee_id, yr, iso_week
),
heavy_weeks AS (
    SELECT
        w.employee_id,
        e.employee_name,
        e.department,
        COUNT(*) AS meeting_heavy_weeks
    FROM week_meeting_hours w
    JOIN employees e USING (employee_id)
    WHERE hours > 20
    GROUP BY w.employee_id, e.employee_name, e.department
)
SELECT
    employee_id,
    employee_name,
    department,
    meeting_heavy_weeks
FROM heavy_weeks
WHERE meeting_heavy_weeks >= 2
ORDER BY meeting_heavy_weeks DESC, employee_name ASC;
