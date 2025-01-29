---
modified date: 2024-08-18T00:25:27-07:00
created date: 2024-07-30T11:50:29-07:00
---
# Online forecast adaptation
## Online update of LightGBM
- [stackoverflow: train() vs update() vs refit()](https://stackoverflow.com/questions/73664093/lightgbm-train-vs-update-vs-refit)
- refit doesn't work for custom objective function
	- as of 5/24: [\`Booster.refit()\` fails when...](https://github.com/microsoft/LightGBM/issues/5609)
	- But is on [new feature ideas list](https://github.com/microsoft/LightGBM/issues/2302) 
- [boosting - How does LightGBM d...](https://stats.stackexchange.com/questions/453540/how-does-lightgbm-deals-with-incremental-learning-and-concept-drift)
- lgbm doc: [lightgbm.Booster — LightGBM 4....](https://lightgbm.readthedocs.io/en/latest/pythonapi/lightgbm.Booster.html)
- Tuning deals w/ nonstationarity, etc.: [[Lainder22frcstGBTaugTuneCV]]
- [[Salwala22distribIncrmntlMLbigTS]] uses "incremental LightGBM" (ILGBM) but never defines what that is
# Extrapolation for LightGBM

[LGBMregressor](https://lightgbm.readthedocs.io/en/latest/pythonapi/lightgbm.LGBMRegressor.html) with default params can't produce an output outside of the range of its training data.  What to do?
- Use the [linear_tree=True](https://lightgbm.readthedocs.io/en/latest/Parameters.html#linear_tree) option?
	- works on a trivial problem [here](https://www.evernote.com/shard/s13/nl/1523219/100bc603-d01c-4aaf-b001-2ec84b70b4eb?title=XGBoost%20for%20time%20series:%20lightGBM%20is%20a%20bigger%20boat), shows how to see linear coeffs
- detrend, de-seasonalize, de-any-component-that's-easy-to-predict
	- idea is that LightGBM would now be only predicting model residuals
	- residuals are smaller, and extreme residuals could occur at any time, so extreme examples more likely to be included in train set
	- ? however, does this limit the possibility of modeling nonlinear seasonal, etc. effects?
		- in the end, you must add them back on (linear)
		- if also still included them in LightGBM inputs would it learn to not predict extreme values anyway?
- Never allow a training data segment to be so short that extremes extremes aren't included?
	- [ ] do a study to see what that would imply about shortest length
- Blend with a linear/econometric/physical/... model which can extrapolate i.e. do [[Model Stacking]]
# Monotonic Learning with LightGBM

-  Monotonic Learning with [LightGBM](https://mapie.readthedocs.io/en/latest/examples_regression/4-tutorials/plot_cqr_tutorial.html)
- LightGBM has several parameters that can enforce a monotonic relationship between some features and the target, for example [monotone_constraints](https://lightgbm.readthedocs.io/en/latest/Parameters.html#monotone_constraints).  
	- There are restrictions e.g. with categorical variables so read the docs.
	- XGBoost [apparently](https://towardsdatascience.com/build-xgboost-lightgbm-models-on-large-datasets-what-are-the-possible-solutions-bf882da2c27d) had this first, but LightGBM caught up
## RektPunk GBM Non-crossing Quantiles

- Initial idea: [RektPunk24:Multiple quantile regression w...](https://github.com/microsoft/LightGBM/issues/5727) ^k6ql
	- This avoided crossover, but [wasn't great at extreme quantiles](https://github.com/microsoft/LightGBM/issues/5727#issuecomment-1966112052).  
	- ! Standard LGBM quantiles actually look better: there was quantile touching but no crossing
	- RektPunk thinks this could be due to [using the same hyperparms across quantiles](https://github.com/microsoft/LightGBM/issues/5727#issuecomment-1968330039) (or is it just that they weren't tuned?). 
		- And [unique hyperparams may not be feasible for big data](https://github.com/microsoft/LightGBM/issues/5727#issuecomment-1972332885) (or was this just tuning a single set?)
		- ? OR are extreme quantile bad b/c they're rare events and he's training with something like CRPS? ^94d9
			- something related in [[Probabilistic Forecast Scoring]]?
- Original idea inspired by
	- [ ] @ [[Cannon18nonCrossNeuralQRrainfal|Cannon18: Non-crossing nonlinear regression quantiles by monotone composite quantile regression neural network, with application to rainfall extremes]] 
	- [ ] @ [[Moon21lrnMuliQuantilesNN|Moon21: Learning Multiple Quantiles With Neural Networks]] 

- [[RektPunk24nonCrossMQBoostQR|RektPunk24: MQBoost Quantiles non-cross LightGBM and XGBoost]] 
	- [Initial idea](<#^k6ql>), updated to the latest LightGBM, also for XGBOOST
	- Uses [[Akiba19OptunaHyperparamOpt|Optuna: A Next-generation Hyperparameter Optimization]] somehow
	- [ ] ? not clear if it does hypertune per-quantile tuning
	- [ ] ? does it allow optuna to use time series CV?
- also [[Catboost#Multiquantile regression with Catboost|Multiquantile regression with Catboost]], said to have less crossover that indep. quantile models, but evidence not shown.
# Conformal Quantile Regression and LightGBM
- implemented in [[Taquet22modelAgnostIntervMAPIE|MAPIE]] library

# Hyperparameter Tuning

## Most commonly tuned hyperparameters
- [[Salwala22distribIncrmntlMLbigTS]]
	- "[were considered](Salwala22distribIncrmntlMLbigTS.md#^oyox)" 1) max number of bins, 2) minimal number of data in one leaf, 3) number of estimators, 4) learning rate, 5) number of leaves, 6) minimal sum hessian in one leaf, 7) subsample (bagging fraction) and 8) colsample bytree (feature fraction).
- [[Liu23conceptDriftGlobalTSfrcst]]
	- "[such as](Liu23conceptDriftGlobalTSfrcst.md#^7qts)": maximum depth, number of leaves, minimum number of instances in a leaf, learning rate and subfeature leaf
# Other
- [[Contextual Optimization#Decision Tree Methods in Contextual Optimization]]
- [[Boosting]]
- [[Hyperparameter Tuning]]
# Forcasting with LightGBM
 - [[Manokhin23worksTSfrcstNixtla]]
 - [[Januschowski22ForecastingTrees]]
 - Tuning deals w/ nonstationarity, etc.: [[Lainder22frcstGBTaugTuneCV]]
 - LightGBM still probably best forecasting algorithm: [[Dancker24dontNeedDprLrnTSfrcst]] and many others.
 - With Concept Drift
	 - [[Liu23conceptDriftGlobalTSfrcst]] 
	 - [[Salwala22distribIncrmntlMLbigTS]]
