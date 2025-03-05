---
created date: 2025-03-04T11:58:28-08:00
modified date: 2025-03-04T19:40:45-08:00
---
From: [Module Introduction - Modifyin...](https://www.coursera.org/learn/sql-for-data-science/lecture/V9qBD/module-introduction)

# Working with Text String
From: [Working with Text Strings - Mo...](https://www.coursera.org/learn/sql-for-data-science/lecture/yw49P/working-with-text-strings)

## Concatenation
![[image-26.png|414x146]]

- syntax depends on DBMS e.g. SQL Server uses `+` to concat
## Trimming Strings
From: [Working with Text Strings - Mo...](https://www.coursera.org/learn/sql-for-data-science/lecture/yw49P/working-with-text-strings)

![[image-27.png]]

- TRIM: removes trailing spaces
	- ! Wrong: [it trims both lead and trail](https://www.perplexity.ai/search/what-is-the-output-of-the-atta-ZXXPMc0WTz._L1pFuFX8dQ#0).  Otherwise so, why LTRIM and RTRIM?
## Substring
From: [Working with Text Strings - Mo...](https://www.coursera.org/learn/sql-for-data-science/lecture/yw49P/working-with-text-strings)

![[image-30.png]]

![[image-29.png]]

- This selects 4 chars starting @ the 3rd (1-indexing)
- if there aren't 4 chars available, it stops
## Upper, Lower
From: [Working with Text Strings - Mo...](https://www.coursera.org/learn/sql-for-data-science/lecture/yw49P/working-with-text-strings)
![[image-31.png]]

# Working with Date and Time Strings
From: [Working with Date and Time Str...](https://www.coursera.org/learn/sql-for-data-science/lecture/kbIot/working-with-date-and-time-strings)

- date/time handline depend upon DBMS.  She'll discuss SQL Lite


![[image-34.png]]

![[image-33.png]]

![[image-35.png]]

![[image-36.png]]

## Examples
From: [Date and Time Strings Examples...](https://www.coursera.org/learn/sql-for-data-science/lecture/ayLVq/date-and-time-strings-examples)

### STRFTIME

![[image-37.png]]
### Date Computations
![[image-38.png]]

- current time down to the millisecond
![[image-39.png]]

- calculating age from Birthdate
# Case Statements
From: [Case Statements - Modifying an...](https://www.coursera.org/learn/sql-for-data-science/lecture/qsHKS/case-statements)

![[image-40.png]]

- CASE statements go in the SELECT section of a query
![[image-42.png]]

![[image-43.png]]

- A CASE quantizer: bytescategory == ('small','medium','large','Other')

# Views
From: [Case Statements - Modifying an...](https://www.coursera.org/learn/sql-for-data-science/lecture/qsHKS/case-statements)

- Uses
	- get a table with more or less columns without changing schema
	- "ecapsulate" queries (save them temporarily?)
- disappears when DB connection closes
![[image-44.png]]

- create a view (my_view) and then use it like a table:
	- see it
	  SELECT *
	  FROM my_view
	- delete it
	  DROP VIEW my_view
- can do operations on it, as if it was a table
- especially useful for 
	- outputting stuff in the right order
	- get around security: your view doesn't write to the original tables
	- for multi-level queries
	- not transferring data through an ETL process (not sure what that means)
# Data Governance and Profiling
From: [Data Governance and Profiling ...](https://www.coursera.org/learn/sql-for-data-science/lecture/icb6W/data-governance-and-profiling)

## "profiling": look at descriptive statistics
- num rows
- table size
- age of data
- how / how often is it refreshed
- column datatypes
- summary stats, min/max/man/var
- distinct values
- NULL values
## Governance Best Practices
- your read/write privileges
- clean up environments
- know "promotion process": how you get a model into production
# Using SQL for Data Science, Part 1
From: [Using SQL for Data Science, Pa...](https://www.coursera.org/learn/sql-for-data-science/lecture/Mq7rr/using-sql-for-data-science-part-1)

- need to understand both data and business sides

# Using SQL for Data Science, Part 2
From: [Using SQL for Data Science, Pa...](https://www.coursera.org/learn/sql-for-data-science/lecture/Bpbog/using-sql-for-data-science-part-2)


- what she does
	- where is the data I need
	- draw a diagram showing the tables
	- fill out details
	- plan joins
- always begin with SELECT
- Test and troubleshoot along the way
# Additional SQL Resources to Explore
From: [Coursera \| Online Courses & C...](https://www.coursera.org/learn/sql-for-data-science/supplement/ptjJA/additional-sql-resources-to-explore)
- [SQL Puzzle Archives - SQL Authority with Pinal Dave](https://blog.sqlauthority.com/category/sql-puzzle/)
- [SQLZoo](https://sqlzoo.net/wiki/SQL_Tutorial)





