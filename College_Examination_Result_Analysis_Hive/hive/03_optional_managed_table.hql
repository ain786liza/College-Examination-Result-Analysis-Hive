-- 03_optional_managed_table.hql
-- Optional: demonstrates creating a managed Hive table from the external table.
USE college_exam;

DROP TABLE IF EXISTS exam_results_managed;

CREATE TABLE exam_results_managed
STORED AS ORC
AS
SELECT student_id, student_name, department, semester, exam_year,
       subject, marks_obtained, max_marks
FROM exam_results;

DESCRIBE FORMATTED exam_results_managed;
SELECT COUNT(*) FROM exam_results_managed;
