---
category: literaturenote
tags:
  - ml/genAI
citekey: Wiggers24hallucRAGwontSolve
status:
  - read
dateread: 
ZoteroTags: ""
aliases:
  - Why RAG won't solve generative AI's hallucination problem
  - Why RAG won't solve generative
publisher: ""
citation key: Wiggers24hallucRAGwontSolve
DOI: ""
created date: 2024-05-04T11:48:40-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/IPXGMZ3H)   | [**URL**](https://techcrunch.com/2024/05/04/why-rag-wont-solve-generative-ais-hallucination-problem/) | [[Wiggers24hallucRAGwontSolve.pdf|PDF]]
>
> 
> **Abstract**
> RAG is being pitched as a solution of sorts to generative AI hallucinations. But there's limits to what the technique can do.
> 
> 
> **FirstAuthor**:: Wiggers, Kyle  
~    
> **Title**:: "Why RAG won't solve generative AI's hallucination problem"  
> **Date**:: 2024-05-04  
> **Citekey**:: Wiggers24hallucRAGwontSolve  
> **ZoteroItemKey**:: IPXGMZ3H  
> **itemType**:: blogPost  
> **DOI**::   
> **URL**:: https://techcrunch.com/2024/05/04/why-rag-wont-solve-generative-ais-hallucination-problem/  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: 
> **Related**:: 

> Wiggers, Kyle. “Why RAG Won’t Solve Generative AI’s Hallucination Problem.” _TechCrunch_, 4 May 2024, [https://techcrunch.com/2024/05/04/why-rag-wont-solve-generative-ais-hallucination-problem/](https://techcrunch.com/2024/05/04/why-rag-wont-solve-generative-ais-hallucination-problem/).

Currently, RAG is "keywords search +" (my phrase) that can be accurate in some factual searches.  It's useful when, for security reasons, you don't want to train on documents, and when you want to be sure to avoid copyright-infringement, because you have the actual source at hand.  For reasoning based searches, RAG is still a work in progress.

RAG works OK for [[Wiggers24hallucRAGwontSolve.pdf#page=3&annotation=51R|“information need”]] type factual searches, which often reduces to keyword search, which can already be done without the huge compute and electricity.  For [[Wiggers24hallucRAGwontSolve.pdf#page=3&annotation=56R|reasoning-intensive]] searches, like in programming or math proofs, RAG fails more often, hallucinating by using memory stored in its trained parameters -- [[Wiggers24hallucRAGwontSolve.pdf#page=2&annotation=42R|parametric memory]] -- or getting distracted and retrieve irrelevant content in a long document.  Even if it retrieves the right document, it might choose to hallucinate instead.
# Efforts to Improve RAG
- indexing
	- more efficient
	- representations beyond keywords, more abstract
- better decisions about when to use a retrived doc
%% begin Obsidian Notes %%
___


___
%% end Obsidian Notes %%



%% Import Date: 2024-05-04T11:48:52.160-07:00 %%
