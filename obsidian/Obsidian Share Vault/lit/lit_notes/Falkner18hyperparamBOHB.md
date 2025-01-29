---
category: literaturenote
tags:
  - ml/hyperparamTune
citekey: Falkner18hyperparamBOHB
status:
  - unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "BOHB: Robust and efficient hyperparameter optimization at scale"
  - "BOHB: Robust and efficient hyperparameter"
publisher: ""
citation key: Falkner18hyperparamBOHB
DOI: ""
created date: 2024-06-13T20:39:03-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/7RB3ZXEA)   | [**URL**](https://proceedings.mlr.press/v80/falkner18a.html) | [[Falkner18hyperparamBOHB.pdf|PDF]]
>
> 
> 
> **FirstAuthor**:: Falkner, Stefan  
> **Author**:: Klein, Aaron  
> **Author**:: Hutter, Frank  
~    
> **Title**:: "BOHB: Robust and efficient hyperparameter optimization at scale"  
> **Date**:: 2018-01-01  
> **Citekey**:: Falkner18hyperparamBOHB  
> **ZoteroItemKey**:: 7RB3ZXEA  
> **itemType**:: conferencePaper  
> **DOI**::   
> **URL**:: https://proceedings.mlr.press/v80/falkner18a.html  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**:: PMLR  
> **Location**::    
> **Pages**:: 1437–1446  
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Falkner, Stefan, et al. “BOHB: Robust and Efficient Hyperparameter Optimization at Scale.” _International Conference on Machine Learning_, PMLR, 2018, pp. 1437–46. _Google Scholar_, [https://proceedings.mlr.press/v80/falkner18a.html](https://proceedings.mlr.press/v80/falkner18a.html).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==

- BOHB is implemented in [[Akiba19OptunaHyperparamOpt|Optuna]] (can be implemented w/ extra code??)
	- but [[Akiba19OptunaHyperparamOpt#Optuna and BOHB: don't do it?|Optuna and BOHB: don't do it?]] (b/c Optuna's TPE bandwidth problems)
- Tips for using TPE: [[Watanabe23undestandTPE]]
- original TPE paper: [[Bergstra11hyperparmOptTPE]]
- Authors of 1st BOHB (unmaintained) implementation: [[Falkner18libHpBandSter|HpBandSter: a distributed hyperband implementation]]
	- But there, authors suggest that HpBandSter is superseded by [[Lindauer22libSMAC3|SMAC3: a versatile Bayesian optimization package for hyperparameter optimization]] or one other lib (which might be slightly less maintained?)
- BOHB [[Eggensperger22hyperparamOptHPOBench|with a random forest seems like the best]] multi-fidelity method, so maybe need to use that?
- Also [[Eggensperger22hyperparamOptHPOBench|SMAC-HB seems better than BHOB]].  Sounds like this must be implemented in [[Lindauer22libSMAC3|SMAC3: a versatile Bayesian optimization]]
___
%% end Obsidian Notes %%
%% Import Date: 2024-06-13T20:39:16.270-07:00 %%
