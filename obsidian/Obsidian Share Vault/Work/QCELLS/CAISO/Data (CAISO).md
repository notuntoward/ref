---
created date: 2024-07-27T21:28:45-07:00
modified date: 2024-08-06T18:23:28-07:00
---
- [**Today's Outlook**: CAISO demand, supply, emissions, prices](https://www.caiso.com/todays-outlook)
- OASIS: the CAISO data interface
	- [OASIS Prod](http://oasis.caiso.com/mrioasis/logon.do)
	- [OASIS FAQ](obsidian://open?vault=Obsidian%20Share%20Vault&file=work%2FCAISO%2Fattachments%2Foasis-frequently-asked-questions.pdf)
- [Network model changes and pricing node mapping](https://www.caiso.com/library/network-model-changes-and-pricing-node-mapping)^4hcx
	- shows PNODEs etc. ([[Market Details (CAISO)#^5sgx|PNode definition]])
- [The Renewables and Wholesale... ReWP](https://emp.lbl.gov/renewables-and-wholesale-electricity-prices-rewep): online electricity price plotter
	- [ReWEP Tool 2024 release](https://emp.lbl.gov/news/exploring-wholesale-energy-price-trends-renewables-and-wholesale-electricity-prices): price visualizer, some download possible (aggregate only)
- [[Edwards21rampFrcstVizRAVIS|Edwards21: RAVIS: Resource Forecast and Ramp]] 
- My [unsuccessful attempts on perplexity](https://www.perplexity.ai/search/caiso-has-a-day-ahead-market-f-sFOGWKkpS3.rbXsYdELaNw#5) to find ancillary service activation data

# Features used in existing CAISO forecast 
Amir [says](https://growingenergylabs.atlassian.net/wiki/spaces/ARG/pages/9494659948/Draft+Project+Plan+Stochastic+Optimization+for+Real+Time+Energy+Market+Bidding#%5CuD83D%5CuDD17-Reference-materials):
> "RT" predictors used in the DA energy are shared with RT energy as CAISO does not provide hourly forecasts for any predictors (features), ==based on our current access pattern==. The difference is in integration of ==5-min published LMPS== which results in adjusting the forecasts on an hourly basis.

Amir points to this summary page: [Tahoe Project - DA Energy forecasting](https://growingenergylabs.atlassian.net/wiki/spaces/analytics/pages/9347694660/Tahoe+Project+-+DA+Energy+forecasting).  There are the 3 DA model feature sets -- the union of them is:

|Variable | Description|
| -- | -- |
|demand_SCE | |
|Persisted_Fuel_Price| |
|Total_Renewable| |
|SP15_Renewable| |
|Persisted_DAM_LMP_Price| |
|demand_CAISO| |
|RU_2DA_Req_MIN| |
|Annual_Seasonality| |
|Daily_Seasonality| |
|drv_SP_2DA_Req_MIN| |
|drv_SP15_Renewable| |
|Weekly_Seasonality| |
|drv_demand_SCE| |
|SP_2DA_Req_MIN| |
|RD_2DA_Req_MAX| |
|RD_2DA_Req_MIN| |
|NS_2DA_Req_MIN| |
|drv_demand_CAISO| |
 