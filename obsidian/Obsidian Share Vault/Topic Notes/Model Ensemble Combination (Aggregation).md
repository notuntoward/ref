---
created date: 2024-08-13T11:58:23-07:00
modified date: 2024-08-13T14:21:26-07:00
---
Given the predictions of multiple models, combine them into a single prediction, which is presumably more accurate than the best one in the ensemble.  Another phrase for this is "ensemble averaging."
# Deterministic Model Combination
- [[Handling Concept Drift in Forecasting#Weighted Model Averaging as Concept Drift Handling|Model Averaging as Concept Drift Handling]]
# Probabilistic Model Combination
## Quantile based
- [[Fakoor23quantileAggrConformMono|Fakoor23: Flexible Model Aggregation for Quantile Regression]] 
- [[Handling Concept Drift in Forecasting#Concept Drift Handling of Probabilistic Models|Concept Drift Handling of Probabilistic Models]]
## Scenario based
- when the desired prediction is the sum of the things being predicted individually in the ensemble, just add the scenarios.  That'll work if their errors are uncorrelated.