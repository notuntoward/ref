---
category: literaturenote
tags:
  - ml/embed
  - ml/genAI
citekey: CognitiveCreator23word2VecNLPgtwy
status:
  - unread
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "Word2Vec: NLP’s Gateway to Word Embeddings"
  - "Word2Vec: NLP’s Gateway to Word"
publisher: ""
citation key: CognitiveCreator23word2VecNLPgtwy
DOI: ""
created date: 2024-04-09T10:13:01-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/MEB5TEZ2)   | [**URL**](https://cognitivecreator.medium.com/word2vec-nlps-gateway-to-word-embeddings-6256e6a61afe) | [[CognitiveCreator23word2VecNLPgtwy.pdf|PDF]]
>
> 
> **Abstract**
> Explore the world of Word2Vec and its significance in NLP
> 
> 
> **FirstAuthor**:: Cognitive Creator  
~    
> **Title**:: "Word2Vec: NLP’s Gateway to Word Embeddings"  
> **Date**:: 2023-11-04  
> **Citekey**:: CognitiveCreator23word2VecNLPgtwy  
> **ZoteroItemKey**:: MEB5TEZ2  
> **itemType**:: blogPost  
> **DOI**::   
> **URL**:: https://cognitivecreator.medium.com/word2vec-nlps-gateway-to-word-embeddings-6256e6a61afe  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
>**Related**:: 

> Cognitive Creator. “Word2Vec: NLP’s Gateway to Word Embeddings.” _Medium_, 4 Nov. 2023, [https://cognitivecreator.medium.com/word2vec-nlps-gateway-to-word-embeddings-6256e6a61afe](https://cognitivecreator.medium.com/word2vec-nlps-gateway-to-word-embeddings-6256e6a61afe).
%% begin Obsidian Notes %%
___

Sketchy but still informative details about word2vec works.  Messed up math hints that word2vec is an autoencoder w/ only a single layer (says 2 layers here). There's also **code**, so I could implement it myself, and try to figure out what's really happening...

For the CBOW variant, at least, the embedding is *linear* 

e(t) = E x one_hot(t)

where t is the word being predicted, and E is the weight matrix just before the only nonlinearity, f().  Softmax is applied after weighting by the matrix, W, and the prediction is probability distribution of possible words (prediction target is one_hot(t).  

I didn't bother going through the Skip-gram variant....

You'd probably want to use the CBOW (predicts target word) because it's computationally cheaper, and better on common words, while Skip-gram is worse on common words, and better on rare -- and cares about those?  

Skip-gram, as shown here, does not really seem to be used, as the [[CognitiveCreator23word2VecNLPgtwy.pdf#page=10&annotation=8187R|table]] says it's used with modifications.  Also, it's said to handle varying context window sizes.  Since contexts are just averaged one-hots of the words in the context window, I guess you'd avoid an *output* dimension mismatch during training -- but the same could be said about *input* dimension match on training.

- [ ] ? Why would skip-gram embedding handle variable length context windows but not CBOW?

See
- [[Barnard23whatIsEmbeddingIBM|What is Embedding?]] and others for embedding use cases.
- [[SwimmTeam24twordEmbed5TypNLPapp]] for more embedding types

___
%% end Obsidian Notes %%



%% Import Date: 2024-04-09T10:13:19.703-07:00 %%
