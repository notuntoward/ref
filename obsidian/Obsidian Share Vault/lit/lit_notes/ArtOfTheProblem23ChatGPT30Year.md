---
category: literaturenote
tags: 
citekey: ArtOfTheProblem23ChatGPT30Year
status: unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "ChatGPT: 30 Year History: How AI Learned to Talk"
  - "ChatGPT: 30 Year History: How"
publisher: ""
citation key: ArtOfTheProblem23ChatGPT30Year
DOI: ""
created date: 2024-04-26T16:16:43-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/WU39HN8C)   | [**URL**](https://www.youtube.com/watch?v=OFS90-FX6pg)
>
> 
> **Abstract**
> This video explores the journey of AI language models, from their modest beginnings through the development of OpenAI's GPT models. Our journey takes us through the key moments in generative neural network research involved in next word prediction. We delve into the early experiments with tiny language models in the 1980s, highlighting significant contributions by researchers like Jordan, who introduced Recurrent Neural Networks, and Elman, whose work on learning word boundaries revolutionized our understanding of language processing. It leaves us with a question: what is thought? Is simulated thought, thought? Featuring Noam Chomsky Douglas Hofstadter Michael I. Jordan Jeffrey Elman Geoffrey Hinton Ilya Sutskever Andrej Karpathy Yann LeCun and more. (Sam altman)  My script, references & visualizations here: https://docs.google.com/document/d/1s...  consider joining my channel as a YouTube member:    / @artoftheproblem     This is the last video in the series "The Pattern Machine" you can watch it all here:    • Episode 5: Deep Learning (The Pattern...    00:00 - Introduction 00:32 - hofstader's thoughts on chatGPT 01:00 - recap of supervised learning 01:55 - first paper on sequential learning 02:55 - first use of state units (RNN) 04:33 - first observation of word boundary detection 05:30 - first observation of word clustering 07:16 - first "large" language model Hinton/Sutskever  10:10 - sentiment neuron (Ilya | OpenAI) 12:30 - transformer explaination 15:50 - GPT-1 17:00 - GPT-2 17:55 - GPT-3 18:20 - In-context learning 19:40 - ChatGPT 21:10 - tool use 23:25 - philosophical question: what is thought?
> 
> 
> **FirstDirector**:: Cruise, Brit  
~    
> **Title**:: "ChatGPT: 30 Year History: How AI Learned to Talk"  
> **Date**:: 2023-11-27  
> **Citekey**:: ArtOfTheProblem23ChatGPT30Year  
> **ZoteroItemKey**:: WU39HN8C  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=OFS90-FX6pg  
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

> _ChatGPT: 30 Year History: How AI Learned to Talk_. Directed by Brit Cruise, 2023. _YouTube_, [https://www.youtube.com/watch?v=OFS90-FX6pg](https://www.youtube.com/watch?v=OFS90-FX6pg).
%% begin Obsidian Notes %%
___
Very good history running through the papers and products from plain MLPs to RNN's to GPT.  Helpful for connecting all these ideas.  Summary at the end of current disagreements about what it all means.
# Raw Video Notes
## Why chatGPT matters
- [00:00:56](https://www.youtube.com/watch?v=OFS90-FX6pg&t=57#t=56.72) chatGPT can do in 1 s that would take an hour for a human to do (Douglas Hofstadter). "Entire race will be eclipsed and left in the dust."
## Evolution to ChatGPT
- [00:01:50](https://www.youtube.com/watch?v=OFS90-FX6pg&t=111#t=01:50.87) reasoning is a sequential process.  Original NNs were siloed.
### Jordan
- [00:02:36](https://www.youtube.com/watch?v=OFS90-FX6pg&t=156#t=02:36.04) Jordan's recurrent nets, adding state memory, just hid next letter in a sequence & then trained 
	- weren't just memorized, but generalized
	- but another experiment w/ spatial pattern kept gradually returning to same stable sequence, for different initial points: what they learn is to travel through a trajectory through state space.
### Elman
- [00:04:33](https://www.youtube.com/watch?v=OFS90-FX6pg&t=274#t=04:33.63) Elman tried a 50 neuron NN. Learned letter sequency of words.  
	- Learned word boundaries by itself.  Start of word error is high, near end of word, error is low (decreasing entropy, as in info theory sequency length)
	- Could learn words and nouns, breakable, edible, ...
	- Chomsky said not possible
- [00:06:20](https://www.youtube.com/watch?v=OFS90-FX6pg&t=380#t=06:20.33) pre-verbal children also learn to predict the next hidden word.  They listen and talk along in their minds.
- [00:06:53](https://www.youtube.com/watch?v=OFS90-FX6pg&t=413#t=06:53.28) sequences of words are a high dimensional trajectory
- Generating text with Recurrent NNs paper (2011)
	- better char level prediction could compress text files
	- said compression is equivalent to intelligence
	- [00:08:05](https://www.youtube.com/watch?v=OFS90-FX6pg&t=486#t=08:05.71) Hopfield quote
	- 1000's of neurons
	- kinda worked predicting a few words, but afterwards, nonsense
	- NN ran out of long distance learning capacity (these were RNNs of some sort, I guess, but not RELU, I guess)
### Karpathy
- redid w/ bigger network, more layers, trained on all of shakespeare.  Worked, also plausible math
- it learned in phases by itself
- NN learned what it needed to keep track of.
### Dalle3 paper (2017)
- [00:10:14](https://www.youtube.com/watch?v=OFS90-FX6pg&t=614#t=10:14.11) trained on 82M AMZ reviews
- saw it learned a single sentiment neuron.  Perfectly classified sentiment.  Learned this even though it learned to  predict the next word
- forced that neuron to be pos or neg, and generated text was pos or neg!
- learned other stuff
- this was still an RNN, meant that context had to be squeezed into fixed internal memory, erasing meaning.  So long sequency gibberish
### Alternative to Dalle 3 paper
- [00:12:42](https://www.youtube.com/watch?v=OFS90-FX6pg&t=763#t=12:42.66) Alternative: process entire input sequence in parallel, required many layers of depth so memory big enough.  Impossible to train
### Attention is all you need paper
- [00:13:00](https://www.youtube.com/watch?v=OFS90-FX6pg&t=780#t=13:00.43) 2017: Transformers & attention paper
	- for translation
	- solution to memory constraint above
	- dynamic layer adapted weight based on input context (normal nets have fixed connection weights)
		- could do in **one** layer what before required **many layers**
		- [ ] ? Is it really that it requires fewer gradient-killing nonlinear layers  b/c of the big linear attention blocks? 
			- [ ] true even when nonlinearity is RELU?  
				- [ ] Is RELU gradient killing still bad enough to need the linear blocks?
			- [ ] or is it that the softmax part of the attention is a more tractable nonlinearity for some reason?
		- attention layer shrink [[lit/lit_notes/attachments/80c7705cf00d4dc2538f72bc3272f16d_MD5.jpeg|slide]] ^aa352a
	- get shallower but wider network
	- could train it
	- self-attention layers made it possible to train
	- every word looked at every other word (attention layers)
- [00:13:45](https://www.youtube.com/watch?v=OFS90-FX6pg&t=826#t=13:45.62) distance in concept space makes connections across words.  River bank attention slide: [[lit/lit_notes/attachments/303f7415bfb1a7034fa6cb7b21327daf_MD5.jpeg|Open: Pasted image 20240426143439.png]] ^611d0c
- [00:14:55](https://www.youtube.com/watch?v=OFS90-FX6pg&t=895#t=14:55.02) "transformer" comes from transforming meaning based on the words around it
- [00:15:05](https://www.youtube.com/watch?v=OFS90-FX6pg&t=906#t=15:05.75) music generation, 
	- line colors are different attention heads
	- weight of line is the weight
	- all patterns are considered
- [00:15:25](https://www.youtube.com/watch?v=OFS90-FX6pg&t=925#t=15:25.31) looks at patterns all the time all at once: 
- no memory is needed: it's self-reference within the layer
### GPT1 (Open AI)
- [00:15:52](https://www.youtube.com/watch?v=OFS90-FX6pg&t=953#t=15:52.57) Attention is all you need paper was still half in old paradigm
	- only on translation
	- supervised training
- OpenAI tried it on next word problem (GPT1)
	- 7000 books, many domains
	- continued passage much more logically before
	- could answer questions, not present in training data.  This was **Zero-shot learning**
### GPT2 (openAI)
- 3000K neurons, more data
- could translate languages w/ no specific translation training
- still drifted off after many sentences
### GPT3 (OpenAI)
- [00:18:11](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1092#t=18:11.60) 176B connections, 1k words, all common web, books, wikipedia
- could learn new things after it was already trained:  **In context learning**
	- [00:18:37](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1118#t=18:37.79) defined a fake word in a chat: GPT3 could use that word correctly in a sentence
	- it's the "wug test": liguistic stage in children
	- what weights change?  [00:19:27](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1168#t=19:27.55) 
		- **core**: fixed after train
		- **in context**: change during inference
	- "The prompt is the program"
		- so, I suppose this is like a computer, with chips frozen (core weights) and software changed by inputs (in context)
	- **InstructGPT**:  extra  training on good vs. bad human instructions
		- what to say and also how to say it
		- [00:20:22](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1222#t=20:22.31) this was consumer-facing chatGPT
	- Then think step by step improved performance
		- iterative looks, so subthought were in meaningful chunks
		- so could follow long chain of reasoning
		- [ ] but how does context memory get wiped between the meaningful chunks (if it goes on without ending, context would run out)
		- could learn tool use also 
## What it all means
- [00:22:05](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1325#t=22:05.23) every task performed by computers could be designed w/ LLM at core
	- Karpathy says LLM kernel process in emerging OS.  RAM is context window; LLM pages info in/out of context window
	- [ ] is that an agent
- [00:22:34](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1355#t=22:34.81) some say no specialized networks.  Treat all perceptions as language (symbols), train based on self-attention ^2cdc0d
	- [ ] is there a source for this?
	- general system can be retasked on any arbitrary narrow problem
	- Bishop [[Scarfe24bishopNewDpLrnBk#^617a74|said]] something similar, except for physical problems
	- [00:23:46](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1427#t=23:46.58) Chomsky says NO.  It's glorified autofill
		- but Hinton disagrees
		- LeCun kind of agrees w/ Chomsky, says fluency isn't understanding
		- Andrew Ng says he's never seen AI community so fragmented
- [00:25:21](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1521#t=25:21.32) one side says if it looks like thought, it is thought; the other says they're tricking us, showing us our thoughts in a way we didn't anticipate.
- [00:25:34](https://www.youtube.com/watch?v=OFS90-FX6pg&t=1534#t=25:34.08) line between simulated and actual is becoming more blurred: maybe there is no line...
	
___
%% end Obsidian Notes %%



%% Import Date: 2024-04-26T16:17:01.633-07:00 %%
