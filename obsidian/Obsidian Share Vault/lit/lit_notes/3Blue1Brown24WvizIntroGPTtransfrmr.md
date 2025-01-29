---
category: literaturenote
tags:
  - ml/genAI
citekey: 3Blue1Brown24WvizIntroGPTtransfrmr
status:
  - read
dateread: 
ZoteroTags: ""
aliases:
  - But what is a GPT?  Visual intro to transformers | Chapter 5, Deep Learning
  - But what is a GPT?
publisher: ""
citation key: 3Blue1Brown24WvizIntroGPTtransfrmr
DOI: ""
created date: 2024-10-13T20:30:06-07:00
modified date: 2024-10-18T12:31:19-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/MXZJVR4S)   | [**URL**](https://www.youtube.com/watch?v=wjZofJX0v4M)
>
> 
> **Abstract**
> Unpacking how large language models work under the hood Early view of the next chapter for patrons: https://3b1b.co/early-attention Special thanks to these supporters: https://3b1b.co/lessons/gpt#thanks  To contribute edits to the subtitles, visit https://translate.3blue1brown.com/  Other recommended resources on the topic.  Richard Turner's introduction is one of the best starting places: https://arxiv.org/pdf/2304.10557.pdf  Coding a GPT with Andrej Karpathy    • Let's build GPT: from scratch, in cod...    Introduction to self-attention by John Hewitt https://web.stanford.edu/class/cs224n...  History of language models by Brit Cruise:    • ChatGPT: 30 Year History | How AI Lea...    Paper about examples like the “woman - man” one presented here: https://arxiv.org/pdf/1301.3781.pdf  ------------------  Timestamps  0:00 - Predict, sample, repeat 3:03 - Inside a transformer 6:36 - Chapter layout 7:20 - The premise of Deep Learning 12:27 - Word embeddings 18:25 - Embeddings beyond words 20:22 - Unembedding 22:22 - Softmax with temperature 26:03 - Up next  ------------------ These animations are largely made using a custom Python library, manim.  See the FAQ comments here: https://3b1b.co/faq#manim https://github.com/3b1b/manim https://github.com/ManimCommunity/manim/  All code for specific videos is visible here: https://github.com/3b1b/videos/  The music is by Vincent Rubinetti. https://www.vincentrubinetti.com https://vincerubinetti.bandcamp.com/a... https://open.spotify.com/album/1dVyjw...  ------------------  3blue1brown is a channel about animating math, in all senses of the word animate. If you're reading the bottom of a video description, I'm guessing you're more interested than the average viewer in lessons here. It would mean a lot to me if you chose to stay up to date on new ones, either by subscribing here on YouTube or otherwise following on whichever platform below you check most regularly.  Mailing list: https://3blue1brown.substack.com Twitter:   / 3blue1brown   Instagram:   / 3blue1brown   Reddit:   / 3blue1brown   Facebook:   / 3blue1brown   Patreon:   / 3blue1brown   Website: https://www.3blue1brown.com
> 
> 
> **FirstDirector**:: 3Blue1Brown  
~    
> **Title**:: "But what is a GPT?  Visual intro to transformers | Chapter 5, Deep Learning"  
> **Date**:: 2024-04-01  
> **Citekey**:: 3Blue1Brown24WvizIntroGPTtransfrmr  
> **ZoteroItemKey**:: MXZJVR4S  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=wjZofJX0v4M  
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

> _But What Is a GPT?  Visual Intro to Transformers | Chapter 5, Deep Learning_. Directed by 3Blue1Brown, 2024. _YouTube_, [https://www.youtube.com/watch?v=wjZofJX0v4M](https://www.youtube.com/watch?v=wjZofJX0v4M).
%% begin Obsidian Notes %%
___

This is the first [3Blue1Brown](https://www.youtube.com/c/3blue1brown) video specifically on transformers; next is [[3Blue1Brown24visAttenTransfrmr|Visualizing Attention, a Transformer's Heart, Chapter 6, Deep Learning]]. The [animations](CommDevs24ManimMathAnim) are great, and I should borrow his idea of introducing transformers by showing that there are lots of types of them, starting w/ Google's language translation transformer.

The common purpose of the many transformers is to find meaningful relations between different domains e.g. languages, but this paper is about GPT transformers, which transform a context of text into a prediction of the next word. It starts with tokenization, where text is split into word-like units, which are then one-hotted into one vector of floats for each context token. This num_context X num_tokens matrix of vectors is then multiplied by an 
# Related
- [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History: How]]
- [[Alammar20NarratedTransformerLLM|The Narrated Transformer Language Model]]
- [[CommDevs24ManimMathAnim|Manim – Mathematical Animation Framework]]
# Raw Notes
- Intro
	- GPT: "Generative Pretrained Transformer"
	- Transformers
		- [00:00:47](https://www.youtube.com/watch?v=wjZofJX0v4M&t=48#t=47.53) audio --> text
		- [00:00:51](https://www.youtube.com/watch?v=wjZofJX0v4M&t=51#t=51.39) text --> speech audio
		- [00:00:59](https://www.youtube.com/watch?v=wjZofJX0v4M&t=59#t=59.01)  test --> image
		- [00:01:15](https://www.youtube.com/watch?v=wjZofJX0v4M&t=76#t=01:15.84) original transformer: [[Vaswani17AttentionAllYou|Attention is all you need]], 2017, google, for language translation
	- GPT (this kind of transformer)
		- [00:01:28](https://www.youtube.com/watch?v=wjZofJX0v4M&t=89#t=01:28.87) text + maybe other stuff
			-  --> next word
		- [00:01:42](https://www.youtube.com/watch?v=wjZofJX0v4M&t=102#t=01:42.41) really a prob dist. of next words
		- then append predicted text and run again
	- [00:02:37](https://www.youtube.com/watch?v=wjZofJX0v4M&t=158#t=02:37.66) GPT2 vs. GPT3 story: GPT3 much better
	- Tokens
		- [00:03:29](https://www.youtube.com/watch?v=wjZofJX0v4M&t=210#t=03:29.54) Tokens illustration
		- [00:03:46](https://www.youtube.com/watch?v=wjZofJX0v4M&t=227#t=03:46.84) Tokens --> vectors (embedding)
	- [00:04:01](https://www.youtube.com/watch?v=wjZofJX0v4M&t=241#t=04:01.02) to attention block
		- [00:04:15](https://www.youtube.com/watch?v=wjZofJX0v4M&t=256#t=04:15.64) figures what kind of meaning for "model" makes sense
- [ ] ? embedding does the same thing, I should note. How correct is this guy?
		- [00:04:14](https://www.youtube.com/watch?v=wjZofJX0v4M&t=255#t=04:14.92) meaning vectors are updated in each attention block
		- [00:03:56](https://www.youtube.com/watch?v=wjZofJX0v4M&t=236#t=03:56.05) meaning vector time matrix
	- [00:04:32](https://www.youtube.com/watch?v=wjZofJX0v4M&t=272#t=04:32.45) vectors next go through MLP (feedforward layer)
		- [00:04:39](https://www.youtube.com/watch?v=wjZofJX0v4M&t=280#t=04:39.87) **MLPs** **don't go across time**, are only for updating the weights for the same token at each step
			- [00:03:55](https://www.youtube.com/watch?v=wjZofJX0v4M&t=236#t=03:55.75) **attention block does go across time**
				- it's a dense matrix multiply of all embeddings x all embeddings
				- picks which tokens are relevant to updating other words.  Encodes some kinds of meaning for each token
			- MLP is small in drawing ([this](https://blog.gopenai.com/why-llms-are-just-a-big-classification-model-ed69387a9c8a) says 2-4 layers)
		- [00:04:51](https://www.youtube.com/watch?v=wjZofJX0v4M&t=292#t=04:51.58) like asking questions about the meaning of individual tokens e.g. "is it English?", "is it part of a bigger word?", ...
	- [00:05:02](https://www.youtube.com/watch?v=wjZofJX0v4M&t=303#t=05:02.61) lots of matrix multiplications (good graph for why TPU's, etc.)
	- [00:05:07](https://www.youtube.com/watch?v=wjZofJX0v4M&t=308#t=05:07.77) normalization skipped
	- [00:05:18](https://www.youtube.com/watch?v=wjZofJX0v4M&t=318#t=05:18.47) attention/MLP blocks alternate and repeat, 
	- [00:05:34](https://www.youtube.com/watch?v=wjZofJX0v4M&t=335#t=05:34.78) then predict word probs at end
		- GPT output layer softmax
		- [ ] Is the last vector in the same place as the last token?
			- or at the beginning, is there an extra token at the future position of the next word being predicted?
			- if so, for the "next word token", what is the input in the 1st layer?
		- Later, ([00:21:53](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1313#t=21:53.05)), it says that `Wu`'s size is "embedding dim" X "context length", which kinda implies that an extra vector isn't appended, and that the softmax input is literally the vector at the position of the last token in the input context.
	- [00:06:16](https://www.youtube.com/watch?v=wjZofJX0v4M&t=377#t=06:16.69) system prompt 
	- [00:06:16](https://www.youtube.com/watch?v=wjZofJX0v4M&t=377#t=06:16.87) user prompt
	- [00:08:59](https://www.youtube.com/watch?v=wjZofJX0v4M&t=539#t=08:59.08) GPT3 has 175B params 
	- [00:09:22](https://www.youtube.com/watch?v=wjZofJX0v4M&t=562#t=09:22.43) backpropagation
- Transformer Matrices (a.k.a. Attention blocks?) are Tensors
	- [00:09:53](https://www.youtube.com/watch?v=wjZofJX0v4M&t=594#t=09:53.59) inputs are always an array / vector of real numbers: a "**tensor**" (N-dimensional)
	- [00:10:05](https://www.youtube.com/watch?v=wjZofJX0v4M&t=606#t=10:05.78) transformed into more tensors by layers, *final tensor* is word prob dist for **next word**
	- [00:10:33](https://www.youtube.com/watch?v=wjZofJX0v4M&t=633#t=10:33.06) only process is weighted sums (actually + additions)
	- [00:11:15](https://www.youtube.com/watch?v=wjZofJX0v4M&t=676#t=11:15.93) GPT3 has 28K matrices
	- [00:11:15](https://www.youtube.com/watch?v=wjZofJX0v4M&t=675#t=11:15.17) matrices have 8 categories, which are
		1. embedding
		2. key
		3. query
		4. value
		5. output
		6. up-projection
		7. down-projection
		8. unembedding
- Embedding again
	- [00:12:36](https://www.youtube.com/watch?v=wjZofJX0v4M&t=756#t=12:36.45) tokenization: wants to pretend they're words
	- [00:13:04](https://www.youtube.com/watch?v=wjZofJX0v4M&t=785#t=13:04.98) embedding matrix: 1 column for each "word": weights begin random, and are trained
	- [00:13:55](https://www.youtube.com/watch?v=wjZofJX0v4M&t=836#t=13:55.87) 12.3K dims in GPT3 embed vector
	- [00:14:33](https://www.youtube.com/watch?v=wjZofJX0v4M&t=873#t=14:33.32) settles on embedding directions w/ semantic meaning
	- [00:14:54](https://www.youtube.com/watch?v=wjZofJX0v4M&t=895#t=14:54.81) his embedding graph caem from python library gensim
	- [00:15:01](https://www.youtube.com/watch?v=wjZofJX0v4M&t=902#t=15:01.88) difference between woman & man ~ diff between king and queen (almost, for real)
	- [00:15:42](https://www.youtube.com/watch?v=wjZofJX0v4M&t=943#t=15:42.84) family relations better
	- [00:15:49](https://www.youtube.com/watch?v=wjZofJX0v4M&t=950#t=15:49.61) seems to have found a direction for gender
	- [00:16:01](https://www.youtube.com/watch?v=wjZofJX0v4M&t=961#t=16:01.48) italy/germany, hitler/mussolini
	- [00:16:21](https://www.youtube.com/watch?v=wjZofJX0v4M&t=981#t=16:21.18) german/japan + sushi = bratwurst
	- [00:16:43](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1003#t=16:43.24) dot product measures vector alignment: pos when similar; 0 when perpendicular; neg when opposite
	- [00:17:13](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1033#t=17:13.27) also a plurality direction
	- [00:17:39](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1059#t=17:39.31) bigger #'s are bigger in "plural" direction
	- [00:18:01](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1082#t=18:01.55) GPT3 vocab: ~ 50.3 K tokens
	- [00:18:11](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1091#t=18:11.36) dimension 12.3K embedding dim
	- [00:18:32](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1113#t=18:32.51) vectors also encode token position, capacity to soak in context e.g. Shakeperian language, Scotland... (not just words): think about all you understand about a word e.g. the word "quill"
	- [00:19:25](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1165#t=19:25.08) first step of model: vectors in initial sequence are the vectors for the known words
	- [ ] ? Is there pre-embedding then, in the 1st step of GTP, or is the initial embedding just oneshot (3blue1brown shows floating point)
	- [00:19:46](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1187#t=19:46.80) each attention block seems to be one full embedding of all possible words for each context; 
	- alternation: the MLP; then another attention (embed) layer; then another MLP
	- [00:19:42](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1183#t=19:42.55) vectors evolve as meaning is refined
	- [00:19:56](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1197#t=19:56.74) GPT3: fixed context of 2048, so all attention layers are 2048 x embedding dimension (12K).  Always looks like this, as network model layers continue
	- [00:19:58](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1198#t=19:58.31) GPT context 2048: how many possible tokens
	- [00:20:07](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1207#t=20:07.28) in this video's matrix animations: *height* is embedding dimension, *width* is time (context).  So, the matrix represents one depiction of the total meaning of the sequence.
- Final layer: Softmax
	- [00:20:56](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1257#t=20:56.69) in the step before the final prediction of the next word, another matrix, the `unembedding matrix` , or `Wu` 
	- maps the last vector (the last "word" in the context) into an "embedding space" vector representation of the prediction of the next token in the sequence.  Then this is softmaxed, to get the word (token) probabilties.
	- [00:21:17](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1277#t=21:17.18) why only last embedding in context? 
		- **Reason**: During train, more efficient to make each vector full context, make a prediction about the next token (will be explained later)
	- [00:21:53](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1313#t=21:53.05) `Wu`'s size is "embedding dim" X "context length"
	- [00:22:30](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1350#t=22:30.13) **softmax** explained
	- [00:23:57](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1437#t=23:57.37) **temperature**, `T` explained: `T` is in the denominator of the exponent of softmax: if `T` is big the softmax probs are flatter (higher entropy).  **T=0 means all prob goes to max value** (goes w/ most predictable word (token)).  But UI limits T>0
		- [00:24:44](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1485#t=24:44.77) shows the effect of temp on story: T=0 (trite derivative of Goldilocks story); T=5 ==> nonsense story
	- [00:25:34](https://www.youtube.com/watch?v=wjZofJX0v4M&t=1535#t=25:34.85) the inputs to the softmax are **logits**.  So the weights in the attention vectors are logits






___
%% end Obsidian Notes %%



%% Import Date: 2024-04-07T16:11:19.927-07:00 %%
