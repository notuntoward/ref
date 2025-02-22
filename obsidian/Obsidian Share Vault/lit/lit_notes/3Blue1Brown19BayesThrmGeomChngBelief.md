---
category:
  - literaturenote
tags: 
read: true
in-progress: false
linked: true
aliases:
  - Bayes theorem, the geometry of changing beliefs
  - Bayes theorem, the geometry of
citekey: 3Blue1Brown19BayesThrmGeomChngBelief
ZoteroTags: 
ZoteroCollections:
  - basic_stats
created date: 2025-02-21T14:10:54-08:00
modified date: 2025-02-21T15:27:30-08:00
---

> [!info]- &nbsp;[**Zotero**](zotero://select/library/items/XV4RD8YD)   | [**URL**](https://www.youtube.com/watch?v=HZGCoVF3YvM)
>
> 
> 
> **FirstDirector**:: 3Blue1Brown  
~    
> **Title**:: "Bayes theorem, the geometry of changing beliefs"  
> **Date**:: 2019-12-22  
> **Citekey**:: 3Blue1Brown19BayesThrmGeomChngBelief  
> **ZoteroItemKey**:: XV4RD8YD  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=HZGCoVF3YvM  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: 
> **Related**:: 

> _Bayes Theorem, the Geometry of Changing Beliefs_. Directed by 3Blue1Brown, 2019. _YouTube_, [https://www.youtube.com/watch?v=HZGCoVF3YvM](https://www.youtube.com/watch?v=HZGCoVF3YvM).
%% begin Obsidian Notes %%
___
Visual review of Bayes Theorem and Bayesian updating.  Nice.

## A handy visual

![[lit/lit_notes/attachments/34bc42f9607ef00c1b91ebdcb94d7908_MD5.jpeg]]

This is the famous Kahneman/Tversky farmer or librarian example, where the evidence `E` is that the person is shy and retiring.  The hypothesis you're to predict the probability of, `H` is that the person is a librarian.  There are way more farmers than librarians in the population, so almost all of the square enclosing the total population is farmers.  Even though `P(E|H) = 0.4`  and `P(E|~H)=0.1` (librarians are more shy than farmers), there are way more farmers, so if you see a shy person, the probability that this person is a librarian increases -- this is a `Bayesian evidence update` -- it is still much smaller than the probability that this person is a farmer, simply because there are so many farmers.
### Notation & Terms:
- P(E): `probability of the evidence` (here of anybody being shy)
- P(H): `prior`, the prob. of the hypothesis (here, being a librarian)
- $\neg$: `not`
- P(H): `prior` probability of the unconditional probability of the hypothesis (1/21)
- P(H|E): `posterior`, the probability of the hypothesis given the evidence (shy)
- P(E|H): `likelihood`, a backwards posterior, prob of evidence given hypothesis (0.4)
## How question phrasing matters

People instinctively fail to consider that probabilities multiply, not recognizing that it's less likely that a person belongs to two subgroups than just one.  For example...
### Told this

Linda is 31 years old, single, outspoken, and very bright. She majored in philosophy. As a student, she was deeply concerned with issues of discrimination and social justice, and also participated in anti-nuclear demonstrations.

### Asked: Is Linda a bank teller and feminist?

![[lit/lit_notes/attachments/0f9da6870b23bec3038d1bd85069bc1e_MD5.jpeg]]

### If instead asked to count...

… then 0% got the answer wrong.

![[lit/lit_notes/attachments/d0ef79bb85ffd401136605d35774ccb2_MD5.jpeg]]

I guess this is why you often hear science communicators say "40 out of 100" instead of 40%?

## Simple Bayes Derivation: Counts or Proportion's

- [Based on counts or proportions](https://youtu.be/HZGCoVF3YvM?t=766)  
- Similar to [[lit/lit_notes/Clyde20IntroBayesianThink.md#Counts based derivation of Bayes Rule |Counts based derivation of Bayes Rule]] found in [[Clyde20IntroBayesianThink]]


___
%% end Obsidian Notes %%


%% Import Date: 2025-02-21T14:11:08.197-08:00 %%
