---
category: literaturenote
tags: 
citekey: Piao24transFrmrFreqBiasFredFormer
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "Fredformer: Frequency Debiased Transformer for Time Series Forecasting"
  - "Fredformer: Frequency Debiased Transformer for"
publisher: ""
citation key: Piao24transFrmrFreqBiasFredFormer
DOI: 10.1145/3637528.3671928
created date: 2024-07-12T11:50:43-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/4HASJUUJ)  | [**DOI**](https://doi.org/10.1145/3637528.3671928)  | [**URL**](http://arxiv.org/abs/2406.09009) | [[Piao24transFrmrFreqBiasFredFormer.pdf|PDF]]
>
> 
> **Abstract**
> The Transformer model has shown leading performance in time series forecasting. Nevertheless, in some complex scenarios, it tends to learn low-frequency features in the data and overlook high-frequency features, showing a frequency bias. This bias prevents the model from accurately capturing important high-frequency data features. In this paper, we undertook empirical analyses to understand this bias and discovered that frequency bias results from the model disproportionately focusing on frequency features with higher energy. Based on our analysis, we formulate this bias and propose Fredformer, a Transformer-based framework designed to mitigate frequency bias by learning features equally across different frequency bands. This approach prevents the model from overlooking lower amplitude features important for accurate forecasting. Extensive experiments show the effectiveness of our proposed approach, which can outperform other baselines in different real-world time-series datasets. Furthermore, we introduce a lightweight variant of the Fredformer with an attention matrix approximation, which achieves comparable performance but with much fewer parameters and lower computation costs. The code is available at: https://github.com/chenzRG/Fredformer
> 
> 
> **FirstAuthor**:: Piao, Xihao  
> **Author**:: Chen, Zheng  
> **Author**:: Murayama, Taichi  
> **Author**:: Matsubara, Yasuko  
> **Author**:: Sakurai, Yasushi  
~    
> **Title**:: "Fredformer: Frequency Debiased Transformer for Time Series Forecasting"  
> **Date**:: 2024-07-03  
> **Citekey**:: Piao24transFrmrFreqBiasFredFormer  
> **ZoteroItemKey**:: 4HASJUUJ  
> **itemType**:: preprint  
> **DOI**:: 10.1145/3637528.3671928  
> **URL**:: http://arxiv.org/abs/2406.09009  
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

> Piao, Xihao, et al. _Fredformer: Frequency Debiased Transformer for Time Series Forecasting_. 3 July 2024. _arXiv.org_, [https://doi.org/10.1145/3637528.3671928](https://doi.org/10.1145/3637528.3671928).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Piao24transFrmrFreqBiasFredFormer
> 
> Standard transformers are biased towards captuing low freq signals; the reason is that they have high energy.  This model aims to fix that.  Has code, and a lighter weight version of this algorithm.
> 
> Comment: This paper has been accepted by SIGKDD2024
> 
> <small>📝️ (modified: 2024-07-12) [link](zotero://select/library/items/99K4K4NU) - [web](http://zotero.org/users/60638/items/99K4K4NU)</small>
>  
> ---




%% Import Date: 2024-07-12T11:51:06.629-07:00 %%
