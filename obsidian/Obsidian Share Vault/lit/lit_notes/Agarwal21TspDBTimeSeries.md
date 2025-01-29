---
category: literaturenote
tags:
  - forecasting
  - hasCode
citekey: Agarwal21TspDBTimeSeries
status:
  - unread
dateread: 
ZoteroTags: obsLitNOte
aliases:
  - "tspDB: Time Series Predict DB"
  - "tspDB: Time Series Predict DB"
publisher: ""
citation key: Agarwal21TspDBTimeSeries
DOI: 10.48550/arXiv.1903.07097
created date: 2024-12-03T21:03:44-08:00
modified date: 2024-12-05T13:31:44-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/Z4FJLNLB)  | [**DOI**](https://doi.org/10.48550/arXiv.1903.07097)  | [**URL**](http://arxiv.org/abs/1903.07097) | [[Agarwal21TspDBTimeSeries.pdf|PDF]]
>
> 
> **Abstract**
> A major bottleneck of the current Machine Learning (ML) workflow is the time consuming, error prone engineering required to get data from a datastore or a database (DB) to the point an ML algorithm can be applied to it. Hence, we explore the feasibility of directly integrating prediction functionality on top of a data store or DB. Such a system ideally: (i) provides an intuitive prediction query interface which alleviates the unwieldy data engineering; (ii) provides state-of-the-art statistical accuracy while ensuring incremental model update, low model training time and low latency for making predictions. As the main contribution we explicitly instantiate a proof-of-concept, tspDB, which directly integrates with PostgreSQL. We rigorously test tspDB's statistical and computational performance against the state-of-the-art time series algorithms, including a Long-Short-Term-Memory (LSTM) neural network and DeepAR (industry standard deep learning library by Amazon). Statistically, on standard time series benchmarks, tspDB outperforms LSTM and DeepAR with 1.1-1.3x higher relative accuracy. Computationally, tspDB is 59-62x and 94-95x faster compared to LSTM and DeepAR in terms of median ML model training time and prediction query latency, respectively. Further, compared to PostgreSQL's bulk insert time and its SELECT query latency, tspDB is slower only by 1.3x and 2.6x respectively. That is, tspDB is a real-time prediction system in that its model training / prediction query time is similar to just inserting / reading data from a DB. As an algorithmic contribution, we introduce an incremental multivariate matrix factorization based time series method, which tspDB is built off. We show this method also allows one to produce reliable prediction intervals by accurately estimating the time-varying variance of a time series, thereby addressing an important problem in time series analysis.
> 
> 
> **FirstAuthor**:: Agarwal, Anish  
> **Author**:: Alomar, Abdullah  
> **Author**:: Shah, Devavrat  
~    
> **Title**:: "tspDB: Time Series Predict DB"  
> **Date**:: 2021-02-13  
> **Citekey**:: Agarwal21TspDBTimeSeries  
> **ZoteroItemKey**:: Z4FJLNLB  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.1903.07097  
> **URL**:: http://arxiv.org/abs/1903.07097  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNOte
> **Related**:: 

> Agarwal, Anish, et al. _tspDB: Time Series Predict DB_. arXiv:1903.07097, arXiv, 13 Feb. 2021. _arXiv.org_, [https://doi.org/10.48550/arXiv.1903.07097](https://doi.org/10.48550/arXiv.1903.07097).
%% begin Obsidian Notes %%
___
The postgres-based imputing auto-forecaster meant for amateurs in [[Zewe22ToolPredictingFuture|A tool for predicting the]]. I found this during top N forecasting universities survey.

Code is available: https://tspdb.mit.edu/
### Related

- [[Zewe22ToolPredictingFuture|A tool for predicting the future]]
- [[Agarwal22multivarSinglSpect|On Multivariate Singular Spectrum Analysis]]
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Agarwal21TspDBTimeSeries
> 
> The postgres-based imputing auto-forecaster meant for amateurs in ([Zewe, 2022](zotero://select/library/items/DT57INAP)). I found this during top N forecasting universities survey.
> 
> ### Related
> 
> - ([Agarwal et al., 2022](zotero://select/library/items/8H3URFC4))
> - ([Zewe, 2022](zotero://select/library/items/DT57INAP))
> 
> <small>📝️ (modified: 2024-05-08) [link](zotero://select/library/items/6CV5XDAW) - [web](http://zotero.org/users/60638/items/6CV5XDAW)</small>
>  
> ---




%% Import Date: 2024-05-08T11:07:15.343-07:00 %%
