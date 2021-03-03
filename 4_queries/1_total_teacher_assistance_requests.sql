SELECT  COUNT(assistance_requests.*) as total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON assistance_requests.teacher_id = teachers.id
JOIN students ON assistance_requests.student_id = students.id
GROUP BY teachers.name 
HAVING teachers.name = 'Waylon Boehm';
