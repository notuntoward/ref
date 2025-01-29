---
category: literaturenote
tags:
  - ml/embed
  - ml/translation
  - ml/recommender
  - mi/imagesearch
  - ml/biometrics
  - ml/graphML
  - ml/anomaly
  - ml/genAI
citekey: Barnard23whatIsEmbeddingIBM
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - What is Embedding?
  - What is Embedding?
publisher: 
citation key: Barnard23whatIsEmbeddingIBM
DOI: ""
created date: 2024-04-08T16:58:35-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/5JXRETWJ)   | [**URL**](https://www.ibm.com/topics/embedding) | [[Barnard23whatIsEmbeddingIBM.pdf|PDF]]
>
> 
> **Abstract**
> Embedding is a means of representing text and other objects as points in a continuous vector space that are semantically meaningful to machine learning algorithms.
> 
> 
> **FirstAuthor**:: Barnard, Joel  
~    
> **Title**:: "What is Embedding?"  
> **Date**:: 2023-12-22  
> **Citekey**:: Barnard23whatIsEmbeddingIBM  
> **ZoteroItemKey**:: 5JXRETWJ  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://www.ibm.com/topics/embedding  
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

> Barnard, Joel. “What Is Embedding?” _IBM Think_, 22 Dec. 2023, [https://www.ibm.com/topics/embedding](https://www.ibm.com/topics/embedding).
%% begin Obsidian Notes %%
___

The main special purpose embeddings for tasks are word, many word, image, audio and graph, with multimodal variants. ^kt1abl

The descriptions of them and how they're used are pretty high level, so I left some questions in here.

# [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=480R|Word2Vec]]
- word2vec is a [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=483R|two-layer neural network]] (two *hidden* layers?)
- in [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=499R|three-dimensional space, synonyms cluster]]
- distance between words is [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=507R|dot product]] (also [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=524R|users and items.]])
# [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=518R|recommendation embedding]]
- represents [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=521R|users and items]]
- [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=524R|dot product]] of [[Barnard23whatIsEmbeddingIBM.pdf#page=3&annotation=538R|embedding vectors]] is the [[Barnard23whatIsEmbeddingIBM.pdf#page=4&annotation=541R|Recommendation Score]]
- row/col matrix of users & items: cell content is preference: [[Barnard23whatIsEmbeddingIBM.pdf#page=4&annotation=547R|ratings, clicks, purchases]]
- ? What is the input during training?  Seem clear that prediction target is a row of item preferences for each user
# [[Barnard23whatIsEmbeddingIBM.pdf#page=4&annotation=591R|Why use embedding]]
- semantic rep
	-  words, images, graph nodes
	- capture semantic relationships and similarities
- Dim reduction
	- computational efficiency
- Learn a "meaningful representation" for better generalization
- 2, 3D viz
- Efficient training
	- mapping categorical inputs to contin vectors improves backprop
	- e.g. opposite of one-hot for words (see below)

# [[Barnard23whatIsEmbeddingIBM.pdf#page=5&annotation=594R|What objects can be embedded?]]
## [words]([[Barnard23whatIsEmbeddingIBM.pdf#page=5&annotation=618R|Words]]) (single words)
- dense, small vector is *opposite of one-hot encoding*
- popular for words are
	- Word2Vec
	- GloVe
	- FastText
	- xt]](many, many words)
- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=624R|sentences, paragraphs or documents]]
- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=627R|sentiment analysis, text classification, machine translation, question answering and information retrieval]]
- Text models (massive training corpora)
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=630R|Doc2Vec]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=633R|USE]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=636R|BERT]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=639R|ELMO]]
[[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=642R|Images]]
- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=645R|capture visual features and semantic information about the content of image]]
- computer vision, image classification, object detection, ....
- Image modes (large-scale data)
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=651R|CNNs]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=648R|VGG]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=654R|ResNet]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=657R|GoogLeNet]]
	- [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=660R|EfficientNet]]
## [[Barnard23whatIsEmbeddingIBM.pdf#page=6&annotation=666R|Audio]] 
- RNNs and CNNs and their hybrids are common.
- speech recog, audio classif, music analysis
## [[Barnard23whatIsEmbeddingIBM.pdf#page=7&annotation=669R|Graphs]]
- node classification, link prediction, community detection.
- social network analysis, bio network, fraud det

# Applications
## [[Barnard23whatIsEmbeddingIBM.pdf#page=8&annotation=672R|Natural Language Processing (NLP)]]

Word embeddings are used for sentiment analysis, whic I suppose, could be an advanced "bag of words" type model, but now it's a continuous distribution in N-D space.  For question answering, BERT is better, but why isn't clear to me.  But Doc2Vec seems reasonable for text similarity -- a modern version of LSA, I guess.
## [[Barnard23whatIsEmbeddingIBM.pdf#page=8&annotation=675R|Computer vision]]

Classification: CNNs, mainly e.g. VGG or ResNet, with ending layer used as the embedding.  Use [[Barnard23whatIsEmbeddingIBM.pdf#page=9&annotation=678R|CLIP]] to retrieve images with natural language queries.  There's a special [[Barnard23whatIsEmbeddingIBM.pdf#page=9&annotation=681R|FaceNet]] embedding for faces.
## [[Barnard23whatIsEmbeddingIBM.pdf#page=9&annotation=684R|Recommender systems]]

User-item embeddings are sent to collaborative filtering (recommendation embedding, above?) or word-product embeddings can be used to select similar products based on *word similarity* in product descriptions (**interesting**)
## [[Barnard23whatIsEmbeddingIBM.pdf#page=9&annotation=687R|Cross-modal applications]]

[[Barnard23whatIsEmbeddingIBM.pdf#page=9&annotation=690R|MUSE]] embedding can help translate text, or connect text with images (does this mean same image mapped to from different languages, similar to how products are linked by description similarities in Recommender systems?).  
## [[Barnard23whatIsEmbeddingIBM.pdf#page=9&annotation=693R|Anomaly detection]]

Changes in graph embedding can indicate a network anomaly, or fraud.  
- [ ] ? The embedding isn't changing, right?  It's just unusual activity mapped to a rare spot in embedded space, right?

%% end Obsidian Notes %%



%% Import Date: 2024-04-08T16:58:41.690-07:00 %%
