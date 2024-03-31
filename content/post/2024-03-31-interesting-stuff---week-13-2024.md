---
type: post
layout: "post"
title: Interesting Stuff - Week 13, 2024
author: nielsb
date: 2024-03-31T08:31:01+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-13-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-13-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Streaming
  - LLMs
  - Kafka
  - AI Agents
description: "In this week's blog: we explore groundbreaking advancements in Generative AI and data streaming, featuring insights from LlamaFactory to DBRX and the transformative potential of agentic workflows. Plus, get a sneak peek into Durban's upcoming Data and AI Community Day."
---

This week's blog post delves into the latest advancements in Generative AI and data streaming, spotlighting transformative frameworks like LlamaFactory and Mora, and groundbreaking tools such as DBRX and Apache Kafka. 

We explore Andrew Ng's insights on the potential of agentic workflows and the strategic shifts revealed at Kafka Summit 2024. Plus, a sneak peek into the upcoming Data and AI Community Day in Durban, promising a day packed with learning and networking.

<!--more-->

## Generative AI

* [LlamaFactory: A Unified Machine Learning Framework that Integrates a Suite of Cutting-Edge Efficient Training Methods, Allowing Users to Customize the Fine-Tuning of 100+ LLMs Flexibly][1]. In the realm of natural language processing, the introduction of LlamaFactory marks a significant leap forward. This innovative framework is designed to democratize the fine-tuning process of large language models (LLMs), making it accessible and customizable for a wide range of users. LlamaFactory integrates a variety of efficient training methods into a unified, modular system, allowing for the fine-tuning of over 100 different LLMs with minimal resource expenditure. This development is particularly exciting as it addresses one of the key challenges in leveraging LLMs: the need for efficient fine-tuning methods that don't require extensive resources. By providing a systematic framework that unifies various fine-tuning approaches, LlamaFactory not only enhances the accessibility of LLMs but also opens up new possibilities for their application across different fields. It's a testament to the ongoing innovation in machine learning, promising to make advanced NLP tools more accessible to a broader audience.
* [Andrew Ng on Agents][2]. In this tweet, Andrew Ng sheds light on a transformative shift in AI, emphasizing the potential of agentic workflows to drive significant progress in the field, possibly surpassing advancements from new generations of foundational models. He articulates the current reliance on large language models (LLMs) in a zero-shot mode, where outputs are generated in a single, unedited flow, likening it to writing an essay in one go without revisions. Despite the challenges, LLMs perform remarkably well under these constraints. Ng introduces the concept of agentic workflows, where LLMs engage in iterative processes similar to human writing strategies, including planning, drafting, revising, and enhancing through multiple passes. This approach, he argues, yields superior outcomes compared to the traditional single-pass method. Highlighting the effectiveness of this methodology, Ng points to a demonstration where incorporating an iterative agent workflow significantly improved the performance of GPT-3.5 on the HumanEval coding benchmark, achieving a 95.1% correctness rate, a stark contrast to its 48.1% in zero-shot mode and even surpassing GPT-4's 67.0%. Ng's insights underscore the importance of iterative, agent-based workflows in unlocking the full potential of AI technologies. By adopting these methodologies, AI practitioners can achieve more nuanced, accurate, and effective outcomes, heralding a new era of AI capabilities that more closely mimic the depth and adaptability of human cognitive processes.
* [Mora: A New Multi-Agent Framework that Incorporates Several Advanced Visual AI Agents to Replicate Generalist Video Generation Demonstrated by Sora][3]. The recent unveiling of Mora, a pioneering multi-agent framework, marks a significant stride in video generation technology. Mora seeks to transcend the limitations of current models that falter beyond the 10-second mark, a challenge that has hindered the practical application of video generation. By harnessing the collective prowess of advanced visual AI agents, each dedicated to specific subtasks such as prompt selection and text-to-image conversion, Mora aspires to replicate and enhance the capabilities exhibited by Sora, OpenAI's closed-source marvel. Mora's architecture is a testament to the power of collaboration among AI agents, each bringing its expertise to bear on the video generation process. This structured yet flexible approach allows Mora to adeptly navigate a variety of video generation tasks, from text-to-video creation to video-to-video editing. Despite a performance gap with Sora, Mora's open-source nature and collaborative framework herald a new era of accessibility and innovation in video generation, promising to push the boundaries of what's possible in visual synthesis. This development is particularly intriguing as it underscores the potential of multi-agent systems in overcoming complex challenges in AI. By breaking down the video generation process into manageable tasks assigned to specialized agents, Mora exemplifies how collaborative AI can achieve results that might be out of reach for individual models. It's a compelling reminder of the importance of diversity and specialization within AI systems, offering a glimpse into the future of creative and generative AI applications.
* [Introducing DBRX: A New State-of-the-Art Open LLM][4]. Databricks has recently unveiled DBRX, a groundbreaking open, general-purpose Large Language Model (LLM) setting new benchmarks in the field. DBRX surpasses the performance of established open LLMs like GPT-3.5 and rivals closed models such as Gemini 1.0 Pro, particularly shining as a code model. What sets DBRX apart is its fine-grained mixture-of-experts (MoE) architecture, which enhances both training and inference efficiency, making it a lean yet powerful tool in the LLM landscape. The introduction of DBRX is a significant moment for the open-source community and enterprises alike, offering capabilities that were once confined to closed-model APIs. With inference speeds up to twice as fast as some of its predecessors and a considerably smaller size, DBRX represents a leap towards more accessible and efficient AI technologies. Its availability on platforms like Hugging Face underlines Databricks' commitment to open-source principles, promising to spur innovation and collaboration within the AI community. DBRX's emergence is particularly noteworthy for its implications on the democratization of AI. By providing an open model that competes with, and in some aspects surpasses, closed models, Databricks is not just advancing state of the art but also ensuring that these advancements are accessible to a broader audience. This move could catalyze a wave of innovation as more researchers and developers gain the tools to push the boundaries of what's possible with AI.

