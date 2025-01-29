---
created date: 2024-07-31T23:27:34-07:00
modified date: 2024-08-01T08:41:41-07:00
---
# Multiquantile regression with Catboost

- can predict multiple quantiles from same tree: multiple quantiles are in leaf (quote below)
- Is said to have *less crossover* than with independent quantile models, but no evidence given (quote below).
- Same hyperparams for every quantile: I can't find a per-quantile approach in quote or Optuna example below
- Code examples
	- Basic: [Catboost multi-quantile regres...](https://www.kaggle.com/code/syerramilli/catboost-multi-quantile-regression)
	- Optuna tuning: only a single hyperparam search space sent to [[Akiba19OptunaHyperparamOpt|Optuna]]
- it's [CPU only](https://catboost.ai/en/docs/concepts/loss-functions-regression#usage-information), not GPU
- Quote from the [docs](https://github.com/catboost/catboost/blob/master/RELEASE.md): 
>     Now it's possible to train models with shared tree structure and multiple predicted quantile values in each leaf. Currently this approach doesn't give a strong guarantee for predicted quantile values consistency, but it still provides more consistency than training multiple independent models for each quantile. You can read [short description in the documentation](https://catboost.ai/en/docs/concepts/loss-functions-regression#MultiQuantile). Short example for Python: `loss_function='MultiQuantile:alpha=0.2,0.4'`. Supported only on CPU for now.
## Multiquantile loss function with Catboost
- cost function is the [MultiQuantile](https://catboost.ai/en/docs/concepts/loss-functions-regression#MultiQuantile)
![[Catboost-20240731233439844.webp|797]]
- Isn't this *just weighted CRPS* (average quantile score), where $w_i$ is a quantile weight in cost function
	- could use this to prioritize extreme quantiles, for example.
