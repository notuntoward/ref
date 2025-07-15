---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
# Starting Features
- P5MIN price forecast
- PREDISPATCH price forecast
- My time features
# Feature Tranche #2
Things that directly hint at shortages, price spikes.  Minimal Feature engineering needed.

- % VRE and %RES
	- Actual vs. Forecast
		- [WattCity's %VRE widget](zotero://select/library/items/AKI29ZT7) reports actuals, 
		- [ ] <span style="color:#ff0000">TODO:</span> but can this be forecasted too?
	- References
		- [Case Study (part 1) of low % VRE NEM-wide on 3rd and 4th July 2023 - WattClarity](zotero://select/library/items/GLVWACDW)
		- [details on Watt Clarity's new widget](zotero://select/library/items/AKI29ZT7)
	- To Download
		- [ ] [[AEMO Data Tables#^96b448|Rooftop PV actual]]
		- [ ] [[AEMO Data Tables#^caa277|Rooftop PV forecast]]
		- [ ] Wind actuals?
		- [ ] [[AEMO Data Tables#^5a7a9c|Wind Forecast]]
		- [ ] Utility Solar Forecast
		- [ ] Dispatchable generation, including hydro
	- [ ] <span style="color:#ff0000">TODO: </span>did the price spike on the days mentioned in the case study above:  3rd and 4th July 2023
	- 
# Advanced features
- Unplanned outage data
	- MT PASA DUID Availability data mentioned [here](https://wattclarity.com.au/articles/2023/06/four-coal-unit-outages-in-the-past-24-hours/), where it shows coal plants tripping, 
	- and in View's page [here](https://growingenergylabs.atlassian.net/wiki/spaces/~6246877945ece00069ca8ef0/pages/8844411573/How+to+analyse+events+forecast), where she explains how to parse it, and [how to detect unplanned outages](https://growingenergylabs.atlassian.net/wiki/spaces/~6246877945ece00069ca8ef0/pages/8844411573/How+to+analyse+events+forecast#How-to-detect-real-time-unplanned-outages%3F)
	- 
- Bid Curve data
	- [NEMOSIS/examples/generator\_bidding\_data.ipynb at master · UNSW-CEEM/NEMOSIS · GitHub](https://github.com/UNSW-CEEM/NEMOSIS/blob/master/examples/generator_bidding_data.ipynb)
	- price formation: [Guide to Scheduled Loads](zotero://select/library/items/YBHBNNMM)
- Transmission/islanding and frequency stuff in [[@Robinson24contingCondPowInterruptAEMO]]
# Also
- Zotero Note: [AEMO Price Forecasting Project](zotero://select/library/items/9DYSEPR6)