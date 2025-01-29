---
category: literaturenote
tags:
  - ml/embed
  - ml/dimred
  - ml/transformer
  - ml/genAI
citekey: SwimmTeam24embedInML
status:
  - read
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - "Embeddings in Machine Learning: Types, Models & Best Practices"
  - "Embeddings in Machine Learning: Types,"
publisher: ""
citation key: SwimmTeam24embedInML
DOI: ""
created date: 2024-04-08T11:41:41-07:00
modified date: 2024-12-17T08:51:31-08:00
---



> [!info]- : [**Zotero**](zotero://select/library/items/QUR9L5UW)   | [**URL**](https://swimm.io/learn/large-language-models/embeddings-in-machine-learning-types-models-and-best-practices) | [[SwimmTeam24embedInML.html|HTM]]
>
> 
> **Abstract**
> Embeddings are a type of feature learning technique where high-dimensional data is converted into low-dimensional vectors while preserving the relevant information.
> 
> 
> **FirstAuthor**:: SwimmTeam  
~    
> **Title**:: "Embeddings in Machine Learning: Types, Models & Best Practices"  
> **Date**:: 2024-01-01  
> **Citekey**:: SwimmTeam24embedInML  
> **ZoteroItemKey**:: QUR9L5UW  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://swimm.io/learn/large-language-models/embeddings-in-machine-learning-types-models-and-best-practices  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: todo, obsLitNote
>**Related**:: 

> SwimmTeam. “Embeddings in Machine Learning: Types, Models & Best Practices.” _Swimm_, 2024, [https://swimm.io/learn/large-language-models/embeddings-in-machine-learning-types-models-and-best-practices](https://swimm.io/learn/large-language-models/embeddings-in-machine-learning-types-models-and-best-practices).
%% begin Obsidian Notes %%
___

Embedding is a way to express how "close" words, documents, images, nodes in a graph are, where "close" can be in meaning, appearance, correlation, link distance (I think), and so on.  It can also be across different modalities e.g. text and image.  Usually this closeness is multidimensional, and often it's of lower dimension than in the original space.  The goal is to

> ... represent data in a form that both machines can understand and that retains semantic meaning ... 

# Basic Embedding
## PCA
Note and embedding by itself, but it does go to low dim space.  Can somehow be used to "create" embeddings
## SVD
It really is, as LSA uses SVD, and that's a lower dim way of comparing text documents.
## Word2Vec
This most popular word embedder was invented by Google, but Zak S says that it's out-of-date now.  A semantic and syntactic word association is learned via a shallow NN.  They don't say how.  

**Use this example in genAI talk** 
> ‘king’ minus the word embedding for ‘man’ is approximately equal to the word embedding for ‘queen’ minus the word embedding for ‘woman’.
 ^0dde8e

- [ ] ? is the NN an autoencoder?

The inputs & outputs are target words and contexts:

| Model         | input   | output  |     |
| ------------- | ------- | ------- | --- |
| **CBOW**      | context | word    |     |
| **Skip-gram** | word    | context |     |
### Word2Vec Weaknesses
- word morphology ignored e.g. "unreadable" and "readable" are identical in one morphological unit: "read" (unit: the smallest unit of meaning in a word)
- out of vocabulary words
- polysemy (multiple meanings)
# Embedding & Transformers

Transformer self-attention uses embeddings to weigh "importance" of input sequence parts relative to each other.  Apparently, bare (my word) transformers can't recognize sequences, unlike RNNs and LSTMs.

Embeds allow transformers to preserve sequence order and temporal relationships.
- [ ] ? Is there such a thing as a bare transformer?  What is importance vs. temporal order?

BERT is an advancement on older transformers (I think), that considers "context from all sides?"
GPT-3 also considers broader contexts, is more nuanced
- [ ] ? meaning "input" *and* "output"?

GPT-4 and PaLM 2: understands cross-modality
- [ ] ? were there cross-modality models b/f these two?  
- [ ] ? is stable diffusion (words and text) a cross-modality model?
# Preproc
Cleaning, removing stopwords & punctuation etc., improve the attention of simpler models, but BERT sand GPT don't require much of this cleanup.
# Training Hyperparams
For each task, you need to pick the appropriate
- model
- dimension
- context window size
- learning rate
- etc., I'm sure
# Pre-trained Models
Avoid the messiness and massive data requirements by using a pre-trained model e.g. BERT or GPT.  You can "fine-tune" this for your task.
- [ ] ? what does "fine-tune" mean?  All params, or just for a small subset of layers?
# Bias / Ethics
Learns them from the data you give it.  Solutions
- adjust embeddings w/ debiasing
- [ ] ? how is bias or fairness measured?
- monitor models with "fairness metrics"
- [x] ? are bias or fairness metrics a cost function that's weighted against prediction error during training? Or is it some kind of post-processing?
	- Answer: it's post-processing: ![[SwimmTeam24twordEmbed5TypNLPapp#^3720c9]]

# In operation...
Need to monitor and usually periodically retrain.

# Downstream models
... must be compatible w/ embeddings e.g. fixed-input-len models don't quite work w/ variable len embeddings.
- hacks are embedding padding and truncation
- [ ] ? But didn't Gemini or something tell me that LLMs have some way of doing their own dimension bendng of the inputs?



___
%% end Obsidian Notes %%



%% Import Date: 2024-04-08T11:44:13.681-07:00 %%
