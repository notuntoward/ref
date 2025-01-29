---
category: literaturenote
tags:
  - CAISO
  - MISO
  - elecDemandFrcast
  - elecMktPriceFrcst
citekey: Zarnikau20determElecPriceMISO
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Determinants of the wholesale prices of energy and ancillary services in the U.S. Midcontinent electricity market
  - Determinants of the wholesale prices
publisher: Energy
citation key: Zarnikau20determElecPriceMISO
DOI: 10.1016/j.energy.2020.117051
"created date:": 2024-07-27T10:38:59-07:00
"modified date:": 
modified date: 2024-07-29T17:00:02-07:00
created date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/6UE59T6U)  | [**DOI**](https://doi.org/10.1016/j.energy.2020.117051)  | [**URL**](https://www.sciencedirect.com/science/article/pii/S0360544220301584) | [[Zarnikau20determElecPriceMISO.pdf|PDF]]
>
> 
> **Abstract**
> This paper examines wholesale price behavior of energy and ancillary services (AS) in the day-ahead market (DAM) and real-time market (RTM) of the Midcontinent Independent System Operator (MISO), the second largest regional transmission organization in the U.S. Using hourly data for the period of 12/19/2013 to 12/30/2017, it estimates a system of 16 electricity price regressions that recognizes the interdependence of MISO’s electricity products. Its key findings are: (1) MISO’s regional DAM energy prices increase with the day-ahead forecasts of natural gas price and MISO’s regional loads, PJM’s DAM energy price at its MISO interface, and MISO’s DAM AS requirements; (2) MISO’s regional DAM energy prices decline with DAM schedules for nuclear and wind generation; (3) MISO’s regional RTM energy prices increase with, but diverge from, MISO’s regional DAM energy prices; (4) MISO’s system-average DAM AS prices increase with MISO’s system-average DAM energy price and procured amounts of AS; and (5) MISO’s system-average RTM AS prices increase with MISO’s system-average RTM energy price and system-average DAM AS prices. These findings imply that MISO can reduce its DAM and RTM prices for energy and AS by accelerating wind generation development, expanding demand-side-management, and easing inter-regional transmission congestion.
> 
> 
> **FirstAuthor**:: Zarnikau, J.  
> **Author**:: Tsai, C. H.  
> **Author**:: Woo, C. K.  
~    
> **Title**:: "Determinants of the wholesale prices of energy and ancillary services in the U.S. Midcontinent electricity market"  
> **Date**:: 2020-03-15  
> **Citekey**:: Zarnikau20determElecPriceMISO  
> **ZoteroItemKey**:: 6UE59T6U  
> **itemType**:: journalArticle  
> **DOI**:: 10.1016/j.energy.2020.117051  
> **URL**:: https://www.sciencedirect.com/science/article/pii/S0360544220301584  
> **Journal**:: Energy  
> **Volume**:: 195  
> **Issue**::   
> **Book**:: Energy  
> **Publisher**::   
> **Location**::    
> **Pages**:: 117051  
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Zarnikau, J., et al. “Determinants of the Wholesale Prices of Energy and Ancillary Services in the U.S. Midcontinent Electricity Market.” _Energy_, vol. 195, Mar. 2020, p. 117051. _ScienceDirect_, [https://doi.org/10.1016/j.energy.2020.117051](https://doi.org/10.1016/j.energy.2020.117051).

%% begin Obsidian Notes %%
___
A regression study identifies market factors which influence MISO DAM and RTM market prices,  mentioning when the MISO finding confirms a similar finding about CAISO or ERCOT.  I don't have the pdf for this paper (attached is just the web page), so I can't find full references to those ERCOT or MISO papers, but I can infer from this one, the properties on those markets.  Compare with [[Kohansal17supplyBidsElastCAISO]].
# Correlates with MISO, CAISO, ERCOT Prices
<span style="color:rgb(0, 176, 80)">Green</span>: usable; <span style="color:rgb(146, 208, 80)">light green</span>: maybe; <span style="color:rgb(0, 176, 240)">blue</span>: possible but unlikely; <span style="color:rgb(255, 192, 0)">yellow</span>: not usable

| Market (Regional) | Priced Product | Correlate Price/Schedule, etc.                                                                                              | Product Direction | Useful for forecast                                                                                 | CAISO confirm | ERCOT Confirm | ERCOT Confrim | Note                                                                                                                    |                                       |
| ----------------- | -------------- | --------------------------------------------------------------------------------------------------------------------------- | ----------------- | --------------------------------------------------------------------------------------------------- | ------------- | ------------- | ------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| DAM               | region Energy  | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1850R\|DA forecasts of the fundamental drivers of natural gas price]] | Up                | <span style="color:rgb(0, 176, 80)">DAM energy</span>                                               | [16]          | [19]          |               |                                                                                                                         |                                       |
| DAM               | region Energy  | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1853R\|DA regional loads]]                                            | Up                | <span style="color:rgb(0, 176, 80)">DAM energy (if load forecast)</span>                            | [16]          | [19]          |               |                                                                                                                         |                                       |
| DAM               | region Energy  | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1856R\|DAM generation regional nuclear generation schedules]]         | Down              | <span style="color:rgb(146, 208, 80)">DAM (if know nuke schedules ahead of time?)</span>            | [16]          | [19]          |               |                                                                                                                         |                                       |
| DAM               | region Energy  | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1859R\|wind generation (schedule?)]]Z                                 | Down              | <span style="color:rgb(146, 208, 80)">DAM if know wind schedule ahead of time (or forecast?)</span> | [16]          | [19]          |               | Vary regionally: [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1862R\|inter-regional transmission constraints]] |                                       |
| DAM               | region Energy  | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1865R\|PJM’s DAM energy price at its MISO interface]]                 | Up                | <span style="color:rgb(0, 176, 240)">only if CAISO connector has earlier DAM close</span>           | [18]          |               |               |                                                                                                                         |                                       |
| RTM               | region Energy  | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1868R\|region DAM energy price]]                                      | Up                | <span style="color:rgb(0, 176, 80)">RTM energy</span>                                               | [20]          | [19]          |               | [[Zarnikau20determElecPriceMISO.pdf#page=3&annotation=1201R\|diverges w/ DAM energy]]                                   |                                       |
| DAM               | system AS      | [[Zarnikau20determElecPriceMISO.pdf#page=4&annotation=1871R\|system-avg DAM energy price]]                                  | Up                | <span style="color:rgb(255, 192, 0)">No.</span>                                                     |               | [19]          |               |                                                                                                                         |                                       |
| DAM               | system AS      | [[Zarnikau20determElecPriceMISO.pdf#page=4&annotation=1874R\|system-avg AS requirements]]                                   | Up                | <span style="color:rgb(0, 176, 240)">Maybe? What are "requirements"</span>                          |               | [19]          |               |                                                                                                                         |                                       |
| RTM               | system AS      | [[Zarnikau20determElecPriceMISO.pdf#page=4&annotation=1877R\|system-average RTM energy price]]                              | Up                | <span style="color:rgb(0, 176, 240)">No? Regional corr w/ sys?</span>                               |               | [19]          |               |                                                                                                                         |                                       |
| RTM               | system AS      | [[Zarnikau20determElecPriceMISO.pdf#page=4&annotation=1885R\|DAM AS price]]                                                 | Up                | <span style="color:rgb(0, 176, 240)">No? Regional corr w/ sys?</span>                               |               | [19]          |               | but diverge                                                                                                             |                                       |
| RTM               | system AS      | <span style="color:rgb(0, 176, 80)">[[Zarnikau20determElecPriceMISO.pdf#page=4&annotation=1885R\|DAM AS price]]</span>      | Up                | <span style="color:rgb(0, 176, 240)">No? Regional corr w/ sys?</span>                               |               |               |               |                                                                                                                         | <span style="color:rgb(0, 176, 240)"> |




___
%% end Obsidian Notes %%


%% Import Date: 2024-07-27T10:39:18.077-07:00 