---
modified date: 2024-09-15T09:39:05-07:00
created date: 2024-12-17T08:51:31-08:00
---
# Topics
## Incremental training of boosted trees
- [[LightGBM#Online update of LightGBM|Online update of LightGBM]]

## Time-varying Forecast Ensemble Weighting
- [[Liu23conceptDriftGlobalTSfrcst]] used online SGD to weight a fixed (apparently) global model trained on whole train set against a model trained only on recent data.

## Many forecast errors for same forecast, different horizons

Some drift detection methods look at forecast error, while some adaptations compute a weighted sum of models in inverse proportion to the forecast error.  But these are mostly one-step ahead forecasts, while a multi horizon forecast has many forecasts. What do do?

- [ ] lit search for concept drift and multi-horizon
### Multi-horizon approaches
- [[Liu23conceptDriftGlobalTSfrcst]] uses average MSE/RMSE over all horizons, gives all horizons the same model mixing weight.  Seems like could use per-horizon weight
- Instead, could use efficient correlation of forecasted time series: [[Qiu18LearningCorrelationSpace|Qiu18: Learning Correlation Space for Time Series]] 
- dim=horizon: [[Xu24ConformalPredictionMultidimensional|Xu24: Conform pred multi-dim TS ellipse]] 
- [[Kim22ReversInstncNorm|Kim22: Reversible instance normalization for accurate time-series forecasting against distribution shift]]: somehow multivariate, multi=horizon?
## Unsupervised adaptation
- [[Kasa24adaptConformDriftNoLabels|Kasa24: Adapting Conformal Prediction to Distribution Shifts Without Labels]] 
# Papers
- [[Salwala22distribIncrmntlMLbigTS|Salwala22: Distributed Incremental Machine Learning for Big Time Series Data]]
- [[Liu23conceptDriftGlobalTSfrcst|Liu23:Handling Concept Drift in Global Time Series Forecasting]]
- [[Chen24multiConceptDriftVrblSlideWin|Chen24: Multi-type concept drift detection dual-layer variable sliding window]]
- [[Maduskar23unsuperDriftDetUDDT|Maduskar23Maduskar23unsuperDriftDetUDDT: UDDT: An Unsupervised Drift Detection]]
# Sliding Window Normalization
- [[Kim22ReversInstncNorm|Kim22: Reversible instance normalization for accurate time-series forecasting against distribution shift]]: somehow multivariate, multi=horizon?

# Also
- ? [[Liu23conceptDriftGlobalTSfrcst|Handling Concept Drift in Global]]: Combine with this?