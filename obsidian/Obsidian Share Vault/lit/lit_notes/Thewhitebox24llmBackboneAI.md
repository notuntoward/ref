---
category: literaturenote
tags:
  - ml/genAI
citekey: Thewhitebox24llmBackboneAI
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - LLMs, The Backbones of Frontier AI | TheWhiteBox
  - LLMs, The Backbones of Frontier
publisher: ""
citation key: Thewhitebox24llmBackboneAI
DOI: ""
created date: 2024-05-07T15:40:33-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/WFRJY6LB)   | [**URL**](https://thewhitebox.ai/llms-the-backbones-of-frontier-ai/) | [[Thewhitebox24llmBackboneAI.pdf|PDF]]
>
> 
> **Abstract**
> LLMs are almost synonymous with state-of-the-art these days, with examples such as ChatGPT. But how are these systems actually built?
> 
> 
> **FirstAuthor**:: TheWhiteBox  
~    
> **Title**:: "LLMs, The Backbones of Frontier AI | TheWhiteBox"  
> **Date**:: 2024-04-17  
> **Citekey**:: Thewhitebox24llmBackboneAI  
> **ZoteroItemKey**:: WFRJY6LB  
> **itemType**:: blogPost  
> **DOI**::   
> **URL**:: https://thewhitebox.ai/llms-the-backbones-of-frontier-ai/  
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

> TheWhiteBox. “LLMs, The Backbones of Frontier AI | TheWhiteBox.” _The White Box_, 17 Apr. 2024, [https://thewhitebox.ai/llms-the-backbones-of-frontier-ai/](https://thewhitebox.ai/llms-the-backbones-of-frontier-ai/).
%% begin Obsidian Notes %%
___
Big picture view of LLMs their training.  Recommended by [[Patel23WillScalingWork]], I think.

# Training Phases

## [[Thewhitebox24llmBackboneAI.pdf#page=3&annotation=44R|Pre-training]]
- Raw sequence-to-sequence training, predicting the next word.  
- This is called [[Thewhitebox24llmBackboneAI.pdf#page=4&annotation=186R|self-supervised learning]], because the data provides its own label.
- produces a [[Thewhitebox24llmBackboneAI.pdf#page=7&annotation=56R|base model]] that predicts the best word.  Not the best b/c its replicating internet behavior, and isn't being conversational, like you'd like a chatbot to be e.g. not answering a question w/  question, and not answering some questions at all
- it's a [[Thewhitebox24llmBackboneAI.pdf#page=7&annotation=61R|smart bag of words]]
## [[Thewhitebox24llmBackboneAI.pdf#page=7&annotation=60R|Supervised Fine-Tuning]]
- a.k.a. [[Thewhitebox24llmBackboneAI.pdf#page=8&annotation=201R|SFT]]
- SFT datasets orders of magnitude smaller than pre-training set
	- [[Thewhitebox24llmBackboneAI.pdf#page=8&annotation=206R|SFT datasets available for free in HuggingFace]]
	- Looking @ hugging face, these are Q/A pairs scraped from the internet
- [[Thewhitebox24llmBackboneAI.pdf#page=8&annotation=732R|InstructGPT]] seems to be a training method (there's another TheWhiteBox page on this)
	- also [[Davidson23improveAInoExpensTrain#InstructGPT]] 
 
[[Thewhitebox24llmBackboneAI.pdf#page=9&annotation=64R|Alignment]]
- optimizing for [[Thewhitebox24llmBackboneAI.pdf#page=9&annotation=66R|safety]]
- Using a [[Thewhitebox24llmBackboneAI.pdf#page=9&annotation=69R|human preference dataset]]
	- contains [[Thewhitebox24llmBackboneAI.pdf#page=9&annotation=71R|better/worse answers]]
	- is massively expensive
	- goal is to reward better LLM responses
		- [[Thewhitebox24llmBackboneAI.pdf#page=10&annotation=81R|RLHF]] (reinforcement with human feedback, they have a page).  Two ways
			- requires a [[Thewhitebox24llmBackboneAI.pdf#page=10&annotation=85R|reward model]] (a policy model?) of about the same size as the LLM, which I guess estimates the reward at the sequence you could get to if you pick word X ?
		- [[Thewhitebox24llmBackboneAI.pdf#page=10&annotation=82R|DPO]] (direct preference optimization)
			- avoids the reward model: [[Thewhitebox24llmBackboneAI.pdf#page=10&annotation=89R|parametrizing the reward]]
			- somehow uses its own responses as rewards
- [[Thewhitebox24llmBackboneAI.pdf#page=10&annotation=91R|Kahneman-Tversky Optimization]]
	- avoids the human preference dataset
	- is new
	- response is a "weak signal", which comes from other LLMs
	- Related to [[Cahyawijaya24humanValuesVecLLM|High-Dimension Human Value Representation]]?
	- Related to Agents which chat with each other (since getting judgement from another LLM)
		- seems like I had a paper where LLM judges another.  Not in obsidian yet?
	- Related to [[Bai22ConstitutionalAIHarmless|Constitutional AI]] ?


___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Big picture view of LLMs their training.  Recommeded by ([Patel, 2023](zotero://select/library/items/GSRLLCGC)), I think
> 
> <small>📝️ (modified: 2024-05-07) [link](zotero://select/library/items/IVWC5PP4) - [web](http://zotero.org/users/60638/items/IVWC5PP4)</small>
>  
> ---




%% Import Date: 2024-05-07T15:40:50.203-07:00 %%
