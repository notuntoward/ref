---
created date: 2024-07-17T11:44:18-07:00
modified date: 2024-08-17T17:13:33-07:00
---
# What other people do

In [[Liu23conceptDriftGlobalTSfrcst]] there are *two* models, `Mall`, trained on a large & fixed data set, and the other, `Mpartial`, trained daily, on only the previous month's data.  At each prediction time, their predictions are adaptively blended in order to get the wisdom of the past, updated with the latest knowledge.  A problem of this approach is that the time gap between the `Mall`'s and `Mpartial`'s training data increases, leaving a gap in between (unless I understand this paper incorrectly) 

In [[Salwala22distribIncrmntlMLbigTS]], there are $n$ models, with model train times borders at time points where concept drift has been detected.  As with `Mpartial` in [[Liu23conceptDriftGlobalTSfrcst]], this models is updated frequently trained, although with a different method.  If a new concept drift is detected, the model in the set of `n` models is selected that makes the best current prediction, and them it is updated with current data.  A problem with this approach is that it relies upon binary drift detection, and I also wonder if it loses something by not training a single model on a long data stream (I believe the adaptation of the model updates will wipe out old memories, although the old models will still be around, ready to be selected...).  Maybe the same argument can be made about models with concept-detector-made boundaries?

And there must be many more schemes out there.
# Weighted Model Averaging as Concept Drift Handling

My idea is to make `n` models like [[Salwala22distribIncrmntlMLbigTS]] but don't select any single one; adaptively blend them, like [[Liu23conceptDriftGlobalTSfrcst]], but all `n`, not just two of them.  Also make models with both long and short training data, across all data available.  In this way, temporal precision is preserved from the distant past, but long models, with a lot of experience are also available.  This may result in training across concept boundaries, but as noted in [[Liu23conceptDriftGlobalTSfrcst]], concept boundary detection is error-prone, which is why his apparently successful method blends models and hopes for the best.  If the temporal granularity of the stored $n$ models is high enough, maybe there will be some pure, mono-concept ones of the right, matching concept, which will get high weights.
## Requirements
- long models
	- don't train long-data models very often
	- grow long models as more data accumulates
	- time segments for some long models could correspond to [known AEMO market changes](Handling Concept Drift in Forecasting)
		- also overlap them to make longer models
	- for long models, do weight newer training data higher, at least when close to inference time.  I don't think this matters when the end of a model's training time is a year away from inference.
- short models
	- maintain a selection of short models throughout the history; these won't be retrained, so the cost of this is only storage and a small(?) amount of extra compute at inference time.
	- [ ] ? minimum time duration of shortest models
	- [ ] ? I think in [[Liu23conceptDriftGlobalTSfrcst]], the short horizon models had both exponential and linear weighting, even though they were short?
- model times overlap, to avoid rapid forecast behavior changes.  This could be for both short and long models
## Problems to solve
- [ ] How to select test data?
- [ ] When training a model that's distant from inference, is there any reason to use exponential, etc., weighting on the training data?
- [ ] For short models, how avoid [[LightGBM]] extrapolation problem?  
	- e.g. if high prices are in the summer, will a winter-trained model be of any use?  
	- [ ] Is there an idea in [[LightGBM#Extrapolation for LightGBM]]?
	- [ ] # do a study to see what never making a window shorter than one including extremes would imply
- Increase chance of predicting peaks
	- **New feature**: max peak in last N days, maybe a bunch of N's
		- [ ] # do a study to see if any of these features are correlated w/ today's peak
# How to parameterize the overlapping time partitions
- dyadic wavelets would kind of work.  Always sum to one at various hierarchical temporal precision
- Cubic splines always sum to one, centers can be placed anywhere, 
	- and RHS boundary spline can look much like exponential weighting
	- can also be hierarchical, I think
- Other spline-like basis functions too, as used in subsequent [[Kolmogorov-Arnold Networks (KANs)]]?
# Concept Drift Handling of Probabilistic Models

Could do something like [[#Weighted Model Averaging as Concept Drift Handling|Model Averaging as Concept Drift Handling]] but do it with a [[Model Ensemble Combination (Aggregation)#Probabilistic Model Combination|Probabilistic Model Combination]] technique e.g. [[Fakoor23quantileAggrConformMono|Fakoor23: Flexible Model Aggregation for Quantile Regression]] 

# Also
- ? [[Concept Drift and Adaptation]]: combine with this?
- [[Model Ensemble Combination (Aggregation)]]