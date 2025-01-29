---
category: literaturenote
tags:
  - ml/physmodel
  - hasCode
  - ml/KAN
  - forecasting
  - interpretability
citekey: Liu24kolmogArnoldKAN
status:
  - unread
dateread: 
ZoteroTags: hasCode, obsLitNote
aliases:
  - "KAN: Kolmogorov-Arnold Networks"
  - "KAN: Kolmogorov-Arnold Networks"
publisher: ""
citation key: Liu24kolmogArnoldKAN
DOI: 10.48550/arXiv.2404.19756
created date: 2024-09-13T15:43:19-07:00
modified date: 2024-09-16T14:58:24-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/SWDUCE7N)  | [**DOI**](https://doi.org/10.48550/arXiv.2404.19756)  | [**URL**](http://arxiv.org/abs/2404.19756) | [[Liu24kolmogArnoldKAN.pdf|PDF]]
>
> 
> **Abstract**
> Inspired by the Kolmogorov-Arnold representation theorem, we propose Kolmogorov-Arnold Networks (KANs) as promising alternatives to Multi-Layer Perceptrons (MLPs). While MLPs have fixed activation functions on nodes ("neurons"), KANs have learnable activation functions on edges ("weights"). KANs have no linear weights at all -- every weight parameter is replaced by a univariate function parametrized as a spline. We show that this seemingly simple change makes KANs outperform MLPs in terms of accuracy and interpretability. For accuracy, much smaller KANs can achieve comparable or better accuracy than much larger MLPs in data fitting and PDE solving. Theoretically and empirically, KANs possess faster neural scaling laws than MLPs. For interpretability, KANs can be intuitively visualized and can easily interact with human users. Through two examples in mathematics and physics, KANs are shown to be useful collaborators helping scientists (re)discover mathematical and physical laws. In summary, KANs are promising alternatives for MLPs, opening opportunities for further improving today's deep learning models which rely heavily on MLPs.
> 
> 
> **FirstAuthor**:: Liu, Ziming  
> **Author**:: Wang, Yixuan  
> **Author**:: Vaidya, Sachin  
> **Author**:: Ruehle, Fabian  
> **Author**:: Halverson, James  
> **Author**:: Soljačić, Marin  
> **Author**:: Hou, Thomas Y.  
> **Author**:: Tegmark, Max  
~    
> **Title**:: "KAN: Kolmogorov-Arnold Networks"  
> **Date**:: 2024-05-02  
> **Citekey**:: Liu24kolmogArnoldKAN  
> **ZoteroItemKey**:: SWDUCE7N  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2404.19756  
> **URL**:: http://arxiv.org/abs/2404.19756  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: hasCode, obsLitNote
> **Related**:: 

> Liu, Ziming, et al. _KAN: Kolmogorov-Arnold Networks_. arXiv:2404.19756, arXiv, 2 May 2024. _arXiv.org_, [https://doi.org/10.48550/arXiv.2404.19756](https://doi.org/10.48550/arXiv.2404.19756).
%% begin Obsidian Notes %%
___

An MLP-like network that can fit interpretable analytical models, said to have better scaling laws than deep NNs.  Has code.  I skimmed this paper but didn't read it.  Lots of [[#Follow-on KAN work]].  Also see the author's talk: [[Liu24kolmogArnoldKANytube]], and the author's KAN "User Manual," [[Liu24scienceMeetKAN20|KAN 2.0: Kolmogorov-Arnold Networks Meet Science]]

# Potential benefits
- more accurate with fewer params than MLPs
- when trained on new data, there's no catastrophic forgetting, so multitask learning (sounds to me) more feasible.
- interpretable, can automatically or manually make an equation out of a trained KAN
# Downsides
- 10X slower to train than an MLP
	- is that to get the symbolic rep too?
	- I guess splines could have quite a few more params than weights would
	- This is for the original KAN; [[#^d275d4|efficient KAN implementations]] are much better
- At the end, there's a KAN strengths and weaknesses, as well as a decision tree suggesting when to use a KAN vs. and MLP.
# When to use a KAN
- Medium article w/ my notes: [[Wolf24simpleKAN]]
	- says that KANs are less flakey for symbolic regressions than the Python PySR lib ([[Cranmer23interpMLrgrssnPySR]])
- Forecasting?
	- plain implementation [[Peixeiro24tsFrcstKAN|best for hourly forecast; not great otherwise]]
	- good for online forecasting? No catastrophic forgetting?
# My ideas: KAN for
- clustering
- feature selection
- online learning (less forgetting, so past heteroskedastic learning could be used immediately)
- Wavelet basis selection  ^iwrb
	- OR wavelet basis replacing KAN bspline functions: 
		- MODWT coeffs are linear, so could be in backprob
		- w/o the separate spline num knots selection grid update every 20 steps
			- but then would have to add normalization step to keep things in bounds
		- but is this way more params that a bspline?
		- wavelets are local, so could have same lack of catastrophic forgetting as original b-spline
		- [PyTorchWavelets](https://github.com/tomrunia/PyTorchWavelets) can do some kind of [1D wavelets with backprop](https://discuss.pytorch.org/t/backprop-through-discrete-wavelet-transform-dwt-on-gpu/9173/11)
		- Wavelet activation NN functions trained w/ backprop [[Uddin23waveletPhysBasedNNdiffyQ]]
	- Wavelets rough/smooth basis could be like CNN pooling layers?
- PV model learning: equations are already known: just need coeffs
- battery aging models: same story as PV

# Follow-on KAN work
- [awesome-kan: repo of KAN libraries, projects, tutorials, papers](https://github.com/mintisan/awesome-kan)
- [KAN implementations](https://youtu.be/AUDHb-tnlB0?t=4313) mentioned in [Liu's Talk](Liu24kolmogArnoldKANytube) (just a couple weeks after the paper):
	- Liu's original (vanilla) implementation: 
		- [pykan](https://github.com/KindXiaoming/pykan)
		- still good for interpretability, but efficiency sucks (he says).
	- Efficient KAN implementations ^d275d4
		- [EfficientKAN](https://github.com/Blealtan/efficient-kan)
			- converts stuff into a big matrix multiply, somehow
		- [FastKAN](https://github.com/ZiyaoLi/fast-kan)
			- 3.3X faster than EfficientKAN, simpler, about as efficient on MNIST
			- approximates B-splines with Gaussian Radial Basis functions
			- suggests KAN is equivalent to certain RBF networks
		- [ChebyKAN](https://github.com/SynodicMonth/ChebyKAN)
			- replaces B-spline w/ Chebyshev polynomials
	- [GraphKAN](https://github.com/WillHua127/GraphKAN-Graph-Kolmogorov-Arnold-Networks): KAN for Graph
	- [KANRL](https://github.com/riiswa/kanrl): KAN for RL
	- Different activation functions: 
		- [FCNKAN](https://github.com/Zhangyanbo/FCN-KAN): "represent the activation"? 
		- [FourierKAN](https://github.com/GistNoesis/FourierKAN), also
			- [FusedFourierKAN](https://github.com/GistNoesis/FusedFourierKAN)
			- [FFTKAN](https://github.com/GistNoesis/FourierKAN/blob/main/fftKAN.py)
		- JacobiKAN, 
		- [ChebyKAN](https://github.com/SynodicMonth/ChebyKAN)
		- Wavelets and multi activations 
			- e.g. in [[Han24tsFrcstKAN4TSF_RMoK|Han24tsFrcstKAN4TSF_RMoK]] 
			- also [[lit/lit_notes/Liu24kolmogArnoldKAN.md#^iwrb|Wavelet basis selection]]
	- KAN for LLM: 
		- KAN-GPT, 
		- Kansformer, 
		- KAN-SSM
	- Time Series (forecasting)
		- [[Peixeiro24tsFrcstKAN|KANs for Time Series]]
		- [[VacaRubio24timeSeriesKAN|Kolmogorov-Arnold Networks (KANs) for Time]]
		- [[Genet24kolmogArnoldFrcstTKAN|TKAN: Temporal Kolmogorov-Arnold Networks]]
		- [[Han24tsFrcstKAN4TSF_RMoK|Han24: KAN4TSF: Are KAN and KAN-based models Effective for Time Series Forecasting?]] 
			- Tutorial: [[Peixeiro24MixtureKANExperts|Peixeiro24: Mixture of KAN Experts for High-Performance Time Series Forecasting]] 
	- [Convolution KAN](https://github.com/AntonioTepsich/Convolutional-KANs)
	- Physics-informed KAN
	- Different language/package: jax, julia, lua, keras, sklearn
	- [KAN for diffusion](https://github.com/KindXiaoming/pykan/issues/160)
	- KAN for ODE

Comment: 48 pages, 20 figures. Codes are available at [https://github.com/KindXiaoming/pykan](https://github.com/KindXiaoming/pykan) ^uuda
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Liu24kolmogArnoldKAN
> 
> Comment: 48 pages, 20 figures. Codes are available at https://github.com/KindXiaoming/pykan
> 
> <small>📝️ (modified: 2024-05-15) [link](zotero://select/library/items/5EYM3T9L) - [web](http://zotero.org/users/60638/items/5EYM3T9L)</small>
>  
> ---




%% Import Date: 2024-05-15T11:01:05.261-07:00 %%
