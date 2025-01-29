---
category: literaturenote
tags: 
citekey: Alammar18illustratedTransformer
status: unread
dateread: 
ZoteroTags: /unread, obsLitNote
aliases:
  - The Illustrated Transformer
  - The Illustrated Transformer
publisher: ""
citation key: Alammar18illustratedTransformer
DOI: ""
created date: 2024-11-21T15:52:10-08:00
modified date: 2024-11-21T15:52:10-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/C7DDP9NW)   | [**URL**](https://jalammar.github.io/illustrated-transformer/) | [[Alammar18illustratedTransformer.pdf|PDF]]
>
> 
> **Abstract**
> Discussions: Hacker News (65 points, 4 comments), Reddit r/MachineLearning (29 points, 3 comments)   Translations: Arabic, Chinese (Simplified) 1, Chinese (Simplified) 2, French 1, French 2, Italian, Japanese, Korean, Persian, Russian, Spanish 1, Spanish 2, Vietnamese  Watch: MIT’s Deep Learning State of the Art lecture referencing this post  Featured in courses at Stanford, Harvard, MIT, Princeton, CMU and others  In the previous post, we looked at Attention – a ubiquitous method in modern deep learning models. Attention is a concept that helped improve the performance of neural machine translation applications. In this post, we will look at The Transformer – a model that uses attention to boost the speed with which these models can be trained. The Transformer outperforms the Google Neural Machine Translation model in specific tasks. The biggest benefit, however, comes from how The Transformer lends itself to parallelization. It is in fact Google Cloud’s recommendation to use The Transformer as a reference model to use their Cloud TPU offering. So let’s try to break the model apart and look at how it functions.  The Transformer was proposed in the paper Attention is All You Need. A TensorFlow implementation of it is available as a part of the Tensor2Tensor package. Harvard’s NLP group created a guide annotating the paper with PyTorch implementation. In this post, we will attempt to oversimplify things a bit and introduce the concepts one by one to hopefully make it easier to understand to people without in-depth knowledge of the subject matter.  2020 Update: I’ve created a “Narrated Transformer” video which is a gentler approach to the topic:     A High-Level Look Let’s begin by looking at the model as a single black box. In a machine translation application, it would take a sentence in one language, and output its translation in another.
> 
> 
> **FirstAuthor**:: Alammar, Jay  
~    
> **Title**:: "The Illustrated Transformer"  
> **Date**:: 2018-06-27  
> **Citekey**:: Alammar18illustratedTransformer  
> **ZoteroItemKey**:: C7DDP9NW  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://jalammar.github.io/illustrated-transformer/  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: /unread, obsLitNote
> **Related**:: 

> Alammar, Jay. _The Illustrated Transformer_. 27 June 2018, [https://jalammar.github.io/illustrated-transformer/](https://jalammar.github.io/illustrated-transformer/).
%% begin Obsidian Notes %%
___
Shows how outputs are generated, and how the model doesn’t need retraining on each iteration, even though context kinda increases.  Lots of figures to borrow from.  Watch before [[Vaswani17AttentionAllYou|Attention is all you need]]?

Also has a video: [[Alammar20NarratedTransformerLLM|The Narrated Transformer Language Model]].  Maybe watch this 1st?
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Alammar18illustratedTransformer
> 
> Shows how outputs are generated, and how the model doesn’t need retraining on each iteration, even though context kinda increases.  Lots of figures ot borrow from.  Watch before ([Vaswani et al., 2017](zotero://select/library/items/JPEYNNM8))?
> 
> Also has a video: ([“The Narrated Transformer Language Model - YouTube”, 2020](zotero://select/library/items/HBBUSYJ8)).  Maybe watch this 1st?
> 
> <small>📝️ (modified: 2024-03-06) [link](zotero://select/library/items/GSCEW6G7) - [web](http://zotero.org/users/60638/items/GSCEW6G7)</small>
>  
> ---




%% Import Date: 2024-04-26T17:01:47.858-07:00 %%
