---
category: literaturenote
tags: 
citekey: IBM23whatIsBoosting
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - What is Boosting?
  - What is Boosting?
publisher: ""
citation key: IBM23whatIsBoosting
DOI: ""
created date: 2024-06-25T11:56:40-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/KW74B8YY)   | [**URL**](https://www.ibm.com/topics/boosting) | [[IBM23whatIsBoosting.pdf|PDF]]
>
> 
> **Abstract**
> Learn about boosting algorithms and how they can improve the predictive power of your data mining initiatives.
> 
> 
> **FirstAuthor**:: IBM,   
~    
> **Title**:: "What is Boosting?"  
> **Date**:: 2023-01-01  
> **Citekey**:: IBM23whatIsBoosting  
> **ZoteroItemKey**:: KW74B8YY  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://www.ibm.com/topics/boosting  
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

> IBM. _What Is Boosting?_ 2023, [https://www.ibm.com/topics/boosting](https://www.ibm.com/topics/boosting).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> IBM23whatIsBoosting
> 
> Boosting iteratively trains simple weak learners (just a little bit more accurate than random) to correct errors of the preceeding weak learner.  It can do this by increasing the sample weight of samples where are gotten wrong (AdaBoost) or by predicting the resudual of the previous learner (Graident Boosting, like LightGBM and XGBOOST).  
> 
> Advantages are:
> 
> - especially good at reducing bias of weak learners
> - no feature preprocessing needed
> - does a kind of dimension reduction (picks predictive features)
> - has built-in missing feature handing ([not really in LightGBM](https://lightgbm.readthedocs.io/en/latest/Advanced-Topics.html))
> 
> But is said to be more vulnerable to overtraining (not so clear this is true).
> 
> <small>📝️ (modified: 2023-11-27) [link](zotero://select/library/items/J7HSWNMU) - [web](http://zotero.org/users/60638/items/J7HSWNMU)</small>
>  
> ---


## Annotations%% begin annotations %%



### Imported: 2024-06-25 11:56 am



<mark style="background-color: #334d80">Quote</mark>
> e

<mark style="background-color: #bddebd">Quote</mark>
> Boosting

<mark style="background-color: #334d80">Quote</mark>
> ombines a set of weak learners

<mark style="background-color: #334d80">Quote</mark>
> random sample of data is selected, fitted

<mark style="background-color: #334d80">Quote</mark>
> equentially

<mark style="background-color: #334d80">Quote</mark>
> each model tries to compensate for the weaknesses of its predecessor

<mark style="background-color: #334d80">Quote</mark>
> weak rules from each individual classifier are combined

<mark style="background-color: #bddebd">Quote</mark>
> Ensemble learning

<mark style="background-color: #334d80">Quote</mark>
> group (or ensemble) of base learners, or models,

<mark style="background-color: #bddebd">Quote</mark>
> base

<mark style="background-color: #bddebd">Quote</mark>
> weak learner

<mark style="background-color: #bddebd">Quote</mark>
> aggregated,

<mark style="background-color: #bddebd">Quote</mark>
> strong learner

<mark style="background-color: #334d80">Quote</mark>
> reduces bias or variance

<mark style="background-color: #bddebd">Quote</mark>
> overfitting

<mark style="background-color: #334d80">Quote</mark>
> g (high variance and low bias)

<mark style="background-color: #bddebd">Quote</mark>
> underfitting

<mark style="background-color: #334d80">Quote</mark>
> g (low variance and high bias)

<mark style="background-color: #bddebd">Quote</mark>
> bagging

<mark style="background-color: #334d80">Quote</mark>
> weak learners are trained in paralle

<mark style="background-color: #bddebd">Quote</mark>
> boosting

<mark style="background-color: #334d80">Quote</mark>
> they learn sequentially.

<mark style="background-color: #334d80">Quote</mark>
> series of models are constructed and with each new model iteration

<mark style="background-color: #334d80">Quote</mark>
> weights of the misclassified data in the previous model are increased

<mark style="background-color: #bddebd">Quote</mark>
> AdaBoost

<mark style="background-color: #334d80">Quote</mark>
> weak learners that exhibit high variance and low bias,

<mark style="background-color: #334d80">Quote</mark>
> low variance and high bias

<mark style="background-color: #334d80">Quote</mark>
> boosting methods can be more prone to this

<mark style="background-color: #bddebd">Quote</mark>
> weak learner

<mark style="background-color: #334d80">Quote</mark>
> weak learner classifies data slightly better than random guessing.

<mark style="background-color: #334d80">Quote</mark>
> can even outperform neural networks and support vector

<mark style="background-color: #334d80">Quote</mark>
> iffer in how they create and aggregate

<mark style="background-color: #bddebd">Quote</mark>
> AdaBoost:

<mark style="background-color: #334d80">Quote</mark>
> teratively, identifying misclassified

<mark style="background-color: #334d80">Quote</mark>
> weight

<mark style="background-color: #bddebd">Quote</mark>
> Gradient boosting:

<mark style="background-color: #334d80">Quote</mark>
> sequentially adding predictors

<mark style="background-color: #334d80">Quote</mark>
> ach one correcting for the errors of its predecessor

<mark style="background-color: #bddebd">Quote</mark>
> XGBoost

<mark style="background-color: #334d80">Quote</mark>
> allowing for learning to occur in parallel

<mark style="background-color: #334d80">Quote</mark>
> learning to occur in parallel d

<mark style="background-color: #334d80">Quote</mark>
> No data preprocessing

<mark style="background-color: #334d80">Quote</mark>
> built-in routines to handle missing data

<mark style="background-color: #334d80">Quote</mark>
> reduce high bias,

<mark style="background-color: #334d80">Quote</mark>
> commonly seen in shallow decision trees

<mark style="background-color: #334d80">Quote</mark>
> logistic regression

<mark style="background-color: #334d80">Quote</mark>
> only select features that increase its predictive power

<mark style="background-color: #334d80">Quote</mark>
> help to reduc

<mark style="background-color: #334d80">Quote</mark>
> reduce dimensiona

<mark style="background-color: #334d80">Quote</mark>
> efficiency.

<mark style="background-color: #334d80">Quote</mark>
> some dispute

<mark style="background-color: #334d80">Quote</mark>
> omputationally expensive

<mark style="background-color: #334d80">Quote</mark>
> slower to train when compared to bagging


> e

<mark style="background-color: #008000">Quote</mark>
> Boosting


> ombines a set of weak learners


> random sample of data is selected, fitted


> equentially


> each model tries to compensate for the weaknesses of its predecessor.


> weak rules from each individual classifier are combined

<mark style="background-color: #008000">Quote</mark>
> Ensemble learning g


> group (or ensemble) of base learners, or models,

<mark style="background-color: #008000">Quote</mark>
> base

<mark style="background-color: #008000">Quote</mark>
> weak learner,

<mark style="background-color: #008000">Quote</mark>
> aggregated,

<mark style="background-color: #008000">Quote</mark>
> strong learner,


> reduces bias or variance

<mark style="background-color: #008000">Quote</mark>
> overfitting


> g (high variance and low bias)

<mark style="background-color: #008000">Quote</mark>
> underfitting


> g (low variance and high bias)

<mark style="background-color: #008000">Quote</mark>
> bagging,


> weak learners are trained in paralle

<mark style="background-color: #008000">Quote</mark>
> boosting


> , they learn sequentially.


> series of models are constructed and with each new model iteration


> weights of the misclassified data in the previous model are increased

<mark style="background-color: #008000">Quote</mark>
> AdaBoost


> weak learners that exhibit high variance and low bias, w


> low variance and high bias


> boosting methods can be more prone to this

<mark style="background-color: #008000">Quote</mark>
> weak learner


> weak learner classifies data slightly better than random guessing.


> can even outperform neural networks and support vector


> iffer in how they create and aggregate

<mark style="background-color: #008000">Quote</mark>
> AdaBoost:


> teratively, identifying misclassified


> weight

<mark style="background-color: #008000">Quote</mark>
> Gradient boosting:


> sequentially adding predictors t


> ach one correcting for the errors of its predecessor.

<mark style="background-color: #008000">Quote</mark>
> XGBoost


> , allowing for learning to occur in parallel


> learning to occur in parallel d


> No data preprocessing


> built-in routines to handle missing data


> reduce high bias,


> commonly seen in shallow decision trees


> logistic regression


> only select features that increase its predictive power


> help to reduc


> reduce dimensiona


> efficiency.


> some dispute


> omputationally expensive


> slower to train when compared to bagging


%% end annotations %%



%% Import Date: 2024-06-25T11:57:09.481-07:00 %%
