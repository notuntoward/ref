---
category: literaturenote
tags:
  - health
  - pacemaker
citekey: Mond88rateResponsPace
status:
  - read
dateread: 
ZoteroTags: Aged, Aged, 80 and over, Cardiac Pacing, Artificial, Electrodes, Implanted, Equipment Design, Exercise Test, Female, Heart Rate, Humans, Male, Middle Aged, Pacemaker, Artificial, Physical Exertion, Respiration, Tidal Volume
aliases:
  - Rate responsive pacing using a minute ventilation sensor
  - Rate responsive pacing using a
publisher: "Pacing and clinical electrophysiology: PACE"
citation key: Mond88rateResponsPace
DOI: 10.1111/j.1540-8159.1988.tb06322.x
created date: 2024-09-29T12:24:15-07:00
modified date: 2024-10-01T22:54:32-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/4IPTJAK8)  | [**DOI**](https://doi.org/10.1111/j.1540-8159.1988.tb06322.x)  | [[Mond88rateResponsPace.pdf|PDF]]
>
> 
> **Abstract**
> Minute ventilation, the product of respiratory rate and tidal volume, correlates directly with oxygen consumption, cardiac output, and heart rate. An implantable pacemaker has been developed which allows variation in pacing rate in response to measured changes in minute ventilation. This single chamber system measures transthoracic impedance between the tip electrode of a standard bipolar lead and the pulse generator case. Low amplitude current pulses (1 mA for 15 microseconds) are generated each 50 msec between the the ring electrode and the case. In the adaptive mode, the pulse generator calculates a rate response factor or slope after maximal exercise. This slope, which describes the relationship between pacing rate and minute ventilation together with the pacing rate limits are the only programmable rate responsive features. Minute ventilation rate responsive systems have been implanted in 12 patients (8 females, 4 males), of mean age 63 years. Indications were His bundle ablation (6), acquired complete heart block (4), and sick sinus syndrome (2). At post-implant exercise testing, pacing rate rose within the first minute. Peak rate and time to upper rate were dependent on workload. After exercise, pacing rate remained at peak for up to 2 minutes before a gradual fall to resting rate. Comparative studies of the minute ventilation and the activity sensor pacing systems in the same patients confirmed that the minute ventilation system more closely parallels normal sinus response to activity. The minute ventilation rate responsive pacing system is simple to programme, no special lead is required and the system is highly physiologic.
> 
> 
> **FirstAuthor**:: Mond, H.  
> **Author**:: Strathmore, N.  
> **Author**:: Kertes, P.  
> **Author**:: Hunt, D.  
> **Author**:: Baker, G.  
~    
> **Title**:: "Rate responsive pacing using a minute ventilation sensor"  
> **Date**:: 1988-11-01  
> **Citekey**:: Mond88rateResponsPace  
> **ZoteroItemKey**:: 4IPTJAK8  
> **itemType**:: journalArticle  
> **DOI**:: 10.1111/j.1540-8159.1988.tb06322.x  
> **URL**::   
> **Journal**:: Pacing and clinical electrophysiology: PACE  
> **Volume**:: 11  
> **Issue**:: 11 Pt 2  
> **Book**:: Pacing and clinical electrophysiology: PACE  
> **Publisher**::   
> **Location**::    
> **Pages**:: 1866-1874  
> **ISBN**::   
> **ZoteroTags**:: Aged, Aged, 80 and over, Cardiac Pacing, Artificial, Electrodes, Implanted, Equipment Design, Exercise Test, Female, Heart Rate, Humans, Male, Middle Aged, Pacemaker, Artificial, Physical Exertion, Respiration, Tidal Volume
> **Related**:: 

> Mond, H., et al. “Rate Responsive Pacing Using a Minute Ventilation Sensor.” _Pacing and Clinical Electrophysiology: PACE_, vol. 11, no. 11 Pt 2, Nov. 1988, pp. 1866–74. _PubMed_, [https://doi.org/10.1111/j.1540-8159.1988.tb06322.x](https://doi.org/10.1111/j.1540-8159.1988.tb06322.x).
%% begin Obsidian Notes %%
___

Defines minute-ventilation, rate response factor (slope) and what appears to have been the first set of heuristics used to employ minute-ventilation for driving cardiac pacing. The system is tuned to the patient using only three parameters: rate response factor, low rate and high rate.

- `Minute ventilation`, proportional to oxygen delivered in one minute (I think) is sensed my measuring the frequency and amplitude of impedance measured across the chest. It is simply rate (how many breaths per minute) times amplitude (the volume of each breath).
	- [ ] ? How is amplitude measured? Max value, 0.99 quantile, half-wave LSQ fit amplitude?
- Differences of [[Mond88rateResponsPace.pdf#page=2&annotation=123R|smoothed]] short and long-term MVs indicates how much harder breathing is than normal. 
	- 30s smooth for short term; 1-2 hrs for long
	- [ ] ? could a too-short short smooth cause Jack's hyperactivity?
		- doesn't list short smooth time as a tunable parameter in this paper
	- [ ] ? is short term smoothing a tunable param in Jack's pacemaker?
- `rate response factor` (slope) determines the *change in pacing in response to the change in minute ventilation*.
	- This is a programmable constant.
	- [[Mond88rateResponsPace.pdf#page=3&annotation=155R|Figure 2]] shows the effect on total heart rate vs. change in minute volume.
		- [ ] ? Is this with constantly increasing breathing in some kind of protocol? Paper not clear.
		- can see that high slope means rapid change in HR
	- Is justified in [[Lau89snglChmbrCardiacPace]]
- `peak exercise function`: is the [[Mond88rateResponsPace.pdf#page=3&annotation=163R|optimal slope value]] determined during a test, but how it's determined is not explained.
- `low rate`: [[Mond88rateResponsPace.pdf#page=3&annotation=181R|Low rate]]: the lowest heart rate allowed (tunable)
- `upper rate`: [[Mond88rateResponsPace.pdf#page=3&annotation=184R|Upper rate]]: highest HR allowed (tunable)
___
%% end Obsidian Notes %%



%% Import Date: 2024-09-29T12:23:57.285-07:00 %%
