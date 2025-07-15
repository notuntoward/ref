---
created date: 2024-07-27T10:29:44-07:00
modified date: 2024-08-03T13:37:16-07:00
---
# Questions

Following [Stochastic Optimization for Real Time Energy Market Participation: The universe of ideas](https://growingenergylabs.atlassian.net/wiki/x/WQBVNgI)
## CAISO market properties
- [ ] [[KellyDetwiler24tale2CAISO_ERCOT|KellyDetwiler24: A tale of two ISOs: energy market design in Texas and California | GE Vernova]] 
- [ ] [[Nelson23ancillarySat_CAISO_ERCOT|Nelson23: Ancillary Market Saturation in CAISO and ERCOT: A Series of Predictable Events]] 
- [ ] [[Bahareh23priceFrcstCAISOidAndDA|Bahareh23: CAISO Intraday & Day-ahead Price Forecast Case Study Solution]]
## Most promising things to forecast?
- [ ] look at Zotero CAISO Market subcollection papers
- [ ] Do CAISO tutorials
## Do 15 minute market?  What is it?

## What is the AS utilization forecast?

## What kind of scenarios does JonD actually want?

- [ ] Review the [Research Plan](https://growingenergylabs.atlassian.net/wiki/x/WQBVNgI) to figure out what he means, if it makes sense, and what kind of scenarios are needed to deliver it
## Hourly mean price forecast or per-five-minute true price?
Job is to estimate profit over some interval.  If can bid only one price and power level per hour, isn't it simply `bid_power X forecasted_hourly_mean_price` ?  Is there something about price transition probabilities that would make you do something else?  Forecast 5-minute prices but downsample and average scenarios to one hour?  Interaction with AS forecast?

The one thing worth considering is when AS could get activated.  
- are AS prices even 5 minutes or is it flat (from DA), with an energy fee
- [ ] ? if you can't risk being AS activated and not having available AS energy, is there some way knowing which 5 minute period will have a high RTM price will affect your single hourly bid?  
- [ ] ? are RTM energy bids also activated every 5 mins, or are you guaranteed payment for full hour regardless?
## Non-crossing / invertible multi-quantiles 
- [ ] See [[Quantile Crossing]]
## CVAR
- [ ] Special quantiles for CVAR?
	- The [Research Plan](https://growingenergylabs.atlassian.net/wiki/x/WQBVNgI) says do CVAR: [[Kumar24ComparConformQRtoQR]], says that QR is used for VAR and CVAR
## Conformal prediction?
- [ ] [[Kumar24ComparConformQRtoQR|Kumar24: Comparing Conformal and Quantile Regression for Uncertainty Quantification: An Empirical Investigation]] 
- [ ] [[Taquet22theoryDescrConformScores|Taquet22: Theoretical Description for Conformity Scores (MAPIE docs)]] 
## Conditional Markov in some linear way
## Liquidity forecast?
# Ideas
## Features
- probabilistic demand ramp rate forecaster as a price forecast input feature
	- could be generated from my old IRPWIND copula model
- Zarnikau20: [[Zarnikau20determElecPriceMISO#<span style="color:rgb(0, 176, 240)">Zarnikau20: </span>Correlates with MISO, CAISO, ERCOT Price|Correlates with MISO, CAISO, ERCOT Prices]]
- demand/response bid curve forecast, as in [Shah16frcstElecMktVariables](Shah16frcstElecMktVariables.md), possibly a probabilistic price forecast features
- Conformal price forecast e.g. [[Zaffran22adaptCnfrmPriceFrcst|Zaffran22: Adaptive conformal predictions for time series]] 

