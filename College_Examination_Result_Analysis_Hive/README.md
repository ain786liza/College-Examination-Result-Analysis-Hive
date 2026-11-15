# College Examination Result Analysis Using Apache Hive

## 1. Project overview
This mini project uses Apache Hadoop and Apache Hive to store and analyse college examination marks. It demonstrates how a large result dataset can be queried using HiveQL instead of writing low-level MapReduce programs.

**Dataset:** `data/exam_results.csv` (synthetic demonstration data; 10 students × 3 subjects = 30 records).

## 2. Objectives
- Store examination records in a Hive table.
- Calculate student totals, percentages, grades and pass/fail status.
- Identify toppers and subject-wise performance.
- Compare department performance.
- Find students who need academic support.

## 3. Requirements
- Linux environment (or a Hadoop-enabled virtual machine)
- Java compatible with your Hadoop installation
- Hadoop 3.x with HDFS and YARN
- Apache Hive 4.x / Beeline
- A running Hive service / configured HiveServer2 if using Beeline

The commands below assume the shell prompt is your Hadoop user and Hive is already configured.

## 4. Project files
- `data/exam_results.csv` — sample dataset
- `hive/01_create_database_tables.hql` — database and raw table
- `hive/02_analysis_queries.hql` — analysis queries
- `hive/03_optional_managed_table.hql` — optional managed-table workflow
- `docs/project_report.md` — report content and explanation
- `docs/presentation_outline.md` — slide outline
- `run_project.sh` — HDFS upload and Beeline execution example

## 5. Run the project

### Step A — Start Hadoop
```bash
start-dfs.sh
start-yarn.sh
jps
```
Confirm that NameNode, DataNode, ResourceManager and NodeManager are running.

### Step B — Put CSV into HDFS
From the project root:
```bash
hdfs dfs -mkdir -p /user/$USER/college_exam/input
hdfs dfs -put -f data/exam_results.csv /user/$USER/college_exam/input/
hdfs dfs -ls /user/$USER/college_exam/input
```

### Step C — Create database and table
Open Beeline (use the connection URL configured in your lab):
```bash
beeline -u 'jdbc:hive2://localhost:10000/default'
```
Then run:
```sql
!run hive/01_create_database_tables.hql
```
If `!run` does not work in your Beeline version, paste the SQL statements from that file into Beeline. The table location is the HDFS directory `/user/<your-user>/college_exam/input/`.

**Important:** Replace `<your-user>` in the HQL location with your actual Linux/Hadoop username. The supplied script uses the path `/user/hdoop/college_exam/input/` as an example; change it if your username differs.

### Step D — Run analysis
```sql
!run hive/02_analysis_queries.hql
```
Run one query at a time if your Beeline client does not support script execution. Each query is labelled in the file.

## 6. Pass rule and grading used
For this demonstration, a student passes a subject when marks are at least 40% of the maximum marks. Grades are:
- A: 85% and above
- B: 70% to below 85%
- C: 50% to below 70%
- D: 40% to below 50%
- F: below 40%

These are project assumptions, not an official college grading policy. Change the thresholds to match your college rules.

## 7. Expected learning outcomes
You will practise HDFS file upload, Hive database/table creation, CSV storage, HiveQL aggregation, filtering, grouping, sorting and conditional expressions.

## 8. Notes
- The names and marks are fictional sample data. Replace them with authorised, anonymised college data for a real analysis.
- Do not publish student personal information.
- This is an academic demonstration, not an official result-processing system.
