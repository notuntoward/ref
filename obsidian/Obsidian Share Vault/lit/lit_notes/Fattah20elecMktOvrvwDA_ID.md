---
category: literaturenote
tags:
  - elecMktTrading
  - elecDemandFrcst
  - elecMktPriceFrcst
  - CAISO
  - ERCOT
  - NordPool
citekey: Fattah20elecMktOvrvwDA_ID
status:
  - read
dateread: 
ZoteroTags: /unread, AEMO, intro, obsLitNote, todo
aliases:
  - Overview of day-ahead and intraday electricity market
  - Overview of day-ahead and intraday
publisher: ""
citation key: Fattah20elecMktOvrvwDA_ID
DOI: ""
"created date:": 2024-07-22T22:00:25-07:00
"modified date:": 
modified date: 2024-08-06T12:12:33-07:00
created date: 2024-07-23T17:52:51-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/RCCILGWG)   | [**URL**](https://trepo.tuni.fi/handle/10024/124424) | [[Fattah20elecMktOvrvwDA_ID.pdf|PDF]]
>
> 
> **Abstract**
> Electricity is a commodity, which has many different attributes from other products because of its unique features. It needs a special infrastructure for production, transportation, and consumption.  In this thesis, the electricity system is discussed in two subsystems. The flow of electricity happens in the technical subsystem, and monetary value is discussed in the economic subsystem.     Here is an attempt to do a comprehensive review of three different marketplaces: AEMO in Australia, CAISO in California, and Nord Pool in Nordic countries based on literature review and available public information. In these marketplaces, there is continuous or upcoming reform of the energy system, which can be strengthened by integrating different perspectives from current markets. Characteristics for a successful electricity market are also proposed at the end of the thesis.     Currently, CAISO has a centralized wholesale energy market, while Nord Pool and AEMO have also decentralized properties. The critical issue with the centralized CAISO market is that they don’t have intra-day pricing that can be updated continuously when the renewable generation changes. Whereas Nord Pool and AEMO with their decentralized intraday market, has the flexibility to adjust the price according to renewable energy production as close to real-time. This iterative intra-day trading can address the coordination problem related to wind and solar power generation. The downside is that there is a risk of network constrain, which can be improved by analysing the network in more detail.     The limitation of this study is using only three marketplaces where in the future it can be extended to more marketplaces
> 
> 
> **FirstAuthor**:: Fattah, Md Abu  
~    
> **Title**:: "Overview of day-ahead and intraday electricity market"  
> **Date**:: 2020-01-01  
> **Citekey**:: Fattah20elecMktOvrvwDA_ID  
> **ZoteroItemKey**:: RCCILGWG  
> **itemType**:: journalArticle  
> **DOI**::   
> **URL**:: https://trepo.tuni.fi/handle/10024/124424  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: /unread, AEMO, intro, obsLitNote, todo
> **Related**:: 

> Fattah, Md Abu. _Overview of Day-Ahead and Intraday Electricity Market_. 2020. _trepo.tuni.fi_, [https://trepo.tuni.fi/handle/10024/124424](https://trepo.tuni.fi/handle/10024/124424).
%% begin Obsidian Notes %%
___

Compares AEMO, Nord Pool, and CAISO markets.  I've read only Section 3.3, the one about CAISO. Reading the conclusion might be worthwhile someday, e.g. if I work on ERCOT.  Explanation is bad, so only skim this for certain details.  Go elsewhere for global understanding.
# CAISO points
## Day-ahead market
- [[Fattah20elecMktOvrvwDA_ID.pdf#page=31&annotation=5421R|Day-ahead market]]
- Opens [[Fattah20elecMktOvrvwDA_ID.pdf#page=31&annotation=2303R|eight days before power delivery]]!
- bidding closes at [[Fattah20elecMktOvrvwDA_ID.pdf#page=31&annotation=2295R|10 am the day before power delivery]]
### Three DAM Processes, in sequence

1. `market power mitigation`, where some change prevents especially powerful operators from preventing competition.  Doesn't say what that is.
2. `FM`: forward market, defines how much generation needed to meet demand (intersection of supply/demand curves) for the next day. Results are: 
	- a set of market prices\
	- a `residual unit`: I believe this means a unit committed to satisfy the difference between forecasted and cleared power ([[lit/lit_notes/Fattah20elecMktOvrvwDA_ID.md#- Residual Unit Commitment |Residual Unit Commitment]])
	- `commitment`: secures <u>Additional</u> capacity to meet *forecasted* demand.
		- If forecast != demand @ supply/demand curve intersection, what is the price for this extra capacity?  Not clear, but this should have been defined in ([[lit/lit_notes/Fattah20elecMktOvrvwDA_ID.md#- Residual Unit Commitment |Residual Unit Commitment]])
		- how does somebody sign up to be committed the next day if not on the left side of this intersection?  Not clear, but this should have been defined in ([[lit/lit_notes/Fattah20elecMktOvrvwDA_ID.md#- Residual Unit Commitment |Residual Unit Commitment]])
		- co-optimized to produce a DA schedule
			- I suppose this determines when each generator must produce power
			- [ ] ? Is the "co" in "co-optimized" the extra power for AS or something?
3. [[Fattah20elecMktOvrvwDA_ID.pdf#page=32&annotation=2311R|Publish market result (13:00)]], triggering RTM opening
### [[Fattah20elecMktOvrvwDA_ID.pdf#page=32&annotation=2323R|Energy Imbalance Market]]\
- This is still part of DAM, I think (crappy writing in this paper)
- [ ] ? a [[Fattah20elecMktOvrvwDA_ID.pdf#page=32&annotation=2343R|post-market process]] that is different than the RTM?  What is that process?
### Ancillary Services (DAM)
See [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=5426R|Ancillary Services (DAM)]]
- DAM allocates ancillary service capacity for reliablity
	- [ ] ? difference between forecast and DAM market intersection plus safety margin?
	- allocated generation gets some kind of "capacity fee"
- These are `procurred` in the "real-time" 
	- [ ] ? if procured, get an energy fee?
- [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=5429R|Regulation]]: must react to ISO control [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=5432R|every four seconds]]
- [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=5435R|Operation reserves]]: handles e.g. large generator fails
	- [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=2643R|Spinning reserve]]
		- synchronized to grid
		- ready [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=2651R|within a  ten-minute  period.]]
	- [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=2655R|non-spinning  reserve]]
		- not synchronized
		- but dispatchable [[Fattah20elecMktOvrvwDA_ID.pdf#page=33&annotation=2667R|within ten minutes]]
	- [ ] ? Aren't both ready in 10 minutes?  What's the difference?
### - Residual Unit Commitment
- Covers [[Fattah20elecMktOvrvwDA_ID.pdf#page=34&annotation=2887R|ISO-forecasted energy beyond market-cleared energy]]
- [[Fattah20elecMktOvrvwDA_ID.pdf#page=34&annotation=2879R|RUC]]: residual unit commitment: can get power from pre-dedicated "resource adequacy program" but not always.
- Could be a DAM capacity payment, as well as an energy payment 
	- energy only if activated, I'm guessing
	- [ ] ? a [[Fattah20elecMktOvrvwDA_ID.pdf#page=34&annotation=2903R|scheduling coordinators need to  submit  an energy bid]].  Who are they?  Does generator have a choice on that bid?
	- [ ] ? how is the price defined for residual units?
	- [ ] ? how does somebody sign up to be committed the next day if not on the left side of this intersection?
### Market Power Mitigation
- `market power`: the power a generator has when there's[[Fattah20elecMktOvrvwDA_ID.pdf#page=34&annotation=3343R|only one resource available]]
- [[Fattah20elecMktOvrvwDA_ID.pdf#page=35&annotation=5448R|Resource bid that is mitigated is reduced to a cost-based bid.]]
## Real-time Market (RTM)
### Three RTM timelines
1. hourly
2. [[Fattah20elecMktOvrvwDA_ID.pdf#page=35&annotation=3423R|15-minute market]]
3. 5-minute [[Fattah20elecMktOvrvwDA_ID.pdf#page=35&annotation=3427R|real-time dispatch]] 
- these are submitted [[Fattah20elecMktOvrvwDA_ID.pdf#page=35&annotation=3411R|75 min]] before trading hour: bids from all participants and base schedules from EIM
- [ ] ? explanation is poor.  Go somewhere else for this info
--- 
%% end Obsidian Notes %%
> [!note]- Zotero Note (1)
> Fattah20elecMktOvrvwDA_ID
> 
> Compares AEMO, Nordpool, and CAISO.  I’m involved with 2 of them, so maybe worth a read.
> 
> <small>📝️ (modified: 2023-10-20) [link](zotero://select/library/items/4YPJQWXN) - [web](http://zotero.org/users/60638/items/4YPJQWXN)</small>
>  
> ---




%% Import Date: 2024-07-22T22:00:38.841-07:00 %%
