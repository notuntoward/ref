---
category: literaturenote
tags:
  - forecasting/prob
  - ml/conformalPred
citekey: Parzen62estProbDenseModePAVA
status:
  - unread
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - On estimation of a probability density function and mode
  - On estimation of a probability
publisher: The annals of mathematical statistics
citation key: Parzen62estProbDenseModePAVA
DOI: ""
"created date:": 2024-08-13T11:46:20-07:00
modified date: 2024-08-13T11:53:59-07:00
created date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/GZUM5WLX)   | [**URL**](https://www.jstor.org/stable/2237880) | [[Parzen62estProbDenseModePAVA.pdf|PDF]]
>
> 
> 
> **FirstAuthor**:: Parzen, Emanuel  
~    
> **Title**:: "On estimation of a probability density function and mode"  
> **Date**:: 1962-01-01  
> **Citekey**:: Parzen62estProbDenseModePAVA  
> **ZoteroItemKey**:: GZUM5WLX  
> **itemType**:: journalArticle  
> **DOI**::   
> **URL**:: https://www.jstor.org/stable/2237880  
> **Journal**:: The annals of mathematical statistics  
> **Volume**:: 33  
> **Issue**:: 3  
> **Book**:: The annals of mathematical statistics  
> **Publisher**::   
> **Location**::    
> **Pages**:: 1065–1076  
> **ISBN**::   
> **ZoteroTags**:: todo, obsLitNote
> **Related**:: 

> Parzen, Emanuel. “On Estimation of a Probability Density Function and Mode.” _The Annals of Mathematical Statistics_, vol. 33, no. 3, 1962, pp. 1065–76.
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==

PAVA is an O(n) algorithm for enforcing montonicity on fitted values, e.g. estimated quantiles.  This can be used as a QR postprocessing step.  It will be WAY faster than the optimizer calls I used for enforcing montonicity, way back at IWES.

It’s an example of isotonic regression, and Perplexity says it’s implemented in sklearn.isotonic.IsotonicRegression

Perplexity thinks this paper is a good refeence for PAVA

[[Fakoor23quantileAggrConformMono]] seems to use this to fix up quantile forecasts.
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Parzen62estProbDenseModePAVA
> 
> PAVA is an O(n) algorithm for enforcing montonicity on fitted values, e.g. estimated quantiles.  This can be used as a QR postprocessing step.  It will be WAY faster than the optimizer calls I used for enforcing montonicity, way back at IWES.
> 
> It’s an example of isotonic regression, and [Perplexity says](https://www.perplexity.ai/search/can-conformal-quantile-regress-KOOwapTiTtetET8qC4QXuQ#6) it’s implemented in `sklearn.isotonic.IsotonicRegression`
> 
> [Perplexity thinks](https://www.perplexity.ai/search/can-conformal-quantile-regress-KOOwapTiTtetET8qC4QXuQ#5) this paper is a good refeence for PAVA
> 
> <small>📝️ (modified: 2024-08-01) [link](zotero://select/library/items/ZZREHISK) - [web](http://zotero.org/users/60638/items/ZZREHISK)</small>
>  
> ---




%% Import Date: 2024-08-13T11:46:37.337-07:00 %%
