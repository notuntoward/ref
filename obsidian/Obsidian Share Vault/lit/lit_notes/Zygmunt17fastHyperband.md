---
category: literaturenote
tags:
  - ml/hyperparamTune
  - hasCode
  - ml/decision-tree-based
citekey: Zygmunt17fastHyperband
status:
  - read
dateread: 
ZoteroTags: ""
aliases:
  - Tuning hyperparams fast with Hyperband
  - Tuning hyperparams fast with Hyperband
publisher: ""
citation key: Zygmunt17fastHyperband
DOI: ""
created date: 2024-06-13T17:53:36-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/G4GFYAVP)   | [**URL**](https://fastml.com/tuning-hyperparams-fast-with-hyperband/) | [[Zygmunt17fastHyperband.pdf|PDF]] | [[Zygmunt17fastHyperband.html|HTM]]
>
> 
> **Abstract**
> Hyperband is a relatively new method for tuning iterative algorithms. It performs random sampling and attempts to gain an edge by using time spent optimizing in the best way. We explain a few things that were not clear to us right away, and try the algorithm in practice.
> 
> 
> **FirstAuthor**:: Zygmunt, Z  
~    
> **Title**:: "Tuning hyperparams fast with Hyperband"  
> **Date**:: 2017-02-27  
> **Citekey**:: Zygmunt17fastHyperband  
> **ZoteroItemKey**:: G4GFYAVP  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://fastml.com/tuning-hyperparams-fast-with-hyperband/  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: 
> **Related**:: 

> Zygmunt, Z. “Tuning Hyperparams Fast with Hyperband.” _FastML_, 27 Feb. 2017, [https://fastml.com/tuning-hyperparams-fast-with-hyperband/](https://fastml.com/tuning-hyperparams-fast-with-hyperband/).
%% begin Obsidian Notes %%
___

Bayesian optimization is not significantly better than random search, but [[Li18HyperbandNovelBanditbased|hyperband]] apparently is?  This doesn't provide evidence for hyperband's superiority over random search, but it has good tips about hyperband configuration: iteration size, not tuning learning rate, and several tips for decision tree methods.  Also [has code](https://github.com/zygmuntz/hyperband).

- Bayesian opt. not significantly better than random search: [[Zygmunt17fastHyperband.pdf#page=1&annotation=14R|Example]]
	- running RS for twice as long yields superior results to Bayesian optimization
	- otherwise, Bayesian is consistently better by only an insignificant amount.
- Stuff about "[[Zygmunt17fastHyperband.pdf#page=3&annotation=32R|iteration]]" 
	- **Definition**: minimum "unit of computation" used to test an configuration.
	- s/b smallest needed to distinguish some good from bad configurations
		- I think that if you make "iteration" too small, you risk not selecting good configs that learn slowly
			- because [[Li18HyperbandNovelBanditbased#^fjq6uu|hyperband overrepresents low resource config tests]]
				- This is using the [[Zygmunt17fastHyperband.pdf#page=4&annotation=47R|default]] setup ^e825a5
			- like what can happen [[Zygmunt17fastHyperband.pdf#page=4&annotation=55R|when learning rate is a parameter]]
	- For trees, an iteration could be a number of trees [[Zygmunt17fastHyperband.pdf#page=3&annotation=33R|eg. 5 or 10]]
		- [ ] ? this can [[Zygmunt17fastHyperband.pdf#page=4&annotation=44R|offset Hyperband’s hedging]]. I don't quite understand this
	- For other algs, could be [[Zygmunt17fastHyperband.pdf#page=3&annotation=35R|could be .5 epochs over the dataset]]
- For trees, hyperband can discover that `min_samples_leaf` and `min_samples_split` [[Zygmunt17fastHyperband.pdf#page=6&annotation=179R|curb overfitting, interact]] with `max_depth`
- [has code](https://github.com/zygmuntz/hyperband), which helps clarify the [[Li18HyperbandNovelBanditbased|original hyperband paper]]
	- it uses hyperopt to sample hyperparameters, 
	- but that looks easy to port to e.g. optuna (which I think already has hyperband anyway)
	- it's also [[Ohta20hyperbandOptunaImplmt|implemented in optuna]]
## Tuning Learning Rate with Hyperband
- suggestion seems to be that you shouldn't tune learning rate with hyperband.
- [[Zygmunt17fastHyperband.pdf#page=4&annotation=55R|when learning rate is a parameter]], hyperband finds configs that converge quickly
	- [ ] ? because it has many chances on the [[Li18HyperbandNovelBanditbased#^fjq6uu|overrepresented]] low-resource config tests to get good results by pumping learning rate?
	- So **Warning**: xgboost kagglers get *best results with low learning rate, many iteration config*s: [[Zygmunt17fastHyperband.pdf#page=4&annotation=46R|people often run XGBoost with precisely this setup to get the best results.]]
	- [ ] ? some stuff I don't understand about removing 2 of 5 main loops to save 50% computation.

___
%% end Obsidian Notes %%
## Annotations
%% begin annotations %%
### Imported: 2024-06-13 5:53 pm
<mark style="background-color: #42a4f5">Quote</mark>
> Bayesian Methods perhaps consistently outperform random sampling, they do so only by a negligible amount

<mark style="background-color: #42a4f5">Quote</mark>
> , running random search for twice as long yields superior results.

<mark style="background-color: #66ba6a">Quote</mark>
> TPE

<mark style="background-color: #42a4f5">Quote</mark>
> run random configurations on a specific schedule of iterations per configuration, using earlier results to select candidates for longer runs.

<mark style="background-color: #66ba6a">Quote</mark>
> max_iter

<mark style="background-color: #66ba6a">Quote</mark>
> eta

<mark style="background-color: #66ba6a">Quote</mark>
> s

<mark style="background-color: #66ba6a">Quote</mark>
> iteration


> could be .5 epochs over the dataset

<mark style="background-color: #42a4f5">Quote</mark>
> iteration should be chosen

<mark style="background-color: #42a4f5">Quote</mark>
> where it is clear that some settings diverge

<mark style="background-color: #ffac5b">Quote</mark>
> tree-based methods, an iteration will be a number of trees

<mark style="background-color: #42a4f5">Quote</mark>
> relative performance compared with many alternatives trained with the same number of iterations is roughly maintained.

<mark style="background-color: #42a4f5">Quote</mark>
> more trees serve to reduce variance, so this assumption may be slightly less valid than for other methods

<mark style="background-color: #42a4f5">Quote</mark>
> offset Hyperband’s hedging

<mark style="background-color: #42a4f5">Quote</mark>
> counter-example

<mark style="background-color: #42a4f5">Quote</mark>
> when learning rate is a parameter,

<mark style="background-color: #ffac5b">Quote</mark>
> unlikely to find good “low learning rate with many iterations” combos

<mark style="background-color: #ffac5b">Quote</mark>
> people often run XGBoost with precisely this setup to get the best results.

<mark style="background-color: #42a4f5">Quote</mark>
> default

<mark style="background-color: #42a4f5">Quote</mark>
> only a few configurations running for max. iterations

<mark style="background-color: #42a4f5">Quote</mark>
> All others are pre-selected with a shorter

<mark style="background-color: #42a4f5">Quote</mark>
> unlikely to hit the best stuff.

<mark style="background-color: #ffac5b">Quote</mark>
> If you do not tune learning rate, the Hyperband algorithm makes good sense

<mark style="background-color: #42a4f5">Quote</mark>
> cut out two of the five main loops, you save 40% of time, but only forfeit checking 13 configurations.

<mark style="background-color: #42a4f5">Quote</mark>
> d discard the last tier (1 x 81, 2 x 81, etc.) in each round

<mark style="background-color: #66ba6a">Quote</mark>
> get_params()

<mark style="background-color: #66ba6a">Quote</mark>
> try_params()


%% end annotations %%



%% Import Date: 2024-06-13T17:53:48.588-07:00 %%
