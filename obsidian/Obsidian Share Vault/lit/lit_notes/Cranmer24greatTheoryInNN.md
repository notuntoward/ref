---
category: literaturenote
tags:
  - ml/genAI
  - ml/physmodel
  - "#ml/KAN"
  - interpretability
citekey: Cranmer24greatTheoryInNN
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - The Next Great Scientific Theory is Hiding Inside a Neural Network
  - The Next Great Scientific Theory
publisher: ""
citation key: Cranmer24greatTheoryInNN
DOI: ""
created date: 2024-05-18T08:11:11-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/QXKACLBG)   | [**URL**](https://www.youtube.com/watch?v=fk2r8y5TfNY)
>
> 
> **Abstract**
> Machine learning methods such as neural networks are quickly finding uses in everything from text generation to construction cranes. Excitingly, those same tools also promise a new paradigm for scientific discovery.  In this Presidential Lecture, Miles Cranmer will outline an innovative approach that leverages neural networks in the scientific process. Rather than directly modeling data, the approach interprets neural networks trained using the data. Through training, the neural networks can capture the physics underlying the system being studied. By extracting what the neural networks have learned, scientists can improve their theories. He will also discuss the Polymathic AI initiative, a collaboration between researchers at the Flatiron Institute and scientists around the world. Polymathic AI is designed to spur scientific discovery using similar technology to that powering ChatGPT. Using Polymathic AI, scientists will be able to model a broad range of physical systems across different scales. More details: https://www.simonsfoundation.org/even...
> 
> 
> **FirstDirector**:: Cranmer, Miles  
~    
> **Title**:: "The Next Great Scientific Theory is Hiding Inside a Neural Network"  
> **Date**:: 2024-04-03  
> **Citekey**:: Cranmer24greatTheoryInNN  
> **ZoteroItemKey**:: QXKACLBG  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=fk2r8y5TfNY  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**:: Simons Foundation   
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> _The Next Great Scientific Theory Is Hiding Inside a Neural Network_. Directed by Miles Cranmer, 2024. _YouTube_, [https://www.youtube.com/watch?v=fk2r8y5TfNY](https://www.youtube.com/watch?v=fk2r8y5TfNY).
%% begin Obsidian Notes %%
___

Tutorial video on NN models discovering physics by author of [[Cranmer23interpMLrgrssnPySR|PySR symbolic regression library]].  Shows how to learn composable physical models from an autoencoder chain, how surprising things like cat videos can make a good foundation model for PDEs, and big idea to make a huge generic physics foundation model.

This sparked [[#My Ideas sprouting from this talk]], about autoencoder PV component and system models.

# Raw Video Notes
## Neural net intro
## Distillation of learned NN to symbolic equations
- [20:14](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1214#t=20:14.28) Autoencoder learns factorized sub-models of whole function.  Factor NNs separated by autoencoder bottlenecks.  This is a distilling-type approach: complex NN to simple equs.
	- factors are learned chained physical processes, separated by autoencoder bottlenecks. 
	- My note: KAN might be less flaky than PySR: [[Wolf24simpleKAN]]
- My idea: [[#Distillation Model for PV System]]
- [21:58](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1318#t=21:58.36) Graph NN learns Newton's law of gravity
- [22:37](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1358#t=22:37.68) black hole mass scaling relationship
- [23:04](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1385#t=23:04.77) cloud cover parameterization, generalizes better to unseen data (I think the [paper](https://arxiv.org/abs/2304.08063) said?)
## Polymathic AI
Related to Foundation Model Paradigm
- [24:59](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1499#t=24:59.03) Foundation models in LLMs, etc.
	- chatGPT trained on GitHub
	- helps it generalize better
	- massive data
- [25:33](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1534#t=25:33.64) mask data, make it learn hidden part, self-supervised
- [27:03](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1624#t=27:03.53) fine-tune image foundation model to generate certain style.  Learns this much quicker.
- [28:05](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1685#t=28:05.18) Universality classes
	- In physics, shared concepts analogous to LLM idea of grammar learned in foundation models
	- e.g Chaos, Dynamical systems, Conservation laws
- [29:32](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1773#t=29:32.78) e.g. both reaction diffusion equations and shallow water equations have waves
	- could massively trained model learn "waves"?
	- specialize to these individual use cases with "fine tuning," with small training data?
- [31:43](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1903#t=31:43.38) big Polymathic AI foundation models produced by "tech behind ChatGPT"
	- [32:39](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=1960#t=32:39.73) result: multiple physics pre-training: PDE foundation model
		- seems to work in many cases
		- is predicting the next step, like chatGPT
	- [35:23](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=2123#t=35:23.13) model trained on many PDE cases and then tuned works better than one trained from scratch.  Far fewer tuning samples needed to reach performance X
		- even pre-training on cat (meow) videos is better than starting from scratch
			- idea learned is spatio-temporal continuity
		- [37:17](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=2237#t=37:17.06) so always pretrain model on some related
- My ideas:
	- [[#PV system foundation model]] 
	- [[#PV shading Foundation model]] 
## Simplicity: what is it?  Will Physical Foundation models learn it?
- [37:51](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=2271#t=37:51.04) is "+" simple?
- [39:25](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=2365#t=39:25.07) our idea of "simplicity" is based on familiarity, he says
	- we're familiar with useful stuff
	- but (I say) isn't that built-in for us?  Can't even some animals do "+"?
- [40:17](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=2417#t=40:17.35) so... if it's "useful," for one problem, useful for other probs (since they are "simple?")
	- world is compositional
- [41:03](https://www.youtube.com/watch?v=fk2r8y5TfNY&t=2463#t=41:03.40) exciting for polymathic AI, since they'll find broadly useful ideas
	- maybe we'll then discover new operators
	- and then we will think they are "simple" 
		- I guess not because they're "easy"
		- but because they'll be familiar

# My Ideas sprouting from this talk
## Distillation Model for PV System
Can an autoencoder chain learn a PV system model?
- Learning output would be simple physical PV system models
	- overall input/output: irradiance forecast / grid power
- factor networks
	- network 1: POC and shading
		- input: irradiance forecast, time, solar angles, etc.
		- output POC irradiance
	- network 2: PV module
		- input: POC irradiance, temp, etc.
		- output: panel output power
	- network 3: inverter
		- input: panel output power
		- output: power to grid
- not quite a standard autoencoder chain
	- new inputs added after bottleneck
	- e.g. PV module input includes temperature 
	- not an output of POC and shading subnetwork input input included in PV module inputs
	- on the other hand, include temp twice, separately?
		- maybe temp tells you info needed to correct POC irradiance? 
		- then given POC irradiance, temp still helps simplify PV panel subnetwork?
- [ ] BUT, if know form of equs, why bother with NN?
## PV system foundation model
- Train a [[#Distillation Model for PV System]] on a huge number of resi systems
- Fine tune on individual system
- somehow generalize foundation model for panel capacity, inverter capacity, etc.
	- normalize?
	- use symbolic equations?
## PV Shading Foundation model
Only thing you need to learn when you have physical specs of PV modules and inverters
- put NN in front of known PV module model
- can learn a ton of shading-only models
- maybe can be quickly adapted?
- use for PJT X project?
___
%% end Obsidian Notes %%



%% Import Date: 2024-05-18T08:11:27.082-07:00 %%