## Streaming

* [Changes You Should Know in the Data Streaming Space: Takeaways From Kafka Summit 2024][5]. This blog post by RisingWave compares this year's event with Current 2023. The summit highlighted Confluent's strategic pivot towards making Kafka the backbone of data products, aiming to simplify the data infrastructure for users and elevate Kafka from a data movement tool to a comprehensive data management solution. Confluent's vision to blend the operational and analytical realms by capturing real-time data events at their source could redefine the industry, potentially positioning it ahead of competitors like Snowflake and Databricks. Additionally, Kafka's enhancements, such as the two-phase commit mechanism and improved client observability, promise to revolutionize data consistency maintenance, addressing the critical challenge of exactly-once semantics in distributed environments. Confluent's strategy to merge batch and streaming realms through technologies like Apache Iceberg and the introduction of TableFlow for seamless integration of Kafka data into data lakes and warehouses signifies a bold step towards a unified data ecosystem. This approach challenges the dominance of Snowflake and Databricks and reiterates the importance of Iceberg as the preferred data lake format. The summit also touched on the burgeoning field of GenAI, with Confluent articulating a clearer vision for its AI strategy, including using Flink for invoking external vector embedding services. However, the roadmap for Confluent's GenAI initiatives remains unclear, highlighting the ongoing challenge of integrating unstructured data for model training. In conclusion, the Kafka Summit 2024 underscored the shift towards high-level abstraction, cost efficiency, unified systems, and GenAI in the data streaming space. Far from being a niche, Streaming technology is poised to shape the future of data management and analysis, reflecting the industry's move towards powerful and user-friendly tools.
* [Real-Time Generative AI Applications: Harnessing the Power of Stream Processing][6]. Generative AI, powered by Large Language Models (LLMs), is transforming the software industry by overcoming traditional limitations through innovative solutions like Retrieval-Augmented Generation (RAG). RAG optimizes LLM outputs by referencing external authoritative knowledge bases, enhancing data freshness and context relevance. This approach addresses LLM challenges such as data recency, short memory, and hallucination by integrating real-time, private, and historical data into the model's context. Building effective LLM applications hinges on a robust data engineering foundation. A well-architected LLM application typically includes a real-time data processing pipeline and a vector data storage for historical embedding data indexing. Apache Kafka is recommended for real-time data transport due to its maturity and community support. For real-time stream processing, tools like Apache Flink, Timeplus Proton, Bytewax, and RisingWave offer scalable and reliable solutions, with Timeplus Proton highlighted for its high performance and ease of use with Kafka. The choice of a vector database is crucial for long-term memory in LLMs, with options ranging from dedicated vector databases to leveraging existing systems like ClickHouse or PostgreSQL for vector storage and search. Embedding functions, essential for converting text to numerical vectors, can be sourced from platforms like OpenAI or Huggingface, depending on the application's needs. Context builders play a pivotal role in crafting prompts for LLMs, with tools like LangChain and LIamaIndex assisting in prompt generation. The selection of an LLM model, whether open-source or proprietary, should align with the specific requirements of the use case. In summary, real-time data is pivotal for maximizing the potential of LLMs in generative AI applications. By leveraging streaming platforms like Apache Kafka and stream processing tools like Timeplus Proton and RisingWave, developers can create applications that extract valuable insights from streaming data, further amplified by the capabilities of LLMs.

