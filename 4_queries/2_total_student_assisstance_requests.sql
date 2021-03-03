SELECT students.name, COUNT(assistance_requests.*)
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
WHERE name = 'Elliot Dickinson'
GROUP BY students.name;
