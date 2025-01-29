---
category: literaturenote
tags:
  - forecasting
  - ml/KAN
  - hasCode
  - interpretability
citekey: Peixeiro24tsFrcstKAN
status:
  - read
dateread: 
ZoteroTags: hasCode, obsLitNote
aliases:
  - Kolmogorov-Arnold Networks (KANs) for Time Series Forecasting
  - Kolmogorov-Arnold Networks (KANs) for Time
publisher: ""
citation key: Peixeiro24tsFrcstKAN
DOI: ""
created date: 2024-09-15T09:49:39-07:00
modified date: 2024-09-15T09:49:39-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/KHF2ADZE)   | [**URL**](https://towardsdatascience.com/kolmogorov-arnold-networks-kans-for-time-series-forecasting-9d49318c3172) | [[Peixeiro24tsFrcstKAN.pdf|PDF]]
>
> 
> **Abstract**
> Discover the Kolmogorov-Arnold Networks (KANs) and apply them for time series forecasting using Python
> 
> 
> **FirstAuthor**:: Peixeiro, Marco  
~    
> **Title**:: "Kolmogorov-Arnold Networks (KANs) for Time Series Forecasting"  
> **Date**:: 2024-05-14  
> **Citekey**:: Peixeiro24tsFrcstKAN  
> **ZoteroItemKey**:: KHF2ADZE  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://towardsdatascience.com/kolmogorov-arnold-networks-kans-for-time-series-forecasting-9d49318c3172  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: hasCode, obsLitNote
> **Related**:: 

> Peixeiro, Marco. “Kolmogorov-Arnold Networks (KANs) for Time Series Forecasting.” _Medium_, 14 May 2024, [https://towardsdatascience.com/kolmogorov-arnold-networks-kans-for-time-series-forecasting-9d49318c3172](https://towardsdatascience.com/kolmogorov-arnold-networks-kans-for-time-series-forecasting-9d49318c3172).
%% begin Obsidian Notes %%
___

In what seems to be a cursory test, plain [[Liu24kolmogArnoldKAN|KAN]] is best for hourly forecasting, but is worse on most standard forecasting tasks: plain MLP is a little better, and better yet are fancier MLP-based algorithms like NBEATS or NHITS ([[Manokhin23worksTSfrcstNixtla]]). However KAN has far fewer params, and guy thinks if KAN has a forecasting future, it would be embedded in algorithms like [[Oreshkin20neuraBasisFrcstNBEATS|NBEATS]] or [NHITS](Challu22NHiTSNeuralHierarchical).  

- @ **IDEA** or embedded inside of [[Contextual Optimization]]

The code implementing these tests is in [this branch](https://github.com/Nixtla/neuralforecast/tree/feature/kan-experiment), which may eventually be merged to [here](https://github.com/marcopeix/time-series-analysis/blob/master/kan-blog.ipynb). Also some forecasting infra libs I should check out.

# KAN has Best Hourly Result

![[Peixeiro24tsFrcstKAN.pdf#page=16&rect=43,59,564,82&color=note]]
- [[Peixeiro24tsFrcstKAN.pdf#page=17&annotation=818R|best performance on the hourly M4]]
- 2nd place was NHITS, which in [[Manokhin23worksTSfrcstNixtla]], was also 2nd place, but to LGBM.  Hard to say, but LGBM might have been better than KAN by more than KAN is better than NHITS, here.
# Parameterization 
- it doesn't seem like the author did much hyperparameter tuning?  
- Guy says that KAN has 75% fewer params than MLP but do either have optimal # params?  
# Forecasting libs
- [[Peixeiro24tsFrcstKAN.pdf#page=10&annotation=777R|Pytorch implementation of KAN]] (Efficient KAN but [[Liu24kolmogArnoldKAN#Follow-on KAN work|FastKAN is faster]])
- [[Peixeiro24tsFrcstKAN.pdf#page=14&annotation=783R|utilsforecast]]: it's [part of Nixtla](https://github.com/Nixtla/utilsforecast)
- [[Peixeiro24tsFrcstKAN.pdf#page=10&annotation=774R|neuralforcast]]
- [[Peixeiro24tsFrcstKAN.pdf#page=12&annotation=780R|datasetsforecast]]: it's [part of Nixtla](https://github.com/Nixtla/datasetsforecast)

# Also
- [[VacaRubio24timeSeriesKAN]]
___
%% end Obsidian Notes %%



%% Import Date: 2024-05-17T08:53:40.343-07:00 %%
