-- 02_analysis_queries.hql
USE college_exam;

-- Q1. Total number of student-subject records
SELECT COUNT(*) AS total_records FROM exam_results;

-- Q2. Total, percentage and result for every student
WITH student_totals AS (
    SELECT student_id, student_name, department, semester, exam_year,
           SUM(marks_obtained) AS total_marks,
           SUM(max_marks) AS total_max_marks,
           ROUND(100.0 * SUM(marks_obtained) / SUM(max_marks), 2) AS percentage,
           SUM(CASE WHEN marks_obtained * 100.0 / max_marks < 40 THEN 1 ELSE 0 END) AS failed_subjects
    FROM exam_results
    GROUP BY student_id, student_name, department, semester, exam_year
)
SELECT student_id, student_name, department, total_marks, total_max_marks,
       percentage,
       CASE WHEN failed_subjects = 0 THEN 'PASS' ELSE 'FAIL' END AS overall_result
FROM student_totals
ORDER BY percentage DESC;

-- Q3. Top 5 students by percentage
SELECT student_id, student_name, department,
       ROUND(100.0 * SUM(marks_obtained) / SUM(max_marks), 2) AS percentage
FROM exam_results
GROUP BY student_id, student_name, department
ORDER BY percentage DESC
LIMIT 5;

-- Q4. Subject-wise average and highest marks
SELECT subject,
       ROUND(AVG(marks_obtained), 2) AS average_marks,
       MAX(marks_obtained) AS highest_marks,
       MIN(marks_obtained) AS lowest_marks
FROM exam_results
GROUP BY subject
ORDER BY average_marks DESC;

-- Q5. Department-wise average percentage
SELECT department,
       ROUND(100.0 * SUM(marks_obtained) / SUM(max_marks), 2) AS average_percentage
FROM exam_results
GROUP BY department
ORDER BY average_percentage DESC;

-- Q6. Pass and fail counts by subject (40% pass threshold)
SELECT subject,
       SUM(CASE WHEN marks_obtained * 100.0 / max_marks >= 40 THEN 1 ELSE 0 END) AS pass_count,
       SUM(CASE WHEN marks_obtained * 100.0 / max_marks < 40 THEN 1 ELSE 0 END) AS fail_count
FROM exam_results
GROUP BY subject
ORDER BY subject;

-- Q7. Students who failed at least one subject
SELECT student_id, student_name, department,
       SUM(CASE WHEN marks_obtained * 100.0 / max_marks < 40 THEN 1 ELSE 0 END) AS failed_subjects
FROM exam_results
GROUP BY student_id, student_name, department
HAVING SUM(CASE WHEN marks_obtained * 100.0 / max_marks < 40 THEN 1 ELSE 0 END) > 0
ORDER BY failed_subjects DESC, student_name;

-- Q8. Grade distribution by subject
SELECT subject,
       CASE
         WHEN marks_obtained * 100.0 / max_marks >= 85 THEN 'A'
         WHEN marks_obtained * 100.0 / max_marks >= 70 THEN 'B'
         WHEN marks_obtained * 100.0 / max_marks >= 50 THEN 'C'
         WHEN marks_obtained * 100.0 / max_marks >= 40 THEN 'D'
         ELSE 'F'
       END AS grade,
       COUNT(*) AS students
FROM exam_results
GROUP BY subject,
       CASE
         WHEN marks_obtained * 100.0 / max_marks >= 85 THEN 'A'
         WHEN marks_obtained * 100.0 / max_marks >= 70 THEN 'B'
         WHEN marks_obtained * 100.0 / max_marks >= 50 THEN 'C'
         WHEN marks_obtained * 100.0 / max_marks >= 40 THEN 'D'
         ELSE 'F'
       END
ORDER BY subject, grade;

-- Q9. Student marks in each subject (pivot-like report)
SELECT student_id, student_name,
       MAX(CASE WHEN subject = 'Mathematics' THEN marks_obtained END) AS mathematics,
       MAX(CASE WHEN subject = 'Programming' THEN marks_obtained END) AS programming,
       MAX(CASE WHEN subject = 'Database' THEN marks_obtained END) AS database
FROM exam_results
GROUP BY student_id, student_name
ORDER BY student_id;

-- Q10. Subject with lowest average marks
SELECT subject, ROUND(AVG(marks_obtained), 2) AS average_marks
FROM exam_results
GROUP BY subject
ORDER BY average_marks ASC
LIMIT 1;
