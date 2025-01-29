---
category: literaturenote
tags:
  - ml/genAI
  - hasCode
citekey: Wu24fineLLMtuneReFTR
status:
  - ?read
dateread: 
ZoteroTags: hasCode, todo, obsLitNote
aliases:
  - "ReFT: Representation Finetuning for Language Models"
  - "ReFT: Representation Finetuning for Language"
publisher: ""
citation key: Wu24fineLLMtuneReFTR
DOI: 10.48550/arXiv.2404.03592
created date: 2024-04-13T19:57:31-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/5H6NTJCI)  | [**DOI**](https://doi.org/10.48550/arXiv.2404.03592)  | [**URL**](http://arxiv.org/abs/2404.03592) | [[Wu24fineLLMtuneReFTR.pdf|PDF]]
>
> 
> **Abstract**
> Parameter-efficient fine-tuning (PEFT) methods seek to adapt large models via updates to a small number of weights. However, much prior interpretability work has shown that representations encode rich semantic information, suggesting that editing representations might be a more powerful alternative. Here, we pursue this hypothesis by developing a family of $\textbf{Representation Finetuning (ReFT)}$ methods. ReFT methods operate on a frozen base model and learn task-specific interventions on hidden representations. We define a strong instance of the ReFT family, Low-rank Linear Subspace ReFT (LoReFT). LoReFT is a drop-in replacement for existing PEFTs and learns interventions that are 10x-50x more parameter-efficient than prior state-of-the-art PEFTs. We showcase LoReFT on eight commonsense reasoning tasks, four arithmetic reasoning tasks, Alpaca-Eval v1.0, and GLUE. In all these evaluations, LoReFT delivers the best balance of efficiency and performance, and almost always outperforms state-of-the-art PEFTs. We release a generic ReFT training library publicly at https://github.com/stanfordnlp/pyreft.
> 
> 
> **FirstAuthor**:: Wu, Zhengxuan  
> **Author**:: Arora, Aryaman  
> **Author**:: Wang, Zheng  
> **Author**:: Geiger, Atticus  
> **Author**:: Jurafsky, Dan  
> **Author**:: Manning, Christopher D.  
> **Author**:: Potts, Christopher  
~    
> **Title**:: "ReFT: Representation Finetuning for Language Models"  
> **Date**:: 2024-04-07  
> **Citekey**:: Wu24fineLLMtuneReFTR  
> **ZoteroItemKey**:: 5H6NTJCI  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2404.03592  
> **URL**:: http://arxiv.org/abs/2404.03592  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: hasCode, todo, obsLitNote
>**Related**:: 

> Wu, Zhengxuan, et al. _ReFT: Representation Finetuning for Language Models_. arXiv:2404.03592, arXiv, 7 Apr. 2024. _arXiv.org_, [https://doi.org/10.48550/arXiv.2404.03592](https://doi.org/10.48550/arXiv.2404.03592).
%% begin Obsidian Notes %%
___
One type of fine tuning, although maybe it's about steering?

A standard way of fine tuning is to manipulate the MLP weights (coefficients) of a trained LLM (PEFT); in this paper, a low rank subspace of the representations is manipulated instead.  This requires 10x-50x params. Has python

Introduction links to papers on causal explainability, and algorithmic steering during inference (this paper itself is about steering).  

Fig 4 might be a good graph showing how fine tuning can improve results on different applications. <span style="color:#c00000">There is no Fig 4</span>.  Did I type the above into the wrong place?

Comment: 40 pages, preprint
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Wu24fineLLMtuneReFTR
> 
> Introduction links to papers on causal explainability, and algorithmic steering during inference (this paper itself is about steering).  Fig 4 might be a good graph showing how fine futning can improve results on different applications.
> 
> - TODO: look these up, b/c I’m weak on how causality works in LLMs ([causuaLens, 2023](zotero://select/library/items/R5FX68SQ); Liu et al., 2024; Dynatrace, 2024; causuaLens, 2023), and also on steering
> - Has a python lib
> 
> Comment: 40 pages, preprint
> 
> <small>📝️ (modified: 2024-04-13) [link](zotero://select/library/items/2KLT66D3) - [web](http://zotero.org/users/60638/items/2KLT66D3)</small>
>  
> ---




%% Import Date: 2024-04-13T19:58:45.097-07:00 %%
