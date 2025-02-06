---
tags:
  - ml/embed
  - ml/zeroshot
  - ml/genAI
created date: 2024-10-22T09:21:55-07:00
modified date: 2025-02-06T10:14:17-08:00
---
**TODO** get all Zotero "Generative AI" collection into this
**TODO** get all related browser tab groups into this
# Intro Draft 1
asdfasdfsaf
## My first contact with AI
asdfsfda
### **TEST HEADINGS**: boadflasdf
asdf
#### asdflkajsdf
asdf
##### asdflkjasdflkjadsf
asdf
###### asdfljasdflasdfjl;j
- my PhD: airline chat swearing
- finished on another speech topic
- got a post doc in energy ML
- didn't look back until last year
- [ ] # get my `intro` ideas out of my gmail
## Then I DID look at it!
### Amazing

Maybe only report amazing results up to 2017 [[Vaswani17AttentionAllYou|Attention is all you need]]

- amazing results on constrained tasks
	- earliest ChatGPT results
	- [Introducing the next generation of Claude](zotero://select/library/items/2L8NLKX5)
- pictures
- [[Barousse24dataAnlystGPT4Outperf|Study: GPT-4 outperforms Data Analysts]]
	- include stable diffusion pictures from [MidJourney](https://www.midjourney.com/showcase) w/ the text prompt.  
		- Show prompt 1st, and then image
		- [[MidJourney Exaoundationfmples]]
		- [ ] collect good examples periodically
		- [ ] Show car genAI/cfd example of some other thing, since I think it's supposed to be stable diffusion
		- [ ] [Pick-a-Pic](zotero://select/library/items/9SVS5A3Z): metric for picking higher qual images.  aesthetic metric instead of cfd metric in cars
- Better than doctors: [[AIExplained24NewOpenAIModel#MedGemini]]
- drug design
- Claude 3 voice clone
### Not Amazing
- cautions about AI propaganda
- could do this here (or in [[#AI and Human Creativity?|AI and Human Creativity?]]):
	- while demoing chatGPT, veer into a Hitler thing, but then say, "Na, I won't...  the problem with this is that it's an unconstrained problem.  It's in infinite question space and... I'll talk about that later   
  	  - [[__temp__Smart Crow Analogy]] ?
      - And this is why there's more value in limited scope problems, like "... and then move on to limited scope problems e.g. coding, forecasting, etc.  (note that forecasting still better w/ smaller models).  
	  - And that could be a segue to training data and power consumption
- Good headline: [[SinghChawla24chatGPTpeerReviewNature|Is ChatGPT corrupting peer review?]]
- point out that these are random realizations
	- plausible trigrams example?
	- [ ] make sure I understand what's random in a generative AI
	- [ ] [[__temp__Realizations -- Bing Copilot and Google Gemni]]
- define "generative" and give examples of generative AI
- [ ] extract points out of [[__temp__Kilcher24mlNewsYouTube240402]]
    - [fake political videos](zotero://select/library/items/QUV7MR9D)
	- and list a bunch of bad examples
	- end with my own 80% fail rate on coding (but still useful, [one of few successes](zotero://select/library/items/YUKAFSYU))
	- ? talk about [[Villalobos22outOfDataLLM|Will we run out of data? An analysis of the limits of scaling datasets in Machine Learning]]?
	- "Yeah, in 2026.  I'll get back to that"
	- [ ] # find some bad financial headlines
	- Is true that [[Birch24genAIwasteTimeMoney|Generative artificial intelligence is simply a waste of our time and money]] ?
	- [[Jin24IstartupShwrCashNoBiz|Investors Are Showering AI Startups With Cash. One Problem: They Don’t Have Much of a Business]] ?
	- Is true? [[Naughton24boomBurstAI|From boom to burst, the AI bubble is only heading in one direction]] 
		- funny picture: [[Graphics to Borrow#Boom to Bust]]
		- he's comparing it with the internet dot com bust, and while I think AI’s different than that, there is a litte of, "We were promised flying cars.  Where are they?"
	- [[Graphics to Borrow#Gen AI Disappointment]] animated graphic from [AI chatbot letdown](zotero://select/library/items/YUKAFSYU)
	-  [[Bogost24aiLostMagic|AI Has Lost Its Magic]] ?
	- "And yeah, I bet many in this audience has tried it, and been shocked at how good it is sometimes, and sometimes, how bad it is. 
	- [ ] Find a funny slide showing an AI fail.  Maybe the Canadian airline thing, or other embarassing error. [[Belanger24airCanadaChatbot]]
	- "It's *currently* not all *magic*": back to slide w/  [[Bogost24aiLostMagic|AI Has Lost Its Magic]]
	- But I but I bet some of you out there are already relying on it.  It's annoying, but I've already forgotten how much time I used to spend on this boring thing.  It's more like:"
	- [[Bogost24aiLostMagic|AI Has Lost Its Magic: That's how you know it's taking over]]

#### So... what is going on?  

When does it work and when doesn't. and when I say "it" WHAT am I talking about?  What is generative AI?

## What is AI?  What is Gen AI
### Top Level Overview
#### "AI": is it or it not AI?
- AI "philosophy"
	- For now, [it's just math slide](zotero://select/library/items/A3V43Y2C)
		- by the way, good youtubes for a quick and breezy of breaking news
		- maybe mention how fast things are changing so need "breezy"
	- could lead above with the pizza sentience anecdote: [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
	- [[#^cb2a45|Emergence / Sentience]]
- Lot's of things called AI
	- historical examples

#### AI Types
- [ ] [What is Generative AI?](zotero://select/library/items/XQW3QQWT)
- [ ] [Generative AI vs. predictive AI](zotero://select/library/items/QZHJTUEJ)
- [ ] [Generative AI can improve -- not replace -- predictive analytics | TechTarget](zotero://select/library/items/HH4EAMBR)
- [ ] [Generative AI vs. machine learning](zotero://select/library/items/JSJY36M8)
- [ ] [Transformer neural networks are shaking up AI](zotero://select/library/items/KXCBMESJ)
- [ ] [How combining predictive, causal, and generative AI can deliver amplified AI value](zotero://select/library/items/H3HSPMWJ)
- [ ] "Generative AI Alone Cannot be Trusted with Decision-Making": [Causal AI &amp; Gen AI Synergies | causaLens](zotero://select/library/items/R5FX68SQ)
#### distinctive things about most of genAI
##### neural nets
- 1st neurons: 635-543 million years ago: [[Paulin21EventsEarlyNervous]]
- 1st artificial neuron: 1944 proposal, in & out of fashion a couple times since: [[Hardesty17explainedNNs]]
- 1st modern NN: ~ 1986: [[Rumelhart86learnRepBackprop]]
	- it's main properties were
	- multi-layers w/ nonlinearity
	- backprop training
	- draw simple neural net
		- small NN (get one from [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History: How]])?
		- but big enough that it looks complicated
	- A few years later universal model: (Hornik89mlpUnivApprox)
		- Didn't say how to do it but the model had the capacity, more or less if it big enough, and enough training data.  
	- show that small net again
	- N parameters
	- Go into deep learning
		- give some example sizes (mabye that graph that showed model size and deep learning)
		- most sucessful net was CNN
	- but CNN blocked b/c of inability to model long distance relationships (something like that said in [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History: How AI Learned to Talk]])
		- transformers somehow broke that problem [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History: How]]
	- [ ] reorder this: make it summarize "big" but leave a transition to transformers?
	- increase in params over time graph (gazillions now): [[Simon21llmNewMooresLaw|Large Language Models: A New Moore's Law?]]
	-  [Artificial Intelligence Index Report 2023](zotero://select/library/items/VRMK5T9Q) good graph, comparison w/ GPT2 (1st LLM) and PaLM in 2022
	- GPT4 is "trillions" of parameters
	- [[Morrison24ClaudeTopGPT4]] suggests "trillions"
	- growth in model size: [[Maslej23aiIndexReport|Artificial Intelligence Index Report 2023]]
	- more model growth, I suppose: [[Gutierrez24GenerativeAIReport3124|Generative AI Report – 3/1/2024]]
	- 1.8 T params (10Xincrease); $63 M train; inference 3X more (128 GPU cluster ): [[Schreiner23GPT4ArchitectureDatasets|GPT-4 architecture, datasets, costs and more leaked]]
	- show amazing achievements starting after 2018 [[Vaswani17AttentionAllYou|Attention is all you need]], expanding graphs any graphs in introduction from then to now
- many, many challenges and tricks to making a model w/ this many parameters
	- theoretical mathematical advances (to be covered by whoever talks about NNs)
	- But maybe the most relevant thing for you all to know is the amount of data required
		- Give some data sizes, maybe a graph
##### "Generative": simple pictures of generative, maybe with a hint
- dice uniform discr dist
- not learned
	- learned dist w/ extra dice dot added
- not continuous not so learnable
	- 1-D Gaussian
	- 2 parameters
- prompt response is a random number from learned distribution e.g.
	- a poem
	- an images
	- a voice
	- design dialogue and a house design [This AI Architect Will Design Your Climate-Friendly Dream Home](zotero://select/library/items/9VEDJWKH)
	- [[Realizations -- Bing Copilot and Google Gemniss]]
	- simple model explanations: [[Lacy24genAIwhyHallucinate|Hallucinations: Why AI Makes Stuff Up]]
	- chatGPT Word prob [[Novis23ObsidianChatGPT#Word probability display on chatGPT website]]
		- use as slide animation? [[Graphics to Borrow#LLM word Probabilities Animation]]
- genAI
	- far more complex distributions
	- gazillion-Dimensions
	- show graph of dimensions?
- Venn diagram showing where generative AI sits (similar to one in one of the linked medium articles)
- mention NN's as 1st AI
- show stuff
- could use this Venn diagram as an organizing, repeating motif, when talking about AI types?
- [Mastering LLM Techniques: LLMOPs](zotero://select/library/items/VN4CSK4M): has another Venn diagram
#### Next point? Demos?
- Here is roughly how it works...
- *Or,* "here is how I use it?"
	- show coding assistance
	- show [[Errors -- Bing Copilot and Google Gemni]]
		- Can say, I'll give some examples you can try out yourself right away for free
		- reinforces context window
		- you are the product (training data is up/down votes)  
			- [ ] Should I mention the training part in the intro?
		- nice references (that change after resetting Copilot, presumably helping it get the right answer) and follow-on questions.  References more useful (in fact you can see why they're invaluable, and Gemni doesn't give them) than the follow-on questions.
			- [ ] verify that follow-on questions aren't that useful.
		- [[__temp__Realizations -- Bing Copilot and Google Gemni]]
# Intro Draft 2
- start w/ may airlines reservation system swear words during PhD
	- got a post-doc in energy systems data science for energy
	- my buddies kept working in that area but I haven't looked back, something to chat about over beers...
	- until last year, when...
 - generative AI samples a conditional distribution
	- what does that mean?
	- show distribution of a dice
	- show distribution of a dice with an extra dot added to the one on a dice
	- "conditional on number of dice sides defaced"
	- VERIFY that genAI really is sampling a distribution like that?
	- What is the underlying random number generator that starts things off in generative AI?
	- If so, show the Bing "adventurous, etc. setting", and the google "other script" or "other verrsions" or whatever it is.
	- ALSO, draw the feedback from input and output
	- SHOW how token memory gets filled up until the AI runs out of memory.
- Segue from quick basic "what is gen AI" background to a demo:  "I know that's a bit more than some people want to know, but other people do want to know it.  So lemme try to make everybody happy showing an actual use case, that I think everybody could get something out of"
	- Then do [[Gen AI Talk Demo - GoogleNotebookLM]]
	- and move on to problems, bigger considerations, etc, and on from from textual analysis to other stuff
# Unordered Points to make
## Underlying Neural Theory
### Neural Nets
- 1st time mention them, say this is the basis of most generative AI, and AI in general
- show simple picture
- mention that somebody else will talk about that
- But are NN's ever "intelligent?": mention/show picture of London Deep Mind vs. Yann LeCunne debate (related but I think not quite what I meant[[Wodecki24yannLeCunDitchGenAI]])
### Tokenization
- simple, good graphic [[OpenAI24tokenizer]]
- simple, token facts, more good graphs [[OpenAI24tokensWhatHowCount|What are tokens and how to count them?]]
- initial tokens [[3Blue1Brown24visAttenTransfrmr#^d95f61|also embed position]] (GPT 3.5, I think)
- [[Karpathy24buildGPTtokenizer|Let's build the GPT Tokenizer]]
#### Transformer intro

- Said to have advanced LM research by 2 years: [[Ho24algoProgressLLM|Algorithmic Progress in Language Models]]
- Something like [[3Blue1Brown24WvizIntroGPTtransfrmr|3Blue2Brown's]] showing all the kinds of transformers.  But I should add all the ones I've collected too.
- What problems the layers solve
	- model params are "parametric memory" [[Wiggers24hallucRAGwontSolve]], a kind of compression 
	- "By virtue of being forced to compress human languages, they've become reasoning engines."  [[Scarfe24bishopNewDpLrnBk]]
- Go through the steps, starting w/ one-shot --> word2vec --> explain that magic, then compare w/ GPT3 or 4 embeddings...
- continue...
- [ ] come up w/ sentences showing the many distinct ways that context changes meaning ([[3Blue1Brown24visAttenTransfrmr#^57ca78|see here]])
- ending: 
	- some say this replaces all specialized networks.  Treat all perceptions and language (tokens).  See [[ArtOfTheProblem23ChatGPT30Year#^2cdc0d|this]].
	- glorious profundity about line between real and simulated thought disappearing
	- Then: continue with a bare slide with "The I in LLM stands for intelligence".  Silence.  Then say, "Some users are less uncertain about what it all means"  Continue with errors.
#### Sources for transformers
- [x] [[3Blue1Brown24WvizIntroGPTtransfrmr|But what is a GPT?  Visual intro to transformers | Chapter 5, Deep Learning]]
- [x] [[3Blue1Brown24visAttenTransfrmr|Visualizing Attention, a Transformer's Heart | Chapter 6, Deep Learning]]
- [[SwimmTeam24TransfrmrBasics7Models|Transformer Model: The Basics and 7 Models You Should Know]]
- [[Alammar18illustratedTransformer|The Illustrated Transformer]]
- [ ] [[Vaswani17AttentionAllYou|Attention is all you need]] and stuff linked to it.
- [ ] [[Lawton23transformerNNshakeAI|Transformer neural networks are shaking up AI]]
- Great graphic showing that almost all LLMs are transformers (non-gray): [Different development paths of LLMs](zotero://select/library/items/NB8W5BEQ)
- some transformer relations are linear: [Linearity of Relation Decoding in Transformer Language Models](zotero://select/library/items/DVGHCSKL)
- [[Nassar22tableFormerStructTransfrmr|Tableformer: Table structure understanding with transformers]]
- [[Gueddari23decOnlyGenAI|The Dual Worlds of Decoder-only Transformers: Training vs. Inference]]
- [[Gill23typesGenAItrainEval|Types of Generative AI Models]]
- Graphic: attention layer shrinks network: [[ArtOfTheProblem23ChatGPT30Year#^aa352a|shrink slide]]
- Graphic: [[ArtOfTheProblem23ChatGPT30Year#^611d0c|river bank attention slide]]
- [ ] what is the error metric when training transformers?
- [ ] how does it decide to stop generating next words?
- [ ] how does nth next token get fed back to predict (n+1)th token?
	- embedding generated from softmax token ID?
	- how are new weights generated to connect it to the rest of the context?
## OpenAI's GPT
- [ ] [[James23ChatGPT4howWorks|Chat-GPT4: How it Works –]]
- [[OpenAI24gptsVsAssistants|GPTs vs Assistants]]
- [[OpenAI24pricing]]
- Good GPT evolution info in [[ArtOfTheProblem23ChatGPT30Year|ChatGPT: 30 Year History]]
### Alternatives to Transformers
#### MAMBA
- [[Gen AI responses to Gen AI questions#Gemini compare mamba and transformers|Gemini compare mamba and transformers]]
- [[Gen AI responses to Gen AI questions#Copilot compare mamba and transformers|Copilot compare mamba and transformers]]
- [What is Mamba and can it beat Transformers?](zotero://select/library/items/FSSVP76C)
- [Mamba (Transformer Alternative)](zotero://select/library/items/FPFG4DN9)
- [A Visual Guide to Mamba and State Space Models](zotero://select/library/items/XH5SFJAB)
- [Mamba - a replacement for Transformers?](zotero://select/library/items/TIEA4D5B)
- original paper: [Mamba](zotero://select/library/items/HSC7WLEW)
- net folklore?: [[D] So, Mamba vs. Transformers... is the hype real?](zotero://select/library/items/EDVMUHKV)
- [Mamba](zotero://select/library/items/GNJEMJ3Q)
- [Repeat After Me](zotero://select/library/items/MFVLI3UX)
#### Interactive AI ^8a459a
- [Meta’s Yann LeCun Wants to Ditch Generative AI](zotero://select/library/items/SUISKUY6)
- This is what [DeepMind’s cofounder](zotero://select/library/items/9WP87AF4) thinks is next: [How Interactive AI is the Next Phase of Generative AI](zotero://select/library/items/JXKSR2UN)
- [ ] But don't his ideas still use "generative" AI?
- example? 
	- [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
	- [[Chu24householdRobotCommonSense|Engineering household robots to have a little common sense]]
		- orig paper for above: [[Wang23GroundingLangPlanCtrFact|Grounding Language Plans in Demonstrations Through Counter-Factual Perturbations]]
	- [AutoDev](zotero://select/library/items/59T9XG2D)
	- [Combining human expertise with artificial intelligence](zotero://select/library/items/HC4WACWJ)
- Funny interactive AI image sequence
	- [[Graphics to Borrow#GIF Robot gets advice, whether it wants it or not]]
	- [[Graphics to Borrow#GIF Robot gets stumped, asks questions and follows advice]]
### Generative Adversarial Nets (GAN) (is the an "alternative to Transformers")
- [Generative Adversarial Networks and Adversarial Autoencoders: Tutorial](zotero://select/library/items/EHI49UP7)
- [What are Generative Adversarial Networks (GANs)](zotero://select/library/items/JYTN8AV9)
- [A Gentle Introduction to Generative Adversarial Networks (GANs)](zotero://select/library/items/UX2E37Y6)
- [Generative Adversarial Networks and Adversarial Autoencoders](zotero://select/library/items/EHI49UP7)
- GANs in google Pixel phone products (I think): [Google Research, 2022 & beyond: Language, vision and generative models](zotero://select/library/items/SHH9BZL7)
- [A time-series Wasserstein GAN method for state-of-charge estimation of lithium-ion batteries](zotero://select/library/items/RFZBFH48)
- [[Graphics to Borrow#GAN and Var. AutoEnc]]
### Stable Diffusion Models
- [ ] [DLAI - How Diffusion Models Work](https://learn.deeplearning.ai/courses/diffusion-models/lesson/1/introduction)
- [ ] get more out of zotero
- Stable diffusion images: [[Hataya23genAIcorruptData|Will Large-scale Generative Models Corrupt]]
- Show car genAI/cfd example of some other thing, since I think it's supposed to be stable diffusion
- Flow matching is "diffusion 3": [Flow Matching for Generative Modeling (Paper Explained) - YouTube](https://www.youtube.com/watch?v=7NNxK3CqaDk)
## Human Impacts of AI

- [ ] Flesh out genAI impacts in my notes to: [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
### AI vs. Human Performance

- “we are really far from human intelligence”: [[Cao24leCunCatSmarterThanAI]]
- super human in ~20-20yrs? [[Cao24leCunCatSmarterThanAI]]
- [[Graphics to Borrow#Benchmark performance vs. Humans]]
- AI beats humans on image classification, visual reasoning, English understanding: [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
- Trails on competition-level math, visual commonsense reasoning, planning [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
- bridge gap between low and high skill workers i.e., I suppose, that it de-skills both of their jobs  [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
- mainly cheaper: [[Barousse24dataAnlystGPT4Outperf|Study: GPT-4 outperforms Data Analysts]]
- comparable in predicting chemistry: [[Lu24AnalysisPredictionSCR|Analysis and prediction in SCR]]
- [[Rein23GPQAbenchmrkGradLevGglePrf|GPQA: A Graduate-Level Google-Proof Q&A Benchmark]] tough: Best LLM score was 41.5 (GemniPro 1.5); human-experts: 65; highly skilled non-experts w/ 30 mins web time: 34
- Quote: machine IQ > human IQ “not in the next 10 years or longer” [[Wodecki24yannLeCunDitchGenAI]]
- But AI can read way more: would take a human 20k years to read current LLM training data [[LeCun24animalSmarterLessDat]] and 170 k for all available [[LeCun24child50xMoreDat]], and "all" is planned [[Villalobos22outOfDataLLM]])
	- Yet... LLMs don't take in visual data like humans see [[LeCun24child50xMoreDat]]
	- note: LLMs help video but I found nothing about video data helping LLMs answer text questions
- Animals get way smarter w/ less data [[LeCun24animalSmarterLessDat]]
- Connections [[Cao24leCunCatSmarterThanAI]]
	- number: 
		- GPT4 has ~ 1.75 T params [[Cao24leCunCatSmarterThanAI]]
		- Human 100 T connections [[Caruso23mapBrainConnections]]
	- Efficiency: AI not as smart as a house cat but # params ~ # house cat connection
### AI helping Human Performance
- improves human performance if used properly:  [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
	- several 2023 studies
    - improve task speed, quality
    - bridge gap between low and high skill workers i.e., I suppose, that it de-skills both of their jobs
### AI and Human Creativity?

- whole society knowledge is a mixture of gaussians
	- we are each a little gaussian
	- LLMs are like a noisy mixture of those gaussians
		- some stuff missed
		- some stuff is garbage (hallucinations)
		- but your little gaussian can be expanded way beyond what humans used to have access to.
			- some evidence of increased creativity
		- some is true and humans have never thought of it: materials synthesis, some math?
	- But LLMs have a smaller mixture that all humans, tend to narrow it down 
		- ("delve" example) (verbs)
		- Then show its the same in peer review: 
			- hilarious parallel adjective word freq graph of adjectives!  [[Liang24chatGPTpeerReview]]
			- [[SinghChawla24chatGPTpeerReviewNature|Is ChatGPT corrupting peer review?]]. For the title?
		- legal monoculture in Dahl24
		- subtle reasoning is rare, not in training data
		- some instance where lower creativity but workmanlike
		- experienced people not rewarded
- Or, do the above with Venn diagrams
- LLM output as an anti-pattern (job recommendations); and as a template (DEI statement)
#### Won't you just grab AI and lose your creativity
- [[Bogost24aiLostMagic|AI Has Lost Its Magic]]: funny poems, pictures but now bored
- [[Bogost23endRecommendLttrs|The End of Recommendation Letters]]. techniques for anti & pro-cliche diversity boilerplate
#### LLMs and plagiarism
- When I've checked to source, I often see that copilot puts an exact or near-exact copy of its source into your prompt.  I don't know if that would make you legally liable, but you probably wouldn't want that regardless of what the law is.
- RAG reduces risk of plagiarism/copyright infringement: [[Wiggers24hallucRAGwontSolve|Why RAG won't solve generative AI's hallucination problem]]
#### Misinformation
- [[US Elections 2024#Political AI background|Political AI background]]
#### Destroying News Media businesses
- Bloomberg pessimist optimism: Micklethwait25journalismAIadapt
## Kinds of Errors
- while demoing chatGPT, veer into a Hitler thing, but then say, "Na, I won't...  the problem with this is that it's an unconstrained problem.  It's in infinite question space and... I'll talk about that later   
- [[__temp__Smart Crow Analogy]] ?
- And this is why there's more value in limited scope problems, like "... and then move on to limited scope problems e.g. coding, forecasting, etc.  (note that forecasting still better w/ smaller models).  
- And that could be a segue to training data and power consumption. 
### Hallucinations ^a59132
#### Intro
They're trained as to match distributions, not exact facts.  So, you might roll a dice and get a 4.  Four is a fact.  It's what happened.  LLMs learn the dice.  They roll it, and if they don't get a 4, in some sense, they're not wrong.  In their worlds, there really are alternate facts.  **TODO**: make sure this is true, reread the article where the guy said they're simply not trained to produce facts.
#### Points and references
- weird images
- strange conversations
- no hallucinations IF YOU PUT THE NECESSARY GUARDRAILS IN PLACE (funny CYA): [Predictive Maintenance and Generative AI](zotero://select/library/items/895HTTKV)
- hideous houses vs. cookiecutter: [This AI Architect Will Design Your Climate-Friendly Dream Home](zotero://select/library/items/9VEDJWKH)
> “We realized when you turn hallucination to zero, you get the most offensive version of cookie-cutter developments,” Ballard says. “You actually need a little bit of hallucination to get 3D-printed tree houses.” The key is balancing creativity against what can practically be built. “You can’t hallucinate construction budgets,” he quips.
- [errors](obsidian://advanced-uri?vault=Obsidian%20Share%20Vault&filepath=work%252FGenerative%2520AI%2520talk%252FIdeas%2520for%2520Gen%2520AI%2520talk.md&block=slsv7g)
- Pluses & Minuses, causes, tips: [[Lacy24genAIwhyHallucinate|Hallucinations: Why AI Makes Stuff Up]]
- Eliminating hallucinations series: Wood24elimHallucinations1
- [[Lacy24genAIwhyHallucinate|Lacy24: Hallucinations: Why AI Makes Stuff]] 

### Errors ^slsv7g
- [Gen AI irony productivity loss mediation](zotero://select/library/items/75S79XRB)
- [Generative AI and accuracy in the history of mathematics](zotero://select/library/items/6XAVUJJF)
- [Autonomous Agent GPT4](zotero://select/library/items/KGKMANEE) has list of potential errors
- [Disturbing Images Copilot](zotero://select/library/items/9BQPPXHV)
- [[Errors -- Bing Copilot and Google Gemni]]
	- price curve errors
	- funny US/Canada GDP/capita errors
- versatile robot drops v.s. narrow robot repeatability : [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- [[#^Reality-constraining AI types keep LLMs real|Reality-constraining AI types keep LLMs real]] ^65cc24
- [Hallucinations](obsidian://advanced-uri?vault=Obsidian%20Share%20Vault&filepath=work%252FGenerative%2520AI%2520talk%252FIdeas%2520for%2520Gen%2520AI%2520talk.md&block=a59132)
- But GPT-4 not great at this? [[Liu24canLLMstatCausalRsn|Are LLMs Capable of Data-based stat causal]]
- [[Guimaraes24whatPretrainedLLMknow|Pre-trained language models: What do they know?]]
- [[Kapoor24AISnakeOil|Kapoor24: AI Snake Oil]]: website that collects AI errors
## Don't LLM's just grab already generated human knowledge?  Do they invent anything?
- are those molecule search algorithms generative?
- examples of generative AI invention that is not hallucination?
- mainly cheaper: [[Barousse24dataAnlystGPT4Outperf|Study: GPT-4 outperforms Data Analysts]]
- comparable in predicting chemistry: [[Lu24AnalysisPredictionSCR|Analysis and prediction in SCR]]
- [[Sadowski23habsburgAI|Habsburg AI]]
- From  [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
	- AlphaDev: efficient algorithmic sorting: 1st update in LLVM stdC++ in 10 years, designed with reinforcement learning
    - GNoME: helps materials study
- draws new conclusions by reading scientific papers
	- Tshitoyan19wordEmbedScienceKwldg : materials science
## Moral problems w/ AI
- Many societal concerns but I'll stick to practical concerns here
- Still, genAI is like a new medical treatment, and we need to be aware of and consider the side effects. (or a new chemical?)
- A new airplane that has to be flight tested?
## Things genAI can't do yet
- not planning or tooling or [[#Agents|Agents]]-based behavior [[__temp__Kilcher24mlNewsYouTube240402]]
- [Autonomous Agent GPT4](zotero://select/library/items/KGKMANEE): or maybe it can do it?  Hilarious that this doc is actually written by chatGPT from the source code (as written in the doc itself)

## Reality-constraining AI types keep LLMs real, constrain generic LLMS
### could do this here
- while demoing chatGPT, veer into a Hitler thing, but then say, "Na, I won't...  the problem with this is that it's an unconstrained problem.  It's in infinite question space and... I'll talk about that later   
- [[__temp__Smart Crow Analogy]] ?
- And this is why there's more value in limited scope problems, like "... and then move on to limited scope problems e.g. coding, forecasting, etc.  (note that forecasting still better w/ smaller models).  
- And that could be a segue to training data and power consumption
### Why don't work: action is limited scope
- general LLM to broad much stuff now limited, good quotes: [ChatGPT and Google Gemini Are Both Doomed](zotero://select/library/items/35FPBL5K)
- [[__temp__Smart Crow Analogy]] ?
- [[#^61ec31|physics informed ML]]
- [[#^5d5a93|physics aware genAI]]
- [[#^8dc8d8|RAG]]
- [ ] Causal AI (collect causal stuff from here, zotero, and Brave tab group (if there's anything there))
	- But GPT-4 not great at this? [[Liu24canLLMstatCausalRsn|Are LLMs Capable of Data-based stat causal]]
- [ ] find some funny non-physically realizable genAI images
#### Look up methods mentioned in  [[Lacy24genAIwhyHallucinate|Hallucinations: Why AI Makes Stuff Up]]
GenAI Responses: [[Gen AI responses to Gen AI questions#Grounding, Fine-Tuning, Steering]]
##### grounding
- [[Wang23GroundingLangPlanCtrFact|Grounding Language Plans in Demonstrations Through Counter-Factual Perturbations]]
- notebooklm.googl.com is "source grounded AI" [[Forte24googleNotebookLM#Chat w/ uploaded documents (source grounded AI)]]
- Your docs are the source: [[Novis23ObsidianChatGPT|Obsidian plus ChatGPT Webinar]]
##### fine-tuning
- [[Junco24fineTuningAIpower|The Power Of Fine-Tuning In Generative AI]]
- easier to fine tune? [[Keen23openSourceLLMs|Should You Use Open Source Large Language Models?]]
- evidence that opensource has less diverse tune data, is overtrained: [[Jain24liveCodeBenchLeaderboard|LiveCodeBench Leaderboard]]
- [ ] is this genAI? [[Chou23NovelFineTuningModel|A Novel Fine-Tuning Model Based on Transfer Learning for Future Capacity Prediction of Lithium-Ion Batteries]]
- Fine tuning typically < 1% full tune cost; 5-10X better for same investment (nonstate actors!): [[Davidson23improveAInoExpensTrain|AI capabilities can be significantly]]
- Use extremely good example of [[Davidson23improveAInoExpensTrain#InstructGPT]] and the [[Graphics to Borrow#Fine Turning Algorithms]] graph (Figure 2) 
- Adjust either weights or reps, low subspace or not: [[Wu24fineLLMtuneReFTR|ReFT: Representation Finetuning for Language]] 
- "fine tuning?" soft prompts / prompt tuning: [[Toloka23optTechniqueLLM]]
- Fine tuning in model building process & data [[Thewhitebox24llmBackboneAI#Thewhitebox24llmBackboneAI.pdf page=7&annotation=60R Supervised Fine-Tuning|Supervised Fine Tuning]]
##### steering
- [[#prompts and prompt engineering|prompts and prompt engineering]] is a kind of steering
- [[Konen24StyleVectorsSteering|Style Vectors for Steering Generative Large Language Model]]
## Adapting LLM to use case
- [[#^65cc24|Reality-constraining AI types keep LLMs real, constrain generic LLMS]]
- [[Graphics to Borrow#Finetune LLM vs. Knowledge base|Finetune LLM vs. Knowledge base]]
- [[#^8dc8d8|Retrieval Augmented Generation (RAG)]]
- [[Graphics to Borrow#^e719b4|LORA adaptation]]: low count parameter LLM tuning
- longer/comp intensive than LSTM; traditional tricks reduce complexity [Transformers for Time-Series Data](zotero://select/library/items/TKZWMNCE)
- constrain the problem, good quotes: [ChatGPT and Google Gemini Are Both Doomed](zotero://select/library/items/35FPBL5K)
## Open Source LLMs
- [Different development paths of LLMs](zotero://select/library/items/NB8W5BEQ): lower right corner of tree graphic shows open vs. closed source
- [[Keen23openSourceLLMs|Should You Use Open Source Large Language Models?]]
- Best open source is huge Chinese: [[Rodriguez24Edge386YiChnLLM|Edge 386: Inside Yi, 01's]]
- [[Morrison24ClaudeTopGPT4|Only 3 of 20 LLMs on Chatbot Arena leaderboard]] are open sourced.
- Meta's Llama3 is [[Morrison24ClaudeTopGPT4|expected in leaderboard top 10]], is open source, soon to be released
- [[Morrison24ClaudeTopGPT4|Some (?) movement towards]] open sourced, decentralized AI
- [[Chen24areOpenSrcLLMcatchUp|ChatGPT's One-year Anniversary: Are Open-Source Catching Up]]
- evidence that opensource has less diverse tune data, is overtrained: [[Jain24liveCodeBenchLeaderboard|LiveCodeBench Leaderboard]]
- [ ] discuss: open source vs. open weights models.
## Small large language models
- use less power?
- need less data?
- can run in-house
- can be [[Morrison24ClaudeTopGPT4|faster]]
- privacy: your data stays internal
- not a global single point of failure
- small LLM: 6 J/token; response ~2 kJ/response: [From words to watts](zotero://select/library/items/M5PCBTQJ)
- graph of many small, open source LLMs: [Different development paths of LLMs](zotero://select/library/items/NB8W5BEQ)
- Hugging face security risks: [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- Good results from cheap models: [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- Open source (small too?) LLMs [[Morrison24ClaudeTopGPT4|becoming more prominent]] on Chatbot Arena leaderboard
- "local size" Claude 3 has "impressive" (#7 ranking) performance [[Morrison24ClaudeTopGPT4|w/o trillions of prams]]
- download and run LLMs on your local computer: [[LMStudio24LMStudioDiscover|LM Studio - Discover and run local LLMs]]
## Vector Databases
- Graphic: [[Graphics to Borrow#Vector Databases]]
- [ ] [[Monigatti23vectorDBprotoToProd|From prototype to production: Vectedbemor databases in generative AI applications]]
- [ ] [[Taipalus24vectorDBfundamental|Vector database management systems: Fundamental concepts, use-cases, and current challenges]]
- [ ] [[Exxact24vecDBllmGenAIdpLrn|Vector Database used in AI | Exxact Blog]]
- [ ] [[Krishnamoorthy23roleVecDBgenAI|The role of vector datastores in generative AI applications | AWS Database Blog]]
## Safety
- [The Terrifying A.I. Scam That Uses Your Loved One’s Voice](zotero://select/library/items/LMXB6Y8A): cloned voice ransom
	- [[#^cuop|Open AI voice clone]]
- OK when robot drop OK, ow not: [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- "Generative AI Alone Cannot be Trusted with Decision-Making": [Causal AI &amp; Gen AI Synergies | causaLens](zotero://select/library/items/R5FX68SQ)
- news fact checking: [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
- Hugging Face security risks: [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- Hackers add risk to Hugging Face: [AI bots hallucinate software packages and devs download them](zotero://select/library/items/M74EEZR9)
- EU [Artificial Intelligence Act](zotero://select/library/items/MHF9CJG8) gets [high marks](zotero://select/library/items/S6W8C8MH) from IBM AI VP.
- [[Morrison24ClaudeTopGPT4|Some (?) movement towards]] open sourced, decentralized AI (non-single-point-of-failure, I say)
- Attack by repetition in large context: [[Anthropic24manyShotJailbreak|Many-shot jailbreaking]]
- [[Cahyawijaya24humanValuesVecLLM|High-Dimension Human Value Representation in]]
## Chain of Thought Reasoning
- That Sunglass Swiss Guy's YouTube video
- [[Brubaker24ChainofThoughtLLM|How Chain-of-Thought Reasoning Helps Neural Networks Compute]]
- [[Lu24AnalysisPredictionSCR|Analysis and prediction in SCR experiments using GPT-4 with an effective chain-of-thought prompting strategy]]
## Physics-aware genAI ^5d5a93
- [This AI Architect Will Design Your Climate-Friendly Dream Home](zotero://select/library/items/9VEDJWKH)
- [A.I. Is Learning What It Means to Be Alive](zotero://select/library/items/LS9EU2IM) biodmed research: heart treatment, developmental bio, cellID 
- [Using generative AI to improve software testing](zotero://select/library/items/TFAA7VRT): weather, I think.  test patterns.  Future grid sims?
- RFM: Robot Foundation Model: [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- RFM (more details): [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- [Physics Informed Machine Learning](zotero://select/library/items/HMLAXBHI) ^61ec31
- Drug design (several references to put here)
## Copyright infringement --> patent infringement?
- [ ] add notes from articles I've stored in zotero
## explain leaderboards
- [generative ai leaderboards - Google Search](https://www.google.com/search?q=generative+ai+leaderboards&sca_esv=9407a31d1b022749&sca_upv=1&sxsrf=ACQVn09FuRqFLTUMiu0e-K1j1ZxKa75M7g%3A1709598884479&ei=pGjmZZToHJKU0PEP47aesAc&ved=0ahUKEwiUyt6R8NuEAxUSCjQIHWObB3YQ4dUDCBA&uact=5&oq=generative+ai+leaderboards&gs_lp=Egxnd3Mtd2l6LXNlcnAiGmdlbmVyYXRpdmUgYWkgbGVhZGVyYm9hcmRzMgYQABgWGB4yCxAAGIAEGIoFGIYDMgsQABiABBiKBRiGAzILEAAYgAQYigUYhgMyCxAAGIAEGIoFGIYDSLJAUOgGWJc_cAV4AZABApgBbKAB6BeqAQQ0Ni4yuAEDyAEA-AEBmAIjoAK8D6gCEsICChAAGEcY1gQYsAPCAgoQIxiABBiKBRgnwgIKEAAYgAQYFBiHAsICBRAAGIAEwgIHECMY6gIYJ8ICFBAAGIAEGOMEGOkEGOoCGLQC2AEBwgIEECMYJ8ICCxAAGIAEGIoFGJECwgIOEC4YgAQYsQMYxwEY0QPCAhEQLhiABBixAxiDARjHARjRA8ICCBAAGIAEGLEDwgILEAAYgAQYsQMYgwHCAgsQLhiABBixAxiDAcICChAAGIAEGIoFGEPCAg0QABiABBiKBRhDGLEDwgIQEC4YgAQYigUYQxixAxiDAcICERAuGIMBGMcBGLEDGNEDGIAEwgIREAAYgAQYigUYkQIYsQMYgwHCAg0QLhiABBiKBRhDGLEDwgIFEC4YgATCAgsQLhiABBjHARjRA8ICCBAuGIAEGLEDwgIOEAAYgAQYigUYkQIYsQOYAwmIBgGQBgi6BgYIARABGAGSBwIzNaAHwKcE&sclient=gws-wiz-serp)
- MLENGERY Leaderboard: [[Chowdhury24evalAIpowerUse|Power-hungry AI: Researchers evaluate energy]]
- [Should You Use Open Source Large Language Models?](zotero://select/library/items/3H78SQYY)
- human scored: [[Imsys24LMSysChatbotArena|Chatbot Arena leaderboard]]
- [[Hughes23VectaraHallucLdrBrd|Vectara Hallucination Leaderboard]]
- [[HuggingFace24leaderboardMTEB|MTEB Leaderboard - a Hugging Face]]
- [[Imsys24LMSysChatbotArena|LMSys Chatbot Arena Leaderboard]] is scored by humans comparing pairs of LLM responses
- Big list of leaderboards/benchmarks: [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
- AI grade inflation: I have a few cites on this: one mentioned by kirschner (legal examps, I may have the original paper); one talking about train/test overlap; one from HAI 24, saying problems w/ benchmarks
- But [[Jain24liveCodeBenchLeaderboard|LiveCodeBench Leaderboard]]: for coding, avoids test/train contamination
- ==get function calling database in here==
- Lack of standardized quality reporting makes it hard to compare risks and limitations [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
## AI data self-pollution
- [[Sadowski23habsburgAI|Habsburg AI]]
- Stable diffusion images: [[Hataya23genAIcorruptData|Will Large-scale Generative Models Corrupt]]la
- LLM text: [[Guo23CuriousDeclineLLM|The Curious Decline of Linguistic]]
- Yes, good headline: [[SinghChawla24chatGPTpeerReviewNature|Is ChatGPT corrupting peer review?]]
- [[Liang24chatGPTpeerReview|Monitoring AI-Modified Content at Scale: A Case Study on the Impact of ChatGPT on AI Conference Peer Reviews]]
- [[Jain24liveCodeBenchLeaderboard|LiveCodeBench Leaderboard]]: for coding, avoids test/train contamination
- [[Schaeffer23trainOnTestAllNeed]]
## prompts and prompt engineering
- what are they?
	- funny examples: [The Unreasonable Effectiveness of Eccentric Automatic Prompts](zotero://select/library/items/F2QD3F4D)
- autoprompt designer
- it's going away as a job
- [Prompt Engineering is Dead](zotero://select/library/items/XH3WDMV9): autotune better than human, but new LLMOPS job for productization
- [The Unreasonable Effectiveness of Eccentric Automatic Prompts](zotero://select/library/items/F2QD3F4D)
- [DSPy](zotero://select/library/items/R3W7XAXS): self-tuning prompt
	- [DSPy — Does It Live Up To The Hype?](zotero://select/library/items/GF2WZ4R5)
- [Pick-a-Pic](zotero://select/library/items/9SVS5A3Z): metric for picking higher qual images.  Crowd sourced (?)
- [Mastering LLM Techniques: LLMOPs](zotero://select/library/items/VN4CSK4M):  The new MLOPS!
- Gemini's "select text in response and do something with it" (like make it longer) is a specific kind of prompt, I think.  Also [[#steering|steering]].
- [[Bhargava24controlTheoryLLM|LLM Control Theory: What's the magic word?  A Control Theory of LLM Prompting]]
- related [[Cahyawijaya24humanValuesVecLLM|High-Dimension Human Value Representation in]]
- System Prompt
	- Anthropic's [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
	- A collection of them: [ChatGPT-AutoExpert/System Prompts.md at main · spdustin/ChatGPT-AutoExpert](zotero://select/library/items/IS8V936D)
	- Explanation: [DALL-E 3&#39;s system prompt reveals OpenAI&#39;s rules for AI image generation](zotero://select/library/items/B3WM6QSP)    
	- Explains system prompt: [DALL-E 3&#39;s system prompt reveals OpenAI&#39;s rules for AI image generation](zotero://select/library/items/B3WM6QSP)
	- force rules for predictive maintenance: [Predictive Maintenance and Generative AI](zotero://select/library/items/895HTTKV)
	- [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
	- [ChatGPT-AutoExpert/System Prompts.md at main · spdustin/ChatGPT-AutoExpert](zotero://select/library/items/IS8V936D)
	- Maybe? [DSPy](zotero://select/library/items/R3W7XAXS)
	- [[Aster24langChainSQLagent|LangChain SQL Agent for Massive Documents Interaction]]
	- Get new info part of RAG "system prompt": [What is Retrieval-Augmented Generation (RAG)?](zotero://select/library/items/RAJPEG5Y)
	- [[Novis23ObsidianChatGPT|Obsidian plus ChatGPT Webinar]]: system prompts for language learning.kar
- [[Brubaker24ChainofThoughtLLM|How Chain-of-Thought Reasoning Helps Neural Networks Compute]]
- Hallucination test: big changes to small changes in prompt:  [[Lacy24genAIwhyHallucinate|Hallucinations: Why AI Makes Stuff Up]]
- Prompts as control system input: [[Bhargava24controlTheoryLLM|LLM Control Theory Seminar]]
- soft prompts / prompt tuning: [[Toloka23optTechniqueLLM]]
## how much data they need [[#^ee895c|training data requirements]]

From [[Key Trends and Figures in Machine Learning]]:
- year most public high-quality human data will be used in some training run: 2024! (or 2026 somewhere else)
- will we run out of training data?  “Yes?”  I need to read the linked-to paper
    - largest training set known (DBRX): 9 trillion words
    - internet data: 100T words
    - From [[Villalobos22outOfDataLLM|Will we run out of data? An analysis of the limits of scaling datasets in Machine Learning]], at the current usage rate:
        - high quality text: 2026
        - low quality text/images as early as 2030
        - data efficiency must "drastically improve"
For optimal results, need 20 tokens/param (page says it’s chinchilla scaling laws, and to see Hoffmann 2022, which doesn’t give this ### in its abstract). [[Epoch23MachineLearningTrends|Key Trends and Figures in]] Also, there's something newer.
- LMMS have so far seen a tiny amount of the data we see, and it's mainly text:
	- “a child has seen 50 times more data than the LLMs that are trained on the totality of
     text that is perfectly available,” [[Wodecki24yannLeCunDitchGenAI]]
# Mixture of Experts, Model Blending and Agents

See [[Gen AI responses to Gen AI questions#Mixture of Experts vs Model Blending vs Agents]]

## Mixture of experts
- Use only dynamically selected tokens during inference: [[Raposo24mixDepthCmputTrnsfrmrLLM|Mixture-of-Depths: Dynamically allocating compute in]]
## Model Blending (merging)
- I'll have a bit of this in Zotero
## Agents
- Another TechWithTim: Coding Agent: [Python Advanced AI Agent Tutorial - LlamaIndex, Ollama and Multi-LLM! 
- not planning or tooling or [[#Agents|Agents]]-based behavior [[Kilcher24mlNewsYouTube240402
- [LangChain SQL Agent for Massive Documents Interaction](zotero://select/library/items/HPF7UE9N)
- Agents plan, iterate, even in committees: [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- [AutoDev](zotero://select/library/items/59T9XG2D)
- [[Li24PersonalLLMAgents|Personal LLM Agents: Insights and Survey about the Capability, Efficiency and Security]]
- [[TechWithTim24pythonRAGtutorial|ADVANCED Python AI Agent Tutorial - using RAG]] 
- PDF SQL DB embedding: [[Aster24langChainSQLagent|LangChain SQL Agent for Massive Documents Interaction]]
- Agents better than Zero-shot (good programming graphic): [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- [Crew AI](https://www.crewai.com/) software for creating agents, recommended [here](https://www.youtube.com/watch?v=kJvXT25LkwA)
- [Task-driven Autonomous Agent Utilizing GPT-4, Pinecone, and LangChain for Diverse Applications](zotero://select/library/items/KGKMANEE)
- [Autonomous Agent GPT4](zotero://select/library/items/KGKMANEE) has list of potential errors. Hilarious that this doc is actually written by chatGPT from the source code (as written in the doc itself)
- [[#Things genAI can't do yet|Things genAI can't do yet]]: one is said to be agents
- Agent? [[Barousse24dataAnlystGPT4Outperf|Study: GPT-4 outperforms Data Analysts]]
- video w/ plausibly readable paper [[Lucek24test5LLMagents|Breaking Down & Testing FIVE LLM Agent]]
- Quote [[Sutton19bitterLesson]]:
   We want AI agents that can discover like we can, not which contain what we have discovered.  Building in our discoveries only makes it harder to see how the discovering process can be done.
# Organizational Efficiency
- [[Tyrangiel23smartBanksAI|AI is making the world’s biggest banks much smarter]]: 17M clients/16P data.  1000's of rules; contradictory/redundant ones removed (60% total).  Credit decisions.
- Many likely opportunities in gov't: [[Tyrangiel24aiRemakeUSgovt|Let AI remake the whole U.S. government (oh, and save the country)]]
# genAI costs
## Money costs
- [Foundation model](zotero://select/library/items/S8SIJXT4) says $100's of millions but I'm not sure where it got that
- [Artificial Intelligence Index Report 2023](zotero://select/library/items/VRMK5T9Q) good graph
- Cost vs. performance: [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
- Huge investments & data source for a nice graphic slide: [Generative AI is driving tech heavyweights to invest billions of dollars in startups](zotero://select/library/items/6GKCX492)
- $150B/15 yrs, largely AI: [Amazon bets $150 billion on data centers required for AI boom](zotero://select/library/items/LWDNWF3S)
- [[Schreiner23GPT4ArchitectureDatasets|GPT-4 architecture, datasets, costs and more leaked]]
	- 1.8 T params (10Xincrease); $63 M train; inference 3X more (128 GPU cluster )
- spend increased 5X over 2022-2023, $22B in 2023 [[Birch24genAIwasteTimeMoney]]
- [[OpenAI24pricing]]
- Gemini Ultra took, $630M to develop (all costs): [[Epoch23MachineLearningTrends|Key Trends and Figures in]]
- It likely used the most train compute too:  [[Epoch24trainComputeVsTime|Training Compute of Notable machine learning Systems Over Time]]
- JP Morgan has spent hundreds of millions, compared to $1.5B in 2022 profits.  Picking stocks, credit decisions, faut detection, personalization, operations efficiency (1000s of rules, some redundant, some contradictory were reduced by 60%), trading [[Tyrangiel23smartBanksAI|AI is making the world’s biggest banks much smarter]]
- Training costs: GPT-4: $78M; Gemini Ultra: $191M [[HAI24AIIndexReport|Artificial Intelligence Index Report 2024]]
- [[OpenAI24pricing]]
- fit this somewhere? [[Jin24IstartupShwrCashNoBiz|Investors Are Showering AI Startups With Cash. One Problem: They Don’t Have Much of a Business]]
	- [[Graphics to Borrow#AI Bubble]]
	
## Compute costs
- Meta's (small, open source) Llama3 is [[Morrison24ClaudeTopGPT4|trained on 300K Nvidia H100 GPUs]], is open source, soon to be released
- Training tokens approx 3X more compute-expensive than inference tokens: [[Erdil24optimAllocInfrncTrn|Optimally Allocating Compute Between Inference]]
- Modern LLMs trained on approx 10T tokens: [[Erdil24optimAllocInfrncTrn|Optimally Allocating Compute Between Inference]]
- Table showing how to reduce inference costs: [[Erdil24optimAllocInfrncTrn|Optimally Allocating Compute Between Inference]]
- Chinchilla scaling advanced LLM by 8-16 months: [[Ho24algoProgressLLM|Algorithmic Progress in Language Models]]
- Use only dynamically selected tokens during inference: [[Raposo24mixDepthCmputTrnsfrmrLLM|Mixture-of-Depths: Dynamically allocating compute in]]
- Exponential growth in train compute time, with sharp knee in 2010 at the start of deep learning.  Pre, it was ~1.4X/yr; now it’s about 4.1X/yr. slighly differnt simpler graph in [[Epoch24trainComputeVsTime|Training Compute of Notable machine]]
- Big Knees in FLOPS vs. time @ daip learning boundary; another at LLM boundary
	- Graphic: [[Graphics to Borrow#Training Compute Flops 1950-2023 (3?)]] from [[Sevilla22ComputeTrendsThree]]
- Final summary
	Something like:  Why are they doing this?  We want stuff that think like humans think.  Isn't this brute force approach kind of dumb?  This is what one of the founders, Yann LeCunn we need to change something, but not how much data it requires [[Wodecki24yannLeCunDitchGenAI]]
	
	Story about that Vietnamese guy saying everybody's wasting time at the NIST speech conference way back when
	
	Bring up [[Sutton19bitterLesson|The Bitter Lesson]]:
	- "building in how we think we think does not work in the long run", increasingly massive compute power and general learning algorithms always win (examples in chess, Go, computer vision, and speech recognition: *which I can personally vouch for*
- So the big AI players are really going with this and buying as much compute as they can as fast as they can.
## Training data costs ^ee895c
- I've got way more on this, maybe under [[#genAI costs|genAI costs]] or [[#energy use|energy use]]
- took years to gather for robot: [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- hundreds of rules from customers in many markets: [Predictive Maintenance and Generative AI](zotero://select/library/items/895HTTKV)
- 15 seconds: [[#^cuop|Open AI voice clone]]
- largest training set known: (DBRX: 9 trillion words): [[Epoch23MachineLearningTrends|Key Trends and Figures in]]
- current LLMs training text data would take about 20 k years to read [[LeCun24animalSmarterLessDat]]; available, 170k [[LeCun24child50xMoreDat]]; agree w/ #'s in [[Villalobos22outOfDataLLM]] ? 
- all internet data: 100T words [[Epoch23MachineLearningTrends|Key Trends and Figures in]]
- need ~ 20 tokens/param 
	- chinchilla scaling param:  [[Epoch23MachineLearningTrends|Key Trends and Figures in]]
- Chinchilla and beyond
	- chinchilla scaling param:  [[Epoch23MachineLearningTrends|Key Trends and Figures in]]
	- [[Sardana23beyondChinchillaOptInference|Beyond Chinchilla-Optimal: Accounting for Inference in Language Model Scaling Laws]]
	- [[Pandey24beyondChinchillaOptScalel|MosaicML Announces Beyond Chinchilla-Optimal for LLM Scaling Laws in Inference]]
- public high quality human (text) data on planet used up by
	- 2024 ([[Epoch23MachineLearningTrends|Key Trends and Figures in]])
	- 2026 (somewhere)
- good quote: - “a child has seen 50 times more data than the LLMs that are trained on the totality of all text that is perfectly available,” [[Wodecki24yannLeCunDitchGenAI]]
- Push to use sensory data e.g. video
	- 32 k hrs of new YouTube every hour [[LeCun24child50xMoreDat]]
	- video more redundant that text but good for self-supervised [[LeCun24child50xMoreDat]]
## Carbon costs
- noted as having reasonable carbon cost calc: [[Henderson22energyCarbonFtPrntML]]
- oregon forced to run gas
- Georgia using new NG plant
- etc.  I have some more incidents on this
## Energy costs

==Needs to be parsed and distributed into the right categories==

- [[Liu24physSysLrnByThemslvs#Brain vs chatGPT energy consumption]]
- [AI Is Exploding Data Center Energy Use. A Google-Created Technique May Help](https://www.evernote.com/l/AA13mbuYwOhOjo1rQbWSx_mYIw=/): dramatic expansion graphs
- IEA report says AI electricity use will double in next 3 years (The carbon copy podcase, Feb 15 2024, or maybe the next episode, I'm not suree)
- this is xx% of RES generation
- calories of energy per day: real intelligence (human) vs. artificial intelligence
	- Get fun facts from [[Liu24physSysLrnByThemslvs|Physical systems that can learn by themselves]]
- side point: data centers and their comm links are a single point of failure: not great for power systems
- [Amid explosive demand, America is running out of power](zotero://select/library/items/UCFF33VA)
- [ ] read and Evernote: [AI taking water from desert](zotero://select/library/items/9EJACB65)
- [ ] read and note [The Staggering Ecological Impacts of Computation and the Cloud](zotero://select/library/items/NYP4CY6G)
- GWhs to train; GPT-3 operation ~ 200 Germans, so LLMs an energy saver?  [Power use in training LLMs 2022](zotero://select/library/items/BS2L6T44)
- ChatGPT-3: 3000 US households of training power; 33K US households in operation: [Q&amp;A](zotero://select/library/items/PICE52YA)
- LLMs could emit equivalent of 5 B (probably *really 6.3M*) US cross-country flights/year, MLENGERY Leaderboard: [[Chowdhury24evalAIpowerUse|Power-hungry AI: Researchers evaluate energy]]
- "hyperscalers" stopped reporting AI pow consumpt. due to outcry: [GenAI](zotero://select/library/items/22VXEBMW)
- 2023 Gen AI emits 3.25 Gtons/yr == 6.3M (or 5M) cross-US flights (typo corrected): [GenAI](zotero://select/library/items/22VXEBMW)
- small LLM: 6 J/token; response ~2 kJ/response: [From words to watts](zotero://select/library/items/M5PCBTQJ)
- in a graphic, next to J/token, could mention $/token
- "AI needs to go nuclear": [Sam Altman at Davos: AI needs to go Nuclear](zotero://select/library/items/RLKEU26U)
- AMZ build datacenter connected to nuke, considering more: [Amazon bets $150 billion on data centers required for AI boom](zotero://select/library/items/LWDNWF3S)
- AMZ exceeds Oregon hydro, forces util. to buy NG:  [Amazon bets $150 billion on data centers required for AI boom](zotero://select/library/items/LWDNWF3S)
- AMZ buys new solar, also connects to new NG plant:  [Amazon bets $150 billion on data centers required for AI boom](zotero://select/library/items/LWDNWF3S)
- AMZ plans 100% RES by 2025 but distant from data centers --> grid probs:  [Amazon bets $150 billion on data centers required for AI boom](zotero://select/library/items/LWDNWF3S)

- Efficient Computing Hardware
	- Google's TPUs far more power-efficient than CPU/GPU (good graph): [[Sato17googleFirstTPU|An in-depth look at Google’s first Tensor Processing Unit (TPU)]]
	- 1.58 bit LLM: [The Era of 1-bit LLMs](zotero://select/library/items/N8982IUT)
	- by 2027, AI will use as much electricity as NL: [AI is a Double-Edged Sword for Climate Change](zotero://select/library/items/5C98HCSG)
		- Graphics: [[Graphics to Borrow#Quantization / CPU,GPU,TPU]]
# Foundation Models
- Foundation Model Wikipedia review: [[wikipedia24FoundationModel|Foundation model]]
- Also: [[#Embedding Models|Embedding Models]]
- [[Gen AI responses to Gen AI questions#What is the difference between a foundation model and an embedding model?]]
- [How to Pick the Right AI Foundation Model](zotero://select/library/items/QRPB4ZKR)
- [[Guimaraes24whatPretrainedLLMknow|Pre-trained language models: What do they know?]]
- [ ] [Lag-Llama](zotero://select/library/items/6YMD8D3K)
- [Lag-Llama](zotero://select/library/items/V4JS9L8E)
- Funny: cat video foundation model better than nothing for learning PDEs: [[Cranmer24greatTheoryInNN]]
- I think I have a good drawing of one in the genAIgeneral brave tab group
- [A.I. Is Learning What It Means to Be Alive](zotero://select/library/items/LS9EU2IM) Universal Cell Embedding is a "foundation model," I think?
- [Unified Training of Universal Time Series Forecasting Transformers](zotero://select/library/items/WYFI65CI)
- RFM: Robot Foundation Model: [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- [A decoder-only foundation model for time-series forecasting](zotero://select/library/items/DQWJPSHE)
- [Foundation model](zotero://select/library/items/S8SIJXT4)
- [[Maslej23aiIndexReport|Artificial Intelligence Index Report 2023]]
- [On the opportunities and risks of foundation models](zotero://select/library/items/RF5TII7E)
- [A decoder-only foundation model for time-series forecasting](zotero://select/library/items/8HUBQQV8)
- [Chronos: Learning the Language of Time Series](zo: Learning the Language of Time Seriestero://select/library/items/7U29MCJC)

# RAG (Retrieval Augmented Generation) ^8dc8d8
### Intro

Text blurb, from my summary of [[Wiggers24hallucRAGwontSolve]]:

Currently, RAG is "keywords search +" (my phrase) that can be accurate in some factual searches.  It's useful when, for security reasons, you don't want to train on documents, and when you want to be sure to avoid copyright-infringement, because you have the actual source at hand.  For reasoning based searches, RAG is still a work in progress.

- [[Graphics to Borrow#RAG Diagram]]
- Requires considerable work in data extraction: basic in [[Robinson24unstructDatPreprocLLM|Preprocessing Unstructured Data for LLM Applications]]
### Sources for RAG
- [ ] simple, good graph: [[OpenAI24ragAndSemSrchGPT|Retrieval Augmented Generation (RAG) and Semantic Search for GPTs]]
- [What is retrieval-augmented generation?](zotero://select/library/items/NNNW9WVS) ^ccd029
- [LangChain](https://python.langchain.com/docs/use_cases/question_answering/) 
	- intro: 
		- you can also connect to GPTs programmatically: Demo.
		- but you might ask what you've actually accomplished, aren't you just working harder for your hallucinations?
		- answer: it's automated, you can control the context window, and you can override the system prompt: [[Hofferber23openAIapiBetterChatGPT]] graphics.
	- does RAG, examples are Q&A over code and over PDFs
	- good diagrams to use in slides
- Get new info part of RAG "system prompt": [What is Retrieval-Augmented Generation (RAG)?](zotero://select/library/items/RAJPEG5Y)
- [[Pixegami23RAGLangchainPython|RAG + Langchain Python Project: Easy AI/Chat For Your Docs]]
- [[Graphics to Borrow#Robot chat and voice inputs gif]]: voice/robot RAG
- is RAG "interactive AI?": [DeepMind’s cofounder](zotero://select/library/items/9WP87AF4)
- [[TechWithTim24pythonRAGtutorial|ADVANCED Python AI Agent Tutorial - using RAG]]
- [[Pixegami23RAGLangchainPython|RAG + LangChain Python Project]]
- [ADVANCED Python AI Agent Tutorial - Using RAG](zotero://select/library/items/XEIZ9G7T)
- RAG recommended: [Hallucinations](zotero://select/library/items/S6W8C8MH)
- [Stanford CS25: V3 I Retrieval Augmented Language Models](https://www.youtube.com/watch?v=mE7IDf2SmJg)
- [ ] is RAG "source grounded AI?"
# Embedding Models
### Presentation Notes (embedding)
- [ ] Use this quote
![[SwimmTeam24embedInML#^0dde8e]]
- [ ] Use this graphic [[Graphics to Borrow#Word2Vec]]
- [ ] Use this quote ![[Barnard23whatIsEmbeddingIBM#^kt1abl]]
- [ ] Use Graph comparing embedding models: [[HuggingFace24benchmarkMTEB|MTEB: Massive Text Embedding Benchmark]]
- [ ] use URL/visual? [[HuggingFace24leaderboardMTEB|MTEB Leaderboard]]
- [ ] [[Monigatti23vectorDBprotoToProd#Good graph for embedding vector]]
- [ ] Cool things to use: 
![[SwimmTeam24twordEmbed5TypNLPapp#^4sdsz1]]
![[SwimmTeam24twordEmbed5TypNLPapp#^38dggq]]
![[SwimmTeam24twordEmbed5TypNLPapp#^bj57up]]
![[SwimmTeam24twordEmbed5TypNLPapp#^vi162l]]
![[SwimmTeam24twordEmbed5TypNLPapp#^zkngjc]]
- [[Gen AI responses to Gen AI questions#What is the difference between a foundation model and an embedding model?]]
- [ ] Embedding space similarity is mostly just cosine sim (Gemini and kinda Copilot)
	- [ ] discuss newer alternatives?
	- [ ] consider that this is a very high dim space:  
		- could use KNN (didn't see that mentioned more than once)
		- consider high dim stuff, like those old hubness papers in energy.bib.
- also [[#Foundation Models|Foundation Models]]
### Sources (embedding)
#### Introductory
- [x] leaderboard: [[HuggingFace24leaderboardMTEB|MTEB Leaderboard]]
- [x] intro: [[SwimmTeam24embedInML|Embeddings in Machine Learning: Types, Models & Best Practices]]
- [x] intro: [[Barnard23whatIsEmbeddingIBM|What is Embedding? | IBM]]
- [x] quick intro: [[HuggingFace24benchmarkMTEB|MTEB: Massive Text Embedding Benchmark]]
- [x] [[Muennighoff23textEmbedMTEBpaper]]
- [x] intro: [[SwimmTeam24Tword2VecHowWork|What Is Word2Vec and How Does It Work?]]
- [x] intro, good graphic: [[SwimmTeam24twordEmbed5TypNLPapp|5 Types of Word Embeddings and Example NLP Applications]]
- [x] intro, sketchy but informative w2v details: [[CognitiveCreator23word2VecNLPgtwy|Word2Vec: NLP’s Gateway to Word]]
#### Power system related
- aggregation forecast?: [[Schreiber21TaskEmbeddingTemporal|Task Embedding Temporal Convolution Networks for Transfer Learning Problems in Renewable Power Time Series Forecast]]
- autoencoder: [[Nivarthi22UnifiedAutoencoderTask|Unified Autoencoder with Task Embeddings for Multi-Task Learning in Renewable Power Forecasting]]
- autoencoder: [[Nivarthi23MultiTaskRepresentationLearning|Multi-Task Representation Learning for Renewable-Power Forecasting: A Comparative Analysis of Unified Autoencoder Variants and Task-Embedding Dimensions]]
- financial frcst: [[He19TransferLearningFinancial|Transfer Learning for Financial Time Series Forecasting]]
- power flow neural graph: [[Beinert23PowerFlowForecasts|Power flow forecasts at transmission grid nodes using Graph Neural Networks]]
- within NN layers (featsel): [[Qiu18LearningCorrelationSpace|Learning Correlation Space for Time Series]]
- [[Huang20ModelingComplexSpatial|Modeling Complex Spatial Patterns with Temporal Features via Heterogenous Graph Embedding Networks]]
- many embeds, I guess (PV plants, etc.): [[Brunton24physInformedMLseries|Physics Informed Machine Learning: High Level Overview of AI and ML in Science and Engineering]]
#### Text Processing
- search: [[Reimers23neuralSearch|What is Neural Search? Nils]]
- PDF SQL DB embedding: [LangChain SQL Agent for Massive Documents Interaction](zotero://select/library/items/HPF7UE9N)
- For RAG: [[Pixegami23RAGLangchainPython|_RAG + Langchain Python Project: Easy AI/Chat For Your Docs]]
#### Biology
- [[Zimmer24learn2BaliveAI|A.I. Is Learning What It Means to Be Alive]]: Universal Cell Embedding
#### Anomaly 
- [[Li19ZeroShotLearningIntrusion|Zero-Shot Learning for Intrusion Detection via Attribute Representation]]
## Transfer learning in Generative AI
- [A.I. Is Learning What It Means to Be Alive](zotero://select/library/items/LS9EU2IM) after Universal Cell Embedding, could ID cells from an animal it had never seen before (trained on?) it was able to ID its cells, given the animal's "
- Embedding can be used as step in transfer learning
	- [[Schreiber21TaskEmbeddingTemporal|Task Embedding Temporal Convolution Networks for Transfer Learning Problems in Renewable Power Time Series Forecast]]
	- [[SwimmTeam24twordEmbed5TypNLPapp|5 Types of Word Embeddings and Example NLP Applications]]
	- Multi-task: [[Nivarthi22UnifiedAutoencoderTask|Unified Autoencoder with Task Embeddings for Multi-Task Learning in Renewable Power Forecasting]]
	- [[SwimmTeam24twordEmbed5TypNLPapp#^c1154c|word embeddings enable transfer learning]]
## Zero-shot
- Robot and Banana example?: [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- [Chronos: another zero-shot](zotero://select/library/items/PAZ4RG56)
- General chat LLM is zero-shot, need to iterate e.g. RAG?
- zeroshot genAI not better than encoder/decoder: [[Roque24TimeGPTVsTiDEZeroShot|TimeGPT vs TiDE: Is Zero-Shot]]
- Agents better than Zero-shot (good programming graphic): [Robots Talk Back, AI Security Risks, Political Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- [[Guimaraes24whatPretrainedLLMknow|Pre-trained language models: What do they know?]]
- Attack by repetition in large context: [[Anthropic24manyShotJailbreak|Many-shot jailbreaking]]
## General Generative AI: Go through Brave Group
- [ ] some genAI types
- [ ] gen vs. discrim
## Emergence / Sentience ^cb2a45
- [No, Anthropic&#39;s Claude 3 is NOT sentient](zotero://select/library/items/A3V43Y2C)
- [Are Emergent Abilities of Large Language Models a Mirage?](zotero://select/library/items/IVQ6AEQV)
- could lead above with the pizza sentience anecdote: [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
# Applications of Gen AI
## Is AI a solution in search of a problem?
not designed to solve social problems: [[Birch24genAIwasteTimeMoney|Generative artificial intelligence is simply a waste of our time and money]]
## 	- [[Bogost24aiLostMagic|AI Has Lost Its Magic]]
## Search/Query
- [[Obeng24textToSQLpinterest|How we built Text-to-SQL at Pinterest]]
- [[Aster24langChainSQLagent|LangChain SQL Agent for Massive]]
- Did queries? [[Barousse24dataAnlystGPT4Outperf|Study: GPT-4 outperforms Data Analysts]]
## Sentiment Analysis
- (Weber24implicitCoordInflateShock): model shows people feel good about price increases during shortages (could also predict voters feeling good)
## Medicine
- [[Rajpurkar25robotDoctor|Rajpurkar25: The Robot Doctor Will See You Now]]: sometimes useful and safe now but you have to do it right
## Test / Synthetic Data Generation
- [Using generative AI to improve software testing](zotero://select/library/items/TFAA7VRT): weather, I think.  test patterns.  Future grid sims?
- [Evaluating LLM Applications Hayes 2024](zotero://select/library/items/VL9LM73G)
- [Prompt Engineering is Dead](zotero://select/library/items/XH3WDMV9): autotune better than human, but new LLMOPS job for productization
- [Mastering LLM Techniques: LLMOPs](zotero://select/library/items/VN4CSK4M):  The new MLOPS!
## gen AI used for car CFD optimization
## 	- [Conceptual design using generative AI and CFD simulations on AWS](zotero://select/library/items/PV43V6D4): car CFD & style
## 	- could also use aesthetic as in: [Pick-a-Pic](zotero://select/library/items/9SVS5A3Z)
## 	- [Large Language Models as Optimizers](zotero://select/library/items/5JFKZBQT)
## Control systems
- [Robot gets real world knowledge from chatGPT-like thing](zotero://select/library/items/KYL5BJFZ)
- prediction like in RE learning?: [How the AI that drives ChatGPT will move into the physical world](zotero://select/library/items/66WWA34V)
- [[Graphics to Borrow#Robot chat and voice inputs gif]]
## better search / personal DB ^d27479
- Is this just [[#RAG (Retrieval Augmented Generation) 8dc8d8|RAG (Retrieval Augmented Generation) 8dc8d8]]?
- [What is neural search?](zotero://select/library/items/5UN5ZZFC)
- simple, good graph: [[OpenAI24ragAndSemSrchGPT|Retrieval Augmented Generation (RAG) and Semantic Search for GPTs]]
- [Gen AI for Research Market](zotero://select/library/items/5B6GKLKZ): many cases listed, which are all pretty much search, I think.
- [[#^a51c11|Personal Assistant]]
- [[Pixegami23RAGLangchainPython]]
- [ ] [[Hofferber24noteTakingAEobsidian|The AI Note Taking Powerhouse - Obsidian]]
- [[Li24PersonalLLMAgents|Personal LLM Agents: Insights and Survey about the Capability, Efficiency and Security]]
- [[TechWithTim24pythonRAGtutorial]]
### Citing references
- RAG can supply references: [What is Retrieval-Augmented Generation (RAG)?](zotero://select/library/items/RAJPEG5Y) ^4a1b06
- look Gemini checker?
- like Bing Copilot references?
## image generation
- car design thing
- robot visualizing moving stuff
- architect designing concrete toothpaste house
## Gen AI for TS forecasting ^717698
- longer/comp intensive than LSTM; tricks reduce complexity [[Bentsen23transformersTimeSeriesData|Transformers for Time-Series Data]]
- GPT not an LLM: [[Se23creatorsTimeGPT|Revolutionizing Time Series Forecasting: Interview with TimeGPT's creators]]
- zeroshot genAI not better than encoder/decoder: [[Roque24TimeGPTVsTiDEZeroShot|TimeGPT vs TiDE: Is Zero-Shot]]
- Also disses autoregressive models"
	- [[Wodecki24yannLeCunDitchGenAI|Meta’s Yann LeCun Wants to Ditch Generative AI]]
	- "Auto-regressive" in Gen AI means decoder-only: [[Adib23encodeDecodeGenAI|Encoders, Decoders and Their Model Relationship Within Generative AI]]
- [[Roque24TimeGPTVsTiDEZeroShot|TimeGPT vs TiDE: Is Zero-Shot]]
- TimeGPT and DeepAR (kinda gen) don't beat LightGBM or NHITS neural forecasts: [[Manokhin23worksTSfrcstNixtla|What Truly Works in Time Series Forecasting — The Results from Nixtla’s Mega Study]]
- [[Lim21TemporalFusionTransfr|Temporal fusion transformers for interpretable]]
- [[Woo24trainTSfrcstTransfrmrs|Unified Training of Universal Time Series Forecasting Transformers]]
- [[Simple23AreTransformersEffective|Are Transformers effective for Time Series Forecasting]]
- [[Sen24decOnlyFoundTSfrcst|A decoder-only foundation model for time-series forecasting]]
- [[Das24decoderFoundatnTSfrcst]]
- [[Gruver23llmOneShotTSfrcstr]]
- [[Ansari24chronosTSlangLearn|Chronos: Learning the Language of Time Series]]
- [[Rasul24LagLlamaFoundationModels|Lag-Llama: Towards Foundation Models for Probabilistic Time Series Forecasting]]
- Zero-shot models could be a tighter baseline
	- often don't know where you are in difficult model developemnet
	- boundaries: perfect forecast (too good), persistence (no-effort, too easy)
	- if zeroshot better than persistence, then this is a better no-effort lower end)
## Speech
- Graphic: [[Graphics to Borrow#Speech Recognition / Multilingual]]
- [[#^cuop|Open AI voice clone]]
- [[AssemblyAI24multilangASRuniversal1|Introducing Universal-1]]
## Translation
- [[#^cuop|Open AI voice clone]]: has translation examples
- chatGPT translation/grammar explanation for language learning: [[Novis23ObsidianChatGPT#chatGPT as a language learning tutor]]
-  OpenAI voice clone  ^cuop
	- great examples in many languages
	- include openAI voice gen examples
		- [[OpenAI24synthVoiceChllngOppty|Navigating the Challenges and Opportunities of Synthetic Voices]]
		- [[David24OpenAIVoiceCloning|OpenAI’s voice cloning AI 15-second sample]]
- MN dept. of transport [uses google for realtime translation](https://youtu.be/_AOA6M9Ta2I?t=753) for Driver's License application assistance (I think)
## More Use cases (break up and merge w/ others)
- [Gen AI for Biz Leaders](zotero://select/library/items/TSJ6CE24)
- [Can AI do that?](zotero://select/library/items/3CTJALXW)
- [Generative AI is a hammer and no one knows what is and isn’t a nail](zotero://select/library/items/ULSNJZRU)
- [Gov't and biz use cases](zotero://select/library/items/WJABWCNU)
- general idea of use cases: 
	- [What's the big deal with Generative AI?](zotero://select/library/items/GVW9YI3Q)
	- [AI is Eating The World](zotero://select/library/items/IFWAEW3M)
	- [Development of a Data-Driven Method for Online Battery Remaining-Useful-Life Prediction](zotero://select/library/items/ZS3JKWFC)
- Business processes
	- Regulatory compliance
		- Moderna article
		- JP Morgan articles
	- Call centers?
	- etc.
- translation
- [Gen AI for Research Market](zotero://select/library/items/5B6GKLKZ): many cases listed
- [Prompt Engineering is Dead](zotero://select/library/items/XH3WDMV9): many use cases listed
- [Personal LLMs](zotero://select/library/items/IC947GPT)
- Call centers
	- [Automate Boring Call Center](zotero://select/library/items/A8J3J6DD): a 60 minute class
	- Google's chatbot I've used for support not good, can't answer the complicated questions that I ask (as w/ 80% of programming Q's I ask it). 
		- This suggest that call center work will not be ready for our likely customers. As one other call ctr article said
	- For these types of problems papers say that you need to accumulate training data first make a large database of domain knowledge possibly from your fax and call center logs 
		- as w/  [Robots](zotero://select/library/items/66WWA34V)
		- as w/ battery predictive maintenance (any of these generative?)
- [Building Your Own Product Copilot](zotero://select/library/items/FHFNU7DE)
- [Large Language Models as Optimizers](zotero://select/library/items/5JFKZBQT)
- [Conceptual design using generative AI and CFD simulations on AWS](zotero://select/library/items/PV43V6D4): car CFD & style
- [Amid explosive demand, America is running out of power](zotero://select/library/items/UCFF33VA) some grid help
- [A.I. Is Learning What It Means to Be Alive](zotero://select/library/items/LS9EU2IM) biodmed research: heart treatment, developmental bio, cellID 
- [This AI Architect Will Design Your Climate-Friendly Dream Home](zotero://select/library/items/9VEDJWKH)
- [Anthropic Ups the Ante, India Warns Developers, and more](zotero://select/library/items/GEIVRGK6)
	- Autogenerated news
	- fact checking
- [[#^717698|Gen AI for TS forecasting]]
- Parsing pdf specs into a queryable DB [LangChain SQL Agent for Massive Documents Interaction](zotero://select/library/items/HPF7UE9N)    
- Batteries
	- [A time-series Wasserstein GAN method for state-of-charge estimation of lithium-ion batteries](zotero://select/library/items/RFZBFH48)
	- [Predictive Maintenance and Generative AI](zotero://select/library/items/895HTTKV): bus battery health warning
- Personal Assistant ^a51c11
	- [[Bogost24aiLostMagic|AI Has Lost Its Magic]]
		- fun images and poems (funny, use?)
		- market research
		- naming things
		- selecting students according to university policy
		- analysis of wordle solutions
		- homework and essays
		- anti- or super- cliched recommendations
	- [Personal LLMs](zotero://select/library/items/IC947GPT)
	- [[Novis23ObsidianChatGPT|Obsidian plus ChatGPT Webinar]]
	- [[Forte24googleNotebookLM|How to Use NotebookLM (Google's]]
	- [[Gen AI Talk Demo - GoogleNotebookLM]]
	- [ChatGPT for Data Analytics](https://www.youtube.com/watch?v=uhyMqbZI6rM) Video
	- [[#^d27479|search, personal DB]]
	- Personal data organizer: **maybe I should try to build one of these?: [hugging face has free courses](https://learn.deeplearning.ai/courses/open-source-models-hugging-face/lesson/1/introduction)
	- download and run LLMs on your local computer: [[LMStudio24LMStudioDiscover|LM Studio - Discover and run local LLMs]]
- Multilingualism
	- many say that chatGPT's are multi-lingual.  An advantage for multinational company like Hanwha
	- example: [Predictive Maintenance and Generative AI](zotero://select/library/items/895HTTKV)
	- Graphic: [[Graphics to Borrow#Speech Recognition / Multilingual]]
- Predictive Maintenance
	- [Predictive Maintenance and Generative AI](zotero://select/library/items/895HTTKV): bus battery health warning
	- [ ] TODO: collect articles from Brave tab group: predMaintGenAI.  Simens has a pdf that explains domain data needed.
	- [ ] [GE&#39;s Predictive Maintenance Portfolio](zotero://select/library/items/9CYQVTRA)
- papers showing its success
- customer service use
	- [Towards A Production-Ready Customer Feedback LLM: Leveraging Evals for Advanced Feedback Analysis](https://www.youtube.com/watch?v=WM4OzrPO8LE)
- Taking notes in meetings: [Copilot can do that](https://support.microsoft.com/en-us/office/get-started-with-copilot-in-microsoft-teams-meetings-0bf9dd3c-96f7-44e2-8bb8-790bedf066b1)
## genAI in audio
- GANs in google Pixel phone products (I think): [Google Research, 2022 & beyond: Language, vision and generative models](zotero://select/library/items/SHH9BZL7)
- [The Terrifying A.I. Scam That Uses Your Loved One’s Voice](zotero://select/library/items/LMXB6Y8A)
## Writing Software
### Synopsis
Very impressive results on standard tests [[Hou24vevalLLMprogCode|A systematic evaluation]], but but [[Caballar24codingAIautopilot|so far, they still really need humans]].  So one big [[Swimm24devKnowldgShare|problem]] that could be solved is code comprehension, documentation, etc.  

**Good Slide**: [[Graphics to Borrow#Programming Holistic Eval]] (live leaderboard, explained below)
### Sources
- [[Caballar24codingAIautopilot|AI Coding Is Going From Copilot to Autopilot > But so far Devin AI and others still really need humans]]
- [[Hou24vevalLLMprogCode|A systematic evaluation of large language models for generating programming code]]
- programmer tool (good graphs): [[Swimm24devKnowldgShare|The state of developer knowledge sharing]]
- Agents better than Zero-shot (good programming graphic): [Robots Talk Back, AI Security Risks, Political 
-  [coding is one of few successes](zotero://select/library/items/YUKAFSYU)
- [Deepfakes, and more](zotero://select/library/items/QUV7MR9D)
- [AutoDev](zotero://select/library/items/59T9XG2D)
- [[Bogost23endRecommendLttrs|The End of Recommendation Letters]]. techniques for anti & pro-cliche diversity boilerplate
- [[Hou24vevalLLMprogCode|A systematic evaluation of LLM code gen]]
- Examples in [[Forte24googleNotebookLM|How to Use NotebookLM (Google's New AI Tool)]]
- [[Novis23ObsidianChatGPT|Obsidian plus ChatGPT Webinar]]
- types of failures
- Claude3 s/b much better: - [Introducing the next generation of Claude](zotero://select/library/items/2L8NLKX5)
- [[Jain24liveCodeBenchLeaderboard|LiveCodeBench Leaderboard]]: for coding, avoids test/train contamination, closed source better than open.  "holistic": tested on code generation, execution, self repair, test output prediction.
# Libraries for Making Gen AI
## Langchain
- [What is LangChain?](zotero://select/library/items/8JL75JEY)
- [LangChain SQL Agent for Massive Documents Interaction](zotero://select/library/items/HPF7UE9N)
- [Hugging Face + Langchain in 5 mins](zotero://select/library/items/9MKFV9LA)
- [Task-driven Autonomous Agent Utilizing GPT-4, Pinecone, and LangChain for Diverse Applications](zotero://select/library/items/KGKMANEE)
- [[Pixegami23RAGLangchainPython|RAG + LangChain Python Project]]

# Closing

QCELLS has a money crunch.  Should we spend company money on genAI?  
- clear that this is going to happen
	- Banking/Gov't: 
		- [[Copeland24endWorstWallStAI|The Worst Part of a Wall Street Career May Be Coming to an End]]
		- [[Ghosh24aiCashFlowJPMorgan|JPMorgan’s AI-Aided Cashflow Model Can]]
		- [[Tyrangiel23smartBanksAI|Opinion | AI is making the world’s biggest banks much smarter]]
		- [[Tyrangiel24aiRemakeUSgovt|Opinion | Let AI remake the whole U.S. government (oh, and save the country)]]
	- [ ] other convincing applications?
- Moves fast, need to get your fingers in it NOW.
- Trick is to find a task where existing tech is sufficiently mature that you don't waste your time on a failure, and where there is evidence that the cost savings will be sufficiently high.
- The other branch is to suss out the crazier, less proven ideas with huge possible gains.
- Can start small and cheap (in money and time)
	- Gateway drugs: Copilot, Gemini and [[NotebookLM]]
	- If programmer
		- I don't like AI the my IDE yet, but..
		- Free copilot, gemini
		- [ ] Free auto documentation
		- Mention the other free coding thing for python
	- If data scientist
		- It's time to get moving (note forecasting, maybe not)
- Pilot Projects
	- Pick some non-critical applications that can fail and won't take much time.  
	- personal favs: getting PV params from building specs: 1000 houses, said to be too expensive to get, with phone app.  Can this be done in bulk?  AEMO, is what I mean.
	- Thing of a RAG: could get a feel for how this could work using a fully build one, [[NotebookLM]], that's free s/b pretty good; could implement one after [[Robinson24unstructDatPreprocLLM]]
- Semantic search seems doable now
- [ ] TODO: figure out some good closing line e.g. for datascients and programmers, the time to start is now.
# Learning Resources
## How to keep up
- [[2024-03-21#Webinar How To Read AI Research Papers Effectively]]
- [[#^5a216c|Classes I could take]]
- youtubers
	- Yannic Kilcher e.g. [No, Anthropic's Claude 3 is NOT sentient](zotero://select/library/items/A3V43Y2C)
	- [AI explained](https://www.youtube.com/watch?v=pal-dMJFU6Q), the latest, most breathless youtube
- Books
	- [[Bishop24deepLearningBk|Deep learning: Foundations and concepts]]
- My strategy?
	- can't read all day: best use of research time
	- too much to read, so narrow
		- very app specific
		- summaries
		- review papers
		- breakthough: everything's a breakthrough, and I'm busy (except maybe app specific)
		- every once in a while, a book
	- Andrew Yang
	- Medium
	- Andrej tutorials
	- Podcasts?
	- Classes
	- Books?
## Classes I could take ^5a216c
- [ ] [Automate Boring Call Center](zotero://select/library/items/A8J3J6DD): a 60 minute free class
- [ ] [hugging face has free courses](https://learn.deeplearning.ai/courses/open-source-models-hugging-face/lesson/1/introduction)
- [ ] [Evernote Beta AI powered search](https://help.evernote.com/hc/en-us/articles/20406371441939-AI-Powered-Search-Overview) (try when absolutely must upgrade)
- [ ] [Evernote AI note cleanup](https://help.evernote.com/hc/en-us/articles/16280830963091-AI-Note-Cleanup-Overview) (free already if use new version?)
- [ ] free home design: [This AI Architect Will Design Your Climate-Friendly Dream Home](zotero://select/library/items/9VEDJWKH)
- [ ] PDF SQL DB embedding: [LangChain SQL Agent for Massive Documents Interaction](zotero://select/library/items/HPF7UE9N)
- [ ] Try gateway to many LLMs including gemni: [Running Your Very Own Local LLM. Tools like Ollama let you experiment](https://yc.prosetech.com/running-your-very-own-local-llm-6d4db99c0611)
- [ ] [Machine Learning  |  Google for Developers](https://developers.google.com/machine-learning/crash-course): crash course or more advanced ones it links to
- [ ] Try Gemma: [Exploring Gemma: Google open-source AI model](https://medium.com/pythoneers/exploring-gemma-google-open-source-ai-model-812e71b539c0) 
- [ ] [Top 10 generative AI courses and training resources | TechTarget](https://www.techtarget.com/searchenterpriseai/tip/Top-generative-AI-courses-annce.mud-training-resources)
- [ ] Andrew Karpathy's 9 lecture series: [The spelled-out intro to neural networks and backpropagation: building micrograd - YouTube](https://www.yout aube.com/watch?v=VMj-3S1tku0&list=PLAqhIrjkxbuWI23v9cThsA9GvCAUhRvKZ&index=1&t=0s)
- [ ] [[Karpathy24buildGPTtokenizer|Let's build the GPT Tokenizer]]
- [ ] [Physics Informed Machine Learning](zotero://select/library/items/HMLAXBHI) (UW lectures)
- [ ] [Hugging Face + Langchain in 5 mins](zotero://select/library/items/9MKFV9LA) illustrate how you can quickly hook up a silly model.  Not really what Hanwha wants, but interesting.
- [ ] [How I Read a Paper: Facebook's DETR (Video Tutorial) - YouTube](https://www.youtube.com/watch?v=Uumd2zOOz60)
- [ ] TechWithTim RAG tutorial: [[TechWithTim24pythonRAGtutorial|ADVANCED Python AI Agent Tutorial - using RAG]]
- [ ] Another TechWithTim: coding agen
- [ ] t: [Python Advanced AI Agent Tutorial - LlamaIndex, Ollama and Multi-LLM!](https://www.youtube.com/watch?v=JLmI0GJuGlY)
- [ ] [ChatGPT for Data Analytics](https://www.youtube.com/watch?v=uhyMqbZI6rM)
- [ ] [AI Explained](https://www.youtube.com/@aiexplained-official)
- [x] Short & Friendly: [DLAI - Preprocessing Unstructured Data for LLM Applications](https://learn.deeplearning.ai/courses/preprocessing-unstructured-data-for-llm-applications/lesson/1/introduction)
- [ ] [mlabonne/llm-course: Course to get into Large Language Models (LLMs) with roadmaps and Colab notebooks.](https://github.com/mlabonne/llm-course)
- [ ] [Stanford CS25: V3 I Retrieval Augmented Language Models](https://www.youtube.com/watch?v=mE7IDf2SmJg)
## Demo Projects
- [[Gen AI Talk Demo - GoogleNotebookLM]]
- also vector embedding: [[Pixegami23RAGLangchainPython|RAG + Langchain Python Project: Easy AI/Chat For Your Docs]]
- [[2024-04-07#Copilot plugin]] (is MS copilot really an option in this plugin?)
- Try an [OpenAI assistant](https://platform.openai.com/docs/assistants/overview?context=with-streaming), which can [do math](https://help.openai.com/en/articles/6681258-doing-math-with-openai-models), and which has a simple [playground](https://platform.openai.com/playground?mode=assistant) interface. 
- [[Hofferber24noteTakingAEobsidian|The AI Note Taking Powerhouse - Obsidian]]
- [[TechWithTim24pythonRAGtutorial]]
- Another TechWithTim: Coding Agent: [Python Advanced AI Agent Tutorial - LlamaIndex, Ollama and Multi-LLM! ](https://www.youtube.com/watch?v=JLmI0GJuGlY)
- TechWithTime again: [Build a RAG Based LLM App in 20 Minutes! | Full Langflow Tutorial - YouTube](https://www.youtube.com/watch?v=rz40ukZ3krQ)
- [[Robinson24unstructDatPreprocLLM|Preprocessing Unstructured Data for LLM Applications]]
- [DLAI - How Diffusion Models Work](https://learn.deeplearning.ai/courses/diffusion-models/lesson/1/introduction): Ng course
- [DeepLearning.AI Short Courses](https://learn.deeplearning.ai/): 1st on on unstructured was decent
- [[Aster24langChainSQLagent|LangChain SQL Agent for Massive Documents Interaction]]: has python
- Agents e.g. from [here](https://www.youtube.com/watch?v=kJvXT25LkwA)
# Presentation Techniques & Tech
## Animations
- e.g of copilot/gemini things
- how pause GIFs in Powerpoint?
- easier solution: convert GIFs to video
	- Lots of programs for this
		- apple has something built-in
		- many browser extensions e.g. [Chrome Capture - screenshot & GIF tool](https://chromewebstore.google.com/detail/chrome-capture-screenshot/ggaabchcecdbomdcnbahdfddfikjmphe), which isn't limited to making GIFs
# Glossary
- "representation" means the LLM vectors that start out as embedded tokens.  
- "weights" mean the MLP coeffs
- context window
- embedding
- transformer
- decoder / decoder-only
- encoder
- parametric memory [[Wiggers24hallucRAGwontSolve]]
- quantization
- zero-shot
- token
