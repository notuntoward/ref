---
created date: 2025-03-02T21:32:30-08:00
modified date: 2025-03-05T11:05:18-08:00
---
**Module 3 of Coursera / UCD Davis SQL Class Notes** (Lawrence22dataScienceSQLcourse)
From: [Subqueries and Joins with SQL](https://www.coursera.org/learn/sql-for-data-science/home/module/2)

Subqueries and Joins with SQL

# Module Introduction
From: [Module Introduction - Subqueries and Joins in SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/NDsRj/module-introduction)

# Using Subqueries
From: [Using Subqueries - Subqueries and Joins in SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/FChaS/using-subqueries)

- Basic idea for a query with a subquery
	- outer query is the thing you want to know about a subpopulation
		- at the top of the statement
	- inner query selects the population
		- in parens, after the WHERE in the outer query
		- **FROM** in the **inner** query can only be a **single column** ^u5dc 


![[image-14.png|A caption|493x350]]

# Subquery Best Practices and Considerations
From: [Subquery Best Practices and Considerations - Subqueries and Joins in SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/3ubfD/subquery-best-practices-and-considerations)

- queries can be infinitely nested, but nesting decreases speed
- subqueries can select only a single column (so 1-D keys only)'
![[image-15.png|261x228]]

- subqueries can have calcs

![[image-17.png|497x156]]

- subqueries are a way to avoid joins, 
	- but why would I want to do that?
	- because some DBMSs have poor join performance
- but can be slower than equiv joins if not optimized (??)
	- subquery can execute once per join
	- join typically "only operates once"
	- HOWEVER modern DBMSs might optimize away this problem
- many levels of nesting can make SQL hard to read
- subqueries can't do insert, update, delete (and other things, I think)
- performance and support varies with specific DMBS you're using


# Joining Tables: An Introduction
From: [Joining Tables: An Introductio...](https://www.coursera.org/learn/sql-for-data-science/lecture/f7Jnh/joining-tables-an-introduction)

just an intro

# Cartesian (Cross) Joins
From:[Cartesian (Cross) Joins - Subq...](https://www.coursera.org/learn/sql-for-data-science/lecture/naHdo/cartesian-cross-joins)

- `cartesian`: joins allow rows in table 1 with all rows in table 2
	- so result in N * M,  where N and M are the number of rows in each table
	- no key required, no matching
	- ? I don't quite get what this is??
	- not frequently used, inefficient, may contain "incorrect" results
 
![[image-18.png|631x159]]

# Inner Joins
From: [Inner Joins - Subqueries and J...](https://www.coursera.org/learn/sql-for-data-science/lecture/Dk0bv/inner-joins)

![[image-19.png|530x264]]
- this gets products and prices in Suppliers table that have same supplierid in Products table
- ? ON has an "=", so could it be something like ">=" ?
- can be computationally taxing, so avoid if don't need
- she calls the dot notation above "pre-qualifying"

## example of JOIN on multiple tables and table name aliases

![[image-20.png|923x185]]

- looks like you can do "aliases" for tables before and after INNER JOIN
	- ? are these "aliases" in the same sense as "alias" in the [[Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/Module 3 - SQL for Data Science.md#Aliases and Self Joins |Aliases and Self Joins]] section
# Aliases and Self Joins
From: [Aliases and Self Joins - Subqu...](https://www.coursera.org/learn/sql-for-data-science/lecture/cQKUS/aliases-and-self-joins)
## Aliases
- "alias": when you use AS, when getting the table, but in [[#Self Joins (and concatenation)]], it looks you don't need AS, at least in after a FROM 

![[image-21.png|819x376]]

- **WARNING**: the FROM Vendors AS v, Products AS p appears to act like a **CROSS JOIN** (see [perplexity's explanation](https://www.perplexity.ai/search/if-i-run-this-sql-lite-query-s-SWHelZG_Q.qAeXPUQyFpZQ#0) for a similar query)

## Self Joins (and concatenation)
![[image-22.png|478x257]]

- Here, both boss and subordinate have employeeId's
- Aliases are e1 and e2 but they both refer to the Employee table
	- Why? Clarity? But she doesn't say you have to do this
	- Note: FROM alias have no AS, like is show in [[#Aliases]]
- The LEFT JOIN
	- gives you a the employee and manager names on the same row
	- because it's LEFT, you'll get a NULL for employees without a manager
- Apparently (but she doesn't explain): `|| ' ' ||`  is string concatenation of 1st and last names
	- YES, that's correct.  See: [[Module 4 - Modifying and Analyzing Data with SQL#Concatenation]]
- EmployeeName and ManagerName are aliases

# Advanced Joins: Left, Right, and Full Outer Joins
From: [Advanced Joins: Left, Right, a...](https://www.coursera.org/learn/sql-for-data-science/lecture/993cg/advanced-joins-left-right-and-full-outer-joins)

- @ SQL Lite only does LEFT joins!
	- n RIGHT not a huge loss: RIGHT joins are the same as a LEFT join with the reversed order
![[image-23.png|325x208]]

The syntax for pandas-like "outer" is FULL OUTER (in SQL Lite only?)
# My JOIN comments
- Must use them when need need to bring more than one column from an inner table
	- because a [subquery can only bring a single column from an inner subquery](<Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/Module 3 - SQL for Data Science.md#^u5dc >)
- @ DON'T FORGET: **ON** requires a boolean equation
	- So 
	  JOIN albums AS alb ON tr.AlbumId = alb.AlbumId
	- Not
	  JOIN albums AS alb ON tr.AlbumId
	- it's **not like the pandas ON** 

# Unions
From: [Unions - Subqueries and Joins ...](https://www.coursera.org/learn/sql-for-data-science/lecture/KxGPs/unions)
- for stacking two tables (vertical concatenation)
- must have same number of tables
- also same data types, per-column
- and same-order columns

![[image-24.png|268x203]]

- in this example, they're just stacked but (she didn't say this) [duplicate rows are removed](<Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/Module 3 - SQL for Data Science.md#^vaws >)
- ? how would you know which rows are for customers or suppliers?
# SUMMARY
From: [Summary - Subqueries and Joins...](https://www.coursera.org/learn/sql-for-data-science/lecture/xEejU/summary)

- check to see if result of a JOIN has the number of results you'd expect (LEFT, RIGHT, CROSS)
- check for duplicates
- INNER, LEFT and RIGHT joins **require a condition** -- **not like in pandas** where you say `f"ON={column_name}"`

![[image-25.png]]
# Reading
- [x] [SQL vs Python | Mode](https://mode.com/blog/learning-python-sql)
- [ ] [SQL SERVER - Difference Between Union vs. Union All](https://blog.sqlauthority.com/2009/03/11/sql-server-difference-between-union-vs-union-all-optimal-performance-comparison/) (performance)
	- UNION 
		- requires same num cols, same col types
		- deletes duplicate rows in the UNION ^vaws
			- effectively, a SELECT DISTINCT on the results
	- UNION ALL 
		- doesn't remove dup rows
		- is faster than UNION
		- if you know the UNION inputs are distinct, use UNION ALL for speed