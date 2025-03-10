SELECT AVG(total_assistance_time) as avg_total_duration FROM
(SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_assistance_time
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_assistance_time) as cohort_total_ass_time;