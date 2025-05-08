---
title: ML News Groq Gemma Sora Gemini and Air Canadas chatbot troubles
source: https://www.youtube.com/watch?v=3nF8Z6HgSLQ
author: "[[Yannic Kilcher]]"
platform: "[[www.youtube.com]]"
published date: 2024-03-01 22:57:18
created: 2024-03-04 22:52:32.913733
created date: 2025-05-06T12:52:39-07:00
modified date: 2025-05-06T12:52:39-07:00
---
Google's Gemma models are 2B and 7B param models.  Much smaller.  Open.

Outperform llambda models of similar sizes, so quite performant.
- 
```timestamp 
01:08 
``` 
 
****

```timestamp 
01:07 
``` 
 *8,000 tokens so they are in architecture*

```timestamp 
01:11 
``` 
 *quite similar to llama models as I said*

```timestamp 
01:13 
``` 
 *previously this is essentially I believe*

```timestamp 
01:15 
``` 
 *a marketing Ploy from Google right here*

```timestamp 
01:18 
``` 
 *releasing these models they're already*

```timestamp 
01:19 
``` 
 *topping the leaderboards so all in all*
****

B/f said that commecial but limited.  Also Gemini 1.5 token model

- 
```timestamp 
01:38 
``` 
 
****

```timestamp 
01:36 
``` 
 *when it comes to sort of bias correction*

```timestamp 
01:39 
``` 
 *and representation of people so straight*

```timestamp 
01:42 
``` 
 *up refusing to generate any white people*

```timestamp 
01:45 
``` 
 *or any images of white people and and*

```timestamp 
01:48 
``` 
 *things like that one interesting*
****

- 
```timestamp 
02:54 
``` 
 
****

```timestamp 
02:53 
``` 
 *generate images of people that was their*

```timestamp 
02:55 
``` 
 *hot fix their their patch to say well no*

```timestamp 
02:58 
``` 
 *images of people ad at all until we fix*

```timestamp 
03:01 
``` 
 *this problem here then saying if you*

```timestamp 
03:03 
``` 
 *then said I've seen you produce images*

```timestamp 
03:06 
``` 
 *of people it has answers it is important*
****

- 
```timestamp 
03:50 
``` 
 
****

```timestamp 
03:48 
``` 
 *informed correctly and they have built a*

```timestamp 
03:51 
``` 
 *card that can serve language models*

```timestamp 
03:54 
``` 
 *really really really quickly so make*

```timestamp 
03:56 
``` 
 *long novel so this is mixol 8 * 7B*

```timestamp 
04:02 
``` 
 *and see it runs at like 532 tokens a*
****
Mixtral card 8X7B, a google spinoff. 

Not a GPU, but specific LM hardware, esp. memory.

Need hundreds of them to serve 1 LLM ~ $10M cost.

- 
```timestamp 
08:21 
``` 
 
****

```timestamp 
08:19 
``` 
 *Demis hbis on how far you get with scale*

```timestamp 
08:22 
``` 
 *apparently I guess just on the future of*

```timestamp 
08:24 
``` 
 *AI and if you read the interview it's*

```timestamp 
08:27 
``` 
 *kind of a mix between yeah scale is*

```timestamp 
08:29 
``` 
 *great we can do scale scale is awesome*

```timestamp 
08:32 
``` 
 *Gemini is awesome these models are*
****

Scale helps but not to tasks like genAI.  More needed.  This article is in Zotero.

Specifically, not planning or tooling or agent-based behavior.

- 
```timestamp 
10:13 
``` 
 
****

```timestamp 
10:12 
``` 
 *Alton's plan to raise $7 trillion to*

```timestamp 
10:14 
``` 
 *make AI Chip saying I can do it for less*

```timestamp 
10:17 
``` 
 *than 1*

```timestamp 
10:18 
``` 
 *trillion we've gone off the rails so Jim*

```timestamp 
10:21 
``` 
 *Keller apparently legendary CPU*

```timestamp 
10:24 
``` 
 *developer now working at the company*
****

- 
```timestamp 
10:16 
``` 
 
****

```timestamp 
10:14 
``` 
 *make AI Chip saying I can do it for less*

```timestamp 
10:17 
``` 
 *than 1*

```timestamp 
10:18 
``` 
 *trillion we've gone off the rails so Jim*

```timestamp 
10:21 
``` 
 *Keller apparently legendary CPU*

```timestamp 
10:24 
``` 
 *developer now working at the company*

```timestamp 
10:27 
``` 
 *that makes chips themselves they claims*
****

Altman wants $7T fo develop new AI chip; other guy says $1T.   Video guy says thats beyond the total market value of "chips."

- 
```timestamp 
16:37 
``` 
 
****

```timestamp 
16:35 
``` 
 *uh feeding at entire short movie into*

```timestamp 
16:39 
``` 
 *into this so what Gemini will do is it*

```timestamp 
16:41 
``` 
 *will take the movie split it into frames*

```timestamp 
16:44 
``` 
 *and then essentially use the frames as*

```timestamp 
16:46 
``` 
 *tokens or tokenize the frames and you*

