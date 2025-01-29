---
category: literaturenote
tags:
  - forecasting
citekey: Agarwal22multivarSinglSpect
status:
  - unread
dateread: 
ZoteroTags: obsLitNOte
aliases:
  - On Multivariate Singular Spectrum Analysis and its Variants
  - On Multivariate Singular Spectrum Analysis
publisher: ""
citation key: Agarwal22multivarSinglSpect
DOI: 10.48550/arXiv.2006.13448
created date: 2024-05-08T11:06:01-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/8H3URFC4)  | [**DOI**](https://doi.org/10.48550/arXiv.2006.13448)  | [**URL**](http://arxiv.org/abs/2006.13448) | [[Agarwal22multivarSinglSpect.pdf|PDF]]
>
> 
> **Abstract**
> We introduce and analyze a variant of multivariate singular spectrum analysis (mSSA), a popular time series method to impute and forecast a multivariate time series. Under a spatio-temporal factor model we introduce, given $N$ time series and $T$ observations per time series, we establish prediction mean-squared-error for both imputation and out-of-sample forecasting effectively scale as $1 / \sqrt{\min(N, T )T}$. This is an improvement over: (i) $1 /\sqrt{T}$ error scaling of SSA, the restriction of mSSA to a univariate time series; (ii) $1/\min(N, T)$ error scaling for matrix estimation methods which do not exploit temporal structure in the data. The spatio-temporal model we introduce includes any finite sum and products of: harmonics, polynomials, differentiable periodic functions, and Holder continuous functions. Our out-of-sample forecasting result could be of independent interest for online learning under a spatio-temporal factor model. Empirically, on benchmark datasets, our variant of mSSA performs competitively with state-of-the-art neural-network time series methods (e.g. DeepAR, LSTM) and significantly outperforms classical methods such as vector autoregression (VAR). Finally, we propose extensions of mSSA: (i) a variant to estimate time-varying variance of a time series; (ii) a tensor variant which has better sample complexity for certain regimes of $N$ and $T$.
> 
> 
> **FirstAuthor**:: Agarwal, Anish  
> **Author**:: Alomar, Abdullah  
> **Author**:: Shah, Devavrat  
~    
> **Title**:: "On Multivariate Singular Spectrum Analysis and its Variants"  
> **Date**:: 2022-06-19  
> **Citekey**:: Agarwal22multivarSinglSpect  
> **ZoteroItemKey**:: 8H3URFC4  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2006.13448  
> **URL**:: http://arxiv.org/abs/2006.13448  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNOte
> **Related**:: 

> Agarwal, Anish, et al. _On Multivariate Singular Spectrum Analysis and Its Variants_. arXiv:2006.13448, arXiv, 19 June 2022. _arXiv.org_, [https://doi.org/10.48550/arXiv.2006.13448](https://doi.org/10.48550/arXiv.2006.13448).
%% begin Obsidian Notes %%
___
A useful cold start forecaster for residential loads?  Has code.

An imputer that also does forecasting, beats LSTM and Prophet on a household load forecasting task, but is a close 2nd to DeepAR; is #1 in imputation.  I didn't quite understand the electricity task, though.  Several other forecasting and imputation test cases and some other forecasting benchmark algorithms.  

Seems to be a harmonics + other basis function extrapolator that requires little training data to produce a result.

Is kinda probabilistic (estimates variance)

I didn't understand the spatial aspect of this temporal-spatial algorithm
# Related
- Summarized in [[Zewe22ToolPredictingFuture|A tool for predicting the future]]
- Used in, I think: [[Agarwal21TspDBTimeSeries]]


___
%% end Obsidian Notes %%



%% Import Date: 2024-05-08T11:07:15.398-07:00 %%
