---
category: literaturenote
tags: 
citekey: Althoff23conformWindFrcst
status: unread
dateread: 
ZoteroTags: ""
aliases:
  - Evaluation of conformal-based probabilistic forecasting methods for short-term wind speed forecasting
  - Evaluation of conformal-based probabilistic forecasting
publisher: ""
citation key: Althoff23conformWindFrcst
DOI: ""
"created date:": 2024-07-31T18:40:21-07:00
"modified date:": 
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/YXACXDJT)   | [**URL**](https://proceedings.mlr.press/v204/althoff23a.html) | [[Althoff23conformWindFrcst.pdf|PDF]]
>
> 
> **Abstract**
> We apply Conformal Predictive Distribution Systems  (CPDS) and a non-exchangeable version of the  traditional Conformal Prediction (NECP) method to  short-term wind speed forecasting to generate  probabilistic forecasts. These are compared to the  more traditional Quantile Regression Forest (QRF)  method. A short-term forecast is available from a  few hours before the forecasted time period and is  only extended a couple days into the future.  The  methods are supplied ensemble forecasts as input and  additionally the Conformal methods are supplied with  post-processed point forecasts for generating the  probability distributions. In the NECP case we  propose a method of producing probability  distributions by creating sequentially larger  prediction intervals. The methods are compared  through a teaching schedule, to mimic a real-world  setting. For each model update in the teaching  schedule a grid-search approach is applied to select  each method’s optimal hyperparameters, respectively.  The methods are tested out of the box with tweaks to  few hyperparameters. We also introduce a normalized  nonconformity score and use it with the conformal  method that handles data that violates the  exchangeability assumption. The resulting  probability distributions are compared to actual  wind measurements through Continuous Ranked  Probability Scores (CRPS) as well as their validity  and efficiency of certain prediction intervals.  Our  results suggest that the conformal based methods,  with the pre-trained underlying model, produce  slightly more conservative but more efficient  probability distributions than QRF at a lower  computational cost. We further propose how the  conformal-based methods could be improved for the  application to real-world scenarios.
> 
> 
> **FirstAuthor**:: Althoff, Simon  
> **Author**:: Szabadv’ary, Johan Hallberg  
> **Author**:: Anderson, Jonathan  
> **Author**:: Carlsson, Lars  
~    
> **Title**:: "Evaluation of conformal-based probabilistic forecasting methods for short-term wind speed forecasting"  
> **Date**:: 2023-08-17  
> **Citekey**:: Althoff23conformWindFrcst  
> **ZoteroItemKey**:: YXACXDJT  
> **itemType**:: conferencePaper  
> **DOI**::   
> **URL**:: https://proceedings.mlr.press/v204/althoff23a.html  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**:: PMLR  
> **Location**::    
> **Pages**:: 100-115  
> **ISBN**::   
> **ZoteroTags**:: 
> **Related**:: 

> Althoff, Simon, et al. “Evaluation of Conformal-Based Probabilistic Forecasting Methods for Short-Term Wind Speed Forecasting.” _Proceedings of the Twelfth Symposium on Conformal  and Probabilistic Prediction with Applications_, PMLR, 2023, pp. 100–15. _proceedings.mlr.press_, [https://proceedings.mlr.press/v204/althoff23a.html](https://proceedings.mlr.press/v204/althoff23a.html).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Althoff23conformWindFrcst
> 
> Prob wind speed forecast that handles non-stationarity.  Conformal method is more conservative than baseline but more “efficient”.  Evaluation by CRPS, and full distribution is apparently estimated from coverage intervals.
> 
> I think.  Must read.
> 
> <small>📝️ (modified: 2024-03-18) [link](zotero://select/library/items/S5BQVI7L) - [web](http://zotero.org/users/60638/items/S5BQVI7L)</small>
>  
> ---




%% Import Date: 2024-07-31T18:42:54.015-07:00 %%
