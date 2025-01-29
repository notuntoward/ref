---
category: literaturenote
tags:
  - pacemaker
  - health
citekey: Lau89snglChmbrCardiacPace
status:
  - read
dateread: 
ZoteroTags: ""
aliases:
  - Single-chamber cardiac pacing with two forms of respiration-controlled rate-responsive pacemaker
  - Single-chamber cardiac pacing with two
publisher: Chest
citation key: Lau89snglChmbrCardiacPace
DOI: ""
created date: 2024-09-29T11:51:21-07:00
modified date: 2024-10-01T18:38:33-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/TJQFFPC4)   | [**URL**](https://www.sciencedirect.com/science/article/pii/S0012369216332901) | [[Lau89snglChmbrCardiacPace.pdf|PDF]]
>
> 
> 
> **FirstAuthor**:: Lau, Chu-Pak  
> **Author**:: Ward, David E.  
> **Author**:: Camm, A. John  
~    
> **Title**:: "Single-chamber cardiac pacing with two forms of respiration-controlled rate-responsive pacemaker"  
> **Date**:: 1989-01-01  
> **Citekey**:: Lau89snglChmbrCardiacPace  
> **ZoteroItemKey**:: TJQFFPC4  
> **itemType**:: journalArticle  
> **DOI**::   
> **URL**:: https://www.sciencedirect.com/science/article/pii/S0012369216332901  
> **Journal**:: Chest  
> **Volume**:: 95  
> **Issue**:: 2  
> **Book**:: Chest  
> **Publisher**::   
> **Location**::    
> **Pages**:: 352–358  
> **ISBN**::   
> **ZoteroTags**:: 
> **Related**:: 

> Lau, Chu-Pak, et al. “Single-Chamber Cardiac Pacing with Two Forms of Respiration-Controlled Rate-Responsive Pacemaker.” _Chest_, vol. 95, no. 2, 1989, pp. 352–58.
%% begin Obsidian Notes %%
___

Tests of early single chamber pacemakers using ventilation rate to drive pacing suggests a few things that might be relevant to Jack's pacemaker pain points:

- racing heart rate
	- tachycardia due to atrial sensing, a consequence of dual chamber pacemaker?
	- minute ventilation estimation error due to
		- depth of respiration setting
		- arm swinging artifacts
		- lowpass filter on estimated breath rate
- limited max HR due to a long atrial refraction setting 
# Details

- *atrial sensing* can predispose to development of [[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=1301R|tachycardia]] 
	- ? atrial sensing only on dual chamber pacemakers
		- Says, in regard to this problem that "[[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=625R|dual chamber pacing may not be the ideal]]"
		- experiments here done w/ single chamber pacing? Says: "[[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=825R|single chamber cardiac pacing,]]"
	- can be recued by using a [[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=317R|long atrial refractory period]]
	- ! but this can cause a [[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=321R|limitation of the upper rate]] response
	- ? Is a too-long refractory period being used on Jack's pacemaker?
- [[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=1609R|changes in respiratory rate correlate significantly with changes in heart rate]]: good justification for the dResp/dHR algorithm in [[Mond88rateResponsPace]]
	- Nice graph: [[Lau89snglChmbrCardiacPace.pdf#page=4&annotation=2318R|Figure 3.]]
	- impedance measured between pacemaker case and an [[Lau89snglChmbrCardiacPace.pdf#page=2&annotation=1613R|auxiliary electrode placed about 8 to 10 cm from the pacemaker casing]]
	- 60 Hz low pass filter used to [[Lau89snglChmbrCardiacPace.pdf#page=3&annotation=1762R|reduce the influence of stroke volume]] 
		- on sensed rate (I think)
		- ? is this cutoff a setting?
		- note: [minute ventilation](Mond88rateResponsPace) == breath_volume \* breath_rate 
- **setting**: [[Lau89snglChmbrCardiacPace.pdf#page=3&annotation=1645R|depth of respiration considered as a breathing rate]]
	- [ ] ? a setting on Jack's pacemaker?
- [[Lau89snglChmbrCardiacPace.pdf#page=5&annotation=2529R|Arm Swinging]] can drive "pacing rate response"
	- seems to mean the rate added to current HR but I'm not sure
	- [[Lau89snglChmbrCardiacPace.pdf#page=5&annotation=2325R|Tested]] when holding breath, swinging arm
	- [[Lau89snglChmbrCardiacPace.pdf#page=6&annotation=3182R|Pacemaker-dependent effect]]
		- *Biorate*: effect increases constantly w/ swing rate: max=113 BPM 
		- *Meta*: effect peak @ 30 swings/min: max=103 BPM, so kind of a resonant frequency
___
%% end Obsidian Notes %%



%% Import Date: 2024-09-29T11:47:18.531-07:00 %%
