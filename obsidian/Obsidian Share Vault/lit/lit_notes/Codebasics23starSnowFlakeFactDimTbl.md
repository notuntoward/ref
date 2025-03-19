---
category: 
- literaturenote
tags:
read: false
in-progress: false
linked: false
aliases:
- "What is STAR schema : Star vs Snowflake Schema : Fact vs Dimension Table"
- "What is STAR schema :"
citekey: Codebasics23starSnowFlakeFactDimTbl
ZoteroTags: 
ZoteroCollections: 
- data_bases
created date: 3/19/2025, 1:59:12 PM
modified date:
---

> [!info]- &nbsp;[**Zotero**](zotero://select/library/items/QBBBIZFD)  | [**URL**](https://www.youtube.com/watch?v=hQvCOBv_-LE)
>> **Abstract**
> In data modeling, star and snowflake are two popular ways of modeling your data. In this video, I will explain you following concepts in a very simple manner,  What is star schema? What is snowflake schema? Difference between star and snowflake schema What is fact table? What is dimension table? Fact vs Dimension table  Power BI course that covers all above concepts in depth: https://codebasics.io/courses/power-b...  Do you want to learn technology from me? Check https://codebasics.io/?utm_source=des... for my affordable video courses.  Need help building software or data analytics/AI solutions? My company https://www.atliq.com/ can help. Click on the Contact button on that website.  🎥 Codebasics Hindi channel:    / @codebasicshindi    #️⃣ Social Media #️⃣ 🔗 Discord:    / discord   📸 Dhaval's Personal Instagram:   / dhavalsays   📸 Codebasics Instagram:   / codebasicshub   🔊 Facebook:   / codebasicshub   📱 Twitter:   / codebasicshub   📝 Linkedin (Personal):   / dhavalsays   📝 Linkedin (Codebasics):    / codebasics   🔗 Patreon: https://www.patreon.com/codebasics?fa...
> > **Director**:: codebasics
> **Title**:: "What is STAR schema : Star vs Snowflake Schema : Fact vs Dimension Table"
> **Date**:: 2023-02-16
> **Citekey**:: Codebasics23starSnowFlakeFactDimTbl
> **ZoteroItemKey**:: QBBBIZFD
> **itemType**:: videoRecording
> **DOI**:: 
> **URL**:: https://www.youtube.com/watch?v=hQvCOBv_-LE
> **Journal**:: 
> **Volume**:: 
> **Issue**:: 
> **Book**:: 
> **Publisher**:: 
> **Location**:: 
> **Pages**:: 
> **ISBN**:: 
> **ZoteroTags**:: []
> **ZoteroCollections**:: ['Data Bases']
> **Related**::

>  What Is STAR Schema : Star vs Snowflake Schema : Fact vs Dimension Table. Directed by codebasics, 2023. YouTube, https://www.youtube.com/watch?v=hQvCOBv_-LE.

%% begin Obsidian Notes %%
___
==Delete this and write here. Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%
> [!note]- &nbsp;Zotero Note (1)
>>Codebasics23starSnowFlakeFactDimTbl
> 
> #### Normalization
> 
> - [Denormalization means](https://youtu.be/hQvCOBv_-LE?t=47): everything stored in single row
> 
> [Normalized](https://youtu.be/hQvCOBv_-LE?t=57): redundant info is in a separate table
> 
> - example: multitable coluumn of customer attributes, single index of customer_id
> 
> 
> customer_id is used to join w/ other tables
> - example: index of item_id: separate table of item atributes
> 
> #### Fact vs. Dimension Tables
> 
> - [Fact](https://youtu.be/hQvCOBv_-LE?t=215): the data you’re trying to get, in a table.  In this case, a sales transaction
> 
> 
> contains indices
> 
> 
> indices are in dimension tables
> - [Dimension](https://youtu.be/hQvCOBv_-LE?t=205): tables of dimensions, allow you to index your way to a fact table
> 
> 
> represent extra information, summarized by its index
> 
> 
> probably doesn’t change as often as a fact table
> 
> #### Star Table
> 
> - index tables surrounding a fact table
> - all index tables directly index the fact table
> 
> #### Snowflake Table
> 
> - [Dimension tables are hierarchical](https://youtu.be/hQvCOBv_-LE?t=278) e.g. a customer dimension table (directly indexes sales transaction fact table) which has its own fact table i.e. it contains an index_id to some other dimension e.g. the customer table could contain an index to an address index table.
> 
> 
> use case: many customers in same house
> 
> 
> info about a unique address is stored only once in an address table
> 
> 
> index to that address goes to the customer table
> 
> 
> 
> 
> then customer index goes to the transaction table
> 
> 
> that customer might have many transaction
> 
> 
> but all the info about the customer is stored only once
> 
> #### Data Modeling
> 
> - process of describing the table arrangements [is called data modeling](https://youtu.be/hQvCOBv_-LE?t=320)
> - can do it in [tools like tableau or Power BI](https://youtu.be/hQvCOBv_-LE?t=331)
> - [can have multiple fact tables](https://youtu.be/hQvCOBv_-LE?t=320) in the middle, not just one
> 
> #### Recommended by…
> 
> - ([Lawrence, 2022](zotero://select/library/items/B7TNABNU))
> 
>
---