---
category: literaturenote
tags: 
citekey: Bosse23scoreEpidFrcst
status: unread
dateread: 
ZoteroTags: ""
aliases:
  - Scoring epidemiological forecasts on transformed scales
  - Scoring epidemiological forecasts on transformed
publisher: PLOS Computational Biology
citation key: Bosse23scoreEpidFrcst
DOI: 10.1371/journal.pcbi.1011393
"created date:": 2024-07-31T19:05:36-07:00
"modified date:": 
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/3Q9LXI8M)  | [**DOI**](https://doi.org/10.1371/journal.pcbi.1011393)  | [**URL**](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1011393) | [[Bosse23scoreEpidFrcst.pdf|PDF]]
>
> 
> **Abstract**
> Forecast evaluation is essential for the development of predictive epidemic models and can inform their use for public health decision-making. Common scores to evaluate epidemiological forecasts are the Continuous Ranked Probability Score (CRPS) and the Weighted Interval Score (WIS), which can be seen as measures of the absolute distance between the forecast distribution and the observation. However, applying these scores directly to predicted and observed incidence counts may not be the most appropriate due to the exponential nature of epidemic processes and the varying magnitudes of observed values across space and time. In this paper, we argue that transforming counts before applying scores such as the CRPS or WIS can effectively mitigate these difficulties and yield epidemiologically meaningful and easily interpretable results. Using the CRPS on log-transformed values as an example, we list three attractive properties: Firstly, it can be interpreted as a probabilistic version of a relative error. Secondly, it reflects how well models predicted the time-varying epidemic growth rate. And lastly, using arguments on variance-stabilizing transformations, it can be shown that under the assumption of a quadratic mean-variance relationship, the logarithmic transformation leads to expected CRPS values which are independent of the order of magnitude of the predicted quantity. Applying a transformation of log(x + 1) to data and forecasts from the European COVID-19 Forecast Hub, we find that it changes model rankings regardless of stratification by forecast date, location or target types. Situations in which models missed the beginning of upward swings are more strongly emphasised while failing to predict a downturn following a peak is less severely penalised when scoring transformed forecasts as opposed to untransformed ones. We conclude that appropriate transformations, of which the natural logarithm is only one particularly attractive option, should be considered when assessing the performance of different models in the context of infectious disease incidence.
> 
> 
> **FirstAuthor**:: Bosse, Nikos I.  
> **Author**:: Abbott, Sam  
> **Author**:: Cori, Anne  
> **Author**:: Leeuwen, Edwin van  
> **Author**:: Bracher, Johannes  
> **Author**:: Funk, Sebastian  
~    
> **Title**:: "Scoring epidemiological forecasts on transformed scales"  
> **Date**:: 2023-08-29  
> **Citekey**:: Bosse23scoreEpidFrcst  
> **ZoteroItemKey**:: 3Q9LXI8M  
> **itemType**:: journalArticle  
> **DOI**:: 10.1371/journal.pcbi.1011393  
> **URL**:: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1011393  
> **Journal**:: PLOS Computational Biology  
> **Volume**:: 19  
> **Issue**:: 8  
> **Book**:: PLOS Computational Biology  
> **Publisher**::   
> **Location**::    
> **Pages**:: e1011393  
> **ISBN**::   
> **ZoteroTags**:: 
> **Related**:: 

> Bosse, Nikos I., et al. “Scoring Epidemiological Forecasts on Transformed Scales.” _PLOS Computational Biology_, vol. 19, no. 8, Aug. 2023, p. e1011393. _PLoS Journals_, [https://doi.org/10.1371/journal.pcbi.1011393](https://doi.org/10.1371/journal.pcbi.1011393).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Bosse23scoreEpidFrcst
> 
> Exponential-in-nature epedidemiological forecasts should be somehow normalized before calculating CRPS/WIS.  The reason is the scale changes rapidly, and gives more weight to forecasts at high magnitude stages of an epedimic.  They use the log transform but suggest other transforms would be OK too.
> 
> Such normalization changes model ranking based on CRPS/WIS more severely penalizing the missing of the start of an upswing, and less severly penalizing the missing of the start of the downswing.
> 
> See ([Tibshirani, 2023](zotero://select/library/items/YVMXLJMB)) for a discussion of CRPS and WIS.
> 
> <small>📝️ (modified: 2024-07-31) [link](zotero://select/library/items/NRBKCHAG) - [web](http://zotero.org/users/60638/items/NRBKCHAG)</small>
>  
> ---


## Annotations%% begin annotations %%



### Imported: 2024-07-31 7:05 pm



<mark style="background-color: #5c6bc0">Quote</mark>
> exponential nature of epidemic

<mark style="background-color: #5c6bc0">Quote</mark>
> varying magnitudes

<mark style="background-color: #5c6bc0">Quote</mark>
> transforming counts before

<mark style="background-color: #5c6bc0">Quote</mark>
> epidemiologically meaningful and easily interpretable results.

<mark style="background-color: #5c6bc0">Quote</mark>
> log-transformed

<mark style="background-color: #5c6bc0">Quote</mark>
> three attractive properties

<mark style="background-color: #5c6bc0">Quote</mark>
> probabilistic version of a relative error

<mark style="background-color: #5c6bc0">Quote</mark>
> how well models predicted the time-varying epidemic growth rate.

<mark style="background-color: #5c6bc0">Quote</mark>
> logarithmic transformation leads to expected CRPS values

<mark style="background-color: #5c6bc0">Quote</mark>
> changes model rankings

<mark style="background-color: #5c6bc0">Quote</mark>
> missed the beginning of upward swings are more strongly emphasised

<mark style="background-color: #5c6bc0">Quote</mark>
> failing to predict a downturn following a peak is less severely penalise

<mark style="background-color: #5c6bc0">Quote</mark>
> natural logarithm is only one


> exponential nature of epidemic


> varying magnitudes


> transforming counts before


> epidemiologically meaningful and easily interpretable results.


> log-transformed


> three attractive properties:


> probabilistic version of a relative error.


> how well models predicted the time-varying epidemic growth rate.


> logarithmic transformation leads to expected CRPS values


> changes model rankings


> missed the beginning of upward swings are more strongly emphasised


> failing to predict a downturn following a peak is less severely penalised


> natural logarithm is only one


%% end annotations %%



%% Import Date: 2024-07-31T19:06:30.547-07:00 %%
