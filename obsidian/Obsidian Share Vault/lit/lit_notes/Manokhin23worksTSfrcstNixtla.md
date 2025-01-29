---
category: literaturenote
tags: ml/genAI
citekey: Manokhin23worksTSfrcstNixtla
status: unread
dateread: 
ZoteroTags: noted, intro, hasCode, /unread, forecast, obsLitNote
aliases:
  - What Truly Works in Time Series Forecasting — The Results from Nixtla’s Mega Study
  - What Truly Works in Time
publisher: ""
citation key: Manokhin23worksTSfrcstNixtla
DOI: ""
created date: 2024-09-15T09:57:53-07:00
modified date: 2024-09-15T09:57:53-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/TVDUJPYH)   | [**URL**](https://valeman.medium.com/what-truly-works-in-time-series-forecasting-the-results-from-nixtlas-mega-study-78eda5133622) | [[Manokhin23worksTSfrcstNixtla.html|HTM]]
>
> 
> **Abstract**
> Time series is a captivating domain where the quest for a crystal ball never ceases.
> 
> 
> **FirstAuthor**:: Manokhin, Valeriy  
~    
> **Title**:: "What Truly Works in Time Series Forecasting — The Results from Nixtla’s Mega Study"  
> **Date**:: 2023-09-15  
> **Citekey**:: Manokhin23worksTSfrcstNixtla  
> **ZoteroItemKey**:: TVDUJPYH  
> **itemType**:: blogPost  
> **DOI**::   
> **URL**:: https://valeman.medium.com/what-truly-works-in-time-series-forecasting-the-results-from-nixtlas-mega-study-78eda5133622  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: noted, intro, hasCode, /unread, forecast, obsLitNote
>**Related**:: 

> Manokhin, Valeriy. “What Truly Works in Time Series Forecasting — The Results from Nixtla’s Mega Study.” _Medium_, 15 Sept. 2023, [https://valeman.medium.com/what-truly-works-in-time-series-forecasting-the-results-from-nixtlas-mega-study-78eda5133622](https://valeman.medium.com/what-truly-works-in-time-series-forecasting-the-results-from-nixtlas-mega-study-78eda5133622).
%% begin Obsidian Notes %%
___

LightGBM is great for hourly time series (why?) but NHITS better for Monthly and otherwise competitive.  DeepAR is bad, while TimeGPT is not bad.  Simple Theta and SeasonalNaive seem good benchmarks

Proprietary non-reproducible study on TS forecasting of Monash Time Series Forecasting Repository at various time resolutions says that ML techniques now dominate traditional techniques like exponential smoothing.

However, the algorithms themselves appear to be in the [[Nixtla24openSrcTimeSeriesFrcst|Open Source Time Series Ecosystem - Nixtla]] GitHub repo.

### Monthly

1. [[Challu22NHiTSNeuralHierarchical|NHITS]]: Neural Hierarchical Interpolation for Time Series.  Was best in comparison
2. [TimeGPT](https://github.com/Nixtla/nixtla): generative pre-trained transformer model dedicated to prediction tasks.  Next best.
3. [Theta](https://towardsdatascience.com/theta-model-for-time-series-forecasting-642ad1d00358): A decomposition approach to forecasting.  “strong”  in statsmodels
4. DOTheta: (?) “strong”
5. [DeepAR](https://arxiv.org/abs/1704.04110): Probabilistic Forecasting with Autoregressive Recurrent Networks: barely bested [Seasonal Naive](https://openforecast.org/adam/simpleForecastingMethods.html) benchmark.  Seasonal Naive is “previous period”: previous day, previous year, …

### Weekly

1. [[Oreshkin20neuraBasisFrcstNBEATS|N-BEATS: Neural basis expansion analysis]]
2. TBATS: ARIMA with with multiple seasonality
3. DeepAR: barely beat seasonal

### Daily

1. TBATS is tops
2. NHITS ~ TimeGPTS (weekly?)
3. DeepAR: worse than Theta / DOTheta

### Hourly

1. LGBM significantly better than all models, including TimeGPT
2. but NHITS was “strong”
3. [[Peixeiro24tsFrcstKAN#KAN has Best Hourly Result|KAN has Best Hourly Result]]: over NHITSand NBEATS; LghtGBM not tested

**Also**
* [[Roque24TimeGPTVsTiDEZeroShot|TimeGPT vs TiDE]]
* [[Se23creatorsTimeGPT|Revolutionizing Time Series Forecasting: Interview with TimeGPT's creators]]
* [[Peixeiro24tsFrcstKAN#KAN has Best Hourly Result|KAN has Best Hourly Result]] LightGBM not tested, though
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Manokhin23worksTSfrcstNixtla
> 
> LightGBM is great for hourly time series (why?) but NHITS better for Monthly and otherwise competitive.  DeepAR is bad, while TimeGPT is not bad.  Simple Theta and SeasonalNaive seem good benchmarks
> 
> Proprietary non-reproducible study on TS forecasting ofMonash Time Series Forecasting Repositiory at various time resolutions says that ML techniques now dominate traditional techniques like exponential smoothing.
> 
> ### Monthly
> 
> 1. [NHITS](https://nixtla.github.io/neuralforecast/models.nhits.html): Neural Hierarchical Interpolation for Time Series.  Was best in comparison
> 2. [TimeGPT](https://github.com/Nixtla/nixtla): generative pre-trained transformer model dedicated to prediction tasks.  Next best
> 3. [Theta](https://towardsdatascience.com/theta-model-for-time-series-forecasting-642ad1d00358): A decomposition approach to forecasting.  “strong”  in statsmodels
> 4. DOTheta: (?) “strong”
> 5. [DeepAR](https://arxiv.org/abs/1704.04110): Probabilistic Forecasting with Autoregressive Recurrent Networks: barely bested [Seasonal Naive](https://openforecast.org/adam/simpleForecastingMethods.html) benchmark.  Seasonal Naive is “previous period”: previous day, previous year, …
> 
> ### Weekly
> 
> 1. [NBEATS](https://arxiv.org/abs/1905.10437): Neural basis expansion analysis for interpretable time series forecasting
> 2. TBATS: ARIMA with with multiple seasonality
> 3. DeepAR: barely beat seasonal
> 
> ### Daily
> 
> 1. TBATS is tops
> 2. NHITS ~ TimeGPTS (weekly?)
> 3. DeepAR: worse than Theta / DOTheta
> 
> ### Hourly
> 
> 1. LGBM significantly better than all models, including TimeGPT
> 2. but NHITSwas “strong”
> 
> <small>📝️ (modified: 2023-10-02) [link](zotero://select/library/items/WJ3DJ2LU) - [web](http://zotero.org/users/60638/items/WJ3DJ2LU)</small>
>  
> ---




%% Import Date: 2024-04-07T22:29:33.854-07:00 %%
