---
category: literaturenote
tags: ml/genAI
citekey: Robinson24unstructDatPreprocLLM
status: unread
dateread: 
ZoteroTags: todo, obsLitNote
aliases:
  - Preprocessing Unstructured Data for LLM Applications
  - Preprocessing Unstructured Data for LLM
publisher: ""
citation key: Robinson24unstructDatPreprocLLM
DOI: ""
created date: 2024-04-14T08:19:53-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/RVE4RX3Q)   | [**URL**](https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/1/introduction)
>
> 
> **Abstract**
> Introduction · Overview of LLM Data Preprocessing · Normalizing the Content · Metadata Extraction and Chunking · Preprocessing PDFs and Images · Extracting Tables · Build Your Own RAG Bot · Conclusion · Appendix - Tips and Help
> 
> 
> **FirstAuthor**:: Robinson, Matt  
~    
> **Title**:: "Preprocessing Unstructured Data for LLM Applications"  
> **Date**:: 2024-04-01  
> **Citekey**:: Robinson24unstructDatPreprocLLM  
> **ZoteroItemKey**:: RVE4RX3Q  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/1/introduction  
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

> Robinson, Matt. “Preprocessing Unstructured Data for LLM Applications.” _DLAI - Learning Platform_, Apr. 2024, [https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/1/introduction](https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/1/introduction).
%% begin Obsidian Notes %%
___
Short course on converting many datatypes into vectors for LLM analysis, culminating in a demo RAG. It's very "what to type" oriented, and pretty good, runs the code in an IDE.  Some it is opensourced, some not (I think, so kind of a sales talk).  One of Andrew Ng's classes.  Doing the whole series probably worth it.

- [ ] # add a few notes on the sections below that I didn't add notes on before.

Related: [[Nassar22tableFormerStructTransfrmr|Tableformer: Table structure understanding with transformers]]
# Overview
# Introduction
# Overview of LLM
# Data Preprocessing
# Normalizing the Content
# Metadata Extraction and Chunking
# Preprocessing PDFs and Images

The hierarchy and metadata organization of PDFs and images isn't always tagged like it is, e.g. in html, but is arranged by *visual* appearance.  Therefore, extracting it is tricky.  But you need to do it in order to make a vector with the same logical structure e.g. JSON as other data types.

There are two main ways of extracting metadata from a pdf, **Document Layout Models**, which draw boxes around hierarchy elements like "title," and then extract the text within them, either buy just reading plain text, or by running OCR.  

The other method is yet another transformer*, a **Vision Transformer**, which goes straight from document to JSON in one step.  Don't ask me how!

- [ ] ? Seems like vision transformers are SOA, but expensive. **True**?

## Plusses and Minuses of Document Layout Models and Vision Transformers
From [here](https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/5/preprocessing-pdfs-and-images)

- Document Layout Models
	- Advantages
		- Have a fixed set of element types.
		- Get bounding box information
		- Fast, OK for simple pdfs
	- Disadvantages
		- Requires two model calls (the object detection and OCR models)
		- Less Flexible
- Vision Transformers
	- Advantages
		- More flexible for non-standard document types, like forms.
		- More adaptable to new ontologies.
	- Disadvantages
		- Model is generative, potentially prone to hallucination or repetition.
		- Computationally expensive (much more)
- # Extracting Tables
# Extracting Tables
From [here](https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/6/extracting-tables)

- html has table tags, but not pdf, images
- table transformers, vision transformers, OCR
	- [ ] picture/paper of table transformer vs. Vision Transformer
	- Table Transformer
		- recommends looking at [[Nassar22tableFormerStructTransfrmr|Tableformer: Table structure understanding with transformers]]
		- [ ] ? has bounding box info, better structure than vision transformer?  I think??
	- Vision Transformer
		- will output html, not json in this case.  Not sure if it really was json in [[#Preprocessing PDFs and Images]]
		- so lose bounding box info, etc.
	- OCR has same disadvantages as before
# Build Your Own RAG Bot
From [here](https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/7/build-your-own-rag-bot)

RAG demo w/ pdf, markdown and powerpoint: In the end, you can chat w/ docs.
- Extraction from each doc type
	- PDF: uses document layout detection model, for pdfs, not transformers
		- even then, it will "take a few minutes"
		- hacks around to get references from academic pdf
		- strips out detected headers, breaks up narrative structure of document
			- [ ] ? but earlier, didn't he search by header w/ some extra text from leading paragraphs glued on to them?
	- PPT: seems easier
	- MD: skipped over this?
- CHUNKING: does it for all doctypes by title w/ langchain (oneliner)
	- produces "elements"
	- [ ] ? by title?  says like in previous lesson, the glue on thing I was thinking about above?
- tweaks element metadata: removes languages; adds filename, for doc type searching later, but also, I suppose so can find the source of something
- EMBED w/ OpenAIEmbeddings()
- Puts them in a vector database (Chroma())
- Retreiver searches by similarity: gets 6 similar
- Set up prompt template: for LLM
- Asks questions of LLM, get answer from stored docs. Gets it right.
	- cites source of info!
- hybrid search: select only pdfs, then as a question from that collection of sources

# Conclusion
# Appendix - Tips and Help
___
%% end Obsidian Notes %%



%% Import Date: 2024-04-14T08:20:26.820-07:00 %%
