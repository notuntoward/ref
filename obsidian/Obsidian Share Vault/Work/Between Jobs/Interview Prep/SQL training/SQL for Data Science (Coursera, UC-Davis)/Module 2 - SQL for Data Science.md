---
created date: 2025-01-13T21:25:08-08:00
modified date: 2025-01-14T12:08:38-08:00
---
**Module 2 of Coursera / UCD Davis SQL Class Notes** (Lawrence22dataScienceSQLcourse)
From: [Module Introduction - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/GAA9h/module-introduction)

# Intro
From: [Module Introduction - Filterin...](https://www.coursera.org/learn/sql-for-data-science/lecture/GAA9h/module-introduction)
## Filtering Operators in this Module
![[Pasted image 20250113212750.webp|153]]
## Wildcards
will use them...
## Math and Aggregate operators
![[__temp__Pasted image 20250113212951.webp|147]]

# Basics of Filtering
From: [Basics of Filtering with SQL - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/ESCUo/basics-of-filtering-with-sql)
## Where 

![[Pasted image 20250113213432.webp|511]]

## Where examples
![[Pasted image 20250113213554.webp|411]]

- ProductName is a string var, so '' around Tofu

![[__temp__Pasted image 20250113213646.webp|410]]

![[Pasted image 20250113213741.webp|407]]

![[__temp__Pasted image 20250113213809.webp|407]]

![[Pasted image 20250113213852.webp|413]]

## Advanced Filtering: IN, OR, and NOT
From: [Advanced Filtering: IN, OR, and NOT - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/pycB9/advanced-filtering-in-or-and-not)

![[__temp__Pasted image 20250113214209.webp|407]]

![[Pasted image 20250113214309.webp|405]]

- 2nd var in OR not executed of 1st is true
- so I guess for efficiency, put use var that will remove the most entries 1st?
- benefits of IN
	- can list multiple thing to OR
	- faster than OR
	- don't need to think about order
	- can use another select for subqueries
![[Pasted image 20250113214728.webp|667]]

- left code: for each row, 1st part of OR is executed; if TRUE, then 2nd part (AND) is not executed
- right code: for each row, both OR and AND are executed 
- **moral of the story**: simply always use parens to avoid ambiguity

![[__temp__Pasted image 20250113220132.webp|296]]

- [ ] ? NOT operator runs first, on thing next to it only
- she doesn't say it but this works like that's true

## Using Wildcards in SQL
From:  ^4f8f[Using Wildcards in SQL - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/xIAow/using-wildcards-in-sql)

![[Pasted image 20250113221310.webp|394]]

- `%` is the wildcard in strings
- she screwed up in this part (I checked)

![[__temp__Pasted image 20250113221510.webp|314]]

- note: wildcards never match NULL

![[Pasted image 20250113221757.webp|172]]

- I *think* she screwed up with this explanation
- Checking, it seems that `_` matches a single character
- not supported by DB2
![[__temp__Pasted image 20250113222214.webp|205]]

- Matches a set of chars inside of `[]`, I think she said
- but NOT in SQLite
### Why not use wildcards
- slower that '=', etc.
- not consistent across SQL implementations