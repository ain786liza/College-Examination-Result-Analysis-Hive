# Project Report: College Examination Result Analysis Using Apache Hive

## Abstract
The project analyses college examination marks using Apache Hive, a data-warehouse system built on Hadoop. Examination records are stored as a CSV file in HDFS and exposed through an external Hive table. HiveQL queries calculate student percentages, pass/fail status, toppers, subject averages, department performance and grade distributions. The project illustrates how SQL-like analysis can be performed over distributed data.

## 1. Introduction
Colleges generate examination data for many students, semesters and subjects. Manually calculating totals and identifying weak subjects can be time-consuming. Apache Hive provides a SQL-like interface called HiveQL for querying data stored in Hadoop.

## 2. Problem statement
To build a simple data-analysis system that stores examination marks and produces useful academic summaries, including student-wise results, subject-wise performance and department-wise comparisons.

## 3. Objectives
1. Store result records in HDFS.
2. Create a Hive database and external table.
3. Calculate total marks and percentage for each student.
4. classify students as pass or fail using a stated threshold.
5. Identify toppers and low-performing subjects.
6. Compare average performance across departments.

## 4. Software and hardware requirements
**Software:** Linux, Java, Hadoop 3.x, Apache Hive 4.x, Beeline, HDFS.

**Hardware:** A computer or virtual machine capable of running the configured Hadoop/Hive environment. Requirements depend on the local installation and dataset size.

## 5. Dataset description
The included sample file contains 30 subject-mark records for 10 fictional students across CSE, ECE and DS departments. Fields are student_id, student_name, department, semester, exam_year, subject, marks_obtained and max_marks. The sample is synthetic and should be replaced with anonymised, authorised data for a real deployment.

## 6. Methodology
1. Prepare the CSV dataset with a header row.
2. Upload the CSV file to HDFS.
3. Create the `college_exam` database.
4. Create an external table with comma-delimited fields and skip the header row.
5. Execute HiveQL queries for aggregation, filtering, sorting and conditional classification.
6. Interpret the query outputs.

## 7. System architecture
```text
CSV examination dataset
          |
          v
     HDFS storage
          |
          v
 Apache Hive external table
          |
          v
       HiveQL
          |
          v
 Student / Subject / Department reports
```

## 8. Main analysis
- Student-wise total marks and percentage.
- Overall PASS/FAIL: PASS only when every subject score is at least 40%.
- Top five students by percentage.
- Subject-wise average, maximum and minimum marks.
- Department-wise average percentage.
- Subject pass/fail counts.
- Students requiring academic support.
- Grade distribution and subject-wise marks summary.

## 9. Sample findings from the included demonstration data
- There are 10 students and 30 subject records.
- The highest overall percentage belongs to Vivaan (96.00%).
- Diya has an overall percentage of 92.00%.
- Mathematics has an average of 67.10 marks.
- Programming has an average of 72.80 marks.
- Database has an average of 69.10 marks.
- Rohan and Meera have at least one subject below the 40% pass threshold.

These findings describe only the fictional sample dataset, not any real college.

## 10. Advantages
- Familiar SQL-like syntax.
- Suitable for analysing large datasets stored in HDFS.
- Aggregations and grouping simplify result summaries.
- External tables can query files without importing them into Hive-managed storage.

## 11. Limitations
- The sample dataset is small and synthetic.
- Hive is designed for batch analytics, not instant transaction processing.
- The project does not include authentication, role-based access or a graphical dashboard.
- Grading thresholds must be configured to match official college regulations.

## 12. Future enhancements
- Add semester-wise and year-wise comparisons.
- Build a dashboard using Python/Streamlit or a BI tool.
- Add attendance and internal assessment data.
- Use anonymised student identifiers and access controls.
- Schedule periodic data ingestion and report generation.

## 13. Conclusion
The project demonstrates how Apache Hive can analyse college examination data using HiveQL. It produces student, subject and department summaries that can help academic staff identify performance patterns and students who may need support.

## 14. Viva questions
1. What is Apache Hive?
2. What is HiveQL?
3. What is the role of HDFS?
4. What is an external table in Hive?
5. What is the difference between managed and external tables?
6. Why is `skip.header.line.count` used?
7. What is the purpose of `GROUP BY`?
8. Why do we use `SUM`, `AVG`, `MAX` and `MIN`?
9. What is the difference between `WHERE` and `HAVING`?
10. Why is Hive suitable for batch analysis of large datasets?
