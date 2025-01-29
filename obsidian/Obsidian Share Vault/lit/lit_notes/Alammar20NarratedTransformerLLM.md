---
category: literaturenote
tags:
  - ml/genAI
citekey: Alammar20NarratedTransformerLLM
status:
  - read
dateread: 
ZoteroTags: /unread
aliases:
  - The Narrated Transformer Language Model
  - The Narrated Transformer Language Model
publisher: ""
citation key: Alammar20NarratedTransformerLLM
DOI: ""
created date: 2024-04-26T16:31:53-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/HBBUSYJ8)   | [**URL**](https://www.youtube.com/watch?v=-QH8fRhqFHM)
>
> 
> **Abstract**
> AI/ML has been witnessing a rapid acceleration in model improvement in the last few years. The majority of the state-of-the-art models in the field are based on the Transformer architecture. Examples include models like BERT (which when applied to Google Search, resulted in what Google calls "one of the biggest leaps forward in the history of Search") and OpenAI's GPT2 and GPT3 (which are able to generate coherent text and essays).  This video by the author of the popular "Illustrated Transformer" guide will introduce the Transformer architecture and its various applications. This is a visual presentation accessible to people with various levels of ML experience.
> 
> 
> **FirstDirector**:: Jay Alammar  
~    
> **Title**:: "The Narrated Transformer Language Model"  
> **Date**:: 2020-10-06  
> **Citekey**:: Alammar20NarratedTransformerLLM  
> **ZoteroItemKey**:: HBBUSYJ8  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=-QH8fRhqFHM  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**:: YouTube   
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: /unread
> **Related**:: 

> _The Narrated Transformer Language Model_. Directed by Jay Alammar, 2020, [https://www.youtube.com/watch?v=-QH8fRhqFHM](https://www.youtube.com/watch?v=-QH8fRhqFHM).
%% begin Obsidian Notes %%
___
Video accompanying: [[Alammar18illustratedTransformer|The Illustrated Transformer]]

Video about transformer language models: decoder only.  Fairly lightweight, and somewhat confusing.  [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History: How AI Learned to Talk]] and [[3Blue1Brown24WvizIntroGPTtransfrmr]] were better.

Does point to some python, though, that could be used to make some slide graphs: tokenizers, embedders, maybe (not sure) final output probs.

# Raw Video Notes
- [00:01:38](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=98#t=01:38.21) variants of transformer, namely BERT, build on top of transformer, dominate LLMs
	- top scoring are all BERT (in 2020)
	- Google says it's biggest leap in history of search
- [00:02:52](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=172#t=02:52.36) CNNs used to dominate computer vision, but as of 2 wks ago, transformer models are getting impressive results, will go beyond language
- [00:03:45](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=225#t=03:45.40) [[Alammar18illustratedTransformer|The Illustrated Transformer]]: says that's how he understood it then.  He'll go over it again here.
- [00:05:24](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=324#t=05:24.26) init transformer had six layers: shows them kind of in parallel, not layered, huh.
- [00:06:18](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=378#t=06:18.30) decoder-only discussed here (language model): GPT-3, GPT-2, 
	- Llambda (I think) ins enc/dec
	- enc-only is BERT
- [00:07:37](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=458#t=07:37.74) Unsupervised pre-training
	- expensive training on massive dataset
	- but seems to be predicting next word, so why is this "unsupervised?"  Does he mean untuned, or something?
	- [ ] I don't understand the training examples diagram
- [00:12:17](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=738#t=12:17.70) feed forward NN predicts next word, nothing new
	- had prob neural prob LM since 2003 (next word prediction)
	- yes, also see [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History: How AI Learned to Talk]]
- [00:12:44](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=765#t=12:44.99) what is new
	- "the chicken didn't cross the road because it"
	- didn't used to know what "it" referred to: chicken? road?
	- the self attention layer figures this out
- [00:15:07](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=907#t=15:07.28) words to ID's (tokenization)
	- GPT2 seems to have just been word indices?  No subwords?  
	- model outputs an ID too.
- [00:16:42](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1002#t=16:42.20) python for running GPT2 tokenizer
- [00:19:24](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1164#t=19:24.35) word IDs don't have meaning encoded into them
- [00:19:47](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1187#t=19:47.11) Embeddings (see also his blog post "the illustrated word2vec)
	- also shows embeddings code
- [00:22:15](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1336#t=22:15.62) now shows subword tokens going to embeddings: "shaw" "sh" "ank" instead of "shawshank"
- [00:23:30](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1410#t=23:30.19) "**hidden states**" are representation vectors, outputs of blocks, inside of model
- [00:23:49](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1429#t=23:49.28) last token gets turned into representation of the next word: "*Projecting the output*"
	- [00:25:05](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1505#t=25:05.31) softmax is how you do it
	- scores are called "logits"
- [00:26:19](https://www.youtube.com/watch?v=-QH8fRhqFHM&t=1580#t=26:19.96) predicting the next output after the next output
	- shows probs of non-most-probable words
	- **greedy sampling** is picking most probable
	- but usually select from top 5 or top 50 scores
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Alammar20NarratedTransformerLLM
> 
> Video accompanying: ([Alammar, 2018](zotero://select/library/items/C7DDP9NW))
> 
> <small>📝️ (modified: 2024-03-06) [link](zotero://select/library/items/GZD2DKI5) - [web](http://zotero.org/users/60638/items/GZD2DKI5)</small>
>  
> ---




%% Import Date: 2024-04-26T16:32:16.501-07:00 %%
