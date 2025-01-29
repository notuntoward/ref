---
category: literaturenote
tags:
  - ml/embed
  - survey
  - ml/genAI
citekey: SwimmTeam24twordEmbed5TypNLPapp
status:
  - read
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - 5 Types of Word Embeddings and Example NLP Applications
  - 5 Types of Word Embeddings
publisher: ""
citation key: SwimmTeam24twordEmbed5TypNLPapp
DOI: ""
created date: 2024-04-08T18:48:57-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/2ZB3IB57)   | [**URL**](https://swimm.io/learn/large-language-models/5-types-of-word-embeddings-and-example-nlp-applications) | [[SwimmTeam24twordEmbed5TypNLPapp.pdf|PDF]]
>
> 
> **Abstract**
> Word embeddings are a key concept in natural language processing (NLP), a field within machine learning.
> 
> 
> **FirstAuthor**:: Swimm  
~    
> **Title**:: "5 Types of Word Embeddings and Example NLP Applications"  
> **Date**:: Error: `format` can only be applied to dates. Tried for format object  
> **Citekey**:: SwimmTeam24twordEmbed5TypNLPapp  
> **ZoteroItemKey**:: 2ZB3IB57  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://swimm.io/learn/large-language-models/5-types-of-word-embeddings-and-example-nlp-applications  
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

> Swimm. _5 Types of Word Embeddings and Example NLP Applications_. [https://swimm.io/learn/large-language-models/5-types-of-word-embeddings-and-example-nlp-applications](https://swimm.io/learn/large-language-models/5-types-of-word-embeddings-and-example-nlp-applications). Accessed 8 Apr. 2024.
%% begin Obsidian Notes %%
___

Word embeddings, which capture semantic meaning beyond standard LSA, and are fundamentally dimension reduction techniques.  They're based on raw word(s) cooccurrence counts or on prediction of either the target word or the context a word is in.  They're used in a lot of applications, where they are a preprocessing step for further models (although it seems like sometimes,
[[Barnard23whatIsEmbeddingIBM#^bu3v3e|models totally engulf embedding?]]. 

Especially cool captures of semantic subtleties ^4sdsz1

1. FastText bag of word chunks: word morphology, pre/suf fixes ^38dggq
2. GloVe linear spaces: gender, verb tense, pluralization ^bj57up
3. 'iPhone' search can retrieve 'Apple', 'smartphone' and 'iOS' ^vi162l
4. 'Apple' within 'Apple Inc,' is not a fruit. ^zkngjc
# Word embeddings and transfer learning
- word embeddings enable [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=4&annotation=554R|transfer learning]], I suppose, something like taking the last layer of a ResNet and training a new model on your own images. ^c1154c
	- [ ] ? does a model simply take the embedded vectors as input features?
# Frequency vs. Prediction based

 [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=4&annotation=557R|Frequency-based embedding]] encodes words based on how often they occur, while [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=5&annotation=568R|Prediction-based embeddings]] learn to predict words from context.  Prediction based is more nuanced, and is what's used in modern NLP.[[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=5&annotation=568R|Prediction-based embeddings:]]
# Frequency Based Embedding
## [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=5&annotation=583R|Term Frequency-Inverse Document Frequency (TF-IDF)]]
The plain TF-IDF encoding, not the LSA part
## [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=6&annotation=586R|Co-occurrence Matrix]] 
Seems to be the raw input to the SVD in L
## [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=9&annotation=678R|GloVe (Global Vectors for Word Representation)]]

This was put under the "prediction" headline, but it's a [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=10&annotation=704R|count- based model]] -- *yet another screwup in these Swimm documents*
- make a matrix (word/context pair) counts *across the whole corpus*, not just a context
- factorize the matrix to lower dimension (says "least-squares," but really?  Maybe just "linear")
- captures "linear" vector space structures, corresponding to gender, verb tense, pluralization.
# Prediction Based Embedding
## [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=7&annotation=594R|Word2Vec (Skip-gram and Continuous Bag of Words)]]

Requires large dataset but "efficient to compute" (inference?).  Other disclarities in this section, too.  Anyway, <u>two types</u>:

- [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=7&annotation=597R|Skip-gram]]: predict context given word.  Good for rare words, as it's predicting a (more common?) context?  Good that output encoding is complex but has a lot of (similar) examples, while the input is simple and has few examples?  Not totally clear...
- [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=8&annotation=606R|Continuous Bag of Words (CBOW)]]: Better for common words because it "smooths over the entire context," and is faster to train(??).  Is it more accurate on common words, or does it speed up training?  Explanation is kinda gibberish.
# [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=8&annotation=628R|FastText]]

Pretty cool.  Word model is <u>whole word + a bag of character chunks</u> (says chunks are 'n-grams' but this is confused).  Benefits are:
- good for languages where single word has many forms (German!)
- understands prefixes and suffixes
- [ ] # but how would FastText chunk boundaries land on prefix/suffix boundaries?  Actually need linguistically meaningful chunks?
- untroubled by OOV words on test, can generate embeddings for them
- [ ] # Does FastText predict the target word, not the context?
# Embedding Applications

- [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=10&annotation=707R|Text Classication and Sentiment Analysis]]: embeddings as features fed to a sentiment classifier, I think
- [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=11&annotation=713R|Machine Translation]]: Learns the [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=12&annotation=726R|mapping between the vector spaces of two languages]].  Really?
- [ ] ? Do translators map one language's embedding to another language's embedding, or does it learn a single embedding for the pair?
# [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=12&annotation=729R|Information Retrieval and Search]]

Capture of semantic word relationships makes it possible to retrieve 'Apple', 'smartphone' and 'iOS' from the search term 'iPhone'.  Also helps w/ recommender systems, etc.
# [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=13&annotation=764R|Named Entity Recognition]]

Kind of a catchall... but [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=13&annotation=770R|named entities]] are organizations, quantities, codes, etc, and this matters for knowledge extraction and graph building, and semantic search.  

Cool: When you see 'Apple' within 'Apple Inc,' you know its not a fruit.

# Challenges and Limitations of Word Embedding
 - [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=16&annotation=817R|Polysemy]]: covered already
 - Computational load: [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=17&annotation=823R|subword embeddings,]] (e.g. FastText?) and dimensionality reduction help.  
 - Bias: besides training data selection, there are [[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=18&annotation=826R|techniques that can debias word embeddings after training]], but this is (clearly) not a done deal. ^3720c9
# Also has a good presentation graph:
![[SwimmTeam24twordEmbed5TypNLPapp.pdf#page=2&rect=182,232,431,481&color=note]]
___
%% end Obsidian Notes %%



%% Import Date: 2024-04-08T18:50:01.935-07:00 %%
