---
category: literaturenote
tags:
  - ml
  - ml/optimization
  - ml/optimization/contextual
citekey: Sadana24contextualOptSurvey
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - A survey of contextual optimization methods for decision-making under uncertainty
  - A survey of contextual optimization
publisher: European Journal of Operational Research
citation key: Sadana24contextualOptSurvey
DOI: 10.1016/j.ejor.2024.03.020
created date: 2024-08-24T12:14:51-07:00
modified date: 2024-08-24T12:14:51-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/SISPY3WF)  | [**DOI**](https://doi.org/10.1016/j.ejor.2024.03.020)  | [**URL**](https://www.sciencedirect.com/science/article/pii/S0377221724002200) | [[Sadana24contextualOptSurvey.pdf|PDF]]
>
> 
> **Abstract**
> Recently there has been a surge of interest in operations research (OR) and the machine learning (ML) community in combining prediction algorithms and optimization techniques to solve decision-making problems in the face of uncertainty. This gave rise to the field of contextual optimization, under which data-driven procedures are developed to prescribe actions to the decision-maker that make the best use of the most recently updated information. A large variety of models and methods have been presented in both OR and ML literature under a variety of names, including data-driven optimization, prescriptive optimization, predictive stochastic programming, policy optimization, (smart) predict/estimate-then-optimize, decision-focused learning, (task-based) end-to-end learning/forecasting/optimization, etc. This survey article unifies these models under the lens of contextual stochastic optimization, thus providing a general presentation of a large variety of problems. We identify three main frameworks for learning policies from data and present the existing models and methods under a uniform notation and terminology. Our objective with this survey is to both strengthen the general understanding of this active field of research and stimulate further theoretical and algorithmic advancements in integrating ML and stochastic programming.
> 
> 
> **FirstAuthor**:: Sadana, Utsav  
> **Author**:: Chenreddy, Abhilash  
> **Author**:: Delage, Erick  
> **Author**:: Forel, Alexandre  
> **Author**:: Frejinger, Emma  
> **Author**:: Vidal, Thibaut  
~    
> **Title**:: "A survey of contextual optimization methods for decision-making under uncertainty"  
> **Date**:: 2024-03-15  
> **Citekey**:: Sadana24contextualOptSurvey  
> **ZoteroItemKey**:: SISPY3WF  
> **itemType**:: journalArticle  
> **DOI**:: 10.1016/j.ejor.2024.03.020  
> **URL**:: https://www.sciencedirect.com/science/article/pii/S0377221724002200  
> **Journal**:: European Journal of Operational Research  
> **Volume**::   
> **Issue**::   
> **Book**:: European Journal of Operational Research  
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> Sadana, Utsav, et al. “A Survey of Contextual Optimization Methods for Decision-Making under Uncertainty.” _European Journal of Operational Research_, Mar. 2024. _ScienceDirect_, [https://doi.org/10.1016/j.ejor.2024.03.020](https://doi.org/10.1016/j.ejor.2024.03.020).
%% begin Obsidian Notes %%
___

Survey of techniques where learning algorithms are integrated with optimization -- called *data driven contextual optimization*:

Cites Donte’s work, and maybe others?

- # Do more outlining of this paper?
# Intro

## Data driven contextual optimization types

Standard stochastic optimization types make decisions based on fixed, unconditional distributions of uncertain parameters; in contextual optimization, these distributions are conditional upon some set of covariates.  Table 1 has a convenient table of variable definitions.

### Decision rule optimization (DRO)

The decision rule itself is tuned (vs. covariates) for best decision result.  I
### Sequential learning and optimization (SLO)

A 2 stage approach, where a trained model predicts a conditional distribution and this is used to solve an "associated contextual stochastic optimization" problem (CSO).  See Table 2 for the surveyed papers.

- [ ] ? Huh?  Aren't we talking about kinds of contextual optimization already?  A CSO that does CSO?  Recursive definition?
- a.k.a. *predict/estimate-then-optimize* or *prescriptive optimization / stochastic programming*
### Integrated Learning and Optimization (ILO)

 Instead of training a parameter prediction separate from optimization, train a model using the optimization quality (or lack thereof) as a a cost function.  See Table 3 for the surveyed papers.
- Seems like the optimizer is standard and has fixed form, so that you don't directly train a decision rule, as in [[#Decision rule optimization (DRO)|DRO]].
 - a.k.a. *smart predict-the-optimize*, *decision-focused learning* or *(task-based end-to-end learning/forecasting/optimization*
 - [[Donti23optInLoopTalk]] said that this approach beat standard robust optimization.
 - This is what I'm most interested in.
#### Expected Value Based ILO
Uncertainty is completely described by a sufficient stat before the optimization problem is solved, a subset of CSO (above).  
- ? Isn't this just SLO?  Or are the sufficient stat params still learned in a loop w/ optimization?
- This is in "early literature on ILO"
#### Beyond Expected Value Based ILO
This survey covers newer ILO literature too, including
- regret minimization
- task-based "end-to-end" learning
- imitation-based models
- differentiable surrogate models and optimizers
- unrolling-based training
- [ ] implicit differentiation



___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Sadana24contextualOptSurvey
> 
> Survey of techniques where learning alogrithms are integrated with optimization.
> 
> Cites Donte’s work, and maybe others?
> 
> <small>📝️ (modified: 2024-05-08) [link](zotero://select/library/items/M5Y4DEHA) - [web](http://zotero.org/users/60638/items/M5Y4DEHA)</small>
>  
> ---




%% Import Date: 2024-06-02T17:09:57.461-07:00 %%
