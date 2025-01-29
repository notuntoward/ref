---
category: literaturenote
tags:
  - ml/hyperparamTune
citekey: Akiba19OptunaHyperparamOpt
status:
  - unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "Optuna: A Next-generation Hyperparameter Optimization Framework"
  - "Optuna: A Next-generation Hyperparameter Optimization"
publisher: ""
citation key: Akiba19OptunaHyperparamOpt
DOI: 10.1145/3292500.3330701
created date: 2024-12-03T10:23:20-08:00
modified date: 2024-12-03T10:23:20-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/7U3Z7APN)  | [**DOI**](https://doi.org/10.1145/3292500.3330701)  | [**URL**](https://dl.acm.org/doi/10.1145/3292500.3330701) | [[Akiba19OptunaHyperparamOpt.pdf|PDF]]
>
> 
> 
> **FirstAuthor**:: Akiba, Takuya  
> **Author**:: Sano, Shotaro  
> **Author**:: Yanase, Toshihiko  
> **Author**:: Ohta, Takeru  
> **Author**:: Koyama, Masanori  
~    
> **Title**:: "Optuna: A Next-generation Hyperparameter Optimization Framework"  
> **Date**:: 2019-07-25  
> **Citekey**:: Akiba19OptunaHyperparamOpt  
> **ZoteroItemKey**:: 7U3Z7APN  
> **itemType**:: conferencePaper  
> **DOI**:: 10.1145/3292500.3330701  
> **URL**:: https://dl.acm.org/doi/10.1145/3292500.3330701  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**:: ACM  
> **Location**:: Anchorage AK USA   
> **Pages**:: 2623-2631  
> **ISBN**:: 978-1-4503-6201-6  
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Akiba, Takuya, et al. “Optuna: A Next-Generation Hyperparameter Optimization Framework.” _Proceedings of the 25th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining_, ACM, 2019, pp. 2623–31. _DOI.org (Crossref)_, [https://doi.org/10.1145/3292500.3330701](https://doi.org/10.1145/3292500.3330701).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==

## Optuna and BOHB: don't do it?
- Optuna has [[Watanabe23undestandTPE|TPE]] and [[Li18HyperbandNovelBanditbased|Hyperband]] so it's ready to implement [[Falkner18hyperparamBOHB|BOHB]]
- [TPE is Optuna's default sampler for its Hyperband function](https://optuna.readthedocs.io/en/stable/reference/generated/optuna.pruners.HyperbandPruner.html), instead of the random sampler in the original [[Li18HyperbandNovelBanditbased|Hyperband]] paper.
- However, [optuna's TPE implementation has same bandwidth across dims: worse than if per-dim](https://github.com/optuna/optuna/issues/2871).
- this suggests that it would be [worse](https://github.com/optuna/optuna/issues/2871#issuecomment-1144056870) than both the original [[Falkner18libHpBandSter|HpBandSter]] and especially [[Lindauer22libSMAC3|SMAC3]]
## Also
- [[Ohta20hyperbandOptunaImplmt|How We Implement Hyperband in Optuna]]
___
%% end Obsidian Notes %%
%% Import Date: 2024-06-14T09:43:42.922-07:00 %%