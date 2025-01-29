---
category: literaturenote
tags: ml/genAI
citekey: Lacy24genAIwhyHallucinate
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - "Hallucinations: Why AI Makes Stuff Up, and What's Being Done About It"
  - "Hallucinations: Why AI Makes Stuff"
publisher: ""
citation key: Lacy24genAIwhyHallucinate
DOI: ""
created date: 2024-04-03T00:04:19-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/S6W8C8MH)   | [**URL**](https://www.cnet.com/tech/hallucinations-why-ai-makes-stuff-up-and-whats-being-done-about-it/) | [[Lacy24genAIwhyHallucinate.pdf|PDF]]
>
> 
> **Abstract**
> There's an important distinction between using AI to generate content and to answer questions.
> 
> 
> **FirstAuthor**:: Lacy, Lisa  
~    
> **Title**:: "Hallucinations: Why AI Makes Stuff Up, and What's Being Done About It"  
> **Date**:: 2024-04-01  
> **Citekey**:: Lacy24genAIwhyHallucinate  
> **ZoteroItemKey**:: S6W8C8MH  
> **itemType**:: webpage  
> **DOI**::   
> **URL**:: https://www.cnet.com/tech/hallucinations-why-ai-makes-stuff-up-and-whats-being-done-about-it/  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: "obsLitNote"
>**Related**:: 

> Lacy, Lisa. “Hallucinations: Why AI Makes Stuff Up, and What’s Being Done About It.” _CNET_, 1 Apr. 2024, [https://www.cnet.com/tech/hallucinations-why-ai-makes-stuff-up-and-whats-being-done-about-it/](https://www.cnet.com/tech/hallucinations-why-ai-makes-stuff-up-and-whats-being-done-about-it/).
%% begin Obsidian Notes %%
___
As the title says…

- Hallucination def
    - "synthetically generated data," or "fake data that is statistically indistinguishable from actual factually correct data."  
    - generated data is "statistically indistinguishable" from the training data, or that has the same type of generic characteristics. There's no requirement for it to be "true," Soatto said.  
        
- How Gen AI works, and how this makes hallucinations
    - adjective example
        - has never seen “crimson” in some kind of sentence
        - has seen enough to know that crimson and red are used in similar contexts
        - could eventually say something is crimson
    - that’s a kind of invention, or “creativity”.   Can actually make that sentence more interesting, novel
    - but gen AI doesn’t know the difference between that and “true” "It generalizes or makes an inference based on what it knows about language, what it knows about the occurrence of words in di erent contexts," said Swabha Swayamdipta, assistant professor of computer science at the USC Viterbi School of Engineering and leader of the Data, Interpretability, Languageand Learning(DILL) lab. "This is why these language models produce facts which kind of seem plausible but are not quite true because they're not trained to just produce exactly what they have seen before."  
        
    - can also be result of improper and/or biased training data
- "It's just saying, 'Based on this word, I think that the right probability is this next word.' That's what it is. Just math in the basic sense."  
    
- There’s the [[Hughes23VectaraHallucLdrBrd|Vectara Hallucination Leaderboard]]
    - by this metric: hallucinations are between 3-27%
    - my own use is much worse than that
- Solutions to hallucinations
    - This is none: “hallucination is their job” I say.
        - “"Hallucination as a property of an AI model is unavoidable, but as a property of the system that uses the model, it is not only unavoidable, it is very avoidable and manageable,"  Soatto said.  
            
    - don’t gen I for factual info
    - use RAG
        - you can check yourself
        - systems can check the internet for you (GPT-4, copilot, and gemini (if you ask) do this)
    - MS guy says solutions are
        - grounding
        - fine-tuning
        - steering
        - **TODO**: look these up
- Tip on how to detect
    - ask question slightly different way, see if the reponse changes rapidly  

- IBM VP gives the EU’s AI Act ([Yamimova and Ojamo, 2024](zotero://select/library/items/MHF9CJG8)) good marks for AI safety
___
___
Delete this and write here.  Don't delete the persist directives above and below!
___
___
Delete this and write here.  Don't delete the persist directives above and below!
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Lacy24genAIwhyHallucinate
> 
> As the title says…
> 
> - Hallucination def
>     
>     - "synthetically generated data," or "fake data that is statistically indistinguishable from actual factually correct
>         
>         data."
>         
>     - generated data is "statistically indistinguishable" from the training data, or that has the same type of generic
>         
>         characteristics. There's no requirement for it to be "true," Soatto said.
>         
> - How Gen AI works, and how this makes hallucinations
>     
>     - adjective example
>         
>         - has never seen “crimson” in some kind of sentence
>         - has seen enough to know that crimson and red are used in similar contexts
>         - could eventually say something is crimson
>     - that’s a kind of invention, or “creativity”.   Can actually make that sentence more interesting, novel
>     - but gen AI doesn’t know the difference between that and “true”  
>           
>         "It generalizes or makes an inference based on what it knows about language,
>         
>         what it knows about the occurrence of words in di erent contexts," said
>         
>         Swabha Swayamdipta, assistant professor of computer science at the USC
>         
>         Viterbi School of Engineering and leader of the Data, Interpretability,
>         
>         Languageand Learning(DILL) lab. "This is why these language models produce
>         
>         facts which kind of seem plausible but are not quite true because they're not
>         
>         trained to just produce exactly what they have seen before."  
>         
>     - can also be result of improper and/or biased training data
>     
> - "It's just saying, 'Based on this word, I think that the right probability is this next word.' That's what it is.
>     
>     Just math in the basic sense."
>     
> - There’s a Hallucination leaderboard: ([Hughes and Bae, 2023](zotero://select/library/items/EVEAP9PF))
>     
>     - by this metric: hallucinations are between 3-27%
>     - my own use is much worse than that
> - Solutions to hallucinations
>     
>     - This is none: “hallucination is their job” I say.
>         
>         - “"Hallucination as a property of an AI model is unavoidable, but as a property of
>             
>             the system that uses the model, it is not only unavoidable, it is very avoidable
>             
>             and manageable,"  Soatto said.
>             
>     - don’t gen I for factual info
>     - use RAG
>         
>         - you can check yourself
>         - systems can check the internet for you (GPT-4, copilot, and gemini (if you ask) do this)
>     - MS guy says solutions are
>         
>         - grounding
>         - fine-tuning
>         - steering
>         - **TODO**: look these up
> - Tip on how to detect
>     
>     - ask question slightly different way, see if the reponse changes rapidly  
>         
> - IBM VP gives the EU’s AI Act ([Yamimova and Ojamo, 2024](zotero://select/library/items/MHF9CJG8)) good marks for AI safety
> 
> <small>📝️ (modified: 2024-04-01) [link](zotero://select/library/items/I3UZT6QK) - [web](http://zotero.org/users/60638/items/I3UZT6QK)</small>
>  
> ---


## Annotations%% begin annotations %%



### Imported: 2024-04-02 11:43 pm



<mark style="background-color: #b3dbfb">Quote</mark>
> Douglas Hofstadter

<mark style="background-color: #b3dbfb">Quote</mark>
> how quickly these AI models evolve.

<mark style="background-color: #b3dbfb">Quote</mark>
> hallucinations are actually both a feature and a bug

<mark style="background-color: #ffdebd">Quote</mark>
> distinction between using an AI model as a content generator and tapping into it to answer questions

<mark style="background-color: #c2e4c3">Quote</mark>
> hallucination

<mark style="background-color: #b3dbfb">Quote</mark>
> synthetically generated data," or "fake data that is statistically indistinguishable from actual factually correct data."

<mark style="background-color: #b3dbfb">Quote</mark>
> same type of generic characteristics

<mark style="background-color: #b3dbfb">Quote</mark>
> no requirement for it to be "true,"

<mark style="background-color: #b3dbfb">Quote</mark>
> never seen a sentence with the word "crimson

<mark style="background-color: #b3dbfb">Quote</mark>
> infer this word is used in similar contexts to the word "red."

<mark style="background-color: #b3dbfb">Quote</mark>
> might eventually say something is crimson

<mark style="background-color: #b3dbfb">Quote</mark>
> inference based on what it knows about language, what it knows about the occurrence of words in di erent contexts

<mark style="background-color: #b3dbfb">Quote</mark>
> why these language models produce facts which kind of seem plausible but are not quite tru

<mark style="background-color: #b3dbfb">Quote</mark>
> not trained to just produce exactly what they have seen before."

<mark style="background-color: #b3dbfb">Quote</mark>
> can also result from improper training and/or biased or insu cient data

<mark style="background-color: #ffdebd">Quote</mark>
> Based on this word, I think that the right probability is this next word.'

<mark style="background-color: #b3dbfb">Quote</mark>
> gen AI startup Vectara show chatbots hallucinate anywhere from 3% to 27% of the time.

<mark style="background-color: #c2e4c3">Quote</mark>
> Hallucination Leaderboard

<mark style="background-color: #b3dbfb">Quote</mark>
> GPT 4

<mark style="background-color: #b3dbfb">Quote</mark>
> 0% more likely to produce factual responses

<mark style="background-color: #c2e4c3">Quote</mark>
> grounding

<mark style="background-color: #c2e4c3">Quote</mark>
> fine-tuning

<mark style="background-color: #c2e4c3">Quote</mark>
> steering

<mark style="background-color: #b3dbfb">Quote</mark>
> techniques

<mark style="background-color: #b3dbfb">Quote</mark>
> manage

<mark style="background-color: #b3dbfb">Quote</mark>
> training data

<mark style="background-color: #b3dbfb">Quote</mark>
> v

<mark style="background-color: #b3dbfb">Quote</mark>
> erified by third-party sources.

<mark style="background-color: #b3dbfb">Quote</mark>
> embed the model within a larger system

<mark style="background-color: #b3dbfb">Quote</mark>
> checks consistency and factuality and traces attribution.

<mark style="background-color: #ffdebd">Quote</mark>
> Hallucination as a property of an AI model is unavoidable

<mark style="background-color: #b3dbfb">Quote</mark>
> system

<mark style="background-color: #b3dbfb">Quote</mark>
> very avoidable

<mark style="background-color: #b3dbfb">Quote</mark>
> manageable

<mark style="background-color: #b3dbfb">Quote</mark>
> ervices that place the model inside a bigger system where they can specify or customize their constraints

<mark style="background-color: #ffdebd">Quote</mark>
> sk the same question in a slightly di erent way

<mark style="background-color: #b3dbfb">Quote</mark>
> "If a slight change in the prompt vastly deviates

<mark style="background-color: #b3dbfb">Quote</mark>
> model actually didn't understand

<mark style="background-color: #b3dbfb">Quote</mark>
> not fair to ask generative models to not hallucinate because that's what we train them for,

<mark style="background-color: #b3dbfb">Quote</mark>
> fact-checking

<mark style="background-color: #b3dbfb">Quote</mark>
> use other tools when seeking factual information

<mark style="background-color: #c2e4c3">Quote</mark>
> RAG

<mark style="background-color: #b3dbfb">Quote</mark>
> act-checks sources and delivers responses with a link

<mark style="background-color: #b3dbfb">Quote</mark>
> OpenAI's GPT 4

<mark style="background-color: #b3dbfb">Quote</mark>
> nternet if it doesn't know

<mark style="background-color: #b3dbfb">Quote</mark>
> will cite where the information came from.

<mark style="background-color: #c2e4c3">Quote</mark>
> Artificial Intelligence Act,

<mark style="background-color: #b3dbfb">Quote</mark>
> much tidier framework for ensuring transparency, accountability and human oversight


%% end annotations %%



%% Import Date: 2024-04-03T00:04:26.484-07:00 %%
