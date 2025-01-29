---
category: literaturenote
tags:
  - ml/forecast
  - elecMktTrading
  - elecDemandFrcst
  - elecMktPriceFrcst
  - LightGBM
citekey: Shah16frcstElecMktVariables
status:
  - read
dateread: 
ZoteroTags: Electricity markets, obsLitNote, Price forecasting, todo
aliases:
  - Modeling and Forecasting Electricity Market Variables
  - Modeling and Forecasting Electricity Market
publisher: ""
citation key: Shah16frcstElecMktVariables
DOI: ""
"created date:": 2024-07-28T10:59:16-07:00
"modified date:": 
modified date: 2024-07-29T16:55:10-07:00
created date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/X69MHPKQ)   | [**URL**](https://www.semanticscholar.org/paper/Modeling-and-Forecasting-Electricity-Market-Shah/3df284fd3749422e3f5a6610a4716aa933e0c60d) | [[Shah16frcstElecMktVariables.pdf|PDF]]
>
> 
> **Abstract**
> In deregulated electricity markets, accurate modeling and forecasting of different variables, e.g. demand, prices, production etc. have obtained increasing importance in recent years. As in most electricity markets, the daily demand and prices are determined the day before the physical delivery by means of (semi-) hourly concurrent auctions, accurate forecasts are necessary for the efficient management of power systems. However, it is well known that electricity (demand/price) data exhibit some specific features, among which, daily, weekly and annual periodic patterns as well as non-constant mean and variance, jumps and dependency on calendar effects. Modeling and forecasting, thus, is a challenging task. This thesis tackles these two issues, and to do this, two approaches are followed.    In the first case, we address the issue of modeling and out-of-sample forecasting electricity demand and price time series. For this purpose, an additive component model was considered that includes some deterministic and a stochastic residual components. The deterministic components include a long-term dynamics, annual and weekly periodicities and calendar effects. The first three components were estimated using splines while the calendar effects were modeled using dummy variables. The residual component is instead treated as stochastic and different univariate and multivariate models have been considered with increasing level of complexity. In both cases, linear parametric and nonlinear nonparametric models, as well as functional based models, have been estimated and compared in a one day-ahead out-of-sample forecast framework.    The class of univariate models includes parametric autoregressive models (AR), nonparametric and nonlinear regression models based on splines (NPAR) and scalar-response functional models, that in turns can be formulated parametrically (FAR) or non parametrically (NPFAR). The multivariate models are vector autoregressive models (VAR) and functionalresponse, parametric (FFAR) and nonparametric (NPFFAR), models. For this issue, five different electricity markets, namely, British electricity market (APX Power UK), Nord Pool electricity market (NP), Italian electricity market (IPEX), Pennsylvania-New Jersey-Maryland electricity market (PJM) and Portuguese electricity market (OMIE(Po)) were considered for the period 2009 to 2014. The first five years were used for model estimation while the year 2014 was left for one-day-ahead forecasts. Predictive performances are first evaluated by means of descriptive indicators and then through a test to assess the significance of the differences. The analyses suggest that the multivariate approach leads to better results than the univariate one and that, within the multivariate framework, functional models are the most accurate, with VAR being a competitive model in some cases. The results also lead to another important finding concerning to the performance of parametric and nonparametric approach that showed strong linkage with underlying process. Finally the obtained results were compared with other works in the literature that suggest our forecasting errors are smaller compared with the state-of-art prediction techniques used in the literature.    In the second part of this thesis the issue of electricity price forecasting is revisited following a completely different approach. The main idea of this approach is that of modeling the daily supply and demand curves, predicting them and finding the intersection of the predicted curves in order to find the predicted market clearing price and volume. In this approach, the raw bids/offers data for demand and supply, corresponding to each (half-) hour is first aggregated in a specific order. The functional approach converts the resulted piece wise curves into smooth functions. For this issue, parametric functional model (FFAR) and the nonlinear nonparametric counterpart (NPFFAR) were considered. As benchmark, an ARIMA model was fitted to the scalar time series corresponding to the market clearing prices obtained from the crossing points of supply and demand curves. Data from Italian electricity market were used for this issue and the results are summarized by different descriptive indicators. As in the first case, results show superior forecasting performance of our functional approach compare to ARIMA. Among different models, the nonparametric functional model produces better results compared to parametric models. Apart from the improvement in forecasting accuracy, it is important to stress that this approach can be used for optimizing bidding strategies. As forecasting the whole curves gives deep insight into the market, our analysis showed that this strategy can significantly improve bidding strategies and maximize traders profit.
> 
> 
> **FirstAuthor**:: Shah, Ismail  
~    
> **Title**:: "Modeling and Forecasting Electricity Market Variables"  
> **Date**:: 2016-01-31  
> **Citekey**:: Shah16frcstElecMktVariables  
> **ZoteroItemKey**:: X69MHPKQ  
> **itemType**:: conferencePaper  
> **DOI**::   
> **URL**:: https://www.semanticscholar.org/paper/Modeling-and-Forecasting-Electricity-Market-Shah/3df284fd3749422e3f5a6610a4716aa933e0c60d  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: Electricity markets, obsLitNote, Price forecasting, todo
> **Related**:: 

> Shah, Ismail. _Modeling and Forecasting Electricity Market Variables_. 2016. _Semantic Scholar_, [https://www.semanticscholar.org/paper/Modeling-and-Forecasting-Electricity-Market-Shah/3df284fd3749422e3f5a6610a4716aa933e0c60d](https://www.semanticscholar.org/paper/Modeling-and-Forecasting-Electricity-Market-Shah/3df284fd3749422e3f5a6610a4716aa933e0c60d).
%% begin Obsidian Notes %%
___

Time series price forecasting on several markets.  I couldn’t find the conference paper but did find the PhD

In Chapter 6: Modeling and Forecasting Supply and Demand Curves, the take the demand/supply bid curves and fit them to a spline, the predict the market equilibrium price from their intersection.  Note that in this market, the bids and offers are available only after an 8 day lag.  Still, the forecast does beat a day-ahead ARIMA equilibrium (I think) price forecast.  The spline part is maybe not convincing, but an LGBM implementation could produce some probabilistic forecast features?

# Points
- the <u>8 day lag</u> for data (seems like CAISO might have the same delay)
- they predict `equilibrium price` (curve intersection), not the `market clearing price`, which includes imports, transmission constraints, and other stuff 
	- clearing price explanation not clear
	- the don't report how accurate their equilibrium price prediction would be as an estimate of the clearing price, which is what (I think?) is actually used.
- their forecast seems iterative, one step (one day) ahead, and then iterated, but they don't say that
- @ I could probably use an [[LightGBM]] with [[LightGBM#Monotonic Learning with LightGBM|Monotonic Learning]] to predict the two curves, maybe even their intersection (clearing price), all in one model?
- @ Features derived from the curves could possibly be used as features for a prob forecast prediction (a steeper demand slope would indicate higher uncertainty, kind of like how wind power ramps cause time-uncertainty)

___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Shah16frcstElecMktVariables
> 
> Time series price forecasting on several markets.  I coulln’t find the conference paper but did find the PhD
> 
> Maybe of special interest:
> 
> Chapter 6: Modeling and Forecasting Supply and Demand Curves
> 
> <small>📝️ (modified: 2024-07-28) [link](zotero://select/library/items/67VQS4EP) - [web](http://zotero.org/users/60638/items/67VQS4EP)</small>
>  
> ---


