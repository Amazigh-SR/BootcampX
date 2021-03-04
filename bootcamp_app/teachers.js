const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

const userInput = process.argv.slice(2);
console.log(userInput);

pool
  .query(
    `
    SELECT teachers.name as teacher, cohorts.name as cohort
    FROM teachers
    JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON cohorts.id = students.cohort_id
    WHERE cohorts.name = '${userInput[0]}'
    GROUP BY teachers.name, cohorts.name
    ORDER BY teachers.name;
`
  )
  .then((res) => {
    // console.log(res.rows);
    res.rows.forEach((user) => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
  })
  .catch((err) => console.log(err));
