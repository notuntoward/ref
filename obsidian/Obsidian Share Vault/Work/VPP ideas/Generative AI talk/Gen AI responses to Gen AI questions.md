---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

# MAMBA

## Gemini: compare mamba and transformers
From: [‎Gemini - chat to supercharge your ideas](https://gemini.google.com/app/aa1e5802dc64fac2)

Here's a breakdown comparing Mamba and Transformers:

**Architecture:**

- **Transformer:** Relies on an attention mechanism to understand relationships between parts of the input sequence. This can be computationally expensive, especially for long sequences (quadratic complexity).
- **Mamba:** Combines recurrent elements from Selective State Space Models (SSMs) with feedforward blocks from Transformers. This allows for efficient processing and linear complexity with regards to sequence length.

**Performance:**

- **Transformer:** Generally very good performance, but can be slow for long sequences due to the attention mechanism.
- **Mamba:** Shows comparable or better performance than Transformers on various tasks, especially with longer sequences. Additionally, Mamba boasts:
    - **Faster inference:** Up to 4-5 times faster than Transformers of similar size.
    - **Memory efficiency:** Handles larger batch sizes without needing a cache.

**Overall:**

- **Transformer:** The current state-of-the-art for many NLP tasks, but can be computationally expensive.
- **Mamba:** A promising new architecture that addresses some of the limitations of Transformers, particularly with regards to speed and efficiency. It's still under development, but early results are promising.

Here are some resources for further reading:

- Mamba vs. Transformers: The Future of LLMs? YouTube: [https://m.youtube.com/watch?v=ouF-H35atOY](https://m.youtube.com/watch?v=ouF-H35atOY)
- Mamba (Transformer Alternative): The Future of LLMs and ChatGPT? [lazyprogrammer.me]

## Copilot: compare mamba and transformers

Certainly! Let's delve into the comparison between Mamba and Transformers: 

1. Transformer Architecture: 
    

- Efficiency and Limitations: Transformers, including models like GPT-4, have set impressive benchmarks in natural language processing. However, their efficiency decreases with longer sequences due to the quadratic growth in memory and compute requirements for generating each output token. This limitation makes training with long sequences practically challenging. 
    
- Memory Considerations: Transformers map input tokens to vector representations, alternating between token-level operations (MLP) and token-mixing operations (attention layers). For an input of length n, the output size of each block is d x n. 
    
- Inefficiency: Generating n tokens requires O(n^2) compute, which hinders scalability for long sequences. 
    

2. State Space Models (SSMs): 
    

- Efficient Memory Usage: SSMs, including the leading architecture Mamba, use a fixed-size memory that does not grow with sequence length. This efficiency enables training and inference on extremely long inputs (e.g., entire libraries, audio samples, or DNA sequences). 
    
- Mamba's Impressive Performance: Mamba has demonstrated remarkable performance in language modeling, surpassing competing Transformer models in various settings. 
    

3. The Sacrifice of Core Capabilities: 
    

- Retrieval and Repetition: Here's the catch—while SSMs are efficient, they sacrifice a crucial capability: the ability to retrieve and repeat parts of the input context. This task plays a key role in few-shot learning and retrieval, which are essential in foundation models. 
    
- Inferiority on Copying and Retrieval Tasks: Mamba models, despite their efficiency, are inferior to Transformer-based language models when it comes to tasks involving copying and retrieval. This limitation is not specific to Mamba; any model with fixed memory size faces similar issues. 
    

4. Results and Conclusion: 
    

- Empirical Evidence: Through theory and experiments, it has been shown that pre-trained Transformers can outperform Mamba models with 10x more parameters on tasks requiring information retrieval. 
    
- Not a Design Flaw: Importantly, this is not a flaw in Mamba's design; any fixed-memory model would encounter similar challenges. 
    

In summary, while Mamba excels in efficiency and scalability, Transformers retain critical capabilities for modern language modeling. The choice between them depends on the specific task and trade-offs you're willing to make[1](https://www.harvard.edu/kempner-institute/2024/02/02/repeat-after-me-transformers-are-better-than-state-space-models-at-copying-2/). 

Source(s) 

1. [Repeat After Me: Transformers are Better than State Space Models at ...](https://www.harvard.edu/kempner-institute/2024/02/02/repeat-after-me-transformers-are-better-than-state-space-models-at-copying-2/) 

2. [Mamba: Redefining Sequence Modeling and Outforming Transformers ...](https://aidigitalnews.com/ai/mamba-redefining-sequence-modeling-and-outforming-transformers-architecture/) 

3. [Mamba: Redefining Sequence Modeling and Outforming Transformers ...](https://www.unite.ai/mamba-redefining-sequence-modeling-and-outforming-transformers-architecture/) 

4. [Mamba: Linear-Time Sequence Modeling with Selective State Spaces](https://arxiv.org/abs/2312.00752) 

1. [[D] So, Mamba vs. Transformers... is the hype real?](https://www.reddit.com/r/MachineLearning/comments/190q1vb/d_so_mamba_vs_transformers_is_the_hype_real/)

# # What is the difference between a foundation model and an embedding model?

## Gemini, Draft 1, [here](https://gemini.google.com/app/a35234fd8312e974)

While both terms are relevant in machine learning, they have distinct purposes:

**Foundation model** is a **broad term** for a powerful AI model trained on massive amounts of unlabeled data. This pre-training equips them with a vast understanding of the world and the ability to perform various tasks. They excel at:

- **Generalization:** Adapting to new problems without extensive retraining.
- **Wide range of tasks:** Performing tasks like text generation, translation, question answering, and more.

Think of a foundation model as a highly educated individual with a strong knowledge base applicable to many situations.

**Embedding model**, on the other hand, focuses on a **specific function**: transforming text (words, phrases, or even documents) into numerical representations (embeddings). These embeddings capture the semantic meaning of the text, allowing other models to understand the relationships between words and concepts.

Analogy-wise, an embedding model is like a specialized dictionary that assigns unique numerical codes to words based on their meaning and context.

Here's a key takeaway:

- Foundation models are powerful, all-around learners.
- Embedding models are specialists in transforming text into a form usable by other models.

In some cases, **a foundation model might include an embedding module** as part of its pre-training process. This allows the foundation model to not only learn generally but also develop an understanding of how words relate to each other.
## From Gemini Draft 3, [here](https://gemini.google.com/app/a35234fd8312e974):

There can be some confusion between foundation models and embedding models, but here's the breakdown:

**Foundation models** are a broader category. They're large, powerful AI models trained on massive amounts of data. This data can be text, images, or even code. The key idea is that they use a technique called self-supervision to learn general patterns and relationships within the data. This allows them to be adapted to a wide range of tasks like summarization, translation, or question answering.

**Embedding models** are a **specific type of foundation model**. Their focus is on taking text input (words, phrases, or even documents) and transforming them into numerical representations called embeddings. These embeddings capture the semantic meaning of the text, like its similarity to other words or concepts. Embedding models are often used as a first step in other tasks, like machine translation or sentiment analysis.

Here's an analogy: Imagine a foundation model as a giant toolbox filled with all sorts of tools for working with different materials. An embedding model would be a specific tool in that toolbox, like a hammer that can be used to shape many different things.

So, all embedding models are foundation models, but not all foundation models are embedding models.

# Grounding, Fine-Tuning, Steering

## Prompt 1 

Compare grounding, fine-tuning, and steering. What do they have common in generative AI, how are the different, and where would you use one and not the other

### Gemini response 1
From [here](https://gemini.google.com/app/96d3594194e57a13).  I asked it to lengthen one sentence in the steering section of the first response (which is steering, I guess!)

Draft modified by user

All three techniques, grounding, fine-tuning, and steering, are used to improve the outputs of generative AI models, but they approach it in different ways:

- **Grounding:** This refers to providing a strong foundation of real-world information and context to the model. Imagine teaching a child the difference between a cat and a dog by showing them real pictures and explaining their characteristics. Grounding an AI model involves feeding it massive datasets of text, code, images, or other relevant data depending on the model's purpose. This helps the model understand the relationships between words, concepts, and the real world, leading to more accurate and relevant outputs.
    
- **Fine-tuning:** This technique takes a pre-trained generative model and further trains it on a specific task or dataset. It's like taking a student who has a strong general knowledge base and giving them targeted practice for a particular exam. For example, a large language model could be fine-tuned on a dataset of medical journals to improve its ability to write medical summaries. Fine-tuning allows for specialization and improves performance on a specific task.
    
- **Steering:** This involves influencing the model's output in real-time during generation. It's like nudging a student in the right direction while they're answering a question. Steering can be done through various methods, such as providing prompts, adjusting parameters of the model during generation, or even using human feedback loops. For example, you could steer a language generation model towards a more formal writing style by adjusting a parameter that controls the complexity of sentence structure. Or, you could provide real-time feedback to a model generating images, indicating which areas need more detail or refinement. Human-in-the-loop steering can be particularly useful for creative tasks where the goal is to achieve a specific artistic style or mood.. It allows for more dynamic control over the content being generated.
  
Here's a table summarizing the key differences:

|Technique|How it Works|Use Case|
|---|---|---|
|Grounding|Provides real-world context and information|Improves overall accuracy, reduces hallucinations|
|Fine-tuning|Specializes a pre-trained model for a specific task|Improves performance on a particular task|
|Steering|Influences model output in real-time|Generates specific creative content, avoids unwanted outputs|

**Choosing the right technique:**

- Use grounding when you want a more robust and reliable model that understands the real world better. This is crucial for tasks where factual accuracy is important.
- Use fine-tuning when you have a specific task in mind and want to leverage the power of a pre-trained model. This is efficient for tasks requiring specialized knowledge.
- Use steering when you need more control over the creative direction of the output or want to avoid the model going off on tangents. This is useful for creative writing or generating specific content formats.

In some cases, you might even use a combination of these techniques. For instance, you could ground a large language model on a massive dataset of text and code, then fine-tune it for writing different kinds of creative content, and finally use steering to guide the model towards a specific style or theme for a particular piece.

### Copilot (middle (basic?)) Response 1
From [here](https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx)

Certainly! Let’s delve into the fascinating world of generative AI and explore the concepts of **grounding**, **fine-tuning**, and **steering**. Each of these techniques plays a distinct role in enhancing the capabilities of generative models.

1. **Grounding**:
    
    - **Definition**: Grounding refers to the ability to connect model output to verifiable sources of information. It ensures that the generated content is anchored in specific data, reducing the chances of inventing inaccurate or fictional content.
    - **Use Case**: Grounding is particularly crucial in situations where accuracy and reliability matter. For instance, in financial reporting or health-related contexts, grounding ensures that the model’s responses are based on factual information.
    - **Benefits**:
        - Reduces model hallucinations (instances where the model generates content that isn’t factual).
        - Anchors model responses to specific data sources.
        - Enhances trustworthiness and applicability of generated content.
    - [**Implementation**: In Vertex AI Search and Conversation, grounding allows language models to access information beyond their training data by linking to designated data stores](https://cloud.google.com/vertex-ai/generative-ai/docs/grounding/overview)[1](https://cloud.google.com/vertex-ai/generative-ai/docs/grounding/overview).
2. **Fine-Tuning**:
    
    - **Definition**: Fine-tuning involves refining a pre-trained model to enhance its accuracy and efficiency for specific tasks or datasets. It allows customization of pre-existing models to align with domain-specific requirements.
    - **Use Case**: Fine-tuning empowers individuals to tailor pre-trained AI models to specific domains. It’s invaluable for harnessing AI effectively and aligning it with unique business needs.
    - **Benefits**:
        - Utilizes pre-trained models efficiently.
        - Customizes models for specific tasks.
        - Enables alignment with domain-specific requirements.
    - [**Implementation**: Developers can fine-tune pre-trained models like GPT-3 (e.g., davinci, curie, babbage) to specialize them for their business scenarios](https://www.forbes.com/sites/forbestechcouncil/2023/10/10/the-power-of-fine-tuning-in-generative-ai/)[2](https://www.forbes.com/sites/forbestechcouncil/2023/10/10/the-power-of-fine-tuning-in-generative-ai/)[3](https://letsdatascience.com/the-art-of-fine-tuning-ai-models/).
3. **Steering**:
    
    - **Definition**: Steering involves enabling user interaction and feedback loops to optimize AI system behavior. Techniques like active learning or reinforcement learning allow model modification based on user preferences.
    - **Use Case**: Steering is useful when you want to adapt the model’s behavior based on real-time feedback or user input.
    - **Benefits**:
        - Allows dynamic adjustments to model behavior.
        - Enhances model responsiveness.
        - Supports personalized experiences.
    - [**Implementation**: Implement feedback loops and techniques like reinforcement learning to steer the model](https://www.digitalfluency.guide/post/what-is-steerable-ai-why-does-it-matter-and-how-do-you-build-it)[4](https://www.digitalfluency.guide/post/what-is-steerable-ai-why-does-it-matter-and-how-do-you-build-it).

In summary:

- **Grounding** ensures factual and reliable content.
- **Fine-tuning** tailors pre-trained models to specific domains.
- **Steering** enables dynamic adjustments based on user feedback.

Choose the technique that aligns best with your use case and requirements!

### Copilot (Creative (GPT4 turbo)) Response 1
From [here](https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx&wlexpsignin=1)

In generative AI, **grounding**, **fine-tuning**, and **steering** are three distinct techniques that enhance the performance and applicability of AI models, but they serve different purposes and are used in different contexts.

**Grounding** refers to the process of connecting a generative AI model’s output to verifiable sources of information. [This is done to ensure that the model’s responses are accurate and based on factual data](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[1](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth). [Grounding is particularly important in enterprise settings where the AI needs to provide information that is not only probable but also accurate and verifiable](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[2](https://cloud.google.com/vertex-ai/generative-ai/docs/grounding/overview).

[**Fine-tuning** is a method of training where a pre-trained model is further trained (or fine-tuned) on a specific dataset to specialize its knowledge for particular tasks or domains](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[3](https://www.forbes.com/sites/forbestechcouncil/2023/10/10/the-power-of-fine-tuning-in-generative-ai/). [This is useful when you want the model to perform well on a specific type of content or understand a particular jargon, such as legal terms or medical language](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[4](https://platform.openai.com/docs/guides/fine-tuning).

**Steering** involves guiding the AI’s generation process to align with certain preferences, ethical considerations, or business requirements. [It often employs techniques such as rule-based systems, human-in-the-loop feedback, or interactive interfaces](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[5](https://www.isaca.org/resources/news-and-trends/newsletters/atisaca/2023/volume-44/key-considerations-for-developing-organizational-generative-ai-policies). [Steering is crucial when the AI’s decisions have significant consequences, and human oversight is necessary to ensure the AI’s actions are in line with organizational or societal values](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[6](https://www.digitalfluency.guide/post/what-is-steerable-ai-why-does-it-matter-and-how-do-you-build-it).

What they have in common is that they all aim to improve the relevance, accuracy, and usefulness of generative AI outputs. However, they differ in their approach and application:

- **Grounding** is about ensuring factual correctness and is used when the AI needs to interact with real-world data and provide verifiable information.
- **Fine-tuning** is about model specialization and is used when there is a need for the AI to understand and generate content that is specific to a particular field or domain.
- **Steering** is about control and guidance and is used when it’s necessary to align the AI’s outputs with specific goals, values, or ethical guidelines.

You would use **grounding** when you need the AI to provide information that can be checked against real-world data. **Fine-tuning** would be your go-to when you have a large amount of domain-specific data and you want the AI to perform well on that domain. **Steering** is essential when you need to maintain control over the AI’s outputs, such as in sensitive applications where the AI’s decisions could have significant impacts on people’s lives or business operations.

## Prompt 2

Compare grounding, fine-tuning, and steering. What do they have common in generative AI, how are the different, and where would you use one and not the other

### Copilot (creative) response 2

In technical terms, the algorithms and implementations of **grounding**, **fine-tuning**, and **steering** in generative AI differ primarily in their objectives and the mechanisms they employ to achieve those objectives. However, they share the common goal of improving the performance and applicability of AI models. Here’s a closer look at each:

**Grounding**:

- [**Algorithm**: Grounding often involves integrating a generative AI model with external, up-to-date data sources or databases to provide accurate and verifiable information](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[1](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth).
- [**Implementation**: This can be achieved by linking the AI model to search engines, enterprise data, or specific knowledge bases, allowing it to reference and cite factual information](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[1](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth).
- **Commonality**: Grounding shares with fine-tuning and steering the goal of enhancing the AI’s output but focuses on factual accuracy and real-world data alignment.

**Fine-tuning**:

- [**Algorithm**: Fine-tuning adjusts the weights of a pre-trained neural network on a specific dataset to specialize its knowledge for particular tasks or domains](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[2](https://www.forbes.com/sites/forbestechcouncil/2023/10/10/the-power-of-fine-tuning-in-generative-ai/).
- [**Implementation**: This process involves additional training steps where the model is exposed to new examples and learns to adjust its responses accordingly](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[3](https://platform.openai.com/docs/guides/fine-tuning).
- **Commonality**: Like grounding and steering, fine-tuning aims to improve the AI’s relevance and utility but does so by adapting the model to perform better on specialized content.

**Steering**:

- [**Algorithm**: Steering uses rule-based systems, human-in-the-loop feedback, or interactive interfaces to guide the AI’s generation process](https://cloud.google.com/blog/products/ai-machine-learning/grounding-gen-ai-in-enterprise-truth)[4](https://www.isaca.org/resources/news-and-trends/newsletters/atisaca/2023/volume-44/key-considerations-for-developing-organizational-generative-ai-policies).
- [**Implementation**: It may involve setting up constraints or preferences that the AI must follow, ensuring its outputs align with certain ethical considerations or business requirements](https://www.digitalfluency.guide/post/what-is-steerable-ai-why-does-it-matter-and-how-do-you-build-it)[5](https://www.digitalfluency.guide/post/what-is-steerable-ai-why-does-it-matter-and-how-do-you-build-it).
- **Commonality**: Steering, grounding, and fine-tuning all serve to control the AI’s outputs, but steering is unique in its focus on aligning the AI’s behavior with explicit human values and goals.

While these techniques have distinct technical approaches, they are similar in that they all modify the behavior of a generative AI model to suit specific needs. Grounding ensures accuracy by tethering responses to data, fine-tuning optimizes the model’s performance for particular tasks, and steering controls the model’s outputs to align with human guidance. They can be used separately or in combination, depending on the requirements of the application and the desired outcomes.

# Mixture of Experts vs Model Blending vs Agents

Gemini's answers were all bad in some way.

Perplexity seemed best, and the answers to its suggested questions were also good, and expanded upon its first answer.  All was sourced.

## Prompt
Within the area of generative AI, compare mixture of experts, model blending (also called model merging), and agent-based models. Note that, by "model blending" I don't mean averaging model outputs but combining their parameters. Also by agent-based models, I mean models like those discussed by Andrew Ng in his video, "What's next for AI agentic workflows?"

## Copilot Response
From [here](https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx)

Certainly! Let’s **delve** into the comparison of these three concepts within generative AI:

[**Mixture of Experts (MoE):** MoE is a machine learning approach that involves dividing an AI model into separate sub-networks, each specializing in a subset of the input data](https://www.ibm.com/topics/mixture-of-experts)[1](https://www.ibm.com/topics/mixture-of-experts). [This architecture enables large-scale models to reduce computation costs during pre-training and achieve faster performance during inference by selectively activating only the specific experts needed for a given task](https://www.ibm.com/topics/mixture-of-experts)[1](https://www.ibm.com/topics/mixture-of-experts). [MoE models are particularly beneficial in natural language processing (NLP) where they can address the tradeoff between the greater capacity of larger models and the greater efficiency of smaller models](https://www.ibm.com/topics/mixture-of-experts)[1](https://www.ibm.com/topics/mixture-of-experts).

[**Model Blending (Model Merging):** Model blending refers to the process of combining the parameters of different pre-trained or fine-tuned models to create a new, more powerful model](https://www.geeky-gadgets.com/how-to-blend-llm-ai-models/)[2](https://www.geeky-gadgets.com/how-to-blend-llm-ai-models/). This technique leverages the strengths and specializations of different models to improve performance across a wide range of tasks. [The blending process involves using tools like Merge Kit to merge models with the same architecture and number of layers, and it can result in models that perform well on benchmarks and exhibit high scores on leaderboards](https://www.geeky-gadgets.com/how-to-blend-llm-ai-models/)[2](https://www.geeky-gadgets.com/how-to-blend-llm-ai-models/).

[**Agent-Based Models:** Agent-based models in AI, as discussed by Andrew Ng, refer to models that can independently perform tasks such as drafting, researching, revising, and enhancing work](https://www.youtube.com/watch?v=sal78ACtGTc)[3](https://www.youtube.com/watch?v=sal78ACtGTc). [These models are characterized by their ability to engage in agentic workflows, where AI agents operate autonomously to complete tasks, often surpassing the performance of foundational models in specific applications](https://www.youtube.com/watch?v=sal78ACtGTc)[3](https://www.youtube.com/watch?v=sal78ACtGTc). [Andrew Ng categorizes AI agents into various types, including reflective, tool-using, planning, and collaborative agents, highlighting their versatility and potential to revolutionize tasks](https://www.youtube.com/watch?v=PX3rDf5CvXs)[4](https://www.youtube.com/watch?v=PX3rDf5CvXs).

In summary, while MoE focuses on dividing a model into specialized experts for efficiency, model blending combines the strengths of different models to create a more robust system. Agent-based models, on the other hand, emphasize the autonomous operation of AI agents to perform and refine tasks, potentially leading to more interactive and iterative AI engagements. Each approach has its unique advantages and applications within the field of generative AI.

## Perplexity response
From [here](https://www.perplexity.ai/search/Within-the-area-rxJFdikhTMGWfPnzM2EmgA)

Mixture of Experts (MoE), model blending/merging, and agent-based models are distinct but related approaches in generative AI that leverage multiple models or components to enhance performance and capabilities.

### Mixture of Experts (MoE)

MoE models divide a complex problem into simpler sub-problems, with each sub-problem handled by a specialized "expert" model. A gating network determines which expert(s) to use for a given input, combining their outputs in a weighted manner.[1] Key aspects:

- Each expert focuses on a specific subset of the problem domain
- Experts are trained simultaneously with the gating network
- Enables specialization and efficient use of model capacity
- Suitable for multi-task or multi-domain problems

### Model Blending/Merging

Model blending/merging involves combining the parameters or weights of multiple pre-trained models to create a new, more capable model.[4] Unlike ensembling, where models are combined at the output level, model merging operates at the parameter level. Key aspects: 

- Combines strengths of diverse pre-trained models
- Enables cross-domain knowledge transfer
- Automated optimization of model composition
- Can achieve state-of-the-art performance across tasks

### Agent-based Models

Agent-based models simulate complex systems by defining rules that govern interactions between multiple agents.[3] In the context of generative AI, agents can be instantiated from large language models (LLMs) to exhibit human-like behaviors and interactions.[2] Key aspects:

- Agents have their own goals, decision-making processes, and memory
- Interactions between agents and their environment emerge from defined rules
- Useful for simulating sociological theories, policies, or embodied AI
- Techniques like learned policies and social memory can reduce computational cost[2]

While MoE and model blending focus on combining and optimizing multiple models, agent-based models aim to simulate complex, emergent behaviors from defined rules and interactions between agents instantiated from LLMs.[2][3] Model blending operates at the parameter level, while MoE combines outputs from specialized sub-models.[1][4] All three approaches leverage multiple components to enhance generative AI capabilities.

Citations:
[1] https://www.e2enetworks.com/blog/redefining-ai-with-mixture-of-experts-moe-model-mixtral-8x7b-and-switch-transformers
[2] https://arxiv.org/html/2402.02053v1
[3] https://www.annualreviews.org/docserver/fulltext/statistics/10/1/annurev-statistics-033121-110134.pdf?accname=guest&checksum=50705FD973872F513A44A830CCB6234F&expires=1712912725&id=id
[4] https://github.com/aishwaryanr/awesome-generative-ai-guide
[5] https://www.linkedin.com/pulse/model-merging-expanding-skills-llm-go-nelson-fernandez-pinto-wpwle