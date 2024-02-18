---
type: post
layout: "post"
title: Interesting Stuff - Week 07, 2024
author: nielsb
date: 2024-02-18T14:12:38+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-07-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-07-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Streaming
  - Kafka
  - RisingWave
description: "In this week's blog: a whirlwind tour of Generative AI and Streaming Data Mesh innovations, from the depths of LLMs with llama.cpp to the pioneering Functionary model. Discover the transformative power of GraphRAG and SORA, and join me at the Global Power Platform Bootcamp 2024 for an exciting session on Microsoft Copilot Studio."
---

This week's blog takes you on an exhilarating journey through the latest in Generative AI and Streaming Data Mesh, showcasing groundbreaking advancements from the practical insights of LLMs with `llama.cpp` to the innovative Functionary model. 

We delve into how GraphRAG transforms document analysis and how SORA reshapes text-to-video creativity. Plus, get a glimpse into the transformative world of Streaming Data Mesh with Kafka & RisingWave, 

Finally, join me at the **Global Power Platform Bootcamp 2024** for a deep dive into Microsoft Copilot Studio and the wonders of Generative AI.

<!--more-->

## Generative AI

* [Understanding how LLM inference works with llama.cpp][1]. The author of this blog post explores LLMs through the lens of `llama.cpp`, a C++ implementation of Meta's LLaMA model. The post offers a practical understanding of how LLMs generate responses by breaking down the process into understandable segments such as tokenization, embedding, and the Transformer architecture. The focus is on the inference process, where the trained model interacts with user prompts to produce coherent outputs, making it accessible to engineers outside the ML/AI domain. This deep dive clarifies the inner workings of LLMs and serves as a bridge for those looking to grasp the engineering aspects of these models without delving deep into the underlying mathematical complexities.
* [Building Your Own Product Copilot: Challenges, Opportunities, and Needs][2]. This paper looks at the burgeoning field of integrating advanced AI capabilities into software products, creating "copilots" that assist users by understanding and responding to natural language queries within specific contexts. Through interviews with 26 software engineers from various companies, the study uncovers the multifaceted challenges they face, from the initial unfamiliarity with AI integration to the inadequacies of current software engineering tools and processes in handling the complexities of AI-powered applications. The engineers' experiences highlight the need for better tools and best practices in prompt engineering and testing, which are time-consuming and resource-intensive. The paper also explores potential solutions and opportunities for the broader software engineering community, aiming to streamline the development of AI-enhanced features and products.
* [GraphRAG: Unlocking LLM discovery on narrative private data][3]. This post introduces GraphRAG, a groundbreaking approach that significantly enhances the capabilities of Large Language Models (LLMs) for document analysis and question-answering tasks, particularly with complex and private datasets. GraphRAG leverages LLM-generated knowledge graphs, enabling the model to understand and connect disparate pieces of information and provide synthesized insights. This method shows a marked improvement over traditional Retrieval-Augmented Generation (RAG) techniques, which often need help with complex queries requiring a deep understanding of the data. By organizing data into meaningful semantic clusters and utilizing graph machine learning for prompt augmentation, GraphRAG offers a more intelligent and comprehensive analysis, outperforming baseline RAG methods in delivering coherent and contextually grounded answers. This advancement opens new doors for data investigation, allowing for a more nuanced and accurate exploration of private datasets.
* [Creating video from text: SORA][4]. The link is for SORA, a pioneering text-to-video model designed to understand and simulate the physical world in motion. Sora can generate videos up to a minute long, maintaining high visual quality and closely adhering to user prompts. Initially, Sora is being made available to red teamers for evaluating potential harms or risks and to visual artists, designers, and filmmakers to gather feedback on enhancing the model for creative use. Sora stands out by generating complex scenes with multiple characters, detailed motions, and accurate backgrounds, all driven by a deep understanding of language and the physical world. Despite its strengths, Sora has limitations, such as challenges in simulating complex physics accurately and maintaining consistency in spatial details over time. OpenAI aims to share its research progress early to engage with external feedback and provide insight into upcoming AI capabilities. If you haven't looked yet at SORA, I strongly recommend you do so. It's a game-changer!
* [Meet Functionary: A Language Model that can Interpret and Execute Functions/Plugins][5]. This blog post looks at Functionary, an innovative open-source Large Language Model (LLM) designed for interpreting and executing functions or plugins. It was created by MeetKai, originally known for its contributions to conversational AI. Functionary stands out by judiciously activating functions, understanding their outputs, and triggering them only when necessary, marking a significant shift from general LLMs to a more functional approach. This model benefits applications requiring real-time information and integration with external tools, offering a more efficient and cost-effective alternative to larger models like GPT-4. With drop-in compatibility with OpenAI's platform, Functionary allows easy migration and integration, supporting Python functions and platforms like PyTorch and vLLM. MeetKai's vision with Functionary is to enhance AI-human interactions, particularly in the metaverse, by creating more immersive and interactive experiences. The company is committed to further developing the model, improving inference times, and ensuring comprehensive platform integration.

## Streaming

* [Streaming Data Mesh: Kafka & RisingWave][8]. This article presents a novel approach to Data Mesh, termed Streaming Data Mesh, which significantly diverges from traditional implementations. This approach is centred around utilizing Kafka, a well-known streaming platform, and RisingWave, a streaming database, to maintain data products on the operational plane rather than the analytical plane. This setup allows for bi-directional interactions between operational systems and data products, enabling real-time analytics, online machine learning, and customer-facing applications without requiring specialized ETL pipelines for each data source. The key to this approach is streaming databases like RisingWave, which offer SQL-based stream processing with a database-like experience, including consistency guarantees and PostgreSQL compatibility. The Streaming Data Mesh approach, facilitated by Kafka and RisingWave, represents a significant shift in data mesh implementations, offering a more dynamic and interactive data environment that supports a wide range of real-time use cases.

## WIND (What Is Niels Doing) 

This is what I am doing:

![](/images/posts/speaker-banner.png)

**Figure 1:** *Global Power Platfome Bootcamp SA*

I am prepping for what you see in *Figure 1*. I am doing a session about Microsoft Copilot Studio and Generative AI at the **Global Power Platform Bootcamp 2024**. If you are in Johannesburg on this date [register for the event][7] (it is free), come and say hi. There are many exciting sessions; check out the agenda [here][6].

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

[1]: https://www.omrimallis.com/posts/understanding-how-llm-inference-works-with-llama-cpp/
[2]: https://arxiv.org/pdf/2312.14231.pdf
[3]: https://www.microsoft.com/en-us/research/blog/graphrag-unlocking-llm-discovery-on-narrative-private-data/
[4]: https://openai.com/sora
[5]: https://www.marktechpost.com/2024/02/16/meet-functionary-a-language-model-that-can-interpret-and-execute-functions-plugins/
[6]: https://www.jozipug.com/events
[7]: https://www.meetup.com/jozipug/events/297066384/
[8]: https://www.datamesh-architecture.com/tech-stacks/kafka-risingwave
