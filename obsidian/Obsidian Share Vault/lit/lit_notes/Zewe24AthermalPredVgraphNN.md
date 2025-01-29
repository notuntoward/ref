---
category: literaturenote
tags:
  - ml/forecast
  - graphNN
  - physAwareML
  - elecMktPriceFrcst
citekey: Zewe24AthermalPredVgraphNN
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - AI method radically speeds predictions of materials’ thermal properties
  - AI method radically speeds predictions
publisher: ""
citation key: Zewe24AthermalPredVgraphNN
DOI: ""
"created date:": 2024-07-21T11:04:37-07:00
"modified date:": 
created date: 2024-07-21T22:32:38-07:00
modified date: 2024-07-21T22:32:38-07:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/LYDGRJZD)   | [**URL**](https://news.mit.edu/2024/ai-method-radically-speeds-predictions-materials-thermal-properties-0716) | [[Zewe24AthermalPredVgraphNN.pdf|PDF]]
>
> 
> **Abstract**
> Researchers developed a machine-learning framework that can predict a key property of heat dispersion in materials that is up to 1,000 times faster than other AI methods, and could enable scientists to improve the efficiency of power generation systems and microelectronics.
> 
> 
> **FirstAuthor**:: Zewe, Adam  
~    
> **Title**:: "AI method radically speeds predictions of materials’ thermal properties"  
> **Date**:: 2024-07-16  
> **Citekey**:: Zewe24AthermalPredVgraphNN  
> **ZoteroItemKey**:: LYDGRJZD  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://news.mit.edu/2024/ai-method-radically-speeds-predictions-materials-thermal-properties-0716  
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

> Zewe, Adam. “AI Method Radically Speeds Predictions of Materials’ Thermal Properties.” _MIT News_, 16 July 2024, [https://news.mit.edu/2024/ai-method-radically-speeds-predictions-materials-thermal-properties-0716](https://news.mit.edu/2024/ai-method-radically-speeds-predictions-materials-thermal-properties-0716).
%% begin Obsidian Notes %%
___

Since GraphNNs are being used for power systems, could Virtual Graph NNs also be used.  [Original paper](Okabe24virtNodeGraphNNphonon) authors say that [[Zewe24AthermalPredVgraphNN.pdf#page=6&annotation=262R|virtual nodes are a very generic approach you could use to predict a lot of high- dimensional quantities]].  Something with transmission and local node pricing?  

GraphNNs predicting thermal properties have a high dimension problem, in that phones phonons move all over the place at different velocities and frequencies, and this, (I think) makes the GNN huge.  This new GNN with some [[Zewe24AthermalPredVgraphNN.pdf#page=4&annotation=236R|virtual nodes.]] Representing atoms and phonons with this [[Zewe24AthermalPredVgraphNN.pdf#page=4&annotation=239R|VGNN]], speeds up that calc (I think it's GNN) by 1000 times and 1 M X faster than non-AI approaches.
# Also
- [[Okabe24virtNodeGraphNNphonon|Virtual node graph neural network for full phonon prediction]]
- [[Nature24boostGraphNNvirtNode|Boosting graph neural networks with virtual nodes to predict phonon properties]]
___
%% end Obsidian Notes %%



%% Import Date: 2024-07-21T11:04:51.822-07:00 %%
