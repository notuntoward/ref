---
category: literaturenote
tags:
  - ml/hyperparamTune
citekey: Li18HyperbandNovelBanditbased
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "Hyperband: A novel bandit-based approach to hyperparameter optimization"
  - "Hyperband: A novel bandit-based approach"
publisher: Journal of Machine Learning Research
citation key: Li18HyperbandNovelBanditbased
DOI: ""
created date: 2024-09-01T15:47:05-07:00
modified date: 2024-09-01T15:47:05-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/HHQAJSWK)   | [**URL**](https://www.jmlr.org/papers/v18/16-558.html) | [[Li18HyperbandNovelBanditbased.pdf|PDF]]
>
> 
> **Abstract**
> Performance of machine learning algorithms depends critically on identifying a good set of hyperparameters. While recent approaches use Bayesian optimization to adaptively select configurations, we focus on speeding up random search through adaptive resource allocation and early-stopping. We formulate hyperparameter optimization as a pure-exploration nonstochastic infinite-armed bandit problem where a predefined resource like iterations, data samples, or features is allocated to randomly sampled configurations. We introduce a novel algorithm, Hyperband, for this framework and analyze its theoretical properties, providing several desirable guarantees. Furthermore, we compare Hyperband with popular Bayesian optimization methods on a suite of hyperparameter optimization problems. We observe that Hyperband can provide over an order-of-magnitude speedup over our competitor set on a variety of deep-learning and kernel-based learning problems. Keywords: hyperparameter optimization, model selection, infinite-armed bandits, online optimization, deep learning
> 
> 
> **FirstAuthor**:: Li, Lisha  
> **Author**:: Jamieson, Kevin  
> **Author**:: DeSalvo, Giulia  
> **Author**:: Rostamizadeh, Afshin  
> **Author**:: Talwalkar, Ameet  
~    
> **Title**:: "Hyperband: A novel bandit-based approach to hyperparameter optimization"  
> **Date**:: 2018-01-01  
> **Citekey**:: Li18HyperbandNovelBanditbased  
> **ZoteroItemKey**:: HHQAJSWK  
> **itemType**:: journalArticle  
> **DOI**::   
> **URL**:: https://www.jmlr.org/papers/v18/16-558.html  
> **Journal**:: Journal of Machine Learning Research  
> **Volume**:: 18  
> **Issue**:: 185  
> **Book**:: Journal of Machine Learning Research  
> **Publisher**::   
> **Location**::    
> **Pages**:: 1–52  
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Li, Lisha, et al. “Hyperband: A Novel Bandit-Based Approach to Hyperparameter Optimization.” _Journal of Machine Learning Research_, vol. 18, no. 185, 2018, pp. 1–52.
%% begin Obsidian Notes %%
___

Hyperband is a *configuration evaluation* method -- compares hyperparameter configuration sets chosen elsewhere -- that's 5-30x faster than Bayesian optimization.  It quickly eliminates configurations that are bad on short tests using low resources, in order to devote more resources to comparing the remaining runs.  It assumes that the relative performance of configs tested with low resources is similar on low resource tests, and that high resource tests will sort out the best overall config.  This isn't universally true, which is why the simpler [[Li18HyperbandNovelBanditbased.pdf#page=6&annotation=4880R|SuccessiveHalving]] method can fail due an unfortunate choice for the compromise of [[Li18HyperbandNovelBanditbased.pdf#page=7&annotation=6623R|n versus B/n]].  So hyperband tries to hedge its bets by running many successive halving [[Li18HyperbandNovelBanditbased.pdf#page=7&annotation=6732R|“brackets”]] at different `n versus B/n` choices, but which require about the same computation. The result is that [many configurations](Li18HyperbandNovelBanditbased.pdf#page=9&annotation=15067R) are tested over many resource levels.  The hyperband best-config choice is still biased towards selecting configurations that converge fast [(I think)](Li18HyperbandNovelBanditbased.pdf#page=9&annotation=16739R), and this is especially true if you are [[Zygmunt17fastHyperband#Tuning Learning Rate with Hyperband]] (so probably don't do it).

Note that this paper mostly talks about random configuration selection, and I'd guess that its convergence proofs -- that I didn't read -- use that.  But there are many other options.  One highly cited one is a hybrid hyperband/Bayesian optimization algorithm, [[Falkner18hyperparamBOHB|BOHB]].

See [[Zygmunt17fastHyperband]] for some practical hyperband tips (especially for decision trees) and code.  Hyperband is also [[Ohta20hyperbandOptunaImplmt|implemented in optuna]].

## Points

- the [[Li18HyperbandNovelBanditbased.pdf#page=9&annotation=14783R|set of config tests performed]] is biased towards tests done with low resources ^fjq6uu
	- this is with the [[Zygmunt17fastHyperband#^e825a5|default setup]]
- hyperband pseudocode is [a little unclear]([[Li18HyperbandNovelBanditbased.pdf#page=8&annotation=12790R]]) about how the final choice for the best algorithm is made
- Tests are sets of successive halving (each called a [[Li18HyperbandNovelBanditbased.pdf#page=7&annotation=6732R|“bracket.”]]
	- each bracket uses 

___
%% end Obsidian Notes %%



%% Import Date: 2024-06-11T11:34:55.166-07:00 %%
