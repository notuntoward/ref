---
category: literaturenote
tags:
  - ml/genAI
citekey: Lucek24test5LLMagents
status:
  - read
dateread: 
ZoteroTags: obsLitNote
aliases:
  - Breaking Down & Testing FIVE LLM Agent Architectures - (Reflexion, LATs, P&E, ReWOO, LLMCompiler)
  - Breaking Down & Testing FIVE
publisher: ""
citation key: Lucek24test5LLMagents
DOI: ""
created date: 2024-05-01T21:43:54-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/9ARMKWCA)   | [**URL**](https://www.youtube.com/watch?v=ZJlfF1ESXVw)
>
> 
> **Abstract**
> Large Language Model Agents have taken over LLM and Artificial Intelligence application design by storm, so this time we check out and simplify six main concepts and five popular papers documenting ways to set up language model based agents, as well as directly testing examples.   Resources -  @LangChain  Agent Tutorials & Code -    • LangGraph (Python)   Overview on LLM Agents -    • AI Agents! Giving Reasoning and Tools...    Papers: Reflexion Paper: https://arxiv.org/abs/2303.11366 LATs Paper: https://arxiv.org/abs/2310.04406 Plan-And-Execute Paper: https://arxiv.org/abs/2305.04091 ReWOO Paper: https://arxiv.org/abs/2305.18323 LLMCompiler Paper: https://arxiv.org/abs/2312.04511  LangSmith Traces: Basic Reflection: https://smith.langchain.com/public/60... Reflexion: https://smith.langchain.com/public/83... LATs: https://smith.langchain.com/public/d4... Plan-And-Execute: https://smith.langchain.com/public/c1... ReWOO: https://smith.langchain.com/public/ee... LLMCompiler: https://smith.langchain.com/public/28...  Chapters: 00:00 - Intro 01:08 - Basic Reflection 02:44 - Basic Reflection Testing 06:32 - Reflexion Actor 09:57 - Reflexion Action Testing 12:25 - Language Agent Tree Search (LATs) 17:04 - LATs Testing 20:54 - Plan And Execute 23:38 - Plan And Execute Testing 26:28 - Reasoning Without Observation (ReWOO) 29:26 - ReWOO Testing 31:11 - LLMCompiler 35:19 - LLMCompiler Testing 36:05 - Outro
> 
> 
> **FirstDirector**:: Lucek, Adam  
~    
> **Title**:: "Breaking Down & Testing FIVE LLM Agent Architectures - (Reflexion, LATs, P&E, ReWOO, LLMCompiler)"  
> **Date**:: 2024-04-30  
> **Citekey**:: Lucek24test5LLMagents  
> **ZoteroItemKey**:: 9ARMKWCA  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=ZJlfF1ESXVw  
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

> _Breaking Down & Testing FIVE LLM Agent Architectures - (Reflexion, LATs, P&E, ReWOO, LLMCompiler)_. Directed by Adam Lucek, YouTube, 2024. _YouTube_, [https://www.youtube.com/watch?v=ZJlfF1ESXVw](https://www.youtube.com/watch?v=ZJlfF1ESXVw).
%% begin Obsidian Notes %%
___

Runs through langchain implementations of 5 LLM agent architectures that are found in fairly recent papers.  At this level, these seem really simple -- hacky heuristics that will soon be replaced by something more formal.

But it’s probably worth checking the last and best agent structure, [[Kim24LLMCompilerParallelFunc]], to see if some of that has already happened.

This is apparently open source, and I think it runs on chatGPT.  There are links and details in the YouTube notes (some, all? copied by me, below).

Google Med has a much fancier agent, w/ search after uncertainty and fine tuning after search [[AIExplained24NewOpenAIModel#^856487]]
# Raw Video Timestamps

[00:00](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=0s) - Intro 
[01:08](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=68s) - Basic Reflection 
[02:44](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=164s) - Basic Reflection Testing 
[06:32](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=392s) - Reflexion Actor 
[09:57](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=597s) - Reflexion Action Testing 
[12:25](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=745s) - Language Agent Tree Search (LATs) 
[17:04](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=1024s) - LATs Testing [20:54](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=1254s) - Plan And Execute [23:38](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=1418s) - Plan And Execute Testing
[26:28](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=1588s) - Reasoning Without Observation (ReWOO) [29:26](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=1766s) - ReWOO Testing
[31:11](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=1871s) - LLMCompiler
[35:19](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=2119s) - LLMCompiler Testing
[36:05](https://www.youtube.com/watch?v=ZJlfF1ESXVw&t=2165s) - Outro
# Papers
Reflexion Paper: [https://arxiv.org/abs/2303.11366](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbTk0a2tOSEZ5b0I4LXdnOWVNeWRPY1FvMjY2Z3xBQ3Jtc0tsWVd1ZEhKdWxjOVZfdXA4Z0pZRE12WDBJVEwyT3FZNEMwOEpFNHpTcEpvc1lCVVdFb19OQXFmQll4V181YnBNSHVNTDdyNTFpOHdpTTMxSjhlN2tHNmZ0c3FrSzVfMEp3dVN6OUVoM0c3X1NDdWNLQQ&q=https%3A%2F%2Farxiv.org%2Fabs%2F2303.11366&v=ZJlfF1ESXVw)
LATs Paper: [https://arxiv.org/abs/2310.04406](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXBIbGNOaExjcllGYmFoQnBJQUxHSHdISzFMQXxBQ3Jtc0ttQnV1aU04b1VwMnJiSHNwZXN0Q3pGaDkxcUtNVHd4dXU1ZDVmVVFsMERsck1ja201dXBicDB3dXFNVE1MbDhQSG1TMFFzUHcxT1I3eFBGcmtoOEVvbElLN3dIbGtfRW1Fd1FfWmE5MmFfYjdYWnRBMA&q=https%3A%2F%2Farxiv.org%2Fabs%2F2310.04406&v=ZJlfF1ESXVw) 
Plan-And-Execute Paper: [https://arxiv.org/abs/2305.04091](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbkxKR0tSakhpdDhzcVRYQzUyRVdLZmROUm1HQXxBQ3Jtc0trSEw5aDBHOFY3NWl6ODZiZTJ1LWZreHIzbW1QNHNLRWs2eUQ0b2VLNXVWeHFOSGFsMVVlVkpmdl9XeExtMERZNk41NjEwaHJSZmdGV3UxS1RPVzFRcEtnWWlDNlotZWxIdGtEYUZkTnpFMF9iMzZDaw&q=https%3A%2F%2Farxiv.org%2Fabs%2F2305.04091&v=ZJlfF1ESXVw) 
ReWOO Paper: [https://arxiv.org/abs/2305.18323](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbk5MSlpxTTRTNGJQbTRKWjRJdGVDVHBqM3BZQXxBQ3Jtc0tuRk92OXBuUkVsNjBuajNNa0hfUWlfRFNKdGxkZnNkcjd4ckRCZXRnTGhqbjZkZkxqSkdPV2c2UGx3dzZiSGI2TzNWUXdneTF5NjdUek0xQlRDdlZ0dy1kZGttUjFJbWM1aUFweGxTdl9ialRCWlJDRQ&q=https%3A%2F%2Farxiv.org%2Fabs%2F2305.18323&v=ZJlfF1ESXVw) 
LLMCompiler Paper: [[Kim24LLMCompilerParallelFunc]]
# LangSmith Traces
Basic Reflection: [https://smith.langchain.com/public/60...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqay1LaEUwdDNjQVBEWVlVVVFDcEFYWVpySTlDQXxBQ3Jtc0tuVVU0WkxKNWZ1VGFtN2ViVHU1Qi13YUF5di1hOXBzUVZyRE9ER1RLN0pXMTNoS3hEZ0xSZDFYNFZfRWJIYWpWVU8xRXg1YTY1QjN2bU5XT0NoZ1k2RGtNZWdUaktJN2o3SlBtakxHOE1GMDcxZXFVVQ&q=https%3A%2F%2Fsmith.langchain.com%2Fpublic%2F604a986b-a751-48ed-9dda-738bd2780ea5%2Fr&v=ZJlfF1ESXVw) 
Reflexion: [https://smith.langchain.com/public/83...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbmtCRGpYWjBoTElYaTVVSjFpRTY0SWRXR0FHd3xBQ3Jtc0trR2hfUGJmbDdBNzNqQ1BWMEVIV0pMMjlTS0Q5SmxOeXZoLTVKUk0xSVN5QVViTkxqaWotZUVCUno3eE9BY29KOXh5ck8yeDIzVHdudm9VV3F0eU5BRENpYjBRTEhJbnA2amloeWdJM0FVVS1OUHM2Yw&q=https%3A%2F%2Fsmith.langchain.com%2Fpublic%2F83b0f3a3-b788-471b-ae1b-57167ceef37c%2Fr&v=ZJlfF1ESXVw) 
LATs: [https://smith.langchain.com/public/d4...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbGxmMGpmUFVYMGtodVRqa25BYmowLUlnb1RHZ3xBQ3Jtc0ttZVB2Z1d2dnphMVNmSm93N1R3aDZsMFFIWjBrQnR4VUNOR2VQRXlsSmNJSjlxMlhsWGIwNU1wOUN5LTRvXzFLU1JHQ3hkZ3V1S0w4WFhHYWFncUkzc244WHdlcmtlUm00OVdYR0lfajd0YU1ZRFVsNA&q=https%3A%2F%2Fsmith.langchain.com%2Fpublic%2Fd4541960-3f1a-4e53-9ec7-d223736f64b7%2Fr&v=ZJlfF1ESXVw) 
Plan-And-Execute: [https://smith.langchain.com/public/c1...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbEJ4UGxoTkVvbUZHbTVQOTZUWVlROUh0WjFpUXxBQ3Jtc0ttdVI4Z2JVTmJELTdMT3hjTG04bVMzMWlZTmxCdzI1N0NBbXZVdkhzRV9aZkFPYUg0eTZMcnU3YzV6a2dNRnBsZEc2bTZmbDVRLUtEcmdPSHRjZmJCcGxPb2ZZa0xJNGlBTHBVZHFwcHo5QkVYU2hrRQ&q=https%3A%2F%2Fsmith.langchain.com%2Fpublic%2Fc13392c5-e058-4bbe-b25e-aac7214a28df%2Fr&v=ZJlfF1ESXVw) 
ReWOO: [https://smith.langchain.com/public/ee...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbi05VlhVSUR4YmNiWDJqMXBJdU93OG9DTm5EQXxBQ3Jtc0tsMWJhMjRmTjNKSVBTMWI4TXIydXpCazhpbHU3SEx3a1psZmtWZEMxbEdnTlhuWi1JWUduQzhZNlpsLWt1bEdOWWNnU1ZIWUE0LTBGRy03RXVvSTRBT1MxRjM5X1V4ZHRDT2g2Y0Y0aVYyLTJNLWtIYw&q=https%3A%2F%2Fsmith.langchain.com%2Fpublic%2Fee636208-6914-4c97-9d29-64c572c6ecc0%2Fr&v=ZJlfF1ESXVw) 
LLMCompiler: [https://smith.langchain.com/public/28...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbGRoMkZDSGRXZlRMSFpGU0xKbUtHTlBYVmJTd3xBQ3Jtc0tuR0QtcllMNEJhU2hjMWFsa2VLMkRUQ09HNnVDNWozMmZJbXFaVkdFYW5TSFNuZUdEdGZJUkxBcUNScUUwSjhPenpSNnRwb2tQRldoRDNWS0J3VzltMHlQWFlBeWtJS3NzTmViRE1BWXRNNGtXekFpWQ&q=https%3A%2F%2Fsmith.langchain.com%2Fpublic%2F28857a8a-b9b1-45d5-8403-ded9f95fab6d%2Fr&v=ZJlfF1ESXVw)
___
%% end Obsidian Notes %%

> [!note]- Zotero Note (1)
> Lucek24test5LLMagents
> 
> Runs through langchain implmentations of 5 LLM agent architectures that are found in fairly recent papers.  At this level, these seem really simple -- hacky heuristics that will be replaced with something for formal.
> 
> But it’s probably worth checking the last and best agent structure, to see if some of that has already happened.
> 
> This is apparently open source, and I think runs on chatGPT.  The details are in the youtube comments.
> 
> <small>📝️ (modified: 2024-05-01) [link](zotero://select/library/items/Y6LQ9HZI) - [web](http://zotero.org/users/60638/items/Y6LQ9HZI)</small>
>  
> ---




%% Import Date: 2024-05-01T21:44:32.344-07:00 %%
