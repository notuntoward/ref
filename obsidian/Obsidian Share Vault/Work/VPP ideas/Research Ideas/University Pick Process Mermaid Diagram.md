---
modified date: 2024-10-10T09:02:12-07:00
created date: 2024-12-17T08:51:31-08:00
---
- Graph generated for 5/3/2024 presentation
- Online Mermaid editor link: [Forecast Uni Pick V2](https://www.mermaidchart.com/app/projects/08a93b4d-c08f-43f0-9cff-013f940ff53a/diagrams/736c47c0-1248-4ebe-9cdc-57359c971dd7/version/v0.1/edit)

**Mermaid code V2**: cursor into render to see code.  
*This looks worse in obsidian* than screenshot I made online, before I signed up for an online mermaid account.  This one obscures boxes, and overwrites the EE, CS University subgraph title.  The online one is also kinda worse, no longer has a white background, but one in pale blue, which I think will look dumb in slides.  Maybe that can be fixed?  Also, in obsidian, I'd rather view the code in one window, and the rendering in another, rather than have the rendering hide the code, as here.

# Mermaid of V2 w/ octagonal means (a little messed up)

```mermaid
%%{init: {'theme':'neutral'}}%%

graph LR

USNR[US News WR \nTop 15] --> |EE, CS\n Rank| MeanRankEECS{{Mean}}

EduRank[Edurank \nTop 15] --> |EE, CS\n Rank| MeanRankEECS

MeanRankEECS --> |EE+CS \nRank| ComboMnRank{{Mean}}

LLMprompt[Forecast\n LLM Prompt:\n Top 15] --> Claude3[Claude3]

LLMprompt --> Perplex[Perplexity]

Claude3 --> |Rank| MeanRankF{{Mean}}

Perplex --> |Rank| MeanRankF

MeanRankF --> |Forecast \nRank| ComboMnRank

ComboMnRank --> |Rank| PickTop10[Pick \nTop 10]

Merge(Merge)

Claude3 --> |Rank Explaination\nand URLs| Merge

Perplex --> |Rank Explaination\nand URLs| Merge

PickTop10 --> |Top 10| Merge

Merge --> |URLs| HumanEval[Human \nWeb \nCrawl]

HumanEval --> TopN(Top N \nUnis)

  

style TopN fill:#f4ecd6

style USNR fill:#cce0df

style EduRank fill:#cce0df

style LLMprompt fill:#cce0d0

  

subgraph EECSrank["`**EE & CS University Rank**`"]

USNR & EduRank & MeanRankEECS

end

  

subgraph FrcstRank["`**Forecast University Rank**`"]

LLMprompt & Claude3 & Perplex & MeanRankF

end
```
# Mermaid V2
``` mermaid
%%{init: {'theme':'neutral'}}%%

graph LR
USNR[US News WR \nTop 15] --> |EE, CS\n Rank| MeanRankEECS(Mean)
EduRank[Edurank \nTop 15] --> |EE, CS\n Rank| MeanRankEECS
MeanRankEECS --> |EE+CS \nRank| ComboMnRank(Mean)
LLMprompt[Forecast\n LLM Prompt:\n Top 15] --> Claude3[Claude3]
LLMprompt --> Perplex[Perplexity]
Claude3 --> |Rank| MeanRankF(Mean)
Perplex --> |Rank| MeanRankF
MeanRankF --> |Forecast \nRank| ComboMnRank
ComboMnRank --> |Rank| PickTop10(Pick \nTop 10)
Claude3 --> |Rank Explaination\nand URLs| Merge
Perplex --> |Rank Explaination\nand URLs| Merge 
PickTop10 --> |Top 10| Merge
Merge --> |URLs| HumanEval(Human \nWeb \nCrawl)
HumanEval --> TopN(Top N \nUnis)

style TopN fill:#f4ecd6
style USNR fill:#cce0df
style EduRank fill:#cce0df
style LLMprompt fill:#cce0d0

subgraph EECSrank["`**EE & CS University Rank**`"]
USNR & EduRank & MeanRankEECS
end

subgraph FrcstRank["`**Forecast University Rank**`"]
LLMprompt & Claude3 & Perplex & MeanRankF
end
```

**Mermaid code V1**
``` mermaid
%%{init: {'theme':'neutral'}}%%

graph LR
USNR[US News WR \nTop 15] --> |EE, CS\n Rank| MeanRankEECS(Mean)
EduRank[Edurank \nTop 15] --> |EE, CS\n Rank| MeanRankEECS
MeanRankEECS --> |EE+CS \nRank| ComboMnRank(Mean)
LLMprompt[Forecast\n LLM Prompt:\n Top 15] --> Claude3[Claude3]
LLMprompt --> Perplex[Perplexity]
Claude3 --> |Rank| MeanRankF(Mean)
Perplex --> |Rank| MeanRankF
MeanRankF --> |Forecast \nRank| ComboMnRank
ComboMnRank --> | Rank| PickTop10(Pick \nTop 10)
Claude3 --> |Explain\nURLs| Merge
Perplex --> |Explain\nURLs| Merge
PickTop10 --> |Top 10| Merge
Merge --> HumanEval(Human \nWeb \nCrawl)
HumanEval --> TopN(Top N \nUnis)

style TopN fill:#f4ecd6
style USNR fill:#cce0df
style EduRank fill:#cce0df
style LLMprompt fill:#cce0d0

subgraph EECSrank[EE & CS University Rank]
USNR & EduRank & MeanRankEECS
end

subgraph FrcstRank[Forecast University Rank]
LLMprompt & Claude3 & Perplex & MeanRankF
end
```
-

