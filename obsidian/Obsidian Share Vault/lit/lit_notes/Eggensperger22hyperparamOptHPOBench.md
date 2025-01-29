---
category: literaturenote
tags:
  - ml/hyperparamTune
  - hasCode
citekey: Eggensperger22hyperparamOptHPOBench
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "HPOBench: A Collection of Reproducible Multi-Fidelity Benchmark Problems for HPO"
  - "HPOBench: A Collection of Reproducible"
publisher: ""
citation key: Eggensperger22hyperparamOptHPOBench
DOI: ""
created date: 2024-11-18T20:14:09-08:00
modified date: 2024-11-18T20:14:09-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/3J4ZKR9H)   | [**URL**](http://arxiv.org/abs/2109.06716) | [[Eggensperger22hyperparamOptHPOBench.pdf|PDF]]
>
> 
> **Abstract**
> To achieve peak predictive performance, hyperparameter optimization (HPO) is a crucial component of machine learning and its applications. Over the last years, the number of efficient algorithms and tools for HPO grew substantially. At the same time, the community is still lacking realistic, diverse, computationally cheap, and standardized benchmarks. This is especially the case for multi-fidelity HPO methods. To close this gap, we propose HPOBench, which includes 7 existing and 5 new benchmark families, with a total of more than 100 multi-fidelity benchmark problems. HPOBench allows to run this extendable set of multi-fidelity HPO benchmarks in a reproducible way by isolating and packaging the individual benchmarks in containers. It also provides surrogate and tabular benchmarks for computationally affordable yet statistically sound evaluations. To demonstrate HPOBench's broad compatibility with various optimization tools, as well as its usefulness, we conduct an exemplary large-scale study evaluating 13 optimizers from 6 optimization tools. We provide HPOBench here: https://github.com/automl/HPOBench.
> 
> 
> **FirstAuthor**:: Eggensperger, Katharina  
> **Author**:: Müller, Philipp  
> **Author**:: Mallik, Neeratyoy  
> **Author**:: Feurer, Matthias  
> **Author**:: Sass, René  
> **Author**:: Klein, Aaron  
> **Author**:: Awad, Noor  
> **Author**:: Lindauer, Marius  
> **Author**:: Hutter, Frank  
~    
> **Title**:: "HPOBench: A Collection of Reproducible Multi-Fidelity Benchmark Problems for HPO"  
> **Date**:: 2022-10-06  
> **Citekey**:: Eggensperger22hyperparamOptHPOBench  
> **ZoteroItemKey**:: 3J4ZKR9H  
> **itemType**:: preprint  
> **DOI**::   
> **URL**:: http://arxiv.org/abs/2109.06716  
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

> Eggensperger, Katharina, et al. _HPOBench: A Collection of Reproducible Multi-Fidelity Benchmark Problems for HPO_. arXiv:2109.06716, arXiv, 6 Oct. 2022. _arXiv.org_, [http://arxiv.org/abs/2109.06716](http://arxiv.org/abs/2109.06716).
%% begin Obsidian Notes %%
___

HB is still respectable, but for medium budgets SMAC-HB seems like a winner (if low budget assumptions are met), and should be about as good as blackbox for high budgets.

This paper introduces a new set of benchmark data for hyperparameter optimization problems.  Also compares current algorithms and draws the conclusion that multi-fidelity algorithms have an advantage, except for at very long compute times, where black box Bayesian Optimization (RF-based) and Differential Evolution are competitive and, in at least one case, can beat multi-fidelity variants.  They're all better than random search.
# Other Conclusions
- Hyperband (HB) still respectable: [[Eggensperger22hyperparamOptHPOBench.pdf#page=8&annotation=1662R|only two out of four methods multi-fidelity methods are signiﬁcantly better than HB]]
- [[Eggensperger22hyperparamOptHPOBench.pdf#page=10&annotation=3414R|DEHB and SMAC-HB are reliable and generable multi-ﬁdelity methods]]
	- I guess these are the ones that outperform HB
	- assuming low budget runs represent true relative performance
- Black box competitive [[Eggensperger22hyperparamOptHPOBench.pdf#page=9&annotation=2718R|when lots of budget]]: then, [[Eggensperger22hyperparamOptHPOBench.pdf#page=10&annotation=2726R|DE and BO_RF (random forest) are the most competitive]]
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Comment: Published at NeurIPS Datasets and Benchmarks Track 2021. Updated version
> 
> <small>📝️ (modified: 2024-06-14) [link](zotero://select/library/items/2Q3MTY2A) - [web](http://zotero.org/users/60638/items/2Q3MTY2A)</small>
>  
> ---




%% Import Date: 2024-06-14T13:09:47.460-07:00 %%
