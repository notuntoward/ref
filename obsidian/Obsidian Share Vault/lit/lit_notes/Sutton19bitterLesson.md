---
category: literaturenote
tags:
  - ml/genAI
citekey: Sutton19bitterLesson
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - The Bitter Lesson
  - The Bitter Lesson
publisher: ""
citation key: Sutton19bitterLesson
DOI: ""
created date: 2024-05-04T12:33:25-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/VE3PHTCR)   | [**URL**](http://www.incompleteideas.net/IncIdeas/BitterLesson.html) | [[Sutton19BitterLesson.pdf|PDF]]
>
> 
> **Abstract**
> The biggest lesson that can be read from 70 years of AI research is that general methods that leverage computation are ultimately the most effective, and by a large margin. The ultimate reason for this is Moore's law, or rather its generalization of continued exponentially falling cost per unit of computation. Most AI research has been conducted as if the computation available to the agent were constant (in which case leveraging human knowledge would be one of the only ways to improve performance) but, over a slightly longer time than a typical research project, massively more computation inevitably becomes available. Seeking an improvement that makes a difference in the shorter term, researchers seek to leverage their human knowledge of the domain, but the only thing that matters in the long run is the leveraging of computation. These two need not run counter to each other, but in practice they tend to. Time spent on one is time not spent on the other. There are psychological commitments to investment in one approach or the other. And the human-knowledge approach tends to complicate methods in ways that make them less suited to taking advantage of general methods leveraging computation.  There were many examples of AI researchers' belated learning of this bitter lesson, and it is instructive to review some of the most prominent.
> 
> 
> **FirstAuthor**:: Rich Sutton  
~    
> **Title**:: "The Bitter Lesson"  
> **Date**:: 2019-03-13  
> **Citekey**:: Sutton19bitterLesson  
> **ZoteroItemKey**:: VE3PHTCR  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: http://www.incompleteideas.net/IncIdeas/BitterLesson.html  
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

> Rich Sutton. _The Bitter Lesson_. 13 Mar. 2019, [http://www.incompleteideas.net/IncIdeas/BitterLesson.html](http://www.incompleteideas.net/IncIdeas/BitterLesson.html).
%% begin Obsidian Notes %%
___

The famous bitter lesson from a founder of reinforcement learning.  Says that, while adding human knowledge into AI training algorithms works in the short run -- and is satisfying -- it is a waste of time in the long run, because general learning algorithms that learn their own lessons are always better.  They require more compute, but it's claimed that greater compute is arriving faster than human knowledge can be added, and adding human knowledge actually delays work on using general learning approaches. This is the bitter lesson that AI research keep failing to learn.  Says that search and learning are two methods that scale with compute power.

# Criticism
- [[Nielsen21reflectBitterLesson|Reflections on 'The Bitter Lesson']]

# Good quotes

> the actual contents of minds are tremendously, irredeemably complex;

[[Sutton19BitterLesson.pdf#page=2&annotation=50R]]

> building in how we think we think does not work in the long run

[[Sutton19BitterLesson.pdf#page=2&annotation=44R]]

> We want AI agents that can discover like we can, not which contain what we have discovered.  Building in our discoveries only makes it harder to see how the discovering process can be done.

[[Sutton19BitterLesson.pdf#page=2&annotation=53R]]

> general methods that leverage computation are ultimately the most effective, and by a large margin

[[Sutton19BitterLesson.pdf#page=1&annotation=7R]]

> eventual (non-human, compute-intensive) success is tinged with bitterness, and often incompletely digested, because it is success over a favored, human-centric approach

[[Sutton19BitterLesson.pdf#page=2&annotation=47R]]

# Examples of General Learning Beating Human Knowledge

- **Computer chess**: 1st alg. beating human chess players did have [[Nielsen21reflectBitterLesson|8,000 human knowledge features in it]], the simpler massive search with special hardware and software was vastly more human-knowledge-based approaches.
- **Go**: attempts to use human knowledge failed, while massive search did beat human players.  Computer self-play was also important, and all of this was possible with massive computation.
- **Speech recognition**: statistical approaches beat linguistics based ones -- first HMMs, then deep learning.  Human knowledge a "colossal waste of researcher's time," Moore's law and learning to use it, is what worked.
- **Computer vision**: heuristic edges, cylinders, SIFT features failed.  Deep learning (CNN's I suppose) worked.
___
%% end Obsidian Notes %%



%% Import Date: 2024-05-04T12:33:36.029-07:00 %%
