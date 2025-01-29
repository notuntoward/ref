---
category: literaturenote
tags:
  - ml/physmodel
  - hasCode
  - interpretability
citekey: Wolf24simpleKAN
status:
  - unread
dateread: 
ZoteroTags: hasCode, todo, obsLitNote
aliases:
  - "Kolmogorov-Arnold Networks: the latest advance in Neural Networks, simply explained"
  - "Kolmogorov-Arnold Networks: the latest advance"
publisher: ""
citation key: Wolf24simpleKAN
DOI: ""
created date: 2024-05-15T10:51:50-07:00
modified date: 2024-08-17T23:47:37-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/8I4A5F82)   | [**URL**](https://towardsdatascience.com/kolmogorov-arnold-networks-the-latest-advance-in-neural-networks-simply-explained-f083cf994a85) | [[Wolf24simpleKAN.pdf|PDF]]
>
> 
> **Abstract**
> The new type of network that is making waves in the ML world.
> 
> 
> **FirstAuthor**:: Wolf, Theo  
~    
> **Title**:: "Kolmogorov-Arnold Networks: the latest advance in Neural Networks, simply explained"  
> **Date**:: 2024-05-12  
> **Citekey**:: Wolf24simpleKAN  
> **ZoteroItemKey**:: 8I4A5F82  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://towardsdatascience.com/kolmogorov-arnold-networks-the-latest-advance-in-neural-networks-simply-explained-f083cf994a85  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: hasCode, todo, obsLitNote
> **Related**:: 

> Wolf, Theo. “Kolmogorov-Arnold Networks: The Latest Advance in Neural Networks, Simply Explained.” _Medium_, 12 May 2024, [https://towardsdatascience.com/kolmogorov-arnold-networks-the-latest-advance-in-neural-networks-simply-explained-f083cf994a85](https://towardsdatascience.com/kolmogorov-arnold-networks-the-latest-advance-in-neural-networks-simply-explained-f083cf994a85).
%% begin Obsidian Notes %%
___

Article about the new “neural” [[Liu24kolmogArnoldKAN|KAN]] network, which is said to be less likely to overfit, than MLPs, and more explainable.  Conversion of a trained KAN into a symbolic equation can be done automatically, but at this stage of development, symbolic learning is still flakey -- _very_ sensitive to small hyperparam differences.  But the author guesses that AI labs are already trying it out in their LLMs.  Maybe a research innovation will result in a deep learning level of hyperparameter insensitivity. The author provides [a GitHub of his experiments](https://github.com/TheodoreWolf/KAN), and says he’s excited about the possibilities in ML for (physically based) science.  

The original paper ([[Liu24kolmogArnoldKAN]]) has more to say about KAN strengths and weaknesses, as well as a decision tree suggesting when to use a KAN vs. and MLP.
# Details
MLPs, a sequence of linear regressions (trainable weights) separated by nonlinearities (fixed-function nodes), can approximate anything, kind of like a Taylors series.  There is also the Kolmogorov-Arnold Representation Theorem, in which a similarly simple structure can represent almost anything: any multivariate function can be represented by the sum of (trainable) 1-dimensional non-linear functions; there are no weights. The network nodes only sum.  The Kolmogorov-Arnold network (KAN) can be trained with standard backprop.

In the paper being reviewed here (which also has a GitHub repository), the user specifies network hyperparameters:

- num layers and num nodes in each
- A bspline grid which serves as a starting point for defining the network nonlinearity functions.  I’m guessing this is number of knots, not sure if they are evenly spaced.
- bspline order
- random seed

Training goes like this:

- train the spline coeffs with [[Rumelhart86learnRepBackprop|Backprop]] (seems like the solver is configurable; the example uses LBFGS)
- [prune](Wolf24simpleKAN.pdf#page=13&annotation=136R): remove edges and nodes “below a threshold of relevance.”  I guess I’d need to read the paper to know what that means
- retrain

The KAN can be turned into a symbolic equation by:

- replace each spline with a symbolic function chosen from the list you supply.  
    - I think the replacements must have affine params
    - Either you do the replacement manually, or it does it automatically (how not explained)
- retrain (the new affine parameters)

The result is a symbolic equation.  With the current tuning procedure, this equation can [vary wildly](Wolf24simpleKAN.pdf#page=15&annotation=151R) with hyperparam choice, but an alternative to KAN, the python PySR library [[Cranmer23interpMLrgrssnPySR]], is even flakier.
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Wolf24simpleKAN
> 
> This is a new “neural” network that is said to be less likely to overfit, than MLPs, more explainable, and quicker to train.  At this stage of development, training is still flakey -- _very_ sensitive to small hyperparam differences -- but the author says that it’s likely that big AI labs are already trying it out in their LLMs.  Maybe a research innovation will result in a deep learning level of hyperparameter insensitivity. The author provides [a GitHub of his experiments](https://github.com/TheodoreWolf/KAN), and says he’s excited about the possibilities in ML for science.
> 
> MLPs, a sequence of linear regressions (trainable weights) separated by nonlinearities (fixed-form nodes) can approximate anything, kind of like a Taylors series.  There is also the Kolmogorov-Arnold Representation Theorem, in which a similarly simple structure can represent almost anything:  any multivariate function can be represented by the sum of (trainable) 1-dimensional non-linear functions; there are no weights. The network nodes only sum.  The Kolmogorov-Arnold network (KAN) can be trained with standard backprop.
> 
> In the paper being reviewed here (which also has a GitHub repository), the user specifies network hyperparameters:
> 
> - num layers and num nodes in each
> - A bspline grid which serves as a starting point for defining the network nonlinearity functions.  I’m guessing this is number of knots, not sure if they are evenly spaced.
> - bspline order
> - random seed
> 
> Training goes like this:
> 
> - train the spline coeffs with backprop (seems like solver is configurable, example uses LBFGS)
> - prune: remove edges and nodes “below a threshold of relevance.”  I guess I’d need to read the paper to know what that means
> - retrain
> - replace each spline with a symbolic function chosen from the list you supply.  
>     
>     - I think the replacements must have affine params
>     - Either you do the replacent manually, or it does it automatically (how not explained)
> - retrain (the new affine parameters)
> 
> The result is a symbolic equation.  With current tuning procedure, this can vary wildly with hyperparam choice, but the python PySR library ([Cranmer, 2023](zotero://select/library/items/8GWPITTF)) is even flakier.
> 
> <small>📝️ (modified: 2024-05-15) [link](zotero://select/library/items/8G6BZMAG) - [web](http://zotero.org/users/60638/items/8G6BZMAG)</small>
>  
> ---


## Annotations
%% begin annotations %
### Imported: 2024-05-15 10:51 am

<mark style="background-color: #b3dbfb">Quote</mark>
> less prone to

<mark style="background-color: #b3dbfb">Quote</mark>
> overfitting

<mark style="background-color: #b3dbfb">Quote</mark>
> more interpretable

<mark style="background-color: #b3dbfb">Quote</mark>
> MLP is a series of linear regression models with non-linearities in between each one

<mark style="background-color: #c2e4c3">Quote</mark>
> universal approximators

<mark style="background-color: #b3dbfb">Quote</mark>
> overfit

<mark style="background-color: #b3dbfb">Quote</mark>
> difficult to interpret

<mark style="background-color: #b3dbfb">Quote</mark>
> quite long to train

<mark style="background-color: #c2e4c3">Quote</mark>
> Kolmogorov-Arnold Representation Theorem

<mark style="background-color: #b3dbfb">Quote</mark>
> any multivariate function can be represented with addition of 1-dimensional non-linear functions.

<mark style="background-color: #b3dbfb">Quote</mark>
> can use standard backpropagation

<mark style="background-color: #b3dbfb">Quote</mark>
> LBFGS

<mark style="background-color: #b3dbfb">Quote</mark>
> 20 steps of training

<mark style="background-color: #c2e4c3">Quote</mark>
> prune

<mark style="background-color: #b3dbfb">Quote</mark>
> below a threshold of relevance,

<mark style="background-color: #b3dbfb">Quote</mark>
> retrain

<mark style="background-color: #b3dbfb">Quote</mark>
> each spline edge is made into a symbolic

<mark style="background-color: #b3dbfb">Quote</mark>
> final retraining

<mark style="background-color: #b3dbfb">Quote</mark>
> make sure the affine parameters

<mark style="background-color: #b3dbfb">Quote</mark>
> quite a few hyperparameters

<mark style="background-color: #b3dbfb">Quote</mark>
> very different results

<mark style="background-color: #b3dbfb">Quote</mark>
> number of hidden neurons from 5 to 6

<mark style="background-color: #b3dbfb">Quote</mark>
> flakiness

<mark style="background-color: #c2e4c3">Quote</mark>
> PySR

<mark style="background-color: #b3dbfb">Quote</mark>
> library

<mark style="background-color: #b3dbfb">Quote</mark>
> ven more prone to weirdness than KANs are

<mark style="background-color: #b3dbfb">Quote</mark>
> on the excited side

<mark style="background-color: #b3dbfb">Quote</mark>
> AI for science world

<mark style="background-color: #b3dbfb">Quote</mark>
> a few AI labs are already trying to replace the MLP layers in their LLMs with KANs

<mark style="background-color: #42a4f5">Quote</mark>
> less prone to

<mark style="background-color: #42a4f5">Quote</mark>
> overfitting

<mark style="background-color: #42a4f5">Quote</mark>
> more interpretable

<mark style="background-color: #42a4f5">Quote</mark>
> MLP is a series of linear regression models with non-linearities in between each one.

<mark style="background-color: #66ba6a">Quote</mark>
> universal approximators,

<mark style="background-color: #42a4f5">Quote</mark>
> overfit.

<mark style="background-color: #42a4f5">Quote</mark>
> difficult to interpret

<mark style="background-color: #42a4f5">Quote</mark>
> quite long to train,

<mark style="background-color: #66ba6a">Quote</mark>
> Kolmogorov-Arnold Representation Theorem

<mark style="background-color: #42a4f5">Quote</mark>
> any multivariate function can be represented with addition of 1-dimensional non-linear functions. F

<mark style="background-color: #42a4f5">Quote</mark>
> can use standard backpropagation.

<mark style="background-color: #42a4f5">Quote</mark>
> LBFGS

<mark style="background-color: #42a4f5">Quote</mark>
> 20 steps of training.

<mark style="background-color: #66ba6a">Quote</mark>
> prune

<mark style="background-color: #42a4f5">Quote</mark>
> below a threshold of relevance,

<mark style="background-color: #42a4f5">Quote</mark>
> retrain

<mark style="background-color: #42a4f5">Quote</mark>
> n each spline edge is made into a symbolic

<mark style="background-color: #42a4f5">Quote</mark>
> final retraining

<mark style="background-color: #42a4f5">Quote</mark>
> make sure the affine parameters

<mark style="background-color: #42a4f5">Quote</mark>
> quite a few hyperparameters

<mark style="background-color: #42a4f5">Quote</mark>
> very different results.

<mark style="background-color: #42a4f5">Quote</mark>
> number of hidden neurons from 5 to 6 m

<mark style="background-color: #42a4f5">Quote</mark>
> flakiness

<mark style="background-color: #66ba6a">Quote</mark>
> PySR

<mark style="background-color: #42a4f5">Quote</mark>
> library,

<mark style="background-color: #42a4f5">Quote</mark>
> even more prone to weirdness than KANs are.

<mark style="background-color: #42a4f5">Quote</mark>
> on the excited side,

<mark style="background-color: #42a4f5">Quote</mark>
> AI for science world.

<mark style="background-color: #42a4f5">Quote</mark>
> a few AI labs are already trying to replace the MLP layers in their LLMs with KANs.


%% end annotations %%



%% Import Date: 2024-05-15T10:53:12.413-07:00 %%
