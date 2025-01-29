---
category: literaturenote
tags:
  - forecasting
  - forecasting/price
  - concept_drift
  - LightGBM
  - forecasting/hierarchical
citekey: Salwala22distribIncrmntlMLbigTS
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Distributed Incremental Machine Learning for Big Time Series Data
  - Distributed Incremental Machine Learning for
publisher: ""
citation key: Salwala22distribIncrmntlMLbigTS
DOI: 10.1109/BigData55660.2022.10020361
created date: 2024-07-09T14:17:10-07:00
modified date: 2024-07-19T12:32:26-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/9CAJCX5I)  | [**DOI**](https://doi.org/10.1109/BigData55660.2022.10020361)  | [**URL**](https://ieeexplore.ieee.org/document/10020361) | [[Salwala22distribIncrmntlMLbigTS.pdf|PDF]]
>
> 
> **Abstract**
> Today’s highly instrumented systems generate large amounts of time series data from many different domains. In order to create meaningful insights from these data, techniques are needed to handle the collection, processing, and analysis at scale. The high frequency and volume of data that is generated introduces several challenges including data transformation, managing concept drift, the operational cost of model re-training and tracking, and scaling hyperparameter optimization.Incremental machine learning can provide a viable solution to handle these kinds of data. Further, distributed machine learning can be an efficient technique to improve performance, increase accuracy, and scale to larger input sizes.In this paper, we introduce a framework that combines the computational capabilities of Apache Spark and the workflow parallelization of Ray for distributed incremental learning. We conduct an empirical analysis of our framework for time series forecasting using the Walmart M5 dataset. The system can perform a parameter search on streaming data with concept drift producing a robust pipeline that fits high-volume data effectively. The results are encouraging and substantiate system proficiency over traditional big data analysis approaches that exclusively use either offline or online training.
> 
> 
> **FirstAuthor**:: Salwala, Dhaval  
> **Author**:: Tirupathi, Seshu  
> **Author**:: Quanz, Brian  
> **Author**:: Gifford, Wesley M.  
> **Author**:: Siegel, Stuart  
> **Author**:: Ekambaram, Vijay  
> **Author**:: Jati, Arindam  
~    
> **Title**:: "Distributed Incremental Machine Learning for Big Time Series Data"  
> **Date**:: 2022-12-01  
> **Citekey**:: Salwala22distribIncrmntlMLbigTS  
> **ZoteroItemKey**:: 9CAJCX5I  
> **itemType**:: conferencePaper  
> **DOI**:: 10.1109/BigData55660.2022.10020361  
> **URL**:: https://ieeexplore.ieee.org/document/10020361  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**:: 2356-2363  
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Salwala, Dhaval, et al. “Distributed Incremental Machine Learning for Big Time Series Data.” _2022 IEEE International Conference on Big Data (Big Data)_, 2022, pp. 2356–63. _IEEE Xplore_, [https://doi.org/10.1109/BigData55660.2022.10020361](https://doi.org/10.1109/BigData55660.2022.10020361).
%% begin Obsidian Notes %%
___

Time series forecasting based on LightGMB is run at multiple level (like aggregated PV?). Models are trained incrementally (not clear what this means) until a concept drift on one of the regression targets is selected (doesn't look at model inputs, apparently).  When drift is detected, it waits a month, and then selects the model in the history that is the best hit for that month (I think), and then adapts it.  There is also a batch LGBM training, somehow, didn't figure it out. Does hyperparm tuning only on 8 [[LightGBM]] parameters, and it's different for batch and incremental models.

# Notes
- IBM apparently has software for this paper ([[Salwala22distribIncrmntlMLbigTS.pdf#page=2&annotation=363R|TS-DIML]]) but I couldn't find it online
- Concept Drift Detection
	- Uses [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=225R|Page-Hinkley algorithm]] run on [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=3604R|total sales]]
		- even though [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=264R|error value at the item level used to assess performance]]	
	- I think this looking only at changes in the target variable, not model performance?
- Forecasts are incrementally trained: [[Salwala22distribIncrmntlMLbigTS.pdf#page=4&annotation=4612R|Fig. 4]]	
	- An initial model, D0 is trained and then
	- at time $t_i$, new data arrives and it's used to adapt the model trained at time $t_{i-1}$ 
	- training method is called `partial_fit` but what this is, is not really explained
	- forecast produced can be [[Salwala22distribIncrmntlMLbigTS.pdf#page=4&annotation=1695R|potentially multi-step]]
	- [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=178R|LGBM]] for batch models (which are a baseline, I think)
		- [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=186R|hyperparameters]]
			- "were considered": 1) max number of bins, 2) minimal number of data in one leaf, 3) number of estimators, 4) learning rate, 5) number of leaves, 6) minimal sum hessian in one leaf, 7) subsample (bagging fraction) and 8) colsample bytree (feature fraction). ^oyox
			- Are tuned after every concept drift detect (see variation in [[Salwala22distribIncrmntlMLbigTS.pdf#page=6&annotation=4624R|TABLE I]])
	- [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=216R|ILGBM]] for incremental training (incremental LGBM, which doesn't seem to be explained)
		- [[Salwala22distribIncrmntlMLbigTS.pdf#page=6&annotation=3992R|Incremental learning using the pipeline continues until (the next) concept drift is detected]]
		- [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=4615R|same set of hyperparameter]] as for LGBM batch model
			- but they are separately optimized, as [[Salwala22distribIncrmntlMLbigTS.pdf#page=6&annotation=4468R|there is a need for HPO for incremental model]]
		- incremental training uses [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=222R|one month of data after every concept drift detected]]	
			- so would there be a one month lag before the model changes?
			- [[Salwala22distribIncrmntlMLbigTS.pdf#page=7&annotation=4621R|Fig. 7.]] seems to show that			- 
- [[Salwala22distribIncrmntlMLbigTS.pdf#page=5&annotation=4618R|Distributed pipeline selection algorithm for best IML pipeline]]
	- a trail of past models is stored
	- when concept drift is detected, a model "pipeline" is selected to be updated
	- says $n$ models are "incrementally run" on some data, and the pipeline selected based on error metric
# Details
- 1 forecast per day, out to 24 days ahead
- 2 or 3 level hierarchy is forecasted, but bottom (item) is what's evaluated for in this paper, and concept drift is detected at the top level (total_sales)
- dimension of forecasted value: not clear, says "potentially multistep," so 24?
- is there any sum constraint at the hierarchy level of the target, or is it just forecasting a generic multivariate target: not clear
- feature dimension: 13 mixed categorical and numeric values plus a [[Signature Transforms for Time Series|Signature Feature]] (maybe?) which could be huge:28 x 2 x 2 ?
- 1st model training period
- there is some LGBM batch method used for comparison.  Not clear if it's also part of the model...
# Also
- [[Concept Drift and Adaptation]]

==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%



%% Import Date: 2024-07-09T14:17:34.625-07:00 %%
