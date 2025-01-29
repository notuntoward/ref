---
category: literaturenote
tags:
  - ml/physmodel
  - "#hasCode"
  - interpretability
citekey: Cranmer23interpMLrgrssnPySR
status:
  - unread
dateread: 
ZoteroTags: hasCode, todo, obsLitNote
aliases:
  - Interpretable Machine Learning for Science with PySR and SymbolicRegression.jl
  - Interpretable Machine Learning for Science
publisher: ""
citation key: Cranmer23interpMLrgrssnPySR
DOI: 10.48550/arXiv.2305.01582
created date: 2024-05-15T10:51:50-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/8GWPITTF)  | [**DOI**](https://doi.org/10.48550/arXiv.2305.01582)  | [**URL**](http://arxiv.org/abs/2305.01582) | [[Cranmer23interpMLrgrssnPySR.pdf|PDF]]
>
> 
> **Abstract**
> PySR is an open-source library for practical symbolic regression, a type of machine learning which aims to discover human-interpretable symbolic models. PySR was developed to democratize and popularize symbolic regression for the sciences, and is built on a high-performance distributed back-end, a flexible search algorithm, and interfaces with several deep learning packages. PySR's internal search algorithm is a multi-population evolutionary algorithm, which consists of a unique evolve-simplify-optimize loop, designed for optimization of unknown scalar constants in newly-discovered empirical expressions. PySR's backend is the extremely optimized Julia library SymbolicRegression.jl, which can be used directly from Julia. It is capable of fusing user-defined operators into SIMD kernels at runtime, performing automatic differentiation, and distributing populations of expressions to thousands of cores across a cluster. In describing this software, we also introduce a new benchmark, "EmpiricalBench," to quantify the applicability of symbolic regression algorithms in science. This benchmark measures recovery of historical empirical equations from original and synthetic datasets.
> 
> 
> **FirstAuthor**:: Cranmer, Miles  
~    
> **Title**:: "Interpretable Machine Learning for Science with PySR and SymbolicRegression.jl"  
> **Date**:: 2023-05-05  
> **Citekey**:: Cranmer23interpMLrgrssnPySR  
> **ZoteroItemKey**:: 8GWPITTF  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2305.01582  
> **URL**:: http://arxiv.org/abs/2305.01582  
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

> Cranmer, Miles. _Interpretable Machine Learning for Science with PySR and SymbolicRegression.Jl_. arXiv:2305.01582, arXiv, 5 May 2023. _arXiv.org_, [https://doi.org/10.48550/arXiv.2305.01582](https://doi.org/10.48550/arXiv.2305.01582).
%% begin Obsidian Notes %%
___

Python lib that fits a symbolic expression to your data.  Is said to be flakier than KAN nets on some small problems: [[Wolf24simpleKAN]].

- Use for physical solar model?  
- Use to make an interpretable model of a deep NN (as suggested by author)?
- Use to fit a battery degradation model?  
- Use to force quantile regression to have monotonic, non-decreasing quantiles?

Also
- Paper source found at [https://github.com/MilesCranmer/pysr_paper](https://github.com/MilesCranmer/pysr_paper) ; 
- PySR at [https://github.com/MilesCranmer/PySR](https://github.com/MilesCranmer/PySR) ; 
- Symbolic Regression: [https://github.com/MilesCranmer/SymbolicRegression.jl](https://github.com/MilesCranmer/SymbolicRegression.jl)
- Author's talk: [The Next Great Scientific Theory is Hiding Inside a Neural Network (April 3, 2024)](https://www.youtube.com/watch?v=fk2r8y5TfNY)
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Cranmer23interpMLrgrssnPySR
> 
> Python lib that fits a symbolic expression to your data.  Use for physical solar model?  Use to make an interpretable model of a deep NN (as suggested by author)? Is said to be flakier than KAN nets on some small problems: ([Wolf, 2024](zotero://select/library/items/8I4A5F82))
> 
> Comment: 24 pages, 5 figures, 3 tables. Feedback welcome. Paper source found at https://github.com/MilesCranmer/pysr_paper ; PySR at https://github.com/MilesCranmer/PySR ; SymbolicRegression.jl at https://github.com/MilesCranmer/SymbolicRegression.jl
> 
> <small>📝️ (modified: 2024-05-15) [link](zotero://select/library/items/HHNPNQWN) - [web](http://zotero.org/users/60638/items/HHNPNQWN)</small>
>  
> ---




%% Import Date: 2024-05-15T10:53:12.386-07:00 %%
