---
category: literaturenote
tags:
  - forecasting
  - ml/deepLrn
  - forecasting/ensemble
  - LightGBM
citekey: Dancker24dontNeedDprLrnTSfrcst
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Why You (Currently) Do Not Need Deep Learning for Time Series Forecasting
  - Why You (Currently) Do Not
publisher: ""
citation key: Dancker24dontNeedDprLrnTSfrcst
DOI: ""
"created date:": 2024-07-18T11:27:31-07:00
"modified date:": 
created date: 2024-07-18T11:27:59-07:00
modified date: 2024-07-18T15:53:29-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/2JRCSS7A)   | [**URL**](https://towardsdatascience.com/why-you-currently-do-not-need-deep-learning-for-time-series-forecasting-0de57f2bc0ed) | [[Dancker24dontNeedDprLrnTSfrcst.pdf|PDF]]
>
> 
> **Abstract**
> What you need instead: Learnings from the Makridakis M5 competitions and the 2023 Kaggle AI report
> 
> 
> **FirstAuthor**:: Dancker, Jonte  
~    
> **Title**:: "Why You (Currently) Do Not Need Deep Learning for Time Series Forecasting"  
> **Date**:: 2024-06-20  
> **Citekey**:: Dancker24dontNeedDprLrnTSfrcst  
> **ZoteroItemKey**:: 2JRCSS7A  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://towardsdatascience.com/why-you-currently-do-not-need-deep-learning-for-time-series-forecasting-0de57f2bc0ed  
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

> Dancker, Jonte. “Why You (Currently) Do Not Need Deep Learning for Time Series Forecasting.” _Medium_, 20 June 2024, [https://towardsdatascience.com/why-you-currently-do-not-need-deep-learning-for-time-series-forecasting-0de57f2bc0ed](https://towardsdatascience.com/why-you-currently-do-not-need-deep-learning-for-time-series-forecasting-0de57f2bc0ed).
%% begin Obsidian Notes %%
___

[[LightGBM]] seems the best in forecasting contests and in real life, while statistical forecasting is still a useful baseline.  Deep learning forecasting e.g.  [N-BEATS](Oreshkin20neuraBasisFrcstNBEATS) and [N-HiTS](Challu22NHiTSNeuralHierarchical), gets academic attention, but for now, not much contest or the author's real-world use.  [[#Feature Engineering]] is where time is best spent, while [[#Ensembling]] and thorough [[#Cross Validation is Crucial]].  

This article suggests that, for AEMO, I'd better start ensembling diverse LightGBM models and hurry on those [exogenous features](Dancker24dontNeedDprLrnTSfrcst#^3vzu).

# Best models in Forecasting Competitions

LightGBM seems the best (in 2023 contest); statistical good for baseline

- Forecasting competitions
	- Makridakis vs. Kaggle
		- Makridakis makes the `M` sets (this article mostly about M5)
		- Kaggle has it's own competition
		- But the collaborated on `M5`
	- [ ] I should poll the [Kaggle AI Report](https://www.kaggle.com/competitions/2023-kaggle-ai-report/overview) once a year
- Best models over time
	- `M1-M3`: statistical models best
	- `M4`: hybrid statistical and ML models best 
		- 'ML' means machine learning that isn't deep learning
	- `M5`: All the best were ML; GBMs dominate (in Kaggle too)
- Gradient Boosted Models (GBMs)
	- GBMs dominate because they're good at
		- many features (high dimension input)
		- feature importance
		- few hyperparameters
		- fast training time, means the most iterations in a given amount of time
		- beating deep learning in both performance and training time
	- LightGBM is the best GBM
		- better performance
		- faster train time
		- smaller data
		- e.g. CatBoost took 50% more time to train; MAE 2% worse
- Deep Learning Models
	- slower
	- worse performing
	- For author, [N-BEATS](Oreshkin20neuraBasisFrcstNBEATS) and [N-HiTS](Challu22NHiTSNeuralHierarchical) were [[Dancker24dontNeedDprLrnTSfrcst.pdf#page=7&annotation=1698R|performing worse and took a lot longer to train]], so was never successful with them in the real world.
# Ensembling

Kaggle winners have multiple models, averaging often best

- Ensembling
	- types
		- simple averaging
			- calls this `blending`
			- [Perplexity agrees](<Perplexity agrees: `blending` ==>): `blending` ==
				- averaging (time series)
				- majority vote (classification)
		- complex blending
			- [seems to be](<Perplexity agrees: `blending` ==>) just different model weights, many algorithms 
			- one example is [[Model Stacking]], which author lists separately
	- works when model error is decorrelated, of course
- Author's Favorite Ensembling Approach
	- all models of same type (wouldn't errors be more likely correlated?)
	- different features
	- different cost functions
	- simple averaging
- Averaging the best `M5` models for each time series [[Dancker24dontNeedDprLrnTSfrcst.pdf#page=11&annotation=2118R|beat (overall?) the winner by 2%]]
- [ ] # I should try averaging AEMO with the different feature sets and cost funcs I've tried.
# Feature Engineering

Feature engineering is more important than what model you use, and the process consumes the most time. 

- Data cleaning and understanding are important
- Often Useful Generated Features are
	- windowed: mean/max/std/...
	- lags
	- times
- Exogenous variables is where he (& Kagglers) get the biggest gains
- [ ] @ Electricity price forecast: big gain w/ generation and demand data ^3vzu
- **Very Strange** that he doesn't mention doing automated feature selection!
# Cross Validation is Crucial

- for All the reasons and complications you'd think of...
- [[Dancker24dontNeedDprLrnTSfrcst.pdf#page=10&annotation=2154R|Many in M5 failed to choose the best model for their final submission]]
# Speed and Specificity Matters

- `M5` winner tested 220 models
- It's why Kagglers use [[LightGBM]]
- Get better results the more things he tests
- It's why contestants shun Deep Learning: it's slow and one-size-fits-all


___
%% end Obsidian Notes %%



%% Import Date: 2024-07-18T11:27:52.045-07:00 %%
