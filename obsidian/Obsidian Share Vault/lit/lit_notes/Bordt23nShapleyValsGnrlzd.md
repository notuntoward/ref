---
category: literaturenote
tags:
  - feature-selection
  - interpretability
  - hasCode
citekey: Bordt23nShapleyValsGnrlzd
status:
  - unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - From Shapley Values to Generalized Additive Models and back
  - From Shapley Values to Generalized
publisher: ""
citation key: Bordt23nShapleyValsGnrlzd
DOI: 10.48550/arXiv.2209.04012
created date: 2024-05-18T15:41:00-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/ZC9D4LNV)  | [**DOI**](https://doi.org/10.48550/arXiv.2209.04012)  | [**URL**](http://arxiv.org/abs/2209.04012) | [[Bordt23nShapleyValsGnrlzd.pdf|PDF]]
>
> 
> **Abstract**
> In explainable machine learning, local post-hoc explanation algorithms and inherently interpretable models are often seen as competing approaches. This work offers a partial reconciliation between the two by establishing a correspondence between Shapley Values and Generalized Additive Models (GAMs). We introduce $n$-Shapley Values, a parametric family of local post-hoc explanation algorithms that explain individual predictions with interaction terms up to order $n$. By varying the parameter $n$, we obtain a sequence of explanations that covers the entire range from Shapley Values up to a uniquely determined decomposition of the function we want to explain. The relationship between $n$-Shapley Values and this decomposition offers a functionally-grounded characterization of Shapley Values, which highlights their limitations. We then show that $n$-Shapley Values, as well as the Shapley Taylor- and Faith-Shap interaction indices, recover GAMs with interaction terms up to order $n$. This implies that the original Shapely Values recover GAMs without variable interactions. Taken together, our results provide a precise characterization of Shapley Values as they are being used in explainable machine learning. They also offer a principled interpretation of partial dependence plots of Shapley Values in terms of the underlying functional decomposition. A package for the estimation of different interaction indices is available at \url{https://github.com/tml-tuebingen/nshap}.
> 
> 
> **FirstAuthor**:: Bordt, Sebastian  
> **Author**:: von Luxburg, Ulrike  
~    
> **Title**:: "From Shapley Values to Generalized Additive Models and back"  
> **Date**:: 2023-02-23  
> **Citekey**:: Bordt23nShapleyValsGnrlzd  
> **ZoteroItemKey**:: ZC9D4LNV  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2209.04012  
> **URL**:: http://arxiv.org/abs/2209.04012  
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

> Bordt, Sebastian, and Ulrike von Luxburg. _From Shapley Values to Generalized Additive Models and Back_. arXiv:2209.04012, arXiv, 23 Feb. 2023. _arXiv.org_, [https://doi.org/10.48550/arXiv.2209.04012](https://doi.org/10.48550/arXiv.2209.04012).
%% begin Obsidian Notes %%
___

Shapely values only describe individual variable contributions, ignoring the contributions of their interactions.  This paper describes how to produce n-Shapely values, where n is the number of variable interactions consider (n=2 means consider effects singly and in variable pairs, n=3, up to triplets...) (I think... or is it *only* in pairs or *only* in triplets).  This might be more useful when using Shapely to select features.  There's also a relationship with GAMS, but I didn't skim any of that.

There's a python package, [nshap](https://github.com/tml-tuebingen/nshap?tab=readme-ov-file), which the author says is slow (suggests other algorithms), and which can consider "up to ~ 10 variables."  I wonder if he means that this is the limit over which you can calculate n-shapely, where n=10?  That would be gigantic, though.

The package can also calc Shapely-Taylor or Faith-Shap, which also handle interaction terms.  Faith-Shap is the more computationally efficient than n-Shapely or Shapely-Taylor (according to Perplexity)

# Also
- Published in Comment: AISTATS 2023, I think
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Comment: AISTATS 2023
> 
> <small>📝️ (modified: 2024-05-18) [link](zotero://select/library/items/BWAYAU3W) - [web](http://zotero.org/users/60638/items/BWAYAU3W)</small>
>  
> ---




%% Import Date: 2024-05-18T15:41:13.854-07:00 %%
