---
category: literaturenote
tags:
  - ml/genAI
citekey: 3Blue1Brown24visAttenTransfrmr
status:
  - read
dateread: 
ZoteroTags: ""
aliases:
  - Visualizing Attention, a Transformer's Heart | Chapter 6, Deep Learning
  - Visualizing Attention, a Transformer's Heart
publisher: ""
citation key: 3Blue1Brown24visAttenTransfrmr
DOI: ""
created date: 2024-10-13T15:23:57-07:00
modified date: 2024-10-13T20:31:19-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/6B76TMFW)   | [**URL**](https://www.youtube.com/watch?v=eMlx5fFNoYc)
>
> 
> **Abstract**
> Demystifying attention, the key mechanism inside transformers and LLMs. Instead of sponsored ad reads, these lessons are funded directly by viewers: https://3b1b.co/support Special thanks to these supporters: https://www.3blue1brown.com/lessons/a... An equally valuable form of support is to simply share the videos.  Demystifying self-attention, multiple heads, and cross-attention. Instead of sponsored ad reads, these lessons are funded directly by viewers: https://3b1b.co/support  The first pass for the translated subtitles here is machine-generated, and therefore notably imperfect. To contribute edits or fixes, visit https://translate.3blue1brown.com/  ------------------  Here are a few other relevant resources  Build a GPT from scratch, by Andrej Karpathy    • Let's build GPT: from scratch, in cod...    If you want a conceptual understanding of language models from the ground up, @vcubingx just started a short series of videos on the topic:    • What does it mean for computers to un...    If you're interested in the herculean task of interpreting what these large networks might actually be doing, the Transformer Circuits posts by Anthropic are great. In particular, it was only after reading one of these that I started thinking of the combination of the value and output matrices as being a combined low-rank map from the embedding space to itself, which, at least in my mind, made things much clearer than other sources. https://transformer-circuits.pub/2021...  Site with exercises related to ML programming and GPTs https://www.gptandchill.ai/codingprob...  History of language models by Brit Cruise,  @ArtOfTheProblem      • ChatGPT: 30 Year History | How AI Lea...    An early paper on how directions in embedding spaces have meaning: https://arxiv.org/pdf/1301.3781.pdf  ------------------  Timestamps: 0:00 - Recap on embeddings 1:39 - Motivating examples 4:29 - The attention pattern 11:08 - Masking 12:42 - Context size 13:10 - Values 15:44 - Counting parameters 18:21 - Cross-attention 19:19 - Multiple heads 22:16 - The output matrix 23:19 - Going deeper 24:54 - Ending  ------------------  These animations are largely made using a custom Python library, manim.  See the FAQ comments here: https://3b1b.co/faq#manim https://github.com/3b1b/manim https://github.com/ManimCommunity/manim/  All code for specific videos is visible here: https://github.com/3b1b/videos/  The music is by Vincent Rubinetti. https://www.vincentrubinetti.com https://vincerubinetti.bandcamp.com/a... https://open.spotify.com/album/1dVyjw...  ------------------  3blue1brown is a channel about animating math, in all senses of the word animate. If you're reading the bottom of a video description, I'm guessing you're more interested than the average viewer in lessons here. It would mean a lot to me if you chose to stay up to date on new ones, either by subscribing here on YouTube or otherwise following on whichever platform below you check most regularly.  Mailing list: https://3blue1brown.substack.com Twitter:   / 3blue1brown   Instagram:   / 3blue1brown   Reddit:   / 3blue1brown   Facebook:   / 3blue1brown   Patreon:   / 3blue1brown   Website: https://www.3blue1brown.com
> 
> 
> **FirstDirector**:: 3Blue1Brown  
~    
> **Title**:: "Visualizing Attention, a Transformer's Heart | Chapter 6, Deep Learning"  
> **Date**:: 2024-04-07  
> **Citekey**:: 3Blue1Brown24visAttenTransfrmr  
> **ZoteroItemKey**:: 6B76TMFW  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=eMlx5fFNoYc  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: 
>**Related**:: 

> _Visualizing Attention, a Transformer’s Heart | Chapter 6, Deep Learning_. Directed by 3Blue1Brown, 2024. _YouTube_, [https://www.youtube.com/watch?v=eMlx5fFNoYc](https://www.youtube.com/watch?v=eMlx5fFNoYc).
%% begin Obsidian Notes %%
___

Explains how attention works in GPT3, which is only 1/3 of the params. Next video in series will talk about those (not available yet, as of 4/26/24)

Previous CGP Grey video on transformers is [[3Blue1Brown24WvizIntroGPTtransfrmr|But what is a GPT? Visual intro to transformers | Chapter 5, Deep Learning]]

# Raw Video Notes

- [00:01:34](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=95#t=01:34.56) **Transformer's job is to adjust initial embedding**s, so they encode more than individual tokens, but some "richer contextual meaning" of other words in sequence, which can be a whole document, if you have enough context in the model.
	- original token space could encode things like gender (son/father, etc.) and [[3Blue1Brown24visAttenTransfrmr#^d95f61|position]]
- [00:02:00](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=121#t=02:00.95) Example: 3 meanings of 'mole'.  
	- Would initially have the same tokens. (so not too much fancy linguistics in tokenization, I guess)
	- transformer figures out what to add to generic embeddings to the token's meaning within the sentence
	- Example images of "mole" adjustment ^5da5b5
		- [[lit/lit_notes/attachments/3087df35edf71e7e2124cda5ecebe07c_MD5.jpeg|Open: Pasted image 20240426104532.png]]
		- [[lit/lit_notes/attachments/9928bd928f568fe074c1617c5e956410_MD5.jpeg|Open: Pasted image 20240426104733.png]]
		- [[lit/lit_notes/attachments/038a5a39ce0715294d4e5a15e610ac03_MD5.jpeg|Open: Pasted image 20240426105106.png]]
- [00:03:29](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=210#t=03:29.58) more general than word bidding: can move info from word far away
- [00:02:57](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=177#t=02:57.11) example of tower
	- tower goes in direction of France if France is before it (in English)
	- and to smaller things of it's preceded by miniature (in English)
	- This adjustment happens across long sequence distances, not just adjacent tokens
- [00:03:51](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=232#t=03:51.61) after last block/MLP pair, the last vector in the sequence has all the info for the next word.
	- b/c attention vectors can move info across representations: in this case everything needed to predict next word ^c89a1d
	- [[lit/lit_notes/attachments/adfda91768c106cfa5fe65df40218356_MD5.jpeg|Open: Pasted image 20240426105857.png]]
	- [[lit/lit_notes/attachments/814c26ce5bbc6a5e0f9acd11f67993fd_MD5.jpeg|Open: Pasted image 20240426110434.png]]
- [00:04:41](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=281#t=04:41.03) fluffy blue.. sentence
- [00:04:47](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=287#t=04:47.14) 1 **head of attention**
	- attention block has many parallel heads 
- [00:04:55](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=296#t=04:55.79) not quite true that **init token embed** has info only about that word: they **also have position** info (not talking about that now) ^d95f61
- [00:05:23](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=324#t=05:23.98) noun meanings ingest meaning from their adjectives (made up example of what you think it could be doing.  Is actually too hard to parse in real life)
- [00:06:35](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=395#t=06:35.21) "**Query**" is a low dimensional vector (ex. 128) , which is 
  WQ * Representation (E4 in example).  
  It is the answer asked by repr. from all representations.  
  - WQ is learned from data.
  - hard to parse what it really does
- [00:07:48](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=468#t=07:48.03) "**Key**" Wk is a 2nd vector that multiplies by every representation.  Can consider it a query answer.  
	- Maps embedding vecs to a smaller space, just like query.
	- Match query when they're aligned: have a big dot product
		- called two tokens "**attending**" to each other
- [00:09:17](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=557#t=09:17.05) grid of values score how relevant a word is to updating meaning of other word
- **Attention Pattern** (Relevance weights)
	- [00:09:29](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=570#t=09:29.75) want weighted sum along each token's representation, weighted by the relevance
	- [00:09:42](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=582#t=09:42.01) weights come from softmax down columns: range (0,1), sum to 1.  Grid is attention pattern
	- [00:10:28](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=628#t=10:28.22) How it looks in original attention (is all you need?) paper.
		- softmax applies down columns in that notation.
		- Does that answer the [[Bhargava24controlTheoryLLM#^0cf5dc|question]] I asked in [[Bhargava24controlTheoryLLM|LLM Control Theory: What's the]]
- [00:11:11](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=672#t=11:11.62) predict every possible next token from every possible subsequence. Like a rolling TS forecast
	- ==> must zero anti-causal columns
	- Just sent negs to -inf b/f softmax
	- Called "**masking**"
	- some kinds of attention don't do this, but GPT training does (not during inference)
- [00:12:48](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=768#t=12:48.29) attention pattern size is square of context size: HUGE
- [00:13:07](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=788#t=13:07.86) tricks to make context window smaller
- update of representation
	- [00:13:33](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=813#t=13:33.38) : straightforward, single attention
		- Wv (value matrix) is multipled by repr of 1st token, add result to 2nd token repr.  
		- Do this for every repr in context
		- more complicated for multi-headed attention
	- [00:16:16](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=977#t=16:16.59) Value matrix is giant if mathces key and query matrix
	- [00:16:52](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1013#t=16:52.79) instead, size it so has same # params as key and query.  Do this by making it a product of two matrices.  A "low rank transformation"
- [00:18:22](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1102#t=18:22.40) All of this was "**self-attention**" head
- [00:18:31](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1112#t=18:31.81) **cross-attention** head
	- for when process two types of data e.g. translation
	- example GPT in this video only has one type, so doesn't have it
	- key and query maps are different data types
		- no masking
- Mult-headed attention
- [00:20:30](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1230#t=20:30.16) : many key-query maps and adjustments, in parallel, each w/ own map ^57ca78
	- GPT has 96 attention heads in each block
	- value vectors changes are all added to representation on update
	- [00:21:49](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1310#t=21:49.70) allows model to learn the many ways context changes meaning
- [00:22:07](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1327#t=22:07.42) In GPT3: **each bloc**k of multi-headed attention has **600M params** 
- [00:22:35](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1356#t=22:35.64) in papers and in actual code, won't see low rank value maps separately in each block.  Instead, see them stapled together called an "**output matrix**" expressing entire multi-headed attention block.  When they talk about "value matrix," they're only talking 1st part of low rank transform, the 'value down' matrix in this video.
- [00:24:16](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1456#t=24:16.48) GPT3 has 96 layers, 96 heads, so 58B params for attention, but that's only 1/3 of all params in it.  Majority of params are from other blocks.
- [00:25:06](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=1507#t=25:06.80) attention's main advantage is that its extremely parallelizable in GPUs
	
___
%% end Obsidian Notes %%



%% Import Date: 2024-04-07T16:11:19.819-07:00 %%
