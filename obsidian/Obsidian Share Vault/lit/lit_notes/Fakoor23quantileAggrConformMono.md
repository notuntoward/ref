---
category: literaturenote
tags: 
citekey: Fakoor23quantileAggrConformMono
status: unread
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - Flexible Model Aggregation for Quantile Regression
  - Flexible Model Aggregation for Quantile
publisher: Journal of Machine Learning Research
citation key: Fakoor23quantileAggrConformMono
DOI: ""
"created date:": 2024-08-13T11:46:20-07:00
modified date: 2024-08-13T11:54:12-07:00
created date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/JF74CYT5)   | [**URL**](http://jmlr.org/papers/v24/22-0799.html) | [[Fakoor23quantileAggrConformMono.pdf|PDF]]
>
> 
> **Abstract**
> Quantile regression is a fundamental problem in statistical learning motivated by a need to quantify uncertainty in predictions, or to model a diverse population without being overly reductive. For instance, epidemiological forecasts, cost estimates, and revenue predictions all benefit from being able to quantify the range of possible values accurately. As such, many models have been developed for this problem over many years of research in statistics, machine learning, and related fields. Rather than proposing yet another (new) algorithm for quantile regression we adopt a meta viewpoint: we investigate methods for aggregating any number of conditional quantile models, in order to improve accuracy and robustness. We consider weighted ensembles where weights may vary over not only individual models, but also over quantile levels, and feature values. All of the models we consider in this paper can be fit using modern deep learning toolkits, and hence are widely accessible (from an implementation point of view) and scalable. To improve the accuracy of the predicted quantiles (or equivalently, prediction intervals), we develop tools for ensuring that quantiles remain monotonically ordered, and apply conformal calibration methods. These can be used without any modification of the original library of base models. We also review some basic theory surrounding quantile aggregation and related scoring rules, and contribute a few new results to this literature (for example, the fact that post sorting or post isotonic regression can only improve the weighted interval score). Finally, we provide an extensive suite of empirical comparisons across 34 data sets from two different benchmark repositories.
> 
> 
> **FirstAuthor**:: Fakoor, Rasool  
> **Author**:: Kim, Taesup  
> **Author**:: Mueller, Jonas  
> **Author**:: Smola, Alexander J.  
> **Author**:: Tibshirani, Ryan J.  
~    
> **Title**:: "Flexible Model Aggregation for Quantile Regression"  
> **Date**:: 2023-01-01  
> **Citekey**:: Fakoor23quantileAggrConformMono  
> **ZoteroItemKey**:: JF74CYT5  
> **itemType**:: journalArticle  
> **DOI**::   
> **URL**:: http://jmlr.org/papers/v24/22-0799.html  
> **Journal**:: Journal of Machine Learning Research  
> **Volume**:: 24  
> **Issue**:: 162  
> **Book**:: Journal of Machine Learning Research  
> **Publisher**::   
> **Location**::    
> **Pages**:: 1-45  
> **ISBN**::   
> **ZoteroTags**:: todo, obsLitNote
> **Related**:: 

> Fakoor, Rasool, et al. “Flexible Model Aggregation for Quantile Regression.” _Journal of Machine Learning Research_, vol. 24, no. 162, 2023, pp. 1–45.
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==

Interesting because:

- discusses combining separate QR forecasts, improving accuracy
- how to ensure cdf monotonicity (useful for copula if nothing else)
- isotonic regression:[[Parzen62estProbDenseModePAVA]]
- some conformal stuff that might be multi-quantile, since they’re worried about monotonicity
- is focused on deep learning but says techniques can be applied on other models.
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Fakoor23quantileAggrConformMono
> 
> Interesting because:
> 
> - discusses combining separate QR forecasts, improving accuracy
> - how to ensure cdf montonicity (useful for copula if nothing else)
> - isotonic regression
> - some conformal stuff that might be multi-quantile, since they’re worried about monotonicity
> - is focused on deep learning but says techniques can be applied on other models.
> 
> <small>📝️ (modified: 2024-08-03) [link](zotero://select/library/items/M7S3S43I) - [web](http://zotero.org/users/60638/items/M7S3S43I)</small>
>  
> ---




%% Import Date: 2024-08-13T11:46:37.365-07:00 %%
