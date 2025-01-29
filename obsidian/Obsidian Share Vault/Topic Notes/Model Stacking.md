---
created date: 2024-07-17T11:43:06-07:00
modified date: 2024-07-28T10:37:10-07:00
tags:
  - ml
  - ml/ensemble
---
Another term for doing multi-model weighting.

Scikit-learn has a pipeline for that: [Combine predictors using stacking](https://scikit-learn.org/stable/auto_examples/ensemble/plot_stack_predictors.html#combine-predictors-using-stacking):

![[Model Stacking-20240717122222229.webp|1152]]

In this case, the model weighting is fixed in time, and is done by RidgeCV, butone could also do it dynamically, like in [[Liu23conceptDriftGlobalTSfrcst]], for handling concept drift.  

In general, stacking was one of the winning [[Dancker24dontNeedDprLrnTSfrcst#Ensembling|Ensembling]] techniques in 2023 forecasting contests, although it seems like a simple average often works better.