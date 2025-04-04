---
created date: 2025-01-13T21:25:08-08:00
modified date: 2025-03-23T19:49:06-07:00
---
- **Module 2 of Coursera / UCD Davis SQL Class Notes** (Lawrence22dataScienceSQLcourse)
From: [Module Introduction - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/GAA9h/module-introduction)

Filtering, Sorting, and Calculating Data with SQL
# Intro
From: [Module Introduction - Filterin...](https://www.coursera.org/learn/sql-for-data-science/lecture/GAA9h/module-introduction)
## Filtering Operators in this Module]
![[Pasted image 20250113212750.webp|153|196x190]]
## Wildcards
will use them...
## Math and Aggregate operators
![[Pasted image 20250113212951.webp|147|198x171]]

# Basics of Filtering
From: [Basics of Filtering with SQL - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/ESCUo/basics-of-filtering-with-sql)
## Where 

![[Pasted image 20250113213432.webp|511|512x252]]

## Where examples
![[Pasted image 20250113213554.webp|411|411x190]]

- ProductName is a string var, so '' around Tofu

![[Pasted image 20250113213646.webp|410|422x191]]

![[Pasted image 20250113213741.webp|407|407x238]]

![[Pasted image 20250113213809.webp|407]]

![[Pasted image 20250113213852.webp|413]]

## Advanced Filtering: IN, OR, and NOT
From: [Advanced Filtering: IN, OR, and NOT - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/pycB9/advanced-filtering-in-or-and-not)

![[Pasted image 20250113214209.webp|407|318x218]]

![[Pasted image 20250113214309.webp|405|335x237]]

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

![[Pasted image 20250113220132.webp|296|0x0]]

- [ ] ? NOT operator runs first, on thing next to it only
- she doesn't say it but this works like that's true

## Using Wildcards in SQL
From: [Using Wildcards in SQL - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/xIAow/using-wildcards-in-sql)

The `predicate` used to do wildcard matching is **LIKE**.  For example:

SELECT pay_type
FROM jobs
WHERE job_code LIKE '03%';


![[Pasted image 20250113221310.webp|394]]

- `%` is the wildcard in strings
- she screwed up in this part (I checked)

![[Pasted image 20250113221510.webp|314]]

- note: wildcards neve`r match NULL

![[Pasted image 20250113221757.webp|172|242x305]]

- I *think* she screwed up with this explanation
- Checking, it seems that `_` matches a single character
- not supported by DB2
![[Pasted image 20250113222214.webp|205|278x173]]

- Matches a set of chars inside of `[]`, I think she said
- but NOT in SQLite
### Why not use wildcards
- slower that '=', etc.
- not consistent across SQL implementations
# Sorting with ORDER BY
From: [Sorting with ORDER BY - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/OIQ7a/sorting-with-order-by)

![[Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/attachments/21a46ec41fd4a6786cacd55778079fe8_MD5.jpeg|289x226]]

1. comm after column name
2. don't need to have been in SELECT to sort by it -- unlike pandas!  ^xe1t
	1. [ ] ? b/c you can order by index, as below?
3. last SELECT clause

![[Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/attachments/fbc0d4ac1428724afe05e6afa98fc47c_MD5.jpeg|246x220]]

- can sort by index:  Note the **Matlab-like 1-based column indexing**

![[Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/attachments/93abaf1a3e5f7b564544e43206e620cb_MD5.jpeg|210x138]]

- **only for following column, must spec for each column** or I guess it does default sorting?
# Math Operations
From: [Math Operations - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/DYtOe/math-operations)

![[Work/Between Jobs/Interview Prep/SQL training/SQL for Data Science (Coursera, UC-Davis)/attachments/image.png|345x229]]

- calc is after the selected cols, preceded by a comma
- **AS** is name of new column where the result goes
- above is **\***, can do: **+, -, \*, /**

![[image-2.png|260x201]]

- order of opp follows American saying: "**P**lease **E**xcuse **M**y **D**ear **A**unt **S**ally"
	- e.g. (UnitPrice - Discount)\*Quantity AS Total_Cost

# Aggregate functions
From: [Aggregate Functions - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/O8yes/aggregate-functions)
## Math aggregators
- aggregators are at least: **AVG**, **COUNT**, **MIN**, **MAX**, **SUM** (DISTINCT functions is kind of an aggregator too?)
![[image-3.png|304x200]]

- aggregation is inside of the select statement: above, you don't select UnitPrice and then calc AVG. Instead, you do SELECT AVG(UnitPrice) as avg_price FROM products, or e.g.:

![[image-4.png|270x76]]

- Does avg_price go to the "database" that contains this "table?"
- NULLs are ignored by AVG
- Count behavior a bit different than AVG:
	- **\*** just counts the rows, regardless of columns
	- COUNT(CustomerID) counts the **non-null** values 

![[image-5.png|541x158]]

* getting the min/max range (note the AS'es in the middle of the select). Can do it without AS to get unnamed results
![[image-6.png|332x81]]

## Distinct
![[image-7.png|255x283]]

- DISTINCT not called like a function: It's
  
  SELECT DISTINCT CustomerID FROM Customers
  
  **not**
  
  SELECT DISTINCT(CustomerID) FROM Customers
  
- can't use DISTINCT with COUNT(\*)
	- I guess b/c it contradicts the COUNT(\*)` behavior above (counts rows)
	- So, I guess you can nest operators.  She hasn't shown that yet.
- can't us with min/max, I guess b/c DISINCT shouldn't affect the result when it's either inner or outer nested with min/max
# Grouping Data with SQL
[Grouping Data with SQL - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/LWL8X/grouping-data-with-sql)

![[image-8.png|405x153]]

- GROUP BY comes at the end, after the calc done on the groups
	- this is the *opposite of pandas*

![[image-9.png|219x202]]

- multi-variate groups, just like pandas
- aggregated calcs on groups don't require that every col that is being calculated upon (not grouped) has to be in the select statement. ^o3u3
	- [ ] ? why?  b/c you can assume you aggregate on anything not mentioned??
	- if you don't list them, then you won't know the ordering of the results
- NULLs get grouped
![[image-10.png|292x224]]

- WHERE filters on rows, not groups ^753q

![[image-11.png|234x168]]

- untangling it (different than pandas ordering)
	- SELECT CustomerID, COUNT(\*) AS orders
		- Specifies what the aggregation function will be (COUNT) and what column it will go to (orders)
	- From ORDERS
		- the table
	- GROUP BY CustomeriD
		- the groups to which the aggregation is applied: groups with same CustomerID
	- HAVING COUNT(*) >= 2;
		- omit groups with less than 2 members (presumably, less than two orders from a customer)
- ORDER BY makes GROUPBY results easier to read
	- [ ] ? would the ORDER BY clause be *before* GROUP BY or the aggregation *after*?
	- [ ] ? does it matter for performance too, or just for display?

# Putting it All Together
[Putting it All Together - Filtering, Sorting, and Calculating Data with SQL | Coursera](https://www.coursera.org/learn/sql-for-data-science/lecture/3NaSU/putting-it-all-together)

## The order of SQL clauses
Can skip some, for example, you can SELECT … FROM ORDER … BY\

![[image-12.png|377x332]]

OR...

SELECT column1, column2, ...
FROM table_name
WHERE condition
GROUP BY column1
HAVING condition
ORDER BY column1 ASC/DESC;

## SQL for Data Science Languages
- [python-sql · PyPI](https://pypi.org/project/python-sql/)
- [sqlite3 — DB-API 2.0 interface for SQLite databases &#8212; Python 3.13.2 documentation](https://docs.python.org/3/library/sqlite3.html)


SELECT CustomerId, COUNT(InvoiceId)
FROM Invoices
GROUP By CustomerId
ORDER BY COUNT(InvoiceId) DESC