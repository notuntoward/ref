---
category: literaturenote
tags:
  - ml/genAI
citekey: Nassar22tableFormerStructTransfrmr
status:
  - ?read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "Tableformer: Table structure understanding with transformers"
  - "Tableformer: Table structure understanding with"
publisher: ""
citation key: Nassar22tableFormerStructTransfrmr
DOI: ""
created date: 2024-04-14T09:30:10-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/6RTJ34YK)   | [**URL**](http://openaccess.thecvf.com/content/CVPR2022/html/Nassar_TableFormer_Table_Structure_Understanding_With_Transformers_CVPR_2022_paper.html) | [[Nassar22tableFormerStructTransfrmr.pdf|PDF]]
>
> 
> 
> **FirstAuthor**:: Nassar, Ahmed  
> **Author**:: Livathinos, Nikolaos  
> **Author**:: Lysak, Maksym  
> **Author**:: Staar, Peter  
~    
> **Title**:: "Tableformer: Table structure understanding with transformers"  
> **Date**:: 2022-01-01  
> **Citekey**:: Nassar22tableFormerStructTransfrmr  
> **ZoteroItemKey**:: 6RTJ34YK  
> **itemType**:: conferencePaper  
> **DOI**::   
> **URL**:: http://openaccess.thecvf.com/content/CVPR2022/html/Nassar_TableFormer_Table_Structure_Understanding_With_Transformers_CVPR_2022_paper.html  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**:: 4614–4623  
> **ISBN**::   
> **ZoteroTags**:: obsLitNote
>**Related**:: 

> Nassar, Ahmed, et al. “Tableformer: Table Structure Understanding with Transformers.” _Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition_, 2022, pp. 4614–23. _Google Scholar_, [http://openaccess.thecvf.com/content/CVPR2022/html/Nassar_TableFormer_Table_Structure_Understanding_With_Transformers_CVPR_2022_paper.html](http://openaccess.thecvf.com/content/CVPR2022/html/Nassar_TableFormer_Table_Structure_Understanding_With_Transformers_CVPR_2022_paper.html).
%% begin Obsidian Notes %%

___
A multi-head transformer for recognizing tables in documents.  With my limited understanding on 4/19/24, there seems to be two types of encoding: one by the leading layers of a ResNet CNN, working on images of snipped tables detected in a document; the other which encodes tokenized html tags found in the doc (I think).  During test, it appears that only the doc images is the only input, and that it is decoded into bounding boxes for each table cell, and the corresponding structure tags, which map cell content to the table.

This will take more deep reading to really understand.

Related: [[Robinson24unstructDatPreprocLLM|Preprocessing Unstructured Data for LLM Applications]]

___
%% end Obsidian Notes %%



%% Import Date: 2024-04-14T09:30:24.687-07:00 %%
