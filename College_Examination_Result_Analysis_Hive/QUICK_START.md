# Quick command reference

```bash
start-dfs.sh
start-yarn.sh
jps

hdfs dfs -mkdir -p /user/$USER/college_exam/input
hdfs dfs -put -f data/exam_results.csv /user/$USER/college_exam/input/
hdfs dfs -ls /user/$USER/college_exam/input

beeline -u 'jdbc:hive2://localhost:10000/default'
```

Inside Beeline:
```sql
!run hive/01_create_database_tables.hql
!run hive/02_analysis_queries.hql
```

If the Beeline connection URL differs in your lab, use the URL configured by your instructor.
