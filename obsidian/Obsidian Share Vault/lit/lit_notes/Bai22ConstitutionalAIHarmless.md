---
category: literaturenote
tags: 
citekey: Bai22ConstitutionalAIHarmless
status: unread
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - "Constitutional AI: Harmlessness from AI Feedback"
  - "Constitutional AI: Harmlessness from AI"
publisher: ""
citation key: Bai22ConstitutionalAIHarmless
DOI: 10.48550/arXiv.2212.08073
created date: 2024-05-07T16:41:18-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/7GLSERKM)  | [**DOI**](https://doi.org/10.48550/arXiv.2212.08073)  | [**URL**](http://arxiv.org/abs/2212.08073) | [[Bai22ConstitutionalAIHarmless.pdf|PDF]]
>
> 
> **Abstract**
> As AI systems become more capable, we would like to enlist their help to supervise other AIs. We experiment with methods for training a harmless AI assistant through self-improvement, without any human labels identifying harmful outputs. The only human oversight is provided through a list of rules or principles, and so we refer to the method as 'Constitutional AI'. The process involves both a supervised learning and a reinforcement learning phase. In the supervised phase we sample from an initial model, then generate self-critiques and revisions, and then finetune the original model on revised responses. In the RL phase, we sample from the finetuned model, use a model to evaluate which of the two samples is better, and then train a preference model from this dataset of AI preferences. We then train with RL using the preference model as the reward signal, i.e. we use 'RL from AI Feedback' (RLAIF). As a result we are able to train a harmless but non-evasive AI assistant that engages with harmful queries by explaining its objections to them. Both the SL and RL methods can leverage chain-of-thought style reasoning to improve the human-judged performance and transparency of AI decision making. These methods make it possible to control AI behavior more precisely and with far fewer human labels.
> 
> 
> **FirstAuthor**:: Bai, Yuntao  
> **Author**:: Kadavath, Saurav  
> **Author**:: Kundu, Sandipan  
> **Author**:: Askell, Amanda  
> **Author**:: Kernion, Jackson  
> **Author**:: Jones, Andy  
> **Author**:: Chen, Anna  
> **Author**:: Goldie, Anna  
> **Author**:: Mirhoseini, Azalia  
> **Author**:: McKinnon, Cameron  
> **Author**:: Chen, Carol  
> **Author**:: Olsson, Catherine  
> **Author**:: Olah, Christopher  
> **Author**:: Hernandez, Danny  
> **Author**:: Drain, Dawn  
> **Author**:: Ganguli, Deep  
> **Author**:: Li, Dustin  
> **Author**:: Tran-Johnson, Eli  
> **Author**:: Perez, Ethan  
> **Author**:: Kerr, Jamie  
> **Author**:: Mueller, Jared  
> **Author**:: Ladish, Jeffrey  
> **Author**:: Landau, Joshua  
> **Author**:: Ndousse, Kamal  
> **Author**:: Lukosuite, Kamile  
> **Author**:: Lovitt, Liane  
> **Author**:: Sellitto, Michael  
> **Author**:: Elhage, Nelson  
> **Author**:: Schiefer, Nicholas  
> **Author**:: Mercado, Noemi  
> **Author**:: DasSarma, Nova  
> **Author**:: Lasenby, Robert  
> **Author**:: Larson, Robin  
> **Author**:: Ringer, Sam  
> **Author**:: Johnston, Scott  
> **Author**:: Kravec, Shauna  
> **Author**:: Showk, Sheer El  
> **Author**:: Fort, Stanislav  
> **Author**:: Lanham, Tamera  
> **Author**:: Telleen-Lawton, Timothy  
> **Author**:: Conerly, Tom  
> **Author**:: Henighan, Tom  
> **Author**:: Hume, Tristan  
> **Author**:: Bowman, Samuel R.  
> **Author**:: Hatfield-Dodds, Zac  
> **Author**:: Mann, Ben  
> **Author**:: Amodei, Dario  
> **Author**:: Joseph, Nicholas  
> **Author**:: McCandlish, Sam  
> **Author**:: Brown, Tom  
> **Author**:: Kaplan, Jared  
~    
> **Title**:: "Constitutional AI: Harmlessness from AI Feedback"  
> **Date**:: 2022-12-15  
> **Citekey**:: Bai22ConstitutionalAIHarmless  
> **ZoteroItemKey**:: 7GLSERKM  
> **itemType**:: preprint  
> **DOI**:: 10.48550/arXiv.2212.08073  
> **URL**:: http://arxiv.org/abs/2212.08073  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: todo, obsLitNote
> **Related**:: 

> Bai, Yuntao, et al. _Constitutional AI: Harmlessness from AI Feedback_. arXiv:2212.08073, arXiv, 15 Dec. 2022. _arXiv.org_, [https://doi.org/10.48550/arXiv.2212.08073](https://doi.org/10.48550/arXiv.2212.08073).
%% begin Obsidian Notes %%
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Bai22ConstitutionalAIHarmless
> 
> Tuning out harmful responses without human labels, other than a list of rules to follow -- the labels come from models themselves. In the 1st step, the LLM is fine tuned on some kindof cost function produced by “self-critques and revisions”.  In the 2nd phase, a couple realizations (I think) are generated from the fine-tuned LLM, and another model (not described in abstract) says which is better; this is the feedback for reinforcement learning, and is also callsed RLAIF: reinforecement from AI feedback.  Some kind of chain-of-thought reasoning also helps.
> 
> I think this was cited by ([Patel, 2023](zotero://select/library/items/GSRLLCGC))
> 
> <small>📝️ (modified: 2024-05-07) [link](zotero://select/library/items/73RHBXYF) - [web](http://zotero.org/users/60638/items/73RHBXYF)</small>
>  
> ---




%% Import Date: 2024-05-07T16:41:24.453-07:00 %%
