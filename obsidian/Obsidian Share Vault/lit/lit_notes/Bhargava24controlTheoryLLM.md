---
category: literaturenote
tags:
  - ml/genAI
citekey: Bhargava24controlTheoryLLM
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "LLM Control Theory: What's the magic word?  A Control Theory of LLM Prompting"
  - "LLM Control Theory: What's the"
publisher: ""
citation key: Bhargava24controlTheoryLLM
DOI: ""
created date: 2024-04-23T17:58:08-07:00
modified date: 2024-12-17T08:51:31-08:00
---
read
> [!info]- : [**Zotero**](zotero://select/library/items/QEQCIBUT)   | [**URL**](https://www.youtube.com/watch?v=9QtS9sVBFM0)
>
> 
> **Abstract**
> Stay tuned for our new results in our preprint, "What’s the Magic Word? A Control Theory of LLM Prompting": https://arxiv.org/abs/2310.04444  Thank you to the Information, Geometry, and Physics Seminar run by Juan Pablo Vigneaux for the opportunity to present our work. For a full reference list, see our preprint.  0:00 Introduction  1:51 1: MOTIVATIONS 1:55 Zero-shot learning miracle (Motivations) 3:28 Background on LLMs? (Motivations)   4:22 Transformer Information Flow for Generative Inference (Motivations)  6:03 LLMs are increasingly used as systems (Motivations) 6:42 We do not understand LLMs as systems (Motivations)  9:23 Control theory is great for understanding systems (Motivations)  11:36 Prompt engineering = system control problem (Motivations)  14:12 LLM systems get complicated fast (Motivations)  15:16 Plan for LLM Control Theory (Motivations)   16:58 2: FRAMEWORK 17:01 LLM systems are unusual (Framework)  18:44 LLM system formalization (Framework) 21:43 Reachability (Framework) 23:43 Reachable Sets (Framework)  25:11 k-epsilon Controllability (Framework)   27:29 3: SELF-ATTENTION CONTROLLABILITY THEOREM 27:40 Background on self attention (Theorem) 31:23 Controllability for self-attention (Theorem)  32:20 Theorem (Theorem) 40:23 Connecting self-attention theorem with empirical results (Theorem)   41:13 EXPERIMENTAL RESULTS ON LLM CONTROLLABILITY 41:24 Measuring k-epsilon controllability via prompt optimization (Experiments) 42:58 Experimental design for k-epsilon controllability measurement (Experiments) 45:15 Results on k-epsilon controllability (Experiments)  48:36 OPEN QUESTIONS IN LLM CONTROL THEORY 49:57 Typical sequences, AEP  50:58 More next steps   52:21 Acknowledgements
> 
> 
> **FirstDirector**:: Bhargava, Aman  
> **Director**:: Looi, Shi-Zhuo  
~    
> **Title**:: "LLM Control Theory: What's the magic word?  A Control Theory of LLM Prompting"  
> **Date**:: 2024-04-17  
> **Citekey**:: Bhargava24controlTheoryLLM  
> **ZoteroItemKey**:: QEQCIBUT  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=9QtS9sVBFM0  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**:: Caltech   
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
> **Related**:: 

> _LLM Control Theory: What’s the Magic Word?  A Control Theory of LLM Prompting_. Directed by Aman Bhargava and Shi-Zhuo Looi, 2024. _YouTube_, [https://www.youtube.com/watch?v=9QtS9sVBFM0](https://www.youtube.com/watch?v=9QtS9sVBFM0).
%% begin Obsidian Notes %%
___
 
 LLM considered as a control system, with context, x0 considered as state, prompt, u, as control input, and the LLM's next token prediction, y, as the control target.  Following a quick LLM tutorial, the LLM operations are transformed into linear algebra (I didn't quite get how the MLP did that), and then a classic observability / controllability space analysis is done.  That's used to derive and equation for the space of outputs that are possible with some probability given a number of control tokens.  The upper on the reachable set of outputs is a function of the singular value of the matrices (somewhat related: [[Cahyawijaya24humanValuesVecLLM]])

After that, it's all empirical, with experiments on how many tokens it takes to force some target, y*, given wikipedia sequences of varying lengths, as context, x0.  Empirical prediction error curves vs. prompt length are computed, showing the number of tokens required for a given error in 3 prediction problems.

No surprise that a long context makes the LLM less controllable, and a surprise is that some very short prompts can have a big corrective effect e.g. negation.  I guess that had been seen before, somewhere.

It's not clear to me if theory matches these empirical results.  I didn't hear that claim.
 
Also **good slides** the could be used in a breezy intro to LLMs

# Video Notes

###### 0:00 Introduction

##### 1:51 1: MOTIVATIONS

##### 1:55 Zero-shot learning miracle (Motivations)

- [00:01:55](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=115#t=01:55.30) zero shot learning miracle
	- can answer w/ no training on the Q you're asking
		- knowledge retrieval
		- Reasoning
		- sentiment analysis (just a prompt)
	- how prompts affect answer not intuitive
##### 3:28 Background on LLMs? (Motivations)  

- [[lit/lit_notes/attachments/6a5fb9004f59e2c58bcfd4ebdced1283_MD5.webp|Open: LLM Control Theory Seminar (April 2024)PT3M44.836S.webp]]
![[lit/lit_notes/attachments/6a5fb9004f59e2c58bcfd4ebdced1283_MD5.webp|LLM Control Theory Seminar (April 2024) - 00:03:44|50]] [00:03:44](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=225#t=03:44.84) 
- then solves for the params that give the max likelihood over the training data (a big portion of the internet)
- [[lit/lit_notes/attachments/cd8273beaa721c5494d8686aae2df995_MD5.webp|Open: LLM Control Theory Seminar (April 2024)PT4M25.667S.webp]]
![[lit/lit_notes/attachments/cd8273beaa721c5494d8686aae2df995_MD5.webp|LLM Control Theory Seminar (April 2024) - 00:04:25|50]] [00:04:25](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=266#t=04:25.67)  transformer blocks and dataflow
- this blue rectangles are the block layers (linear part + MLP?).  Vertical direction is transformer layer (l1, l2, l3); horizontal is time, or sequence index.
- gray arrows are info transfer, always forward in time, and drawn going forward more than one layer (I thought they only went to the next layer)
- layer output is the prob of the next token, given the previous token (P(x[m] | x[0:m-1]))
	- it's conditional only on the previous tokens
	- allows you to optimize all probs @ same time (good throughput)
- predictions (read arrows) are pasted on the end of context window, and are given (apparently) the most probable next word.
- [x] does it pick the most probable word, or does it drawn from that distribution?
	- if so, is that where the temperature ("creativity") param modifies the next word predicted distribution?
	- Answer: **yes**.  He later starts out with "zero temp. sampling," which is max likelihood choice
##### 4:22 Transformer Information Flow for Generative Inference (Motivations)

##### 6:03 LLMs are increasingly used as systems (Motivations)

- [[lit/lit_notes/attachments/3cf01fdd541cf345df0ac16529e25c0e_MD5.webp|Open: LLM Control Theory Seminar (April 2024)PT6M31.544S.webp]]
![[lit/lit_notes/attachments/3cf01fdd541cf345df0ac16529e25c0e_MD5.webp|LLM Control Theory Seminar (April 2024) - 00:06:31|50]] [00:06:31](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=392#t=06:31.54) 
##### 6:42 We do not understand LLMs as systems (Motivations)
- control interp
	- u=prompt
	- x0 =  state
	- y = prediction
- How many tokens do you need to deviate behavior of language model to give you what you want @ output
- later, he finds that weird random strings in prompt can do the job
##### 9:23 Control theory is great for understanding systems (Motivations)

- [00:09:59](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=599#t=09:59.46) analogy of car/gas/pedal speed output control system
	- time response by system poles
	- position of poles imply behavior
	- [00:11:05](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=665#t=11:05.11) Kalman analysis IDs controllable/uncontrollable spaces and tests for controllability
- [00:12:21](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=742#t=12:21.73) chatGPT system prompt is a state; what you type is the control input
- [00:14:26](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=867#t=14:26.97) : LLMs getting really complicated: agents, etc. yet feed forward response is not understood
##### 11:36 Prompt engineering = system control problem (Motivations)

##### 14:12 LLM systems get complicated fast (Motivations)

##### 15:16 Plan for LLM Control Theory (Motivations)

##### 16:58 2: FRAMEWORK

- [[lit/lit_notes/attachments/fbca2d63df435570996514ee205c06a1_MD5.webp|Open: LLM Control Theory Seminar (April 2024)PT17M13.138S.webp]]
![[lit/lit_notes/attachments/fbca2d63df435570996514ee205c06a1_MD5.webp|LLM Control Theory Seminar (April 2024) - 00:17:13|50]] [00:17:13](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1033#t=17:13.14) 
- [00:17:23](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1043#t=17:23.40) unusualness of LLMS
- discrete state and time (tokens)
- shift-and-grow state dynamics
- "mutual exclusion on input" (?).  state is written to one token at a time
- in diagram: h is the readout map, gets the most recent r tokents
- [00:20:03](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1204#t=20:03.80) Forward picture
- zoreo temp sampling: so always pick max likelihood, but can expand to non-deterministic
##### 17:01 LLM systems are unusual (Framework)

##### 18:44 LLM system formalization (Framework)

##### 21:43 Reachability (Framework)

- [00:21:54](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1315#t=21:54.93) u* 
##### 23:43 Reachable Sets (Framework)

- [00:24:04](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1444#t=24:04.02) interested in set of all y's given x0. given control length < k
##### 25:11 k-epsilon Controllability (Framework)

- [00:25:42](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1543#t=25:43.00) what fraction of outputs can be reached given some length u
- express this as prob of some desired output being unreachable < epsilon
##### 27:29 3: SELF-ATTENTION CONTROLLABILITY THEOREM
- self-attention is main way info is transmitted between token representations (a small amount transferred by normalization too)
- [00:28:24](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1704#t=28:24.08) it's a weird all-to-all: every output is some function of every input (so how come is prob labels are shown as Markov??)
##### 27:40 Background on self attention (Theorem)

- [00:29:01](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1741#t=29:01.13) attention matrix
- [00:29:53](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1794#t=29:53.63) self-attention is function of token reps
	- a bunch of matrix multiplies fed into a softmax
##### 31:23 Controllability for self-attention (Theorem)

- [00:30:38](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1838#t=30:38.15) softmax turned into matrix multiplication
- [ ] Understand how a normalized exponential of a sum can be turned into this kind of matrix? ^0cf5dc
	- answer in [[3Blue1Brown24visAttenTransfrmr|Visualizing Attention, a Transformer's Heart]] ? 
- [ ] Are all transformer MLP block parts really just matrix mult --> softmax --> matrix mult?
##### 32:20 Theorem (Theorem)

- [00:32:58](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=1978#t=32:58.44) partition y into sum of vector related to u and one to x (I think)
- want y*, and have y = yx + yu
- [00:33:45](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2025#t=33:45.47) control goal: U s.t. y=y*
- [00:34:21](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2062#t=34:21.81) shows that some terms must cancel to do this
- [00:35:56](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2157#t=35:56.80) controllability theorem: can't get to y* if some equ. is true
- [00:36:55](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2216#t=36:55.50) yx only scaled by u
- [00:38:04](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2284#t=38:04) audience guy confuses discrete tokens w/ continuous embeddings.  Bhargava aside: sometimes do something other than embedding tokens.  Instead tune model with learned [[Toloka23optTechniqueLLM|soft prompts]] (
  "optimize more easily")
- [00:40:47](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2447#t=40:47.13) layernorm bounds u and x; regularization bounds weight matrices

##### 40:23 Connecting self-attention theorem with empirical results (Theorem)

##### 41:13 EXPERIMENTAL RESULTS ON LLM CONTROLLABILITY

##### 41:24 Measuring k-epsilon controllability via prompt optimization (Experiments)
- [00:41:18](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2479#t=41:18.96) **RESULTS**
	- lower bound on k-eps controllability
- [00:42:48](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2569#t=42:48.51) can say that w/ at most k tokens, some y is reachable w/ some prob
- [00:43:10](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2591#t=43:10.99) Wikitext
	- x0: wikipedia sequences (8-32 tokens). 
	- Task: predict next token targets in 3 tests:
		- D1: true next token
		- D2: top 75 next tokens after x0
			- idea is to manipulate so 75th most likely token becomes the most likely
		- D3: next token is random from 
	- Prompt search
		- Greedy search: exhaustive search (up to 3 or 4 tokens)
		- Greedy coordinate search
	- 
- [00:45:31](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2731#t=45:31.31) D1: >= 97% prob of correct w/ k <= 10 tokens ==k>10 ?==
- [00:46:04](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2765#t=46:04.79) D2: 89% w/ k<=10
	- longer sequences are harder to control (need longer prompt)
- [00:46:56](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2816#t=46:56.40) D3: 46% for k<=10
	- surprise: really short prompts sometimes could move least likely output the most likely output.  Like "negation" can greatly effect meaning of sentence. Found elsewhere: two token prompts were enough to improve a math LLM

##### 42:58 Experimental design for k-epsilon controllability measurement (Experiments)

##### 45:15 Results on k-epsilon controllability (Experiments)

##### 48:36 OPEN QUESTIONS IN LLM CONTROL THEORY
- Open Questions
- [00:48:38](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2919#t=48:38.73) Distributional control: distribution of next token instead of hard maxlik, like they did in this talk.  **AWS paper** seems related
##### 49:57 Typical sequences, AEP

- [00:49:38](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=2979#t=49:38.62) Info theory equipartition... formalize the "tiny fraction" of possible sequences that actually occur. 
- [00:52:09](https://www.youtube.com/watch?v=9QtS9sVBFM0&t=3129#t=52:09.35) find representations of high level emotional characteristics in activation space.  Control them w/ prompts?  Related: [[Cahyawijaya24humanValuesVecLLM]]

##### 50:58 More next steps

##### 52:21 Acknowledgements


# Seminar announcement

**Toward a Control Theory of LLMs**

Aman Bhargavahttps://aman-bhargava.com/, Computation and Neural Systems, Caltech and Shi-Zhuo Looihttps://scholar.google.com/citations?user=gzG4qoIAAAAJ&hl=en, Department of Mathematics, Caltech

Prompt engineering is crucial for deploying LLMs but is poorly understood mathematically. We formalize LLM systems as a class of discrete stochastic dynamical systems to explore prompt engineering through the lens of control theory. We investigate the reachable set of output token sequences \mathcal R_y(\mathbf x_0) for which there exists a control input sequence \mathbf u for each \mathbf y \in \mathcal R_y(\mathbf x_0) that steers the LLM to output \mathbf y from initial state sequence \mathbf x_0. We offer analytic analysis on the limitations on the controllability of self-attention in terms of reachable set, where we prove an ==upper bound== on the reachable set of outputs \mathcal R_y(\mathbf x_0) as a ==function of the singular values of the parameter matrices==. We present complementary empirical analysis on the controllability of a panel of LLMs, including Falcon-7b, Llama-7b, and Falcon-40b. Our results demonstrate a lower bound on the reachable set of outputs \mathcal R_y(\mathbf x_0) w.r.t. initial state sequences \mathbf x_0 sampled from the Wikitext dataset. We find that the correct next Wikitext token following sequence \mathbf x_0 is reachable over 97\% of the time with prompts of k\leq 10 tokens. We also establish that the top 75 most likely next tokens, as estimated by the LLM itself, are reachable at least 85\% of the time with prompts of k\leq 10 tokens. Intriguingly, short prompt sequences can dramatically alter the likelihood of specific outputs, even making the least likely tokens become the most likely ones. This control-centric analysis of LLMs demonstrates the significant and poorly understood role of input sequences in steering output probabilities, offering a foundational perspective for enhancing language model system capabilities.

# Video Notes from YouTube Page

Stay tuned for our new results in our preprint, "What’s the Magic Word? A Control Theory of LLM Prompting": https://arxiv.org/abs/2310.04444

Thank you to the Information, Geometry, and Physics Seminar run by Juan Pablo Vigneaux for the opportunity to present our work. For a full reference list, see our preprint.

0:00 Introduction
1:51 1: MOTIVATIONS
1:55 Zero-shot learning miracle (Motivations)
3:28 Background on LLMs? (Motivations)  
4:22 Transformer Information Flow for Generative Inference (Motivations)
6:03 LLMs are increasingly used as systems (Motivations)
6:42 We do not understand LLMs as systems (Motivations)
9:23 Control theory is great for understanding systems (Motivations)
11:36 Prompt engineering = system control problem (Motivations)
14:12 LLM systems get complicated fast (Motivations)
15:16 Plan for LLM Control Theory (Motivations)
16:58 2: FRAMEWORK
17:01 LLM systems are unusual (Framework)
18:44 LLM system formalization (Framework)
21:43 Reachability (Framework)
23:43 Reachable Sets (Framework)
25:11 k-epsilon Controllability (Framework)
27:29 3: SELF-ATTENTION CONTROLLABILITY THEOREM
27:40 Background on self attention (Theorem)
31:23 Controllability for self-attention (Theorem)
32:20 Theorem (Theorem)
40:23 Connecting self-attention theorem with empirical results (Theorem)
41:13 EXPERIMENTAL RESULTS ON LLM CONTROLLABILITY
41:24 Measuring k-epsilon controllability via prompt optimization (Experiments)
42:58 Experimental design for k-epsilon controllability measurement (Experiments)
45:15 Results on k-epsilon controllability (Experiments)
48:36 OPEN QUESTIONS IN LLM CONTROL THEORY
49:57 Typical sequences, AEP
50:58 More next steps
52:21 Acknowledgements

___
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Bhargava24controlTheoryLLM
> 
> Prompts analyzed a inputs to a control system trying to get a certain results.  Also **good slides** for a breezy intro to LLMs
> 
> **TODO**: watch, get screenshots of good ideas.  Also learn something!
> 
> ### Seminar announcment
> 
> **Toward a Control Theory of LLMs**
> 
> [Aman Bhargava](https://aman-bhargava.com/), Computation and Neural Systems, Caltech and [Shi-Zhuo Looi](https://scholar.google.com/citations?user=gzG4qoIAAAAJ&hl=en), Department of Mathematics, Caltech
> 
> Prompt engineering is crucial for deploying LLMs but is poorly understood mathematically. We formalize LLM systems as a class of discrete stochastic dynamical systems to explore prompt engineering through the lens of control theory. We investigate the reachable set of output token sequences $\mathcal R_y(\mathbf x_0)$ for which there exists a control input sequence $\mathbf u$ for each $\mathbf y \in \mathcal R_y(\mathbf x_0)$ that steers the LLM to output $\mathbf y$ from initial state sequence $\mathbf x_0$. We offer analytic analysis on the limitations on the controllability of self-attention in terms of reachable set, where we prove an upper bound on the reachable set of outputs $\mathcal R_y(\mathbf x_0)$ as a function of the singular values of the parameter matrices. We present complementary empirical analysis on the controllability of a panel of LLMs, including Falcon-7b, Llama-7b, and Falcon-40b. Our results demonstrate a lower bound on the reachable set of outputs $\mathcal R_y(\mathbf x_0)$ w.r.t. initial state sequences $\mathbf x_0$ sampled from the Wikitext dataset. We find that the correct next Wikitext token following sequence $\mathbf x_0$ is reachable over 97\% of the time with prompts of $k\leq 10$ tokens. We also establish that the top 75 most likely next tokens, as estimated by the LLM itself, are reachable at least 85\% of the time with prompts of $k\leq 10$ tokens. Intriguingly, short prompt sequences can dramatically alter the likelihood of specific outputs, even making the least likely tokens become the most likely ones. This control-centric analysis of LLMs demonstrates the significant and poorly understood role of input sequences in steering output probabilities, offering a foundational perspective for enhancing language model system capabilities.
> 
> ### Youtube video Notes
> 
> Stay tuned for our new results in our preprint, "What’s the Magic Word? A Control Theory of LLM Prompting": https://arxiv.org/abs/2310.04444
> 
> Thank you to the Information, Geometry, and Physics Seminar run by Juan Pablo Vigneaux for the opportunity to present our work. For a full reference list, see our preprint.
> 
> 0:00 Introduction
> 
> 1:51 1: MOTIVATIONS
> 
> 1:55 Zero-shot learning miracle (Motivations)
> 
> 3:28 Background on LLMs? (Motivations)  
> 
> 4:22 Transformer Information Flow for Generative Inference (Motivations)
> 
> 6:03 LLMs are increasingly used as systems (Motivations)
> 
> 6:42 We do not understand LLMs as systems (Motivations)
> 
> 9:23 Control theory is great for understanding systems (Motivations)
> 
> 11:36 Prompt engineering = system control problem (Motivations)
> 
> 14:12 LLM systems get complicated fast (Motivations)
> 
> 15:16 Plan for LLM Control Theory (Motivations)
> 
> 16:58 2: FRAMEWORK
> 
> 17:01 LLM systems are unusual (Framework)
> 
> 18:44 LLM system formalization (Framework)
> 
> 21:43 Reachability (Framework)
> 
> 23:43 Reachable Sets (Framework)
> 
> 25:11 k-epsilon Controllability (Framework)
> 
> 27:29 3: SELF-ATTENTION CONTROLLABILITY THEOREM
> 
> 27:40 Background on self attention (Theorem)
> 
> 31:23 Controllability for self-attention (Theorem)
> 
> 32:20 Theorem (Theorem)
> 
> 40:23 Connecting self-attention theorem with empirical results (Theorem)
> 
> 41:13 EXPERIMENTAL RESULTS ON LLM CONTROLLABILITY
> 
> 41:24 Measuring k-epsilon controllability via prompt optimization (Experiments)
> 
> 42:58 Experimental design for k-epsilon controllability measurement (Experiments)
> 
> 45:15 Results on k-epsilon controllability (Experiments)
> 
> 48:36 OPEN QUESTIONS IN LLM CONTROL THEORY
> 
> 49:57 Typical sequences, AEP
> 
> 50:58 More next steps
> 
> 52:21 Acknowledgements
> 
> <small>📝️ (modified: 2024-04-22) [link](zotero://select/library/items/L96DRXVR) - [web](http://zotero.org/users/60638/items/L96DRXVR)</small>
>  
> ---




%% Import Date: 2024-04-23T17:58:30.004-07:00 %%
