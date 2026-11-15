-- 01_create_database_tables.hql
-- Change hdoop in LOCATION if your HDFS username is different.

CREATE DATABASE IF NOT EXISTS college_exam;
USE college_exam;

DROP TABLE IF EXISTS exam_results;

CREATE EXTERNAL TABLE exam_results (
    student_id STRING,
    student_name STRING,
    department STRING,
    semester STRING,
    exam_year INT,
    subject STRING,
    marks_obtained INT,
    max_marks INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/hdoop/college_exam/input'
TBLPROPERTIES ('skip.header.line.count'='1');

-- Verify that the CSV was loaded correctly.
SELECT * FROM exam_results LIMIT 10;
SELECT COUNT(*) AS total_subject_records FROM exam_results;
