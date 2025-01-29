---
category: literaturenote
tags:
  - ml/genAI
citekey: Davidson23improveAInoExpensTrain
status:
  - ?read
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - AI capabilities can be significantly improved without expensive retraining
  - AI capabilities can be significantly
publisher: ""
citation key: Davidson23improveAInoExpensTrain
DOI: 10.48550/arXiv.2312.07413
created date: 2024-04-12T18:44:27-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/XNHNWRDB)  | [**DOI**](https://doi.org/10.48550/arXiv.2312.07413)  | [**URL**](http://arxiv.org/abs/2312.07413) | [[Davidson23AICapabilitiesCan.pdf|PDF]]
>
> 
> **Abstract**
> State-of-the-art AI systems can be significantly improved without expensive retraining via "post-training enhancements"-techniques applied after initial training like fine-tuning the system to use a web browser. We review recent post-training enhancements, categorizing them into five types: tool-use, prompting methods, scaffolding, solution selection, and data generation. Different enhancements improve performance on different tasks, making it hard to compare their significance. So we translate improvements from different enhancements into a common currency, the compute-equivalent gain: how much additional training compute would be needed to improve performance by the same amount as the enhancement. Our non-experimental work shows that post-training enhancements have significant benefits: most surveyed enhancements improve benchmark performance by more than a 5x increase in training compute, some by more than 20x. Post-training enhancements are relatively cheap to develop: fine-tuning costs are typically <1% of the original training cost. Governing the development of capable post-training enhancements may be challenging because frontier models could be enhanced by a wide range of actors.
> 
> 
> **FirstAuthor**:: Davidson, Tom  
> **Author**:: Denain, Jean-Stanislas  
> **Author**:: Villalobos, Pablo  
> **Author**:: Bas, Guillem  
~    
> **Title**:: "AI capabilities can be significantly improved without expensive retraining"  
> **Date**:: 2023-12-12  
> **Citekey**:: Davidson23improveAInoExpensTrain  
> **ZoteroItemKey**:: XNHNWRDB  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2312.07413  
> **URL**:: http://arxiv.org/abs/2312.07413  
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

> Davidson, Tom, et al. _AI Capabilities Can Be Significantly Improved without Expensive Retraining_. arXiv:2312.07413, arXiv, 12 Dec. 2023. _arXiv.org_, [https://doi.org/10.48550/arXiv.2312.07413](https://doi.org/10.48550/arXiv.2312.07413).
%% begin Obsidian Notes %%
___

Fine-Tuning typically take < 1% of original training cost, and the resulting performance gains are far cheaper than what it would have taken to invest in more compute in the original training run: 5-10X better for the same investment.

Many techniques get large performance gain (compute equivalent gain) for a tiny fraction training time for fine tuning; and small or increase in inference time.

## InstructGPT
- [[Davidson23AICapabilitiesCan.pdf#page=18&annotation=3525R|especially effective]]
- approx 0.3% tuning cost; 
- > 100 X performance gain; 
- zero increase in inference
- 2 steps: 
	- train on humans following instructions: 0.1%
	- then reward for good human comparisons between generated responses: 0.2%

Many other tuning approaches.  See dots on top of Figure 2.

Conclusion is that non-state actors with small budgets will be able to generate very sophisticated algorithms (Didn’t the EU AI Act ([Yamimova and Ojamo, 2024](zotero://select/library/items/MHF9CJG8)), limit compute power somehow to prevent AI terrorism?  I read/heard this on a video or article somewhere but didn’t follow up on it.

TODO: What is different about the fine-tuning that couldn’t have been done during the initial train?  From the table discussed below, it seems to be that the 1st trainings are general purpose, and the fine-tunings are special purpose.

##### attached webpage capture from [here](https://epochai.org/blog/ai-capabilities-can-be-significantly-improved-without-expensive-retraining), which references his paper has

- a nice table showing fine-tuning algorithm options in Dec. 2023 (I think)
- some confusing graphs

Comment: 30 pages, 24 figures
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Davidson23improveAInoExpensTrain
> 
> Fine-Tuning typically take < 1% of original training cost, and the resulting performance gains are far cheaper than what it would have taken to invest in more compute in the original training run: 5-10X better for the same investment.
> 
> Conclusion is that non-state actors with small budgets will be able to generate very sophisticated algorithms (Didn’t the EU AI Act ([Yamimova and Ojamo, 2024](zotero://select/library/items/MHF9CJG8)), limit compute power somehow to prevent AI terrorism?  I read/heard this on a video or article somewhere but didin’t follow up on it.
> 
> TODO: What is different about the fine-tuning that couldn’t have been done during the initial train?  From the table discussed below, it seems to be that the 1st trainigs are general purpose, and the fine-tunings are special purpose.
> 
> ##### attached webpage capture from [here](https://epochai.org/blog/ai-capabilities-can-be-significantly-improved-without-expensive-retraining), which references his paper has
> 
> - a nice table showing fine-tuning algorithm options in Dec. 2023 (I htink)
> - some confusing graphs
> 
> Comment: 30 pages, 24 figures
> 
> <small>📝️ (modified: 2024-04-11) [link](zotero://select/library/items/WW2KVGGB) - [web](http://zotero.org/users/60638/items/WW2KVGGB)</small>
>  
> ---




%% Import Date: 2024-04-12T18:47:25.482-07:00 %%
