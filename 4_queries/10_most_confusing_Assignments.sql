SELECT assignments.id, assignments.name, day, chapter, COUNT(assistance_requests) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;