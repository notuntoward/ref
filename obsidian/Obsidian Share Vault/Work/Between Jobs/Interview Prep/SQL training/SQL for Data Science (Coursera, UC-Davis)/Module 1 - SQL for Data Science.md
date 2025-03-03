---
created date: 2025-01-08T13:50:51-08:00
modified date: 2025-03-02T21:34:23-08:00
---

Getting Started and Selecting & Retrieving Data with SQL
# SQL Command Reference
- **By Purpose**: [[SQLTutorial25sqlCheatSheet|SQTutorial25: SQL Cheat Sheet in PDF]] 
- **Alphabetical**: [[W3schools25sqlQuickReference|W3schools25: SQL Quick Reference]] 
- **Concise: [from OpenAI](https://chatgpt.com/share/67c266e4-425c-8005-8b49-e69ae741460f)** (I fixed truncation in select)

| **Command**       | **Description**                                                                                                                                                                                     |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SELECT`          | Retrieves data from one or more tables. **Syntax:** `SELECT [DISTINCT] column1, column2, ... FROM table_name [WHERE condition] [GROUP BY column] [HAVING condition] [ORDER BY column ASC <br>[DESC] |
| `INSERT`          | Adds new rows to a table. **Syntax:** `INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);`                                                                                |
| `UPDATE`          | Modifies existing rows in a table. **Syntax:** `UP
| `DELETE`          | Removes rows from a table. **Syntax:** `DELETE FROM table_name [WHERE condition];`                                                                                                                  |
| `CREATE TABLE`    | Creates a new table. **Syntax:** `CREATE TABLE table_name (column1 datatype [constraints], column2 datatype [constraints], ...);`                                                                   |
| `ALTER TABLE`     | Modifies an existing table's structure. **Syntax:** `ALTER TABLE table_name ADD column_name datatype;` **Or:** `ALTER TABLE table_name DROP COLUMN column_name;`                                    |
| `DROP TABLE`      | Deletes a table and its data. **Syntax:** `DROP TABLE table_name;`                                                                                                                                  |
| `CREATE DATABASE` | Creates a new database. **Syntax:** `CREATE DATABASE database_name;`                                                                                                                                |
| `DROP DATABASE`   | Deletes a database and its data. **Syntax:** `DROP DATABASE database_name;`                                                                                                                         |
| `CREATE INDEX`    | Creates an index on a table's column(s) to improve query performance. **Syntax:** `CREATE [UNIQUE] INDEX index_name ON table_name (column1, column2, ...);`                                         |
| `DROP INDEX`      | Removes an index from the database. **Syntax:** `DROP INDEX index_name;`                                                                                                                            |
| `CREATE VIEW`     | Creates a virtual table based on the result set of a SELECT statement. **Syntax:** `CREATE VIEW view_name AS SELECT column1, column2, ... FROM table_name WHERE condition;`                         |
| `DROP VIEW`       | Deletes a view. **Syntax:** `DROP VIEW view_name;`                                                                                                                                                  |
| `GRANT`           | Assigns privileges to users. **Syntax:** `GRANT privilege_name ON object_name TO user_name;`                                                                                                        |
| `REVOKE`          | Removes privileges from users. **Syntax:** `REVOKE privilege_name ON object_name FROM user_name;`                                                                                                   |
| `COMMIT`          | Saves all transactions to the database. **Syntax:** `COMMIT;`                                                                                                                                       |
| `ROLLBACK`        | Undoes transactions that have not yet been committed. **Syntax:** `ROLLBACK;`                                                                                                                       |
| `SAVEPOINT`       | Sets a point within a transaction to which you can later roll back. **Syntax:** `SAVEPOINT savepoint_name;`                                                                                         |
| `TRANSACTION`     | Begins a new transaction. **Syntax:** `BEGIN TRANSACTION;`                                                                                                                                          |

This table provides a high-level overview of essential SQL commands and their general syntax. For more detailed information and additional commands, consider consulting comprehensive SQL references such as the [SQL Quick Reference by W3Schools](https://www.w3schools.com/sql/sql_quickref.asp) or the [SQL Cheat Sheet by SQL Tutorial](https://www.sqltutorial.org/sql-cheat-sheet/).

## Order of Basic Clauses
SELECT column1, column2, ...
FROM table_name
WHERE condition
GROUP BY column1
HAVING condition
ORDER BY column1 ASC/DESC;
### Citations:

1. [https://www.manpagez.com/man/3/SQL::Statement::Syntax/](https://www.manpagez.com/man/3/SQL::Statement::Syntax/)
2. [https://learn.microsoft.com/en-us/azure/databricks/sql/language-manual/sql-ref-syntax-qry-select-table-reference](https://learn.microsoft.com/en-us/azure/databricks/sql/language-manual/sql-ref-syntax-qry-select-table-reference)
3. [https://phoenixnap.com/kb/linux-man](https://phoenixnap.com/kb/linux-man)
4. [https://man.cx/mdb-sql(1)](https://man.cx/mdb-sql\(1\))
5. [https://www.w3schools.com/sql/sql_quickref.asp](https://www.w3schools.com/sql/sql_quickref.asp)
6. [https://www.postgresql.org/docs/current/app-psql.html](https://www.postgresql.org/docs/current/app-psql.html)
7. [https://docs.oracle.com/cd/E86824_01/html/E54763/sql-1.html](https://docs.oracle.com/cd/E86824_01/html/E54763/sql-1.html)
8. [https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax](https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax)
9. [https://dev.mysql.com/doc/en/mysql.html](https://dev.mysql.com/doc/en/mysql.html)
**Module 1 of Coursera / UCD Davis SQL Class Notes** (Lawrence22dataScienceSQLcourse)
From: [Coursera | Online Courses & Credentials From Top Educators. Join for Free | Coursera](https://www.coursera.org/learn/sql-for-data-science/home/module/1)

# My Observations
## Three condition keyword
From: [[SQLTutorial25sqlCheatSheet|SQLTutorial25sqlCheatSheet]]

| clause             | Condition Keyword | Example                                                           | Why                                                                                                                                          |
| ------------------- | ----------------- | ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| **SELECT**          | **WHERE**         | SELECT c1, c2 FROM t **WHERE** condition;                         |                                                                                                                                              |
| SELECT... **GROUP** | **HAVING**        | SELECT c1, aggregate(c2) FROM t GROUP BY c1 **HAVING** condition; | [here?](<Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/Module 2 - SQL for Data Science.md#^753q >) |
| SELECT... **JOIN**  | **ON**            | SELECT c1, c2 FROM t1 INNER JOIN t2 **ON** condition;             |                                                                                                                                              |
## When col doesn't it have to be in the SELECT statement
- ORDER BY ([here](<Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/Module 2 - SQL for Data Science.md#^xe1t >))
- columns affected in aggregations (not the GROUP BY PART) ([here](<Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/Module 2 - SQL for Data Science.md#^o3u3 >))
# Video Notes (Module 1)

## ECR Diagrams
From: [Data Models, Part 3: Relational vs. Transactional Models - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/HRlau/data-models-part-3-relational-vs-transactional-models)
![[Pasted image 20250108135414.webp|0x0]]
## [SELECT col FROM table] : How to get data
From: [Retrieving Data with a SELECT Statement - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/oN0Ks/retrieving-data-with-a-select-statement) 
### All Columns
![[Pasted image 20250108140738.webp|552|610x259]]

OR:

![[Pasted image 20250108140810.webp|154|208x65]]

### Named Columns 
![[Pasted image 20250108140518.webp|308|524x386]]

### [LIMIT maxrows] : Limiting num rows to get, like Pandas .head()
![[Pasted image 20250108141023.webp|569]]

## [CREATE TABLE table] : Creating Tables
From: [Creating Tables - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/kuYRl/creating-tables)

### Declaring a new table
![[Pasted image 20250108142010.webp|375|491x280]]
- key can't have NULLs
- [ ] ? Varchar(): is this case sensitive?
### [INSERT INTO table VALUES vals] putting data into a table
#### Insert with Unnamed vs. Named Columns

![[Pasted image 20250108142755.webp|623]]

## Temporary Table
From: [Creating Temporary Tables - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/3fVNc/creating-temporary-tables)

- faster than real table
- simplifies queries
- can't write to the temp table (at least for sqlite)

### Declaring temp table

**SQLite declaration**
![[Pasted image 20250110151359.webp|249|0x0]]

**Fancy Syntax, depends upon the SQL dialect (this is SQLite)**
![[Pasted image 20250110151515.webp|390|587x295]]

### Temp Tables: suggested thing to look up

- updating temp tables
- deleting a temp table
## Comments in SQL
From: [Adding Comments to SQL - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/akd1V/adding-comments-to-sql)

**Dashes or c-style comments**
![[Pasted image 20250110152911.webp|667|915x234]]

## Practice 1
From: [Coursera | Online Courses & Credentials From Top Educators. Join for Free | Coursera](https://www.coursera.org/learn/sql-for-data-science/assignment-submission/saQci/practice-simple-select-queries)
It was too easy: 100%

# Reading: SQL Overview (Module 1)

## What is SQL and how is it used?

### What is SQL?

Structured query language (SQL) is a programming language for storing and processing information in a relational database. A relational database stores information in tabular form, with rows and columns representing different data attributes and the various relationships between the data values. You can use SQL statements to store, update, remove, search, and retrieve information from the database. You can also use SQL to maintain and optimize database performance.

### Why is SQL important?

Structured query language (SQL) is a popular query language that is frequently used in all types of applications. Data analysts and developers learn and use SQL because it integrates well with different programming languages. For example, they can embed SQL queries with the Java programming language to build high-performing data processing applications with major [SQL database systems](https://aws.amazon.com/what-is/sql-database/) such as Oracle or MS SQL Server. SQL is also fairly easy to learn as it uses common English keywords in its statements

#### **History of SQL**

SQL was invented in the 1970s based on the relational data model. It was initially known as the structured English query language (SEQUEL). The term was later shortened to SQL. Oracle, formerly known as Relational Software, became the first vendor to offer a commercial SQL relational database management system.

### What are the components of a SQL system?

Relational database management systems use structured query language (SQL) to store and manage data. The system stores multiple database tables that relate to each other. MS SQL Server, MySQL, or MS Access are examples of relational database management systems. The following are the components of such a system. 

#### **SQL table**

A SQL table is the basic element of a relational database. The SQL database table consists of rows and columns. Database engineers create relationships between multiple database tables to optimize data storage space.

For example, the database engineer creates a SQL table for products in a store: 

|   |   |   |
|---|---|---|
|**Product ID**|**Product Name**|**Color ID**|
|0001|Mattress|Color 1|
|0002|Pillow|Color 2|

Then the database engineer links the product table to the color table with the _Color ID:_

|   |   |
|---|---|
|**Color ID**|**Color Name**|
|Color 1|Blue|
|Color 2|Red|

#### **SQL statements**

SQL statements, or SQL queries, are valid instructions that relational database management systems understand. Software developers build SQL statements by using different SQL language elements. SQL language elements are components such as identifiers, variables, and search conditions that form a correct SQL statement.

For example, the following SQL statement uses a SQL INSERT clause to store _Mattress Brand A,_ priced _$499,_ into a table named _Mattress_table,_ with column names _brand_name_ and _cost:_

INSERT INTO _Mattress_table (brand_name, cost)_

VALUES(‘A’,’499’);

#### **Stored procedures**

Stored procedures are a collection of one or more SQL statements stored in the relational database. Software developers use stored procedures to improve efficiency and performance. For example, they can create a stored procedure for updating sales tables instead of writing the same SQL statement in different applications. 

### How does SQL work?

Structured query language (SQL) implementation involves a server machine that processes the database queries and returns the results. The SQL process goes through several software components, including the following. 

#### **Parser**

The parser starts by tokenizing, or replacing, some of the words in the SQL statement with special symbols. It then checks the statement for the following:

##### ****_Correctness_****

The parser verifies that the SQL statement conforms to SQL semantics, or rules, that ensure the correctness of the query statement. For example, the parser checks if the SQL clause ends with a semi-colon. If the semi-colon is missing, the parser returns an error.

##### ****_Authorization_****

The parser also validates that the user running the query has the necessary authorization to manipulate the respective data. For example, only admin users might have the right to delete data. 

#### **Relational engine**

The relational engine, or query processor, creates a plan for retrieving, writing, or updating the corresponding data in the most effective manner. For example, it checks for similar queries, reuses previous data manipulation methods, or creates a new one. It writes the plan in an intermediate-level representation of the SQL statement called byte code. Relational databases use byte code to efficiently perform database searches and modifications. 

#### **Storage engine**

The storage engine, or database engine, is the software component that processes the byte code and runs the intended SQL statement. It reads and stores the data in the database files on physical disk storage. Upon completion, the storage engine returns the result to the requesting application.

### What are SQL clauses?

Structured query language (SQL) clauses are specific keywords or SQL statements that developers use to manipulate the data stored in a relational database. You can categorize SQL clauses as follows.

#### **Data definition language** 

Data definition language (DDL) refers to SQL clauses that design the database structure. Database engineers use DDL to create and modify database objects based on the business requirements. For example, the database engineer uses the CREATE clause to create database objects such as tables, views, and indexes.

#### **Data query language**

Data query language (DQL) consists of instructions for retrieving data stored in relational databases. Software applications use the SELECT clause to filter and return specific results from a SQL table. 

#### **Data manipulation language**

Data manipulation language (DML) statements write new information or modify existing records in a relational database. For example, an application uses the INSERT clause to store a new record in the database.

#### **Data control language**

Database administrators use data control language (DCL) to manage or authorize database access for other users. For example, they can use the GRANT clause to permit certain applications to manipulate one or more tables. 

#### **Transaction control language**

The relational engine uses transaction control language (TCL) to automatically make database changes. For example, the database uses the ROLLBACK clause to undo an erroneous transaction. 

### What are SQL standards?

SQL standards are a set of formally defined guidelines of the structured query language (SQL). The American National Standards Institute (ANSI) and International Organization for Standardization (ISO) adopted the SQL standards in 1986. Software vendors use the ANSI SQL standards to build SQL database software for developers.

### What is SQL injection?

SQL injection is a cyberattack that involves tricking the database with SQL queries. Hackers use SQL injection to retrieve, modify, or corrupt data in a SQL database. For example, they might fill in a SQL query instead of a person's name in a submission form to carry out a SQL injection attack.

### What is MySQL?

MySQL is an open-source relational database management system offered by Oracle. Developers can download and use MySQL without paying a licensing fee. They can install MySQL on different operating systems or cloud servers. MySQL is a popular database system for web applications. 

#### **SQL vs. MySQL**

Structured query language (SQL) is a standard language for database creation and manipulation. MySQL is a relational database program that uses SQL queries. While SQL clauses are defined by international standards, the MySQL software undergoes continual upgrades and improvements.

### What is NoSQL?

[NoSQL](https://aws.amazon.com/nosql/) refers to non-relational databases that don't use tables to store data. Developers store information in different types of NoSQL databases, including graphs, documents, and key-values. NoSQL databases are popular for modern applications because they are horizontally scalable. Horizontal scaling means increasing the processing power by adding more computers that run NoSQL software.

#### **SQL vs. NoSQL**

Structured query language (SQL) provides a uniform data manipulation language, but NoSQL implementation is dependent on different technologies. Developers use SQL for transactional and analytical applications, whereas NoSQL is suitable for responsive, heavy-usage applications. 

### What is a SQL server?

SQL Server is the official name of Microsoft's relational database management system that manipulates data with SQL. The MS SQL Server has several editions, and each is designed for specific workloads and requirements.

### How does AWS support SQL?

[Microsoft SQL Server on AWS](https://aws.amazon.com/sql/) allows developers to run Microsoft SQL workloads on AWS. The SQL database system performs better with scalable AWS computing resources. By running MS SQL on AWS, companies achieve higher service availability because AWS has the broadest global infrastructure across 24 regions. SQL Server on AWS integrates with more than 230 security, compliance, and governance services to protect your data from external threats. Some other ways AWS supports SQL include the following:

- Customers use the [Amazon Database Migration Service](https://aws.amazon.com/dms/) to make moving SQL databases to AWS easier.
- [Amazon Elastic Block Store (EBS)](https://aws.amazon.com/ebs/) provides high-performance block storage for mission-critical SQL applications.

Get started with SQL Server on AWS by [signing up for an AWS account](https://portal.aws.amazon.com/gp/aws/developer/registration/index) today.
## NTC Hosting: Structured Query Language 

- [ ] # An SQL Reference with Tutorials:
[What is SQL, how does it work and how is it being used](https://www.ntchosting.com/encyclopedia/databases/structured-query-language/)

## SQLite Tutorial

- [ ] # Another tutorial, more to the point?:
[SQLite Tutorial - w3resource](https://www.w3resource.com/sqlite/)

## Data Modeling and ER Diagrams
From: [Coursera | Online Courses & Credentials From Top Educators. Join for Free | Coursera](https://www.coursera.org/learn/sql-for-data-science/supplement/whI45/data-modeling-and-er-diagrams)



**Lecturer recommends reviewing these**
- [x] [Norwalk Aberdeen: Entity-Relationship Diagrams (9 Minute YouTube Video)](https://www.youtube.com/watch?v=c0_9Y8QAstg)
- [x] [Star Schema vs. Snowflake Schema](https://vertabelo.com/blog/data-warehouse-modeling-star-schema-vs-snowflake-schema/)
- [x] [What is STAR Schema? (7 Minute YouTube Video)](https://www.youtube.com/watch?v=hQvCOBv_-LE): Codebasics23starSnowFlakeFactDimTbl
- [x] [Data Modeling 101](http://www.agiledata.org/essays/dataModeling101.html)
- [x] [What is Data Modeling - An Introduction for Business Analysts](http://business-analysis-excellence.com/what-is-data-modeling/) *redundant with other things to review*
- [x] [Wikipedia: Data Modeling](https://en.wikipedia.org/wiki/Data_modeling)  *long and historical so skip since I'm in a hurry*
## Comparing NoSQL and SQL
Recommended Reading with quiz at the end
From: [Coursera \| Online Courses & C...](https://www.coursera.org/learn/sql-for-data-science/discussionPrompt/f2Lqf/comparing-nosql-and-sql)

- [x] [NoSQL vs. SQL Databases](https://www.mongodb.com/nosql-explained/nosql-vs-sql): MongoDB25noSQLVsSQLdatabases
- [ ] [SQL vs. NoSQL: 5 Critical Differences](https://www.integrate.io/blog/the-sql-vs-nosql-difference/#:~:text=SQL%20databases%20are%20vertically%20scalable,data%20like%20documents%20or%20JSON.): Smallcombe24SQLVsNoSQLdiff5
- [ ] [SQL vs. NoSQL: The Differences Explained + When to Use Each](https://www.coursera.org/articles/nosql-vs-sql): Coursera24SQLVsNoSQLdiffExplain
- [ ] # I'm skipping 2 of 3 recommended.  Come back to this when have time

# Tests (Module 1)
- [Quiz Module 1](https://www.coursera.org/learn/sql-for-data-science/assignment-submission/dJsXm/module-1-quiz)
- Coding Questions Module 1
# Also
- [ ] **SQL video Tutorial**: [The data-driven world - SQL Vi...](https://www.linkedin.com/learning/sql-essential-training-20685933/the-data-driven-world-19067626?courseClaim=AQHbfPZU8OQDqQAAAZGzyidLfvnM3_ZvY125dkugcIQX3PVKbPHIhVAmK23J0Avr6h0zxhISwsH6zJKmiItzwrnyajos-leUgq_50LlMx-viccb8mkdpKfxM_05vu3X-N6UIqALPXyStEeU1aWvHkmsry-8hxDpCJEYR-HFxXwJRHiddCjBfPyx8JlaF-hxHNrlc2xW7HysssgdDVFQbykPzzOfcxzyhYca806nTW8oRdSvmBpm6Q-9tDI_V5CB6K8GIYTtJhdQoVf6eF-9Keo7gR0s9TAxXVMFtKFPClG4zg9AQVCYKHSL-10YAv6msFSnt_mGxCbzR1W2B8lv9q4FbIrIllSwJAfbuBUwG_abNajkZ5f1Rq6XqhRYBBdBEUXp826FoS4Y4i_PeC5PHpbt51iUR9v22u7uu3xA2zw373nKAIcH7pUXMulZcnENfpUReYbL0gLgJTMZlA1XRAxUmk39iXzq_cGEfBpEh8G0JTWCoF2lWh4UEAoNLQK-B9CQ43T_B5LpbNttYpblB5XPxoMWAYzcKs602u7UFKX5aqB5gYGbMEkNuB8lGDQNR0rP7hpqkBdYbEojhec8_QMMU9gS3pISB7CqPw-00w73sUwQUUM9ss0LRY0lazeLL6pNoiZy40YXa4hPv8r0TiwmC488g1U0zTnVQqUGU8r55SMEcd7HLWkqSsulJ073x8XZUdlFpSojR9EsADmX3QKs6FITMfRm7GL0n-LUDzx60qaeOWWlzIBgTlJYxPfojepSl5CF0x-QchMJ0lbi7ypxJkKz0WZ8N8ddZJCp6iWOt7jYwCIM_lNE7Qw0W_qzF3rac0CmiDmX5Sp_vugjNI2xUy9uD9QwjS2W_bBp35ofYnG3rHuYuOKRWUepcyGUkjVuhzFYUCZjh3Wd2G0TAb17xUldG0GdkQ35jqDiDC5J5I8s4PF4TjC9QiIAdhEmoka3dPab05xJaYJRsSwTlenPTBQ_mLaIVQ7rIe3aQ3NqFTpxVMRc-9Nxq20sO_o96jxuWTbN-UAmVnWTXSNTx4JjKpvvghep2jkKjfpDtNc9I-PKDdGWUSOC1IslmRyvzodI)