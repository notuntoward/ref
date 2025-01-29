---
category: literaturenote
tags:
  - ml/genAI
citekey: Raposo24mixDepthCmputTrnsfrmrLLM
status:
  - ?read
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - "Mixture-of-Depths: Dynamically allocating compute in transformer-based language models"
  - "Mixture-of-Depths: Dynamically allocating compute in"
publisher: ""
citation key: Raposo24mixDepthCmputTrnsfrmrLLM
DOI: ""
created date: 2024-04-13T19:57:31-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/9YTRI65K)   | [**URL**](https://arxiv.org/abs/2404.02258v1) | [[Raposo24mixDepthCmputTrnsfrmrLLM.pdf|PDF]]
>
> 
> **Abstract**
> Transformer-based language models spread FLOPs uniformly across input sequences. In this work we demonstrate that transformers can instead learn to dynamically allocate FLOPs (or compute) to specific positions in a sequence, optimising the allocation along the sequence for different layers across the model depth. Our method enforces a total compute budget by capping the number of tokens ($k$) that can participate in the self-attention and MLP computations at a given layer. The tokens to be processed are determined by the network using a top-$k$ routing mechanism. Since $k$ is defined a priori, this simple procedure uses a static computation graph with known tensor sizes, unlike other conditional computation techniques. Nevertheless, since the identities of the $k$ tokens are fluid, this method can expend FLOPs non-uniformly across the time and model depth dimensions. Thus, compute expenditure is entirely predictable in sum total, but dynamic and context-sensitive at the token-level. Not only do models trained in this way learn to dynamically allocate compute, they do so efficiently. These models match baseline performance for equivalent FLOPS and wall-clock times to train, but require a fraction of the FLOPs per forward pass, and can be upwards of 50\% faster to step during post-training sampling.
> 
> 
> **FirstAuthor**:: Raposo, David  
> **Author**:: Ritter, Sam  
> **Author**:: Richards, Blake  
> **Author**:: Lillicrap, Timothy  
> **Author**:: Humphreys, Peter Conway  
> **Author**:: Santoro, Adam  
~    
> **Title**:: "Mixture-of-Depths: Dynamically allocating compute in transformer-based language models"  
> **Date**:: 2024-04-02  
> **Citekey**:: Raposo24mixDepthCmputTrnsfrmrLLM  
> **ZoteroItemKey**:: 9YTRI65K  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://arxiv.org/abs/2404.02258v1  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: todo, obsLitNote
>**Related**:: 

> Raposo, David, et al. “Mixture-of-Depths: Dynamically Allocating Compute in Transformer-Based Language Models.” _arXiv.Org_, 2 Apr. 2024, [https://arxiv.org/abs/2404.02258v1](https://arxiv.org/abs/2404.02258v1).
%% begin Obsidian Notes %%
___

A way of constraining compute cost by dynamically selecting only certain tokens from participating in forward pass.  Other ideas like Mixture of Experts pick blocks or MLPs to run (I think).

This paper proposes this only for inference.

In talk, could be used as a technique for reducing model power consumption (I think), in addition to TPU’s etc.
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Raposo24mixDepthCmputTrnsfrmrLLM
> 
> A way of constraining compute cost by dynamically selecting only certain tokens from participating in forward pass.  Other ideas like Mixture of Experts pick blocks or MLPs to run (I think).
> 
> Not sure if this reduces comp during training, inference, or both.
> 
> In talk, could be used as a technique for reducing model power consumption (I think), in addition to TPU’s etc.
> 
> <small>📝️ (modified: 2024-04-13) [link](zotero://select/library/items/2BPTKEWV) - [web](http://zotero.org/users/60638/items/2BPTKEWV)</small>
>  
> ---




%% Import Date: 2024-04-13T19:58:45.068-07:00 %%
