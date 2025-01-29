---
category: literaturenote
tags:
  - ml/embed
  - ml/leaderboard
  - ml/genAI
citekey: HuggingFace24benchmarkMTEB
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "MTEB: Massive Text Embedding Benchmark"
  - "MTEB: Massive Text Embedding Benchmark"
publisher: ""
citation key: HuggingFace24benchmarkMTEB
DOI: ""
created date: 2024-04-08T20:57:07-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/QUK3HMMG)   | [**URL**](https://github.com/huggingface/blog/blob/main/mteb.md) | [[HuggingFace24benchmarkMTEB.pdf|PDF]]
>
> 
> **Abstract**
> Public repo for HF blog posts. Contribute to huggingface/blog development by creating an account on GitHub.
> 
> 
> **FirstAuthor**:: HuggingFace  
~    
> **Title**:: "MTEB: Massive Text Embedding Benchmark"  
> **Date**:: 2024-01-01  
> **Citekey**:: HuggingFace24benchmarkMTEB  
> **ZoteroItemKey**:: QUK3HMMG  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://github.com/huggingface/blog/blob/main/mteb.md  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
>**Related**:: 

> HuggingFace. “MTEB: Massive Text Embedding Benchmark.” _GitHub_, 2024, [https://github.com/huggingface/blog/blob/main/mteb.md](https://github.com/huggingface/blog/blob/main/mteb.md).
%% begin Obsidian Notes %%
___
Quick intro to text (only) embedding and one leaderboard comparing embedding models: [[HuggingFace24leaderboardMTEB|MTEB Leaderboard - a Hugging Face Space by mteb]]

- mainly benchmarking models w/ state-of-the-art results
	- so mostly transformers
- 56 datasets, 8 tasks, 2000 results
- [[Muennighoff23textEmbedMTEBpaper]] describes benchmark tasks and datasets.  Presumably the MTEB score too, whatever that is.
- also a GitHub repro
- [[HuggingFace24benchmarkMTEB.pdf#page=2&annotation=541R|Why Text Embeddings?]]
	- google uses them for search engine
	- text classifiers (SetFit)
- quality very dependent upon model
# Interesting chart
  ![[HuggingFace24benchmarkMTEB.pdf#page=4&rect=72,479,561,769&color=note]]
  - compares speed and embedding quality (MTEB score) vs. model
  - BERT has some fast/good models, not sure what types the other model colors represent
___
%% end Obsidian Notes %%



%% Import Date: 2024-04-08T20:57:31.559-07:00 %%
