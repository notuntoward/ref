---
category: literaturenote
tags:
  - ml/genAI
citekey: Kim24LLMCompilerParallelFunc
status:
  - unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - An LLM Compiler for Parallel Function Calling
  - An LLM Compiler for Parallel
publisher: ""
citation key: Kim24LLMCompilerParallelFunc
DOI: 10.48550/arXiv.2312.04511
created date: 2024-05-01T21:55:22-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/6JK73NUT)  | [**DOI**](https://doi.org/10.48550/arXiv.2312.04511)  | [**URL**](http://arxiv.org/abs/2312.04511) | [[Kim24LLMCompilerParallelFunc.pdf|PDF]]
>
> 
> **Abstract**
> Recent language models have shown remarkable results on various complex reasoning benchmarks. The reasoning capabilities of LLMs enable them to execute external function calls to overcome their inherent limitations, such as knowledge cutoffs, poor arithmetic skills, or lack of access to private data. This development has allowed LLMs to select and coordinate multiple functions based on the context to tackle more complex problems. However, current methods for multiple function calling often require sequential reasoning and acting for each function which can result in high latency, cost, and sometimes inaccurate behavior. To address this, we introduce LLMCompiler, which executes functions in parallel to efficiently orchestrate multiple function calling. Drawing from the principles of classical compilers, LLMCompiler streamlines parallel function calling with three components: (i) an LLM Planner, formulating execution plans; (ii) a Task Fetching Unit, dispatching function calling tasks; and (iii) an Executor, executing these tasks in parallel. LLMCompiler automatically generates an optimized orchestration for the function calls and can be used with both open-source and closed-source models. We have benchmarked LLMCompiler on a range of tasks with different patterns of function calling. We observe consistent latency speedup of up to 3.7x, cost savings of up to 6.7x, and accuracy improvement of up to ~9% compared to ReAct.
> 
> 
> **FirstAuthor**:: Kim, Sehoon  
> **Author**:: Moon, Suhong  
> **Author**:: Tabrizi, Ryan  
> **Author**:: Lee, Nicholas  
> **Author**:: Mahoney, Michael W.  
> **Author**:: Keutzer, Kurt  
> **Author**:: Gholami, Amir  
~    
> **Title**:: "An LLM Compiler for Parallel Function Calling"  
> **Date**:: 2024-02-06  
> **Citekey**:: Kim24LLMCompilerParallelFunc  
> **ZoteroItemKey**:: 6JK73NUT  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2312.04511  
> **URL**:: http://arxiv.org/abs/2312.04511  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Kim, Sehoon, et al. _An LLM Compiler for Parallel Function Calling_. arXiv:2312.04511, arXiv, 6 Feb. 2024. _arXiv.org_, [https://doi.org/10.48550/arXiv.2312.04511](https://doi.org/10.48550/arXiv.2312.04511).
%% begin Obsidian Notes %%
___

The best(?) of the agent models in [[Kim24LLMCompilerParallelFunc|An LLM Compiler for Parallel Function Calling]]
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Kim24LLMCompilerParallelFunc
> 
> The best(?) of the agent models in ([“Breaking Down & Testing FIVE LLM Agent Architectures - (Reflexion, LATs, P&E, ReWOO, LLMCompiler)”, 2024](zotero://select/library/items/9ARMKWCA))
> 
> <small>📝️ (modified: 2024-05-01) [link](zotero://select/library/items/7X2AUSCU) - [web](http://zotero.org/users/60638/items/7X2AUSCU)</small>
>  
> ---




%% Import Date: 2024-05-01T21:55:43.655-07:00 %%
