#!/bin/bash
# Run from the extracted project root. Edit the HDFS username in the HQL file if needed.
set -e
hdfs dfs -mkdir -p /user/$USER/college_exam/input
hdfs dfs -put -f data/exam_results.csv /user/$USER/college_exam/input/
echo "CSV uploaded to HDFS. Open Beeline and execute:"
echo "!run hive/01_create_database_tables.hql"
echo "!run hive/02_analysis_queries.hql"
