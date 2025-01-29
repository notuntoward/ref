---
created date: 2025-01-08T13:50:51-08:00
modified date: 2025-01-13T17:37:46-08:00
---

**Module 1 of Coursera / UCD Davis SQL Class Notes** (Lawrence22dataScienceSQLcourse)
From: [Coursera | Online Courses & Credentials From Top Educators. Join for Free | Coursera](https://www.coursera.org/learn/sql-for-data-science/home/module/1)
# Video Notes (Module 1)

## ECR Diagrams
From: [Data Models, Part 3: Relational vs. Transactional Models - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/HRlau/data-models-part-3-relational-vs-transactional-models)
![[Pasted image 20250108135414.webp]]
## Select
From: [Retrieving Data with a SELECT Statement - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/oN0Ks/retrieving-data-with-a-select-statement) 
### All Columns
![[__temp__Pasted image 20250108140738.webp|552]]

OR:

![[Pasted image 20250108140810.webp|154]]
### Named Columns 
![[Pasted image 20250108140518.webp|308]]

### Limiting num rows to get, like Pandas .head()
![[Pasted image 20250108141023.webp|569]]

## Creating Tables
From: [Creating Tables - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/kuYRl/creating-tables)

### Table declaration
![[Pasted image 20250108142010.webp|375]]
- key can't have NULLs
- [ ] ? Varchar(): is this case sensitive?
### Inserting data

#### Insert with Unnamed v.s. Named Columns

![[Pasted image 20250108142755.webp|623]]

## Temporary Table
From: [Creating Temporary Tables - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/3fVNc/creating-temporary-tables)

- faster than real table
- simplifies queries
- can't write to the temp table (at least for sqlite)

### Declaring temp table

**SQLite declaration**
![[__temp__Pasted image 20250110151359.webp|249]]

**Fancy Syntax, depends upon the SQL dialect (this is SQLite)**
![[__temp__Pasted image 20250110151515.webp|390]]

### Temp Tables: suggested thing to look up

- updating temp tables
- deleting a temp table
## Comments in SQL
From: [Adding Comments to SQL - Getting Started and Selecting & Retrieving Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/akd1V/adding-comments-to-sql)

**Dashes or c-style comments**
![[Pasted image 20250110152911.webp|667]]

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

For example, the following SQL statement uses a SQL INSERT command to store _Mattress Brand A,_ priced _$499,_ into a table named _Mattress_table,_ with column names _brand_name_ and _cost:_

INSERT INTO _Mattress_table (brand_name, cost)_

VALUES(‘A’,’499’);

#### **Stored procedures**

Stored procedures are a collection of one or more SQL statements stored in the relational database. Software developers use stored procedures to improve efficiency and performance. For example, they can create a stored procedure for updating sales tables instead of writing the same SQL statement in different applications. 

### How does SQL work?

Structured query language (SQL) implementation involves a server machine that processes the database queries and returns the results. The SQL process goes through several software components, including the following. 

#### **Parser**

The parser starts by tokenizing, or replacing, some of the words in the SQL statement with special symbols. It then checks the statement for the following:

##### ****_Correctness_****

The parser verifies that the SQL statement conforms to SQL semantics, or rules, that ensure the correctness of the query statement. For example, the parser checks if the SQL command ends with a semi-colon. If the semi-colon is missing, the parser returns an error.

##### ****_Authorization_****

The parser also validates that the user running the query has the necessary authorization to manipulate the respective data. For example, only admin users might have the right to delete data. 

#### **Relational engine**

The relational engine, or query processor, creates a plan for retrieving, writing, or updating the corresponding data in the most effective manner. For example, it checks for similar queries, reuses previous data manipulation methods, or creates a new one. It writes the plan in an intermediate-level representation of the SQL statement called byte code. Relational databases use byte code to efficiently perform database searches and modifications. 

#### **Storage engine**

The storage engine, or database engine, is the software component that processes the byte code and runs the intended SQL statement. It reads and stores the data in the database files on physical disk storage. Upon completion, the storage engine returns the result to the requesting application.

### What are SQL commands?

Structured query language (SQL) commands are specific keywords or SQL statements that developers use to manipulate the data stored in a relational database. You can categorize SQL commands as follows.

#### **Data definition language** 

Data definition language (DDL) refers to SQL commands that design the database structure. Database engineers use DDL to create and modify database objects based on the business requirements. For example, the database engineer uses the CREATE command to create database objects such as tables, views, and indexes.

#### **Data query language**

Data query language (DQL) consists of instructions for retrieving data stored in relational databases. Software applications use the SELECT command to filter and return specific results from a SQL table. 

#### **Data manipulation language**

Data manipulation language (DML) statements write new information or modify existing records in a relational database. For example, an application uses the INSERT command to store a new record in the database.

#### **Data control language**

Database administrators use data control language (DCL) to manage or authorize database access for other users. For example, they can use the GRANT command to permit certain applications to manipulate one or more tables. 

#### **Transaction control language**

The relational engine uses transaction control language (TCL) to automatically make database changes. For example, the database uses the ROLLBACK command to undo an erroneous transaction. 

### What are SQL standards?

SQL standards are a set of formally defined guidelines of the structured query language (SQL). The American National Standards Institute (ANSI) and International Organization for Standardization (ISO) adopted the SQL standards in 1986. Software vendors use the ANSI SQL standards to build SQL database software for developers.

### What is SQL injection?

SQL injection is a cyberattack that involves tricking the database with SQL queries. Hackers use SQL injection to retrieve, modify, or corrupt data in a SQL database. For example, they might fill in a SQL query instead of a person's name in a submission form to carry out a SQL injection attack.

### What is MySQL?

MySQL is an open-source relational database management system offered by Oracle. Developers can download and use MySQL without paying a licensing fee. They can install MySQL on different operating systems or cloud servers. MySQL is a popular database system for web applications. 

#### **SQL vs. MySQL**

Structured query language (SQL) is a standard language for database creation and manipulation. MySQL is a relational database program that uses SQL queries. While SQL commands are defined by international standards, the MySQL software undergoes continual upgrades and improvements.

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