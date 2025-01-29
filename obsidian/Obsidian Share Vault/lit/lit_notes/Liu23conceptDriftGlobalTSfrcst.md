---
category: literaturenote
tags:
  - forecasting
  - forecasting/price
  - concept_drift
  - LightGBM
  - forecasting/hierarchicalcitekey: Liu23conceptDriftGlobalTSfrcst
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Handling Concept Drift in Global Time Series Forecasting
  - Handling Concept Drift in Global
publisher: ""
citation key: Liu23conceptDriftGlobalTSfrcst
DOI: ""
created date: 2024-07-16T15:17:43-07:00
modified date: 2024-08-17T23:54:23-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/7RTK8DPN)   | [**URL**](https://link.springer.com/10.1007/978-3-031-35879-1_7) | [[Liu23conceptDriftGlobalTSfrcst.pdf|PDF]]
>
> 
> **Abstract**
> Machine learning (ML) based time series forecasting models often require and assume certain degrees of stationarity in the data when producing forecasts. However, in many real-world situations, the data distributions are not stationary and they can change over time while reducing the accuracy of the forecasting models, which in the ML literature is known as concept drift. Handling concept drift in forecasting is essential for many ML methods in use nowadays, however, the prior work only proposes methods to handle concept drift in the classification domain. To fill this gap, we explore concept drift handling methods in particular for Global Forecasting Models (GFM) which recently have gained popularity in the forecasting domain. We propose two new concept drift handling methods, namely: Error Contribution Weighting (ECW) and Gradient Descent Weighting (GDW), based on a continuous adaptive weighting concept. These methods use two forecasting models which are separately trained with the most recent series and all series, and finally, the weighted average of the forecasts provided by the two models are considered as the final forecasts. Using LightGBM as the underlying base learner, in our evaluation on three simulated datasets, the proposed models achieve significantly higher accuracy
> 
> 
> **FirstEditor**:: Hamoudia, Mohsen  
> **Editor**:: Makridakis, Spyros  
> **Editor**:: Spiliotis, Evangelos  
~> **FirstAuthor**:: Liu, Ziyi  
> **Author**:: Godahewa, Rakshitha  
> **Author**:: Bandara, Kasun  
> **Author**:: Bergmeir, Christoph  
~    
> **Title**:: "Handling Concept Drift in Global Time Series Forecasting"  
> **Date**:: 2023-01-01  
> **Citekey**:: Liu23conceptDriftGlobalTSfrcst  
> **ZoteroItemKey**:: 7RTK8DPN  
> **itemType**:: bookSection  
> **DOI**::   
> **URL**:: https://link.springer.com/10.1007/978-3-031-35879-1_7  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**:: Springer Nature Switzerland  
> **Location**:: Cham   
> **Pages**:: 163-189  
> **ISBN**:: 978-3-031-35878-4 978-3-031-35879-1  
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Liu, Ziyi, et al. “Handling Concept Drift in Global Time Series Forecasting.” _Forecasting with Artificial Intelligence_, edited by Mohsen Hamoudia et al., Springer Nature Switzerland, 2023, pp. 163–89. _DOI.org (Crossref)_, [https://doi.org/10.1007/978-3-031-35879-1_7](https://doi.org/10.1007/978-3-031-35879-1_7).
%% begin Obsidian Notes %%
___

The best method tested makes a forecast from two trained [[LightGBM]] models: an accurate and fixed (?) model, `Mall`, that uses as much training data as possible, and another rough but adjustable model, `Mpartial`, that has short/recent training data and is frequently trained.  The forecast is the weighted sum of these models' forecasts; the weights are continually adjusted in a direction that would emphasize the model that made the least error on the last forecast.  

On iffy synthetic concept shift data, the best model, Gradient Descent Weighting (GDW), is clearly better across three kinds of concept drift (sudden, gradual and incremental), with the least success on gradual.  They don't test non-stationarities like trend and seasonality because they say that's easily handled by traditional methods.

**I like this general idea** because it:
- avoids *binary* concept drift detection, and all the tuning and miss/false stuff that entails
- defines drift in terms of the input/output relationship, unlike eg. [[Salwala22distribIncrmntlMLbigTS]] 
	- if it concept changes, there will be more model error, so error itself is the "drift"
- weights are basically from SGD, so it could be enhanced with small, easy extensions
- the ensembling is with same type of predictive model, different data, features, [a favorite for some](Dancker24dontNeedDprLrnTSfrcst)
# What this makes me want to try

- @ See the yellow colored bullets below in [[#My Thoughts on Tested Methods]]
- Also [[Handling Concept Drift in Forecasting#Weighted Model Averaging as Concept Drift Handling]]

# Details
## Concept drift types
From [[Liu23conceptDriftGlobalTSfrcst.pdf#page=4&annotation=5241R|Fig. 1]]

![[Liu23conceptDriftGlobalTSfrcst-20240716193755114.webp]]
- hardest is [[Liu23conceptDriftGlobalTSfrcst.pdf#page=16&annotation=4583R|gradual]] b/c, I think, the same behavior is both before and after the drift point, making it hard to distinguish the transition, and quickly learn the new stuff
- hardest is also when the drift occurs after training, as you can't adapt.
- easiest is [[Liu23conceptDriftGlobalTSfrcst.pdf#page=4&annotation=1320R|recurring concept drift]] (not shown above or tested) because it's easy to handle with traditional seasonality techniques
- Generative for these drifts are explained in [[Liu23conceptDriftGlobalTSfrcst.pdf#page=12&annotation=5250R|5.1 Datasets]] (all tests are on synthetic data b/c can't find good real drifting datasets. *True?*)
## Drift Handling in summary, according to the introduction
See [[Liu23conceptDriftGlobalTSfrcst.pdf#page=2&annotation=5253R|Introduction]]
- The obvious, tried and true aren't bad
	- Just weighing most recent data is not bad: Exponential smoothing [[Liu23conceptDriftGlobalTSfrcst.pdf#page=2&annotation=576R|handles most common non-stationarities, like/trends & seasonality]] and others too.
	- Global forecasting models aren't bad b/c they get a lot of training data.
- Fancy drift detection can be bad
	- [False Drift Detects](Liu23conceptDriftGlobalTSfrcst.pdf#page=6&annotation=2072R) 
	- hurt performance when you try to train different models between them.
- Ensemble, weights, multiple models have pluses and minuses.
## Tested Drift Handling Methods
### Series Weighted Methods (SWM)
See [[Liu23conceptDriftGlobalTSfrcst.pdf#page=8&annotation=5256R|Series Weighted Methods]]
- The baselines they need to beat
- During training weight more recent data higher
- linear and exponential weights tested
- four models trained: (short/long training length) x (linear/exponential weight)
### Error Contribution Weighting (ECW)
See [Error Contribution Weighting](Liu23conceptDriftGlobalTSfrcst.pdf#page=9&annotation=3952R)
- Weight two models: `Mpartial` (just recent data) and `Mall` (all data, in some sense)
	- idea is to have one model that's generally good, and one that's rough but can change fast (it's being constantly retrained)
	- both are trained with input weights that emphasize the latest data
		- ? but do you want that on `Mall`?  Don't you want to retain early data wisdom?
	- forecast is the weighted sum
- Weight the next forecast so that the model that was more accurate on this forecast is emphasized
- For multi-horizon forecast models, this means you can't update immediately but, say for a 24 hour forecast, you must wait a whole day before changing its weights
	- @ Need horizon-dep. weights: fast adaptation at short horizons
	- would need a shifting queue memory with a length equal to the forecast horizon
	- They don't do that in this paper, as far as I can tell
### Gradient Descent Weighting (GDW)
See [Gradient Descent Weighting](<Gradient Descent Weighting>)
- Also weight `Mpartial` and `Mall` to emphasize most accurate forecast
- But, weights are computed with linear regression-like error gradient following.  Could do this with SGD, in fact with [scikit-learn's SGDRegressor](https://scikit-learn.org/0.15/modules/generated/sklearn.linear_model.SGDRegressor.html).
## My Thoughts on Tested Methods
- authors cheat a bit 
	- b/c both ECW and GDW are the averages of the models trained with the 2 kinds of sample weighting 
	- probably get an ensemble averaging effect, while SWM doesn't
- @ `Mall` and `Mpartial` need different hyperparam values, as kind of relatedly claimed in [[Salwala22distribIncrmntlMLbigTS]]
- [[Liu23conceptDriftGlobalTSfrcst.pdf#page=16&annotation=4942R|LightGBM hyperparameters tuned]]: "such as maximum depth, number of leaves, minimum number of instances in a leaf, learning rate and subfeature leaf" ^7qts
- @ Could make vector of *many* model types, use SGD to compute weights
	- no need to separate forecasts, and average them
	- Could be several `Mall`s, 
		- some doing inverse-exponential weighting (so past is emphasized), and some emphasizing recent data
		- Maybe `Mall` training weights could come from splines in some kind of spline regression?
	- `Mpartial` needs to be trained every time, so it should have short data
	- But many `Mpartials` of different data lengths, or same lengths, different weightings
- @ Maybe make a model archive, as in [[Salwala22distribIncrmntlMLbigTS]]? 
- @ Could add horizon-weight and temporal smoothing (ridge?)
	- So forecasted TS, even though data comes from different times
	- could also smooth forecast weights jointly in a rolling way across several lags
	- [ ] think about how these would be combined?
- Synthetic test data was kinda easy
	- generated by same easy AR(3) model, only w/ different init values and random seed
	- AR coeffs not described
	- There are only 2 drift models
## Results
See [[Liu23conceptDriftGlobalTSfrcst.pdf#page=14&annotation=5259R|Main Accuracy Results]]
- GDW is clearly best on this data
- improvements biggest for sudden and incremental drift, but some also for gradual
- all improvements are statistically significant
- all models are worse for shorter drift lengths, but GDW is best among them (?)
___
%% end Obsidian Notes %%

## Annotations
%% begin annotations %%



### Imported: 2024-07-16 9:42 pm



<mark style="background-color: #bddebd">Quote</mark>
> GFM

<mark style="background-color: #bddebd">Quote</mark>
> ECW

<mark style="background-color: #bddebd">Quote</mark>
> GDW

<mark style="background-color: #334d80">Quote</mark>
> two forecasting models which are separately traine

<mark style="background-color: #334d80">Quote</mark>
> LightGBM

<mark style="background-color: #334d80">Quote</mark>
> 

<mark style="background-color: #cee2f8">Quote</mark>
> Introduction

<mark style="background-color: #334d80">Quote</mark>
> not stationary

<mark style="background-color: #bddebd">Quote</mark>
> concept

<mark style="background-color: #bddebd">Quote</mark>
> drift.

<mark style="background-color: #334d80">Quote</mark>
> transfer

<mark style="background-color: #334d80">Quote</mark>
> r

<mark style="background-color: #334d80">Quote</mark>
> ransfer learning

<mark style="background-color: #334d80">Quote</mark>
> not stationary.

<mark style="background-color: #334d80">Quote</mark>
> Traditiona

<mark style="background-color: #bddebd">Quote</mark>
> [ETS

<mark style="background-color: #334d80">Quote</mark>
> handling the most common non-stationarities, namely trends and seasonalities,

<mark style="background-color: #334d80">Quote</mark>
> robustness under other types of non-stationarities

<mark style="background-color: #334d80">Quote</mark>
> most weight to the most recent

<mark style="background-color: #334d80">Quote</mark>
> Global Forecasting Models

<mark style="background-color: #bddebd">Quote</mark>
> GFM,

<mark style="background-color: #334d80">Quote</mark>
> building a single model over many series,

<mark style="background-color: #334d80">Quote</mark>
> how ML methods can be used under distribution shift

<mark style="background-color: #bddebd">Quote</mark>
> DWM

<mark style="background-color: #bddebd">Quote</mark>
> SAE

<mark style="background-color: #bddebd">Quote</mark>
> [EIA,

<mark style="background-color: #bddebd">Quote</mark>
> EIA

<mark style="background-color: #334d80">Quote</mark>
> concept drift handlin

<mark style="background-color: #334d80">Quote</mark>
> lassificatio

<mark style="background-color: #bddebd">Quote</mark>
> forecast combination

<mark style="background-color: #334d80">Quote</mark>
> aggregates the predictions of multiple

<mark style="background-color: #bddebd">Quote</mark>
> (ECW

<mark style="background-color: #bddebd">Quote</mark>
> GDW

<mark style="background-color: #334d80">Quote</mark>
> rain two forecasting

<mark style="background-color: #334d80">Quote</mark>
> one

<mark style="background-color: #334d80">Quote</mark>
> most recent

<mark style="background-color: #334d80">Quote</mark>
> other

<mark style="background-color: #334d80">Quote</mark>
> full series history,

<mark style="background-color: #334d80">Quote</mark>
> weighted based on the previous prediction error

<mark style="background-color: #bddebd">Quote</mark>
> continuous adaptive weighting.

<mark style="background-color: #334d80">Quote</mark>
> are different

<mark style="background-color: #334d80">Quote</mark>
> full series’ history is expected to provide more accurate forecast

<mark style="background-color: #334d80">Quote</mark>
> if concept drift

<mark style="background-color: #334d80">Quote</mark>
> ecent series’ history is expected to quickly adapt

<mark style="background-color: #334d80">Quote</mark>
> trainin

<mark style="background-color: #334d80">Quote</mark>
> higher weights for the most recent

<mark style="background-color: #bddebd">Quote</mark>
> Real concept drift

<mark style="background-color: #334d80">Quote</mark>
> rue outputs of the instances change over time

<mark style="background-color: #bddebd">Quote</mark>
> virtual concept drift

<mark style="background-color: #334d80">Quote</mark>
> data distribution changes

<mark style="background-color: #334d80">Quote</mark>
> over time even with the same true outputs,

<mark style="background-color: #bddebd">Quote</mark>
> sudden concept drift

<mark style="background-color: #334d80">Quote</mark>
> suddenly changes into a new distribution

<mark style="background-color: #bddebd">Quote</mark>
> ncremental concept

<mark style="background-color: #334d80">Quote</mark>
> hanges and stays in a new distribution after going through a variable distributio

<mark style="background-color: #bddebd">Quote</mark>
> gradual concept drift

<mark style="background-color: #334d80">Quote</mark>
> gradually, the series completely enters the new

<mark style="background-color: #bddebd">Quote</mark>
> recurring concept drif

<mark style="background-color: #334d80">Quote</mark>
> ccurs periodicall

<mark style="background-color: #334d80">Quote</mark>
> easily handled by the typical handling of seasonality

<mark style="background-color: #334d80">Quote</mark>
> we focus on three concept drift type

<mark style="background-color: #cee2f8">Quote</mark>
> Fig. 1

<mark style="background-color: #bddebd">Quote</mark>
> GFM

<mark style="background-color: #334d80">Quote</mark>
> single model across many series with a set of global parameters that are the same across all series

<mark style="background-color: #334d80">Quote</mark>
> winning the M4 [3] and M5 [4]

<mark style="background-color: #334d80">Quote</mark>
> M5 competition uses global LightGBM

<mark style="background-color: #334d80">Quote</mark>
> eep learning based meta-learning

<mark style="background-color: #bddebd">Quote</mark>
> Nixtla framework

<mark style="background-color: #334d80">Quote</mark>
> ten N-BEATS

<mark style="background-color: #334d80">Quote</mark>
> ATS [21] and N-HiTS [

<mark style="background-color: #334d80">Quote</mark>
> pre-trained

<mark style="background-color: #bddebd">Quote</mark>
> DeepTim

<mark style="background-color: #bddebd">Quote</mark>
> e

<mark style="background-color: #334d80">Quote</mark>
> ddressing distribution shifts using a ridge regresso

<mark style="background-color: #bddebd">Quote</mark>
> Meta-GLAR

<mark style="background-color: #334d80">Quote</mark>
> closed-form adaptation updates

<mark style="background-color: #bddebd">Quote</mark>
> Ye and Dai [25]

<mark style="background-color: #334d80">Quote</mark>
> adequate long-ago dat

<mark style="background-color: #334d80">Quote</mark>
> existing concept drift handling

<mark style="background-color: #334d80">Quote</mark>
> classification

<mark style="background-color: #bddebd">Quote</mark>
> explicit

<mark style="background-color: #334d80">Quote</mark>
> immediately reac

<mark style="background-color: #334d80">Quote</mark>
> ct to the drift

<mark style="background-color: #bddebd">Quote</mark>
> implicit

<mark style="background-color: #334d80">Quote</mark>
> do not use drift detection

<mark style="background-color: #bddebd">Quote</mark>
> Adaptive Boosting Model

<mark style="background-color: #334d80">Quote</mark>
> explicit

<mark style="background-color: #334d80">Quote</mark>
> 

<mark style="background-color: #334d80">Quote</mark>
> weight to each training instance

<mark style="background-color: #334d80">Quote</mark>
> across a sequence of classifier

<mark style="background-color: #334d80">Quote</mark>
> assigns higher weights for the incorrectly classified

<mark style="background-color: #334d80">Quote</mark>
> weighted instances are used to train the next

<mark style="background-color: #334d80">Quote</mark>
> r

<mark style="background-color: #334d80">Quote</mark>
> eparate weight based on its classification accurac

<mark style="background-color: #334d80">Quote</mark>
> eighted avera

<mark style="background-color: #334d80">Quote</mark>
> all classifiers

<mark style="background-color: #334d80">Quote</mark>
> reset

<mark style="background-color: #334d80">Quote</mark>
> highly time-consum

<mark style="background-color: #334d80">Quote</mark>
> ecurring concept drif

<mark style="background-color: #bddebd">Quote</mark>
> RCD

<mark style="background-color: #334d80">Quote</mark>
> explicit

<mark style="background-color: #334d80">Quote</mark>
> wo step drift detection

<mark style="background-color: #334d80">Quote</mark>
> lassifier to detect concept drif

<mark style="background-color: #334d80">Quote</mark>
> warning level to monitor the error rat

<mark style="background-color: #334d80">Quote</mark>
> reat that concept drift as a false alar

<mark style="background-color: #334d80">Quote</mark>
> detect whether the new concept has already been observed

<mark style="background-color: #334d80">Quote</mark>
> ed in the past. I

<mark style="background-color: #334d80">Quote</mark>
> explicit methods may result in incorrect concep

<mark style="background-color: #334d80">Quote</mark>
> educing the model performance

<mark style="background-color: #334d80">Quote</mark>
> implicit methods are usually more useful in handling concept drif

<mark style="background-color: #bddebd">Quote</mark>
> DWM

<mark style="background-color: #334d80">Quote</mark>
> implicit

<mark style="background-color: #334d80">Quote</mark>
> four-step process

<mark style="background-color: #334d80">Quote</mark>
> pool

<mark style="background-color: #334d80">Quote</mark>
> global algorith

<mark style="background-color: #334d80">Quote</mark>
> expert will be added

<mark style="background-color: #334d80">Quote</mark>
> base learner

<mark style="background-color: #334d80">Quote</mark>
> ts weight will be reduced

<mark style="background-color: #334d80">Quote</mark>
> removed.

<mark style="background-color: #bddebd">Quote</mark>
> SAE

<mark style="background-color: #334d80">Quote</mark>
> implicit

<mark style="background-color: #334d80">Quote</mark>
> explores

<mark style="background-color: #334d80">Quote</mark>
> xplores the similarities between its classifiers

<mark style="background-color: #334d80">Quote</mark>
> drop

<mark style="background-color: #334d80">Quote</mark>
> only added if

<mark style="background-color: #334d80">Quote</mark>
> overcome

<mark style="background-color: #334d80">Quote</mark>
> v

<mark style="background-color: #334d80">Quote</mark>
> considerable amount of time to adapt

<mark style="background-color: #bddebd">Quote</mark>
> EIA

<mark style="background-color: #334d80">Quote</mark>
> implicit

<mark style="background-color: #334d80">Quote</mark>
> two models

<mark style="background-color: #bddebd">Quote</mark>
> 𝑀𝑠𝑖𝑚𝑝𝑙𝑒

<mark style="background-color: #bddebd">Quote</mark>
> 𝑀𝑐𝑜𝑚𝑝𝑙𝑒𝑥

<mark style="background-color: #334d80">Quote</mark>
> ingle mode

<mark style="background-color: #334d80">Quote</mark>
> elected based on its error predicted using a regressio

<mark style="background-color: #334d80">Quote</mark>
> in normal situations, 𝑀𝑐𝑜𝑚𝑝𝑙𝑒𝑥 is used to make predictions

<mark style="background-color: #334d80">Quote</mark>
> 𝑀𝑠𝑖𝑚𝑝𝑙𝑒 which is trained with most recent observations

<mark style="background-color: #334d80">Quote</mark>
> difficult to switch

<mark style="background-color: #334d80">Quote</mark>
> ontinuous drift type

<mark style="background-color: #334d80">Quote</mark>
> e propose two methods

<mark style="background-color: #334d80">Quote</mark>
> ECW

<mark style="background-color: #334d80">Quote</mark>
> GDW

<mark style="background-color: #334d80">Quote</mark>
> . Similar to the EIA,

<mark style="background-color: #334d80">Quote</mark>
> two sub-models

<mark style="background-color: #334d80">Quote</mark>
> weighted average of the forecasts

<mark style="background-color: #334d80">Quote</mark>
> weights of the submodels are dynamically changed

<mark style="background-color: #cee2f8">Quote</mark>
> Series Weighted Methods

<mark style="background-color: #334d80">Quote</mark>
> trainin

<mark style="background-color: #334d80">Quote</mark>
> higher weights for the most recen

<mark style="background-color: #334d80">Quote</mark>
> exponential deca

<mark style="background-color: #bddebd">Quote</mark>
> 𝑥𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝑋𝑖

<mark style="background-color: #bddebd">Quote</mark>
> series_length

<mark style="background-color: #bddebd">Quote</mark>
> 𝛼series_length 𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝛼0

<mark style="background-color: #bddebd">Quote</mark>
> 𝛼

<mark style="background-color: #bddebd">Quote</mark>
> 𝛽

<mark style="background-color: #334d80">Quote</mark>
> two values

<mark style="background-color: #bddebd">Quote</mark>
> 200

<mark style="background-color: #334d80">Quote</mark>
> all instances.

<mark style="background-color: #334d80">Quote</mark>
> 𝛼0 and 𝛽 are fixed to 0.9

<mark style="background-color: #bddebd">Quote</mark>
> 0.9

<mark style="background-color: #334d80">Quote</mark>
> are trained

<mark style="background-color: #334d80">Quote</mark>
> two weighting methods

<mark style="background-color: #334d80">Quote</mark>
> wo series_length values

<mark style="background-color: #334d80">Quote</mark>
> ecent series observations

<mark style="background-color: #bddebd">Quote</mark>
> 𝑀partial)

<mark style="background-color: #334d80">Quote</mark>
> ll series observations

<mark style="background-color: #bddebd">Quote</mark>
> 𝑀all

<mark style="background-color: #334d80">Quote</mark>
> weighted average

<mark style="background-color: #334d80">Quote</mark>
> based on the previous prediction error

<mark style="background-color: #bddebd">Quote</mark>
> RSS

<mark style="background-color: #bddebd">Quote</mark>
> 𝑦

<mark style="background-color: #bddebd">Quote</mark>
> ˆ 𝑦𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝑛

<mark style="background-color: #334d80">Quote</mark>
> only consider the error of the last prediction

<mark style="background-color: #bddebd">Quote</mark>
> 𝑅𝑆𝑆𝑖

<mark style="background-color: #334d80">Quote</mark>
> e consider 200 time series observations

<mark style="background-color: #334d80">Quote</mark>
> s when training the 𝑀partial

<mark style="background-color: #bddebd">Quote</mark>
> ECW

<mark style="background-color: #334d80">Quote</mark>
> ermines

<mark style="background-color: #334d80">Quote</mark>
> errors

<mark style="background-color: #bddebd">Quote</mark>
> 𝜖 𝑝

<mark style="background-color: #bddebd">Quote</mark>
> 𝜖𝑎𝑖

<mark style="background-color: #334d80">Quote</mark>
> error percentages

<mark style="background-color: #bddebd">Quote</mark>
> 𝐸 𝑝

<mark style="background-color: #bddebd">Quote</mark>
> 𝐸𝑎𝑖

<mark style="background-color: #334d80">Quote</mark>
> weights

<mark style="background-color: #bddebd">Quote</mark>
> 𝑤𝑝

<mark style="background-color: #bddebd">Quote</mark>
> 𝑤𝑎𝑖

<mark style="background-color: #bddebd">Quote</mark>
> GDW

<mark style="background-color: #334d80">Quote</mark>
> gradient descent to determine the weights

<mark style="background-color: #334d80">Quote</mark>
> final error

<mark style="background-color: #bddebd">Quote</mark>
> 𝜖𝑖

<mark style="background-color: #334d80">Quote</mark>
> gradients

<mark style="background-color: #bddebd">Quote</mark>
> 𝑔𝑝𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝑔𝑎𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝜂.

<mark style="background-color: #bddebd">Quote</mark>
> 0.01

<mark style="background-color: #334d80">Quote</mark>
> both exponential and linear

<mark style="background-color: #334d80">Quote</mark>
> our model combinations,

<mark style="background-color: #334d80">Quote</mark>
> ECW and GDW methods are obtained by averaging the forecasts provided by the above four model combinations

<mark style="background-color: #334d80">Quote</mark>
> we

<mark style="background-color: #334d80">Quote</mark>
> consider LightGBM [11] as the base learner due to its recent competitive performance

<mark style="background-color: #cee2f8">Quote</mark>
> 5.1 Datasets

<mark style="background-color: #334d80">Quote</mark>
> simulated datasets

<mark style="background-color: #bddebd">Quote</mark>
> ts1

<mark style="background-color: #bddebd">Quote</mark>
> ts2

<mark style="background-color: #334d80">Quote</mark>
> same AR

<mark style="background-color: #334d80">Quote</mark>
> AR(3) data generation

<mark style="background-color: #334d80">Quote</mark>
> different initial values and a random seed

<mark style="background-color: #bddebd">Quote</mark>
> 𝑥𝑖

<mark style="background-color: #bddebd">Quote</mark>
> 𝑖

<mark style="background-color: #334d80">Quote</mark>
> combined

<mark style="background-color: #bddebd">Quote</mark>
> series_length

<mark style="background-color: #334d80">Quote</mark>
> drift point,

<mark style="background-color: #bddebd">Quote</mark>
> 𝑡drift

<mark style="background-color: #334d80">Quote</mark>
> randomly selected

<mark style="background-color: #334d80">Quote</mark>
> combined series

<mark style="background-color: #bddebd">Quote</mark>
> 𝑡drift

<mark style="background-color: #bddebd">Quote</mark>
> 𝑡start

<mark style="background-color: #bddebd">Quote</mark>
> 𝑡end

<mark style="background-color: #334d80">Quote</mark>
> randomly selected

<mark style="background-color: #334d80">Quote</mark>
> combined series

<mark style="background-color: #334d80">Quote</mark>
> combined

<mark style="background-color: #bddebd">Quote</mark>
> 𝐼𝑖

<mark style="background-color: #334d80">Quote</mark>
> randomised

<mark style="background-color: #bddebd">Quote</mark>
> 𝑝𝑖

<mark style="background-color: #334d80">Quote</mark>
> probability that an instance belongs to ts

<mark style="background-color: #334d80">Quote</mark>
> three simulated

<mark style="background-color: #bddebd">Quote</mark>
> datasets

<mark style="background-color: #334d80">Quote</mark>
> dataset has 2000

<mark style="background-color: #bddebd">Quote</mark>
> series.

<mark style="background-color: #334d80">Quote</mark>
> first 165

<mark style="background-color: #334d80">Quote</mark>
> 650 data point

<mark style="background-color: #334d80">Quote</mark>
> training

<mark style="background-color: #334d80">Quote</mark>
> last

<mark style="background-color: #334d80">Quote</mark>
> 350 data

<mark style="background-color: #334d80">Quote</mark>
> testing.

<mark style="background-color: #bddebd">Quote</mark>
> 𝐹𝑘

<mark style="background-color: #bddebd">Quote</mark>
> 𝑌𝑘

<mark style="background-color: #bddebd">Quote</mark>
> ℎ

<mark style="background-color: #bddebd">Quote</mark>
> prequential evaluation

<mark style="background-color: #334d80">Quote</mark>
> normally called

<mark style="background-color: #bddebd">Quote</mark>
> time series cross-validation

<mark style="background-color: #334d80">Quote</mark>
> forecast horizon

<mark style="background-color: #334d80">Quote</mark>
> series

<mark style="background-color: #334d80">Quote</mark>
> e

<mark style="background-color: #bddebd">Quote</mark>
> test sets

<mark style="background-color: #334d80">Quote</mark>
> 50 data points

<mark style="background-color: #bddebd">Quote</mark>
> training set

<mark style="background-color: #334d80">Quote</mark>
> test

<mark style="background-color: #334d80">Quote</mark>
> one at a time iteratively

<mark style="background-color: #bddebd">Quote</mark>
> rolling origin without recalibration

<mark style="background-color: #334d80">Quote</mark>
> models are not retrained

<mark style="background-color: #334d80">Quote</mark>
> ctuals corresponding with the first test set are also added to the training set

<mark style="background-color: #334d80">Quote</mark>
> three types

<mark style="background-color: #334d80">Quote</mark>
> of LightGBM

<mark style="background-color: #334d80">Quote</mark>
> does not handle concept drif

<mark style="background-color: #bddebd">Quote</mark>
> (Plain),

<mark style="background-color: #bddebd">Quote</mark>
> Plain

<mark style="background-color: #bddebd">Quote</mark>
> i

<mark style="background-color: #334d80">Quote</mark>
> exponential weighting

<mark style="background-color: #bddebd">Quote</mark>
> EXP

<mark style="background-color: #334d80">Quote</mark>
> linear weighting

<mark style="background-color: #bddebd">Quote</mark>
> Linear

<mark style="background-color: #334d80">Quote</mark>
> hree statistical models

<mark style="background-color: #bddebd">Quote</mark>
> AR(3)

<mark style="background-color: #bddebd">Quote</mark>
> AR(5)

<mark style="background-color: #bddebd">Quote</mark>
> ETS

<mark style="background-color: #bddebd">Quote</mark>
> StatsForecast

<mark style="background-color: #fff6cc">Quote</mark>
> Main Accuracy Results

<mark style="background-color: #334d80">Quote</mark>
> first group

<mark style="background-color: #334d80">Quote</mark>
> The second grou

<mark style="background-color: #334d80">Quote</mark>
> hird group

<mark style="background-color: #334d80">Quote</mark>
> two LightGBM

<mark style="background-color: #334d80">Quote</mark>
> hyperparameters

<mark style="background-color: #334d80">Quote</mark>
> tuned using a grid search

<mark style="background-color: #334d80">Quote</mark>
> first group,

<mark style="background-color: #334d80">Quote</mark>
> AR5_All and AR3_All respectively show the best

<mark style="background-color: #334d80">Quote</mark>
> second group

<mark style="background-color: #334d80">Quote</mark>
> third group

<mark style="background-color: #334d80">Quote</mark>
> The model trained with the full series history has a high forecasting accuracy

<mark style="background-color: #334d80">Quote</mark>
> where the model trained with the recent series history can quickly adapt to new concepts

<mark style="background-color: #334d80">Quote</mark>
> GDW method shows considerable improvements across the sudden and incremental concept drift types and smaller improvements across the gradual

<mark style="background-color: #334d80">Quote</mark>
> baseline LightGBM models have also provided accurate forecasts up to some extent for the series showing gradual

<mark style="background-color: #334d80">Quote</mark>
> sudden or incremental

<mark style="background-color: #334d80">Quote</mark>
> high possibility that the models have seen fewer or no instances

<mark style="background-color: #334d80">Quote</mark>
> across sudden and incremental concept drift types, it shows considerable performance improvements in terms of the forecasting accuracy

<mark style="background-color: #334d80">Quote</mark>
> considerable performance improvements in terms of the forec

<mark style="background-color: #334d80">Quote</mark>
> All methods show higher errors for the series where the concept drift occurs in the test set

<mark style="background-color: #334d80">Quote</mark>
> rror increasing rate of the GDW method is considerably lower

<mark style="background-color: #334d80">Quote</mark>
> sudden concept drift

<mark style="background-color: #334d80">Quote</mark>
> ll models show higher forecasting errors for shorter drift lengths

<mark style="background-color: #334d80">Quote</mark>
> GDW and ECW show a bette

<mark style="background-color: #334d80">Quote</mark>
> GDW shows the best

<mark style="background-color: #334d80">Quote</mark>
> incremental concept drift

<mark style="background-color: #008000">Quote</mark>
> GFM

<mark style="background-color: #008000">Quote</mark>
> ECW

<mark style="background-color: #008000">Quote</mark>
> GDW


> two forecasting models which are separately traine


> LightGBM

<mark style="background-color: #086ddd">Quote</mark>
> Introduction


> not stationary

<mark style="background-color: #008000">Quote</mark>
> concept

<mark style="background-color: #008000">Quote</mark>
> drift.


> transfer


> ransfer learning


> ra


> g m


> not stationary.


> Traditiona

<mark style="background-color: #008000">Quote</mark>
> [ETS


> handling the most common non-stationarities, namely trends and seasonalities,


> robustness under other types of non-stationarities


> most weight to the most recent


> Global Forecasting Models

<mark style="background-color: #008000">Quote</mark>
> GFM,


> building a single model over many series,


> how ML methods can be used under distribution shift

<mark style="background-color: #008000">Quote</mark>
> DWM

<mark style="background-color: #008000">Quote</mark>
> SAE

<mark style="background-color: #008000">Quote</mark>
> [EIA,

<mark style="background-color: #008000">Quote</mark>
> EIA


> concept drift handlin


> lassificatio

<mark style="background-color: #008000">Quote</mark>
> forecast combination


> aggregates the predictions of multiple

<mark style="background-color: #008000">Quote</mark>
> (ECW

<mark style="background-color: #008000">Quote</mark>
> GDW


> rain two forecasting


> one


> most recent s


> other


> e full series history, w


> weighted based on the previous prediction error,

<mark style="background-color: #008000">Quote</mark>
> s continuous adaptive weighting.


> are different


> full series’ history is expected to provide more accurate forecasts


> if concept drift


> ecent series’ history is expected to quickly adapt


> trainin


> higher weights for the most recent

<mark style="background-color: #008000">Quote</mark>
> Real concept drift


> rue outputs of the instances change over time

<mark style="background-color: #008000">Quote</mark>
> virtual concept drift


> data distribution changes


> over time even with the same true outputs,

<mark style="background-color: #008000">Quote</mark>
> sudden concept drift


> suddenly changes into a new distribution

<mark style="background-color: #008000">Quote</mark>
> ncremental concept


> + changes and stays in a new distribution after going through a variable distributio

<mark style="background-color: #008000">Quote</mark>
> gradual concept drift


> gradually, the series completely enters the new

<mark style="background-color: #008000">Quote</mark>
> recurring concept drift


> ccurs periodically


> easily handled by the typical handling of seasonality


> we focus on three concept drift type

<mark style="background-color: #086ddd">Quote</mark>
> Fig. 1:

<mark style="background-color: #008000">Quote</mark>
> GFM


> single model across many series with a set of global parameters that are the same across all series


> winning the M4 [3] and M5 [4] f


> M5 competition uses global LightGBM


> eep learning based meta-learning

<mark style="background-color: #008000">Quote</mark>
> Nixtla framework


> ten N-BEATS


> ATS [21] and N-HiTS [


> pre-trained

<mark style="background-color: #008000">Quote</mark>
> DeepTim

<mark style="background-color: #008000">Quote</mark>
> e


> ddressing distribution shifts using a ridge regresso

<mark style="background-color: #008000">Quote</mark>
> Meta-GLAR


> closed-form adaptation updates

<mark style="background-color: #008000">Quote</mark>
> Ye and Dai [25]


> adequate long-ago data


> existing concept drift handling


> classification

<mark style="background-color: #008000">Quote</mark>
> explicit m


> immediately reac


> ct to the drift

<mark style="background-color: #008000">Quote</mark>
> implicit


> do not use drift detection

<mark style="background-color: #008000">Quote</mark>
> Adaptive Boosting Model


> explicit


> explicit


> weight to each training instance


> across a sequence of classifiers


> assigns higher weights for the incorrectly classified


> weighted instances are used to train the next


> r


> eparate weight based on its classification accurac


> weighted avera


> y a


> y a


> all classifiers


> s reset


> highly time-consum


> ecurring concept drift

<mark style="background-color: #008000">Quote</mark>
> RCD


> n explicit


> wo step drift detection


> lassifier to detect concept drift


> warning level to monitor the error rate


> reat that concept drift as a false alar


> detect whether the new concept has already been observed


> ved in the past. I


> explicit methods may result in incorrect concep


> educing the model performance


> implicit methods are usually more useful in handling concept drift

<mark style="background-color: #008000">Quote</mark>
> DWM


> implicit


> four-step process


> pool


> global algorith


> n expert will be added


> base learner


> ts weight will be reduced


> removed.

<mark style="background-color: #008000">Quote</mark>
> SAE


> implicit


> explores


> explores the similarities between its classifiers


> drop


> only added if


> ove


> overcome


> overcome


> considerable amount of time to adapt

<mark style="background-color: #008000">Quote</mark>
> EIA


> n implicit m


> two models

<mark style="background-color: #008000">Quote</mark>
> 𝑀𝑠𝑖𝑚𝑝𝑙𝑒

<mark style="background-color: #008000">Quote</mark>
> 𝑀𝑐𝑜𝑚𝑝𝑙𝑒𝑥 ,


> ingle mode


> elected based on its error predicted using a regressio


> in normal situations, 𝑀𝑐𝑜𝑚𝑝𝑙𝑒𝑥 is used to make predictions


> 𝑀𝑠𝑖𝑚𝑝𝑙𝑒 which is trained with most recent observations


> difficult to switch


> ontinuous drift type


> we propose two methods


> ECW


> d GDW,


> . Similar to the EIA,


> two sub-models


> weighted average of the forecasts


> weights of the submodels are dynamically changed

<mark style="background-color: #086ddd">Quote</mark>
> Series Weighted Methods


> g trainin


> higher weights for the most recen


> exponential decay

<mark style="background-color: #008000">Quote</mark>
> 𝑥𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝑋𝑖

<mark style="background-color: #008000">Quote</mark>
> series_length

<mark style="background-color: #008000">Quote</mark>
> 𝛼series_length−𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝛼0

<mark style="background-color: #008000">Quote</mark>
> 𝛼

<mark style="background-color: #008000">Quote</mark>
> 𝛽


> two values


> 200

<mark style="background-color: #008000">Quote</mark>
> 200


> d all instances.


> 𝛼0 and 𝛽 are fixed to 0.9

<mark style="background-color: #008000">Quote</mark>
> 0.9


> are trained


> two weighting methods


> wo series_length values


> ecent series observations

<mark style="background-color: #008000">Quote</mark>
> 𝑀partial )


> ll series observations (

<mark style="background-color: #008000">Quote</mark>
> 𝑀all


> weighted average


> based on the previous prediction error.

<mark style="background-color: #008000">Quote</mark>
> RSS

<mark style="background-color: #008000">Quote</mark>
> 𝑦𝑖

<mark style="background-color: #008000">Quote</mark>
> ˆ𝑦𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝑛


> only consider the error of the last prediction

<mark style="background-color: #008000">Quote</mark>
> 𝑅𝑆𝑆 𝑖


> we consider 200 time series observations w


> s when training the 𝑀partial m

<mark style="background-color: #008000">Quote</mark>
> ECW


> ermines


> n errors

<mark style="background-color: #008000">Quote</mark>
> 𝜖 𝑝𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝜖 𝑎𝑖


> error percentages

<mark style="background-color: #008000">Quote</mark>
> 𝐸 𝑝

<mark style="background-color: #008000">Quote</mark>
> 𝐸𝑎𝑖


> weights

<mark style="background-color: #008000">Quote</mark>
> 𝑤 𝑝

<mark style="background-color: #008000">Quote</mark>
> 𝑤 𝑎𝑖

<mark style="background-color: #008000">Quote</mark>
> GDW


> gradient descent to determine the weights


> final error

<mark style="background-color: #008000">Quote</mark>
> 𝜖 𝑖 ,


> gradients

<mark style="background-color: #008000">Quote</mark>
> , 𝑔 𝑝𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝑔 𝑎𝑖

<mark style="background-color: #008000">Quote</mark>
> e 𝜂.

<mark style="background-color: #008000">Quote</mark>
> 0.01


> both exponential and linear


> four model combinations, c


> ECW and GDW methods are obtained by averaging the forecasts provided by the above four model combinations


> we


> consider LightGBM [11] as the base learner due to its recent competitive performance

<mark style="background-color: #086ddd">Quote</mark>
> 5.1 Datasets


> simulated datasets

<mark style="background-color: #008000">Quote</mark>
> ts1

<mark style="background-color: #008000">Quote</mark>
> ts2


> same AR


> AR(3) data generation


> different initial values and a random seed

<mark style="background-color: #008000">Quote</mark>
> 𝑥 𝑖

<mark style="background-color: #008000">Quote</mark>
> 𝑖


> combined

<mark style="background-color: #008000">Quote</mark>
> series_length


> drift point,

<mark style="background-color: #008000">Quote</mark>
> 𝑡 drift


> randomly selected


> combined series

<mark style="background-color: #008000">Quote</mark>
> 𝑡drift

<mark style="background-color: #008000">Quote</mark>
> 𝑡 start

<mark style="background-color: #008000">Quote</mark>
> 𝑡 end ,


> e randomly selected


> combined series


> (−) combined

<mark style="background-color: #008000">Quote</mark>
> 𝐼𝑖


> randomised

<mark style="background-color: #008000">Quote</mark>
> 𝑝𝑖


> probability that an instance belongs to ts2


> three simulated d

<mark style="background-color: #008000">Quote</mark>
> datasets


> dataset has 2000 s

<mark style="background-color: #008000">Quote</mark>
> series.


> first 165


> 650 data points


> training


> last 3


> 350 data p


> testing.

<mark style="background-color: #008000">Quote</mark>
> 𝐹𝑘

<mark style="background-color: #008000">Quote</mark>
> 𝑌𝑘

<mark style="background-color: #008000">Quote</mark>
> ℎ

<mark style="background-color: #008000">Quote</mark>
> prequential evaluation


> normally called

<mark style="background-color: #008000">Quote</mark>
> time series cross-validation


> e forecast horizon


> series


> series


> e

<mark style="background-color: #008000">Quote</mark>
> test sets


> 50 data points

<mark style="background-color: #008000">Quote</mark>
> training set


> test


> one at a time iteratively.

<mark style="background-color: #008000">Quote</mark>
> rolling origin without recalibration


> models are not retrained


> ctuals corresponding with the first test set are also added to the training set.


> three types


> s of LightGBM


> does not handle concept drift

<mark style="background-color: #008000">Quote</mark>
> (Plain),

<mark style="background-color: #008000">Quote</mark>
> Plain

<mark style="background-color: #008000">Quote</mark>
> i


> exponential weighting

<mark style="background-color: #008000">Quote</mark>
> EXP


> linear weighting

<mark style="background-color: #008000">Quote</mark>
> Linear)


> hree statistical models

<mark style="background-color: #008000">Quote</mark>
> AR(3) m

<mark style="background-color: #008000">Quote</mark>
> AR(5) m

<mark style="background-color: #008000">Quote</mark>
> ETS

<mark style="background-color: #008000">Quote</mark>
> ETS

<mark style="background-color: #008000">Quote</mark>
> StatsForecast

<mark style="background-color: #ffd000">Quote</mark>
> Main Accuracy Results


> first group


> The second grou


> hird group


> two LightGBM


> hyperparameters


> tuned using a grid search


> first group,


> AR5_All and AR3_All respectively show the best


> second group


> e third group


> The model trained with the full series history has a high forecasting accuracy


> y where the model trained with the recent series history can quickly adapt to new concepts


> GDW method shows considerable improvements across the sudden and incremental concept drift types and smaller improvements across the gradual


> baseline LightGBM models have also provided accurate forecasts up to some extent for the series showing gradual


> sudden or incremental


> high possibility that the models have seen fewer or no instances


> across sudden and incremental concept drift types, it shows considerable performance improvements in terms of the forecasting accuracy.


> considerable performance improvements in terms of the forec


> All methods show higher errors for the series where the concept drift occurs in the test set


> rror increasing rate of the GDW method is considerably lower c


> sudden concept drift


> ll models show higher forecasting errors for shorter drift lengths


> GDW and ECW show a bette


> GDW shows the best p


> incremental concept drift


%% end annotations %%



%% Import Date: 2024-07-16T21:46:33.016-07:00 %%
