---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

```dataview
TABLE  
title as Title,  
default(FirstAuthor, FirstDirector) as "First Author",
dateformat(Date, "yyyy-mm-dd") as "Date", 
status as Status,
Citekey as Citekey,  
itemType as Item
FROM "lit/lit_notes"  
```