---
category: literaturenote
tags: 
citekey: Tibshirani23calibScoreFrcst
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Forecast Scoring and Calibration
  - Forecast Scoring and Calibration
publisher: ""
citation key: Tibshirani23calibScoreFrcst
DOI: ""
"created date:": 2024-07-31T19:05:36-07:00
"modified date:": 
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/YVMXLJMB)   | [**URL**](https://www.stat.berkeley.edu/~ryantibs/statlearn-s23/lectures/calibration.pdf) | [[Tibshirani23calibScoreFrcst.pdf|PDF]]
>
> 
> **Abstract**
> In this lecture, we cover a topic that sits adjacent to conformal prediction in a sense, which is calibration. We will cover the perspective(s) on calibration from the forecasting literature, where it is arguably the most developed. Instead of focusing solely on calibration, we’ll cover some of the broader theory of forecasting, pertaining to scoring rules, calibration, and ensembles. There is a rich literature on forecast scoring and calibration. This literature has roots in statistics, but over the years it has been expanded and driven by applied forecasting disciplines, primarily weather forecasting. It is still quite an active area in terms of development: new results that seem foundational in nature are still being discovered year to year. As per our usual comment, what we cover in this lecture is only a sample of what is known in the theory of forecasting. Unlike other topics, we are not aware of a book that gives a modern and comprehensive treatment of forecast scoring rules, calibration, and so on. (Perhaps this would be premature, as these topics are still in active development, and such a book will come later.) One of the most active and influential researchers in forecasting theory today is Tilmann Gneiting, and much of what we cover will be drawing from his work with collaborators, such as Gneiting and Raftery (2007); Gneiting et al. (2007); Ranjan and Gneiting (2010); Gneiting and Ranjan (2013).
> 
> 
> **FirstAuthor**:: Tibshirani, Ryan  
~    
> **Title**:: "Forecast Scoring and Calibration"  
> **Date**:: 2023-01-01  
> **Citekey**:: Tibshirani23calibScoreFrcst  
> **ZoteroItemKey**:: YVMXLJMB  
> **itemType**:: report  
> **DOI**::   
> **URL**:: https://www.stat.berkeley.edu/~ryantibs/statlearn-s23/lectures/calibration.pdf  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Tibshirani, Ryan. _Forecast Scoring and Calibration_. Course Notes, University of California, Berkeley, 2023. _Google Scholar_, [https://www.stat.berkeley.edu/~ryantibs/statlearn-s23/lectures/calibration.pdf](https://www.stat.berkeley.edu/~ryantibs/statlearn-s23/lectures/calibration.pdf).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Tibshirani23calibScoreFrcst
> 
> Some versions of the interval scores commonly used in conformal prediction papers are both are proper, and tightly related to CRPS and QS.  But then it seems to me that the log score might be better than any of these for rare events (also see ([Taillardat et al., 2023](zotero://select/library/items/S9UBBYVG)) for more).  Also, details about Bregman intervals and a lot on calibration (TODO: read that part)
> 
> ### Scores
> 
> ##### Relationship between CRSP, QS and interval scores
> 
> The interval score, IS, often used in conformal forecasting, does already both reward for sharpness and penalize miscoverage.  A composite metric for a set of interval forecasts is the officially proper weighted interval score, WIS.  Is WIS what I’ve always computed ([“Evalcast Docs: weighted_interval_score”, 2024](zotero://select/library/items/E8STYAAN)), but I just called it “CRPS?”
> 
> Anyway, CRPS can be used to define WIS/QS, but I don’t quite get that either.
> 
> Finally, this paper has a refined CRPS derivation that shows that it’s the integrated QS -- I have the older, apparently not-quite-correct derivation in energy.bib somehwere.  TODO someday: find that paper and link it.
> 
> ##### Other scores
> 
> - log score (proper)
> - quadratic score (proper)
> - log score aggressively penalizes rare event underconfidence
> - but CRPS is more “modern,” but in DE, I found that it was not so good at rare events.
> - what about the Energy Score?  TODO an link to that, as Steven V found this was better for rare events, if I remember correctly.
> 
> ### Bregman representation
> 
> TODO: read some day
> 
> ### Calibration
> 
> ### Also
> 
> - See ([Bosse et al., 2023](zotero://select/library/items/3Q9LXI8M)) about the need to log (or something) normalize predictions before calculating CRPS/WIS on exponentially changing epedimiological data.
> - See ([Taillardat et al., 2023](zotero://select/library/items/S9UBBYVG)) for CRPS modifications which fix its weakness on assessing extreme event performance.
> 
> TODO: read, since important for conformal prediction
> 
> <small>📝️ (modified: 2024-01-31) [link](zotero://select/library/items/7M9R2ZPN) - [web](http://zotero.org/users/60638/items/7M9R2ZPN)</small>
>  
> ---


## Annotations%% begin annotations %%



### Imported: 2024-07-31 6:40 pm



<mark style="background-color: #66bb6a">Quote</mark>
> `

<mark style="background-color: #66bb6a">Quote</mark>
> α

<mark style="background-color: #66bb6a">Quote</mark>
> uα

<mark style="background-color: #66bb6a">Quote</mark>
> ISα

<mark style="background-color: #66bb6a">Quote</mark>
> dist(y, S)

<mark style="background-color: #5c6bc0">Quote</mark>
> combines a reward for sharpness (first term) and a penalty for miscoverage (second term

<mark style="background-color: #5c6bc0">Quote</mark>
> collection of interval forecasts

<mark style="background-color: #66bb6a">Quote</mark>
> α

<mark style="background-color: #66bb6a">Quote</mark>
> A,

<mark style="background-color: #66bb6a">Quote</mark>
> WIS)

<mark style="background-color: #5c6bc0">Quote</mark>
> is a proper score

<mark style="background-color: #66bb6a">Quote</mark>
> S

<mark style="background-color: #66bb6a">Quote</mark>
> proper

<mark style="background-color: #66bb6a">Quote</mark>
> A

<mark style="background-color: #66bb6a">Quote</mark>
> T

<mark style="background-color: #5c6bc0">Quote</mark>
> equivalence (11) between WIS and QS

<mark style="background-color: #5c6bc0">Quote</mark>
> new interpretation to how quantile score (10) combines a sharpness reward with a miscoverage penalty

<mark style="background-color: #5c6bc0">Quote</mark>
> CRPS (7) also has an equivalent formulation in terms of QS: if F differentiable, with density f , and admits an expectation, ∫

<mark style="background-color: #5c6bc0">Quote</mark>
> fills in a few missing details

<mark style="background-color: #5c6bc0">Quote</mark>
> Log score (2)

<mark style="background-color: #5c6bc0">Quote</mark>
> quadratic

<mark style="background-color: #5c6bc0">Quote</mark>
> proper

<mark style="background-color: #ffee58">Quote</mark>
> former

<mark style="background-color: #5c6bc0">Quote</mark>
> more aggressive at penalizing underconfidence assigned to rare events.

<mark style="background-color: #ffee58">Quote</mark>
> more aggressive at penalizing underconfidence assigned to rare events

<mark style="background-color: #5c6bc0">Quote</mark>
> CRPS (7) is a more modern

<mark style="background-color: #5c6bc0">Quote</mark>
> CRPS turns out to be equivalent to an integrated quantile score

<mark style="background-color: #5c6bc0">Quote</mark>
> approximation to CRPS in practice would be to discretize at any desired set of probability levels and use this to define WIS/QS

<mark style="background-color: #66ba6a">Quote</mark>
> ℓα

<mark style="background-color: #66ba6a">Quote</mark>
> α

<mark style="background-color: #66ba6a">Quote</mark>
> u α

<mark style="background-color: #66ba6a">Quote</mark>
> IS α

<mark style="background-color: #66ba6a">Quote</mark>
> dist(y, S)


> combines a reward for sharpness (first ∈ | −| term) and a penalty for miscoverage (second term)


> collection of interval forecasts

<mark style="background-color: #66ba6a">Quote</mark>
> α

<mark style="background-color: #66ba6a">Quote</mark>
> A,

<mark style="background-color: #66ba6a">Quote</mark>
> (WIS)


> is a proper score f

<mark style="background-color: #66ba6a">Quote</mark>
> S

<mark style="background-color: #66ba6a">Quote</mark>
> proper

<mark style="background-color: #66ba6a">Quote</mark>
> A

<mark style="background-color: #66ba6a">Quote</mark>
> T


> � equivalence (11) between WIS and QS


> new interpretation to how quantile score (10) combines a sharpness reward with a miscoverage penalty (


> CRPS (7) also has � an equivalent formulation in terms of QS �


> fills in a few missing details


> Log score (2)


> quadratic


> proper,

<mark style="background-color: #ffed57">Quote</mark>
> former


> more aggressive at penalizing underconfidence assigned to rare events.

<mark style="background-color: #ffed57">Quote</mark>
> more aggressive at penalizing underconfidence assigned to rare events.


> CRPS (7) is a more modern


> CRPS turns out to be equivalent to an integrated quantile score


> approximation to CRPS in practice would be to discretize at any desired set of probability levels and use this to define WIS/QS;


%% end annotations %%



%% Import Date: 2024-07-31T19:06:30.864-07:00 %%