```timestamp 
16:49 
``` 
 *can fit pretty long you can see here 44*
****

1.5M visual tokens for 44 minutes of video for Gemni 1.5 Pro.  Tokens are frames (t"okenized").  Output is a summary.


- 
```timestamp 
17:32 
``` 
 
****

```timestamp 
17:30 
``` 
 *coming out with a paper that's titled*

```timestamp 
17:33 
``` 
 *World model on million length video and*

```timestamp 
17:36 
``` 
 *language with ring attention this is an*

```timestamp 
17:38 
``` 
 *actual research paper that is very*

```timestamp 
17:41 
``` 
 *concurrent as I said to Gemini 1.5 Pro*

```timestamp 
17:44 
``` 
 *doing retrieval experiments across very*
****

Berkeley paper: million-long model. Main thing is "ring attention," some kind of approximation.  

This could go w/ my presentation bit on attention mechanism.

- 
```timestamp 
18:18 
``` 
 
****

```timestamp 
18:16 
``` 
 *promising Phil Wang also known as Lucid*

```timestamp 
18:19 
``` 
 *Reigns already has an implementation on*

```timestamp 
18:21 
``` 
 *ring attention up even though the paper*

```timestamp 
18:24 
``` 
 *is super duper new yeah what's*

```timestamp 
18:26 
``` 
 *interesting to see in the read me of*

```timestamp 
18:27 
``` 
 *this reposit is Phil saying I will be*

```timestamp 
18:29 
``` 
 *running out of sponsorship early next*
****

paper and pytorch lib for ring attenion.  Also "striped attention"

- 
```timestamp 
18:47 
``` 
 
****

```timestamp 
18:45 
``` 
 *News Vancouver writes Air Canada's*

```timestamp 
18:48 
``` 
 *chatbook gave BC man the wrong*

```timestamp 
18:50 
``` 
 *information now the airline has to pay*

```timestamp 
18:51 
``` 
 *for the mistake apparently a person went*

```timestamp 
18:54 
``` 
 *on the chatbot for Air Canada that's*

```timestamp 
18:57 
``` 
 *kind of power by a large language model*
****

Air Canada Airline reservation system screwed up (a good presentation joke for me!  Things haven't changed).  

Bereavement question.  Chatbo said could claim AFTER trip, but AFTER, customer support said he couldn't.  Court decision: responsibility is Air Canada's even though AC said that the chatbo was a separate legal entity, responsible for its own actions!

This was an excuse I never thought of!

Damage was maybe $800.  Lawyers were of course much larger:  "Lawyers should be AI fans!"

- 
```timestamp 
27:12 
``` 
 
****

```timestamp 
27:12 
``` 
 *tutorial on tokenizers very cool and as*

```timestamp 
27:15 
``` 
 *Andre is very very clear explanations*

```timestamp 
27:18 
``` 
 *you will know a lot more after this*

```timestamp 
27:21 
``` 
 *nature writes what the eu's tough AI law*

```timestamp 
27:23 
``` 
 *means for research in chat GPT the EU AI*
****

Andrew Karpathy quit openAI a few days ago (from March 4) to work on "personal project."  Almost immediately released a video on LLM Tokenization.

Here's his tutorial: https://www.youtube.com/watch?v=zduSFxRajkE


- 
```timestamp 
30:12 
``` 
 
****

```timestamp 
30:10 
``` 
 *AI launches Aya Aya is an open-source*

```timestamp 
30:14 
``` 
 *massively multilingual large language*

```timestamp 
30:17 
``` 
 *model and a data set built over 101*

```timestamp 
30:20 
``` 
 *different languages all across the world*

```timestamp 
30:23 
``` 
 *and this is one of the largest data set*
****

101 language LLM and dataset.  Released.  Model is open access.  Not sure about the data.

- 
```timestamp 
31:58 
``` 
 
****

```timestamp 
31:55 
``` 
 *very cool stability and announces stable*

```timestamp 
31:58 
``` 
 *diffusion 3 a text to image model using*

```timestamp 
32:01 
``` 
 *a diffusion Transformer architecture for*

```timestamp 
32:04 
``` 
 *greatly improved performance in multi-ub*

```timestamp 
32:07 
``` 
 *prompts image quality and spelling*

```timestamp 
32:10 
``` 
 *abilities not releasing anything there*
****

"stable diffusion 3" text-to-image model developed (not yet released).  by "Stability AI"

Does "stable diffusion" mean text-to-image?

- 
```timestamp 
33:33 
``` 
 
****

```timestamp 
33:32 
``` 
 *system that identifies drug combo*

```timestamp 
33:35 
``` 
 *problems so uh interactions between*

```timestamp 
33:37 
``` 
 *different drugs specifically as they are*

```timestamp 
33:40 
``` 
 *transmitting the uh barrier in your gut*

```timestamp 
33:43 
``` 
 *the problem is any researching any drug*

```timestamp 
33:45 
``` 
 *and what it does is already super*
****

A combo of machine learning + physical expert models.  NOT generative AI, I think.  Would have to check.

Video guys says frontier is not more data but combining ML and experts