## WIND (What Is Niels Doing)

As mentioned previously:

![](/images/posts/data-ai-dbn-april-24.png)

**Figure 1:** *Data and AI Community Day Durban*

The CfS (Call for Speakers) for the event is closing soon, and I have started looking at what has been submitted. There are some exciting topics, and I see how the event will be a great success. Notice I said the CfS is closing soon; it has not closed yet, so if you want to submit a session, you need to do it now (I am looking at you [Dean Martin][10]). The event is on the 27th of April and will be a full day of learning and networking. 

👉 [**SUBMIT HERE**][7]

Registration for the event is also open, and you can register now. As I mentioned above, from the topics I have seen, the event is a **MUST-ATTEND** event. It is free, so what are you waiting for:

👉 [**REGISTER HERE**][8]

If you are interested in the event, you can find more information on the [**AI/ML & Data Community Durban**][9] website.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. Please comment on this post or [ping][ma] me if you have ideas for what to cover.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[mdaveyblog]: https://mdavey.wordpress.com/
[charlblog]: https://charlla.com/

[jovpop]: https://twitter.com/JovanPop_MSFT
[bobw]: https://twitter.com/bobwardms
[revod]: https://twitter.com/revodavid
[lonny]: https://twitter.com/sqL_handLe
[ewtw]: https://twitter.com/sqlOnIce
[buckw]: https://twitter.com/BuckWoodyMSFT
[mattw]: https://twitter.com/matthewwarren
[murba]: https://twitter.com/muratdemirbas
[daveda]: https://twitter.com/davidthecoder
[adcol]: https://twitter.com/adriancolyer
[jesrod]: https://twitter.com/jrdothoughts
[tomaz]: https://twitter.com/tomaz_tsql
[dataart]: https://twitter.com/dataartisans
[luis]: https://twitter.com/luis_de_sousa
[benstop]: https://twitter.com/benstopford
[conflu]: https://twitter.com/confluentinc
[tylert]: https://twitter.com/tyler_treat
[andrewng]: https://twitter.com/AndrewYNg
[lawr]: https://twitter.com/bytezn
[jue]: https://twitter.com/b0rk
[yan]: https://twitter.com/theburningmonk
[danny]: https://twitter.com/g9yuayon
[rmoff]: https://www.linkedin.com/in/robinmoffatt/
[ryansw]: https://twitter.com/ryanswanstrom
[pabloc]: https://twitter.com/pabloc_ds
[mklep]: https://twitter.com/martinkl
[mdavey]: https://twitter.com/matt_davey
[jboner]: https://twitter.com/jboner
[joeduff]: https://twitter.com/funcOfJoe
[charl]: https://twitter.com/charllamprecht
[dbricks]: https://twitter.com/databricks
[adsit]: https://twitter.com/SitnikAdam
[vicky]: https://twitter.com/vickyharp
[dscentral]: https://twitter.com/DataScienceCtrl
[natemc]: https://twitter.com/natemcmaster
[ads]: https://twitter.com/azuredatastudio
[travw]: https://twitter.com/radtravis
[emilk]: https://twitter.com/IsTheArchitect
[netflx]: https://netflixtechblog.com/
[hubert]: https://www.linkedin.com/in/hkdulay/
[jserra]: https://www.linkedin.com/in/jamesserra/

[1]: https://www.marktechpost.com/2024/03/25/llamafactory-a-unified-machine-learning-framework-that-integrates-a-suite-of-cutting-edge-efficient-training-methods-allowing-users-to-customize-the-fine-tuning-of-100-llms-flexibly
[2]: https://twitter.com/AndrewYNg/status/1770897666702233815
[3]: https://www.marktechpost.com/2024/03/29/mora-a-new-multi-agent-framework-that-incorporates-several-advanced-visual-ai-agents-to-replicate-generalist-video-generation-demonstrated-by-sora
[4]: https://www.databricks.com/blog/introducing-dbrx-new-state-art-open-llm
[5]: https://risingwave.com/blog/changes-you-should-know-in-the-data-streaming-space-takeaways-from-kafka-summit-2024/
[6]: https://www.timeplus.com/post/generative-ai-apps
[7]: https://sessionize.com/data-and-ai-community-day-dbn-april-24
[8]: https://www.quicket.co.za/events/254487-data-and-ai-community-day-durban/#/
[9]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/
[10]: https://www.linkedin.com/in/deanmartinza/
