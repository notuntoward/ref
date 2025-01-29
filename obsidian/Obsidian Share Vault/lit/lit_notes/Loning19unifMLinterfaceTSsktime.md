---
category: literaturenote
tags: 
citekey: Loning19unifMLinterfaceTSsktime
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "sktime: A Unified Interface for Machine Learning with Time Series"
  - "sktime: A Unified Interface for"
publisher: ""
citation key: Loning19unifMLinterfaceTSsktime
DOI: ""
created date: 2024-07-09T19:29:13-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/NLSJPSNA)   | [**URL**](http://arxiv.org/abs/1909.07872) | [[Loning19unifMLinterfaceTSsktime.pdf|PDF]]
>
> 
> **Abstract**
> We present sktime -- a new scikit-learn compatible Python library with a unified interface for machine learning with time series. Time series data gives rise to various distinct but closely related learning tasks, such as forecasting and time series classification, many of which can be solved by reducing them to related simpler tasks. We discuss the main rationale for creating a unified interface, including reduction, as well as the design of sktime's core API, supported by a clear overview of common time series tasks and reduction approaches.
> 
> 
> **FirstAuthor**:: Löning, Markus  
> **Author**:: Bagnall, Anthony  
> **Author**:: Ganesh, Sajaysurya  
> **Author**:: Kazakov, Viktor  
> **Author**:: Lines, Jason  
> **Author**:: Király, Franz J.  
~    
> **Title**:: "sktime: A Unified Interface for Machine Learning with Time Series"  
> **Date**:: 2019-09-17  
> **Citekey**:: Loning19unifMLinterfaceTSsktime  
> **ZoteroItemKey**:: NLSJPSNA  
> **itemType**:: preprint  
> **DOI**::   
> **URL**:: http://arxiv.org/abs/1909.07872  
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

> Löning, Markus, et al. _Sktime: A Unified Interface for Machine Learning with Time Series_. arXiv:1909.07872, arXiv, 17 Sept. 2019. _arXiv.org_, [http://arxiv.org/abs/1909.07872](http://arxiv.org/abs/1909.07872).
%% begin Obsidian Notes %%
___
Python lib for time series signature transform.  This technique is used in price forecasting e.g. [[Sidogi23SigTransfrmStockLOB|A Signature Transform of LOB]]

A general purpose scikit-learn compatible forecasting wrapper that can use a [[Signature Transforms for Time Series]] technique.

- [sktime documentation](https://www.sktime.net/en/stable/)
	- [Forecasting — sktime  document...](https://www.sktime.net/en/stable/api_reference/forecasting.html#forecasting-ref)
	- [The Signature Method with Sktime](https://www.sktime.net/en/latest/examples/transformation/signature_method.html)
		- it implements [[Morrill21GenSignatureTSfeatExtract]]
- [sktime GitHub](https://github.com/sktime/sktime)
- [Kaggle example](https://www.sktime.net/en/stable/api_reference/forecasting.html#forecasting-ref) using [[LightGBM]] and sktime to use a [[Signature Transforms for Time Series]] forecasting technique
- [[Pattnaik20LightGBMautoRgrsSktime|Medium example]] using [[LightGBM]] and sktime to use a [[Signature Transforms for Time Series]] forecasting technique.  Simple AR, w/ trends, etc.
- sktime can do forecasts with [Exogenous Variables](https://www.sktime.net/en/stable/examples/blog_posts/Overview_of_sktime_functionalities_for_forecasting.html#Multivariate-exogenous-time-series)
- my doc bug report:[\[BUG\] Dead image links](https://github.com/sktime/sktime/issues/6742)

==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%



%% Import Date: 2024-07-09T19:29:39.504-07:00 %%
