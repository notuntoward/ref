---
created date: 2025-03-02T21:32:30-08:00
modified date: 2025-03-02T21:32:30-08:00
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


![[image-14.png|782x379]]

# Subquery Best Practices and Considerations
From: [Subquery Best Practices and Considerations - Subqueries and Joins in SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/3ubfD/subquery-best-practices-and-considerations)

- queries can be infinitely nested, but nesting decreases speed
- subqueries can select only a single column (so 1-D keys only)'
![[image-15.png|261x228]]

- subqueries can have calcs
