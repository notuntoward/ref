---
category:
  - literaturenote
tags:
  - statistics
  - significance-test
  - health
read: true
in-progress: false
linked: true
aliases:
  - Evaluation of various estimators for standardized mean difference in meta-analysis
  - Evaluation of various estimators for
citekey: Lin21evalSMDmeta
ZoteroTags: 
ZoteroCollections:
  - fitness_metrics
  - basic_stats
created date: 7/28/2025, 8:25:55 AM
modified date: 2025-07-28T10:01:23-07:00
---

> [!info]- &nbsp;[**Zotero**](zotero://select/library/items/ASG4FNSD)  | [**DOI**](https://doi.org/10.1002/sim.8781) | [**URL**](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7770064/) | **[[Lin21evalSMDmeta.pdf|PDF]]**
>> **Abstract**
> Meta-analyses of a treatment’s effect compared to a control frequently calculate the meta-effect from standardized mean differences (SMDs). SMDs are usually estimated by Cohen’s d or Hedges’ g. Cohen’s d divides the difference between sample means of a continuous response by the pooled standard deviation, but is subject to non-negligible bias for small sample sizes. Hedges’ g removes this bias with a correction factor. The current literature (including meta-analysis books and software packages) is confusingly inconsistent about methods for synthesizing SMDs, potentially making reproducibility a problem. Using conventional methods, the variance estimate of SMD is associated with the point estimate of SMD, so Hedges’ g is not guaranteed to be unbiased in meta-analyses. This article comprehensively reviews and evaluates available methods for synthesizing SMDs. Their performance is compared using extensive simulation studies and analyses of actual datasets. We find that because of the intrinsic association between point estimates and standard errors, the ==usual version of Hedges’ g can result in more biased meta-estimation than Cohen’s d==. We ==recommend using average-adjusted variance estimators== to obtain an unbiased meta-estimate, and the ==Hartung–Knapp–Sidik–Jonkman method for accurate estimation of its confidence interval==.
> > **Author**:: Lin, Lifeng,  Aloe, Ariel M.
> **Title**:: "Evaluation of various estimators for standardized mean difference in meta-analysis"
> **Date**:: 2021-1-30
> **Citekey**:: Lin21evalSMDmeta
> **ZoteroItemKey**:: ASG4FNSD
> **itemType**:: journalArticle
> **DOI**:: 10.1002/sim.8781
> **URL**:: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7770064/
> **Journal**:: Statistics in medicine
> **Volume**:: 40
> **Issue**:: 2
> **Book**:: Statistics in medicine
> **Publisher**:: 
> **Location**:: 
> **Pages**:: 403-426
> **ISBN**:: 
> **ZoteroTags**:: []
> **ZoteroCollections**:: ['Fitness Metrics', 'Basic Stats']
> **Related**::

>  Lin, Lifeng, and Ariel M. Aloe. “Evaluation of Various Estimators for Standardized Mean Difference in Meta-Analysis.” Statistics in Medicine, vol. 40, no. 2, Jan. 2021, pp. 403–26. PubMed Central, https://doi.org/10.1002/sim.8781.

%% begin Obsidian Notes %%
___
How to estimate a single effect (standardized mean difference ([[Lin21evalSMDmeta.pdf#page=1&annotation=17R|SMD]])) based on results from many heterogenous studies. The [[Lin21evalSMDmeta.pdf#page=4&annotation=376R|Hedges’  g]] method seems best (I guess), but only if it's corrected by a [[Lin21evalSMDmeta.pdf#page=10|debiasing method]] (not sure which one).  Confidence interval estimates are straightforward and [[Lin21evalSMDmeta.pdf#page=10&annotation=416R|can work for other effect measures e.g mean difference, response ratio, and odds ratio]].  Many [[Lin21evalSMDmeta.pdf#page=18&annotation=453R|software packages]] can do this, but for reproducibility, you [[Lin21evalSMDmeta.pdf#page=18&annotation=454R|must report which one and which parameters]].  They also have example of binning SMD into [[Lin21evalSMDmeta.pdf#page=12&annotation=825R|no, moderate, or large treatment effects]] (other studies use different bins, I think).
#### Details
This is about how to get a single [[Lin21evalSMDmeta.pdf#page=1&annotation=17R|standardized mean difference]] which measures a treatment effect from several tests (or studies or papers) which tested the same treatment e.g. some drug or exercise, but used different units of measurement, different conditions, etc.. The process of making a[[Lin21evalSMDmeta.pdf#page=1&annotation=15R| synthesized SMD]] idea is done by normalizing each test's results by some variance estimate and the combining.  
##### SMD Estimators and bias corrections
It sounds like the most common methods are `Hedges' g` and `Cohen's d`, but [[Lin21evalSMDmeta.pdf#page=10&annotation=418R|Cohen’s  d  is biased within studies]] while Hedge's g is [guaranteed to be unbiased if its assumptions are met](Lin21evalSMDmeta.pdf#page=9&annotation=402R).  Surprisingly, in realistic conditions, [[Lin21evalSMDmeta.pdf#page=21&annotation=464R|Hedges’  g  actually has larger bias (in magnitude) than Cohen’s  d  using the conventional methods]].  There are [[Lin21evalSMDmeta.pdf#page=9&annotation=400R|alternative methods for reducing bias in meta-analysis]] that I think can be applied to either method but the authors say the within-study bias of Cohen's d make it [[Lin21evalSMDmeta.pdf#page=10&annotation=410R|of less interest]]. 
###### Bias correction works for more than SMD
Note that these bias correction methods aren't limited to correction SMD, but [[Lin21evalSMDmeta.pdf#page=10&annotation=416R|can also apply to other effect measures including the mean difference, response ratio, and odds ratio.]]
##### SMD Confidence Intervals
The paper also explains [[Lin21evalSMDmeta.pdf#page=10&annotation=408R|how to calculate SMD confidence intervals]] 
##### Software
The R language `metafor` package does some of the work here, but several [[Lin21evalSMDmeta.pdf#page=18&annotation=453R|are compared]].  They use different defaults and different formulas, so for reproducibility, these details need to be published in a paper that uses them.

# Also
- [[Meta Study Effect Estimation]]
- [[Meta Study Effect Estimation#Example papers using meta analysis|Example papers using meta analysis]]

___
%% end Obsidian Notes %%
