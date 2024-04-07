---
type: post
layout: "post"
title: Interesting Stuff - Week 14, 2024
author: nielsb
date: 2024-04-07T10:27:45+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-14-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-14-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Streaming Analytics
  - Kafka
  - LLM
  - RAG
description: "Dive into this week's blog as we explore the forefront of Generative AI with RAG deep dives and Databricks' DBRX, alongside cutting-edge Streaming Analytics like Microsoft's Eventhouse. Plus, get a glimpse into the upcoming Data and AI Community Days."
---

This week's blog post is a whirlwind tour through the latest in Generative AI and Streaming Analytics, featuring everything from a deep dive into Retrieval Augmented Generation (RAG) to the innovative Eventhouse by Microsoft Fabric. 

We explore the groundbreaking DBRX model by Databricks, and share insights from the integration of Apache Kafka with Tinybird. Plus, a sneak peek into my preparations for the upcoming Data and AI Community Days in Johannesburg and Durban. Join me as we navigate these exciting developments in the tech world, perfect for enthusiasts and professionals alike!

<!--more-->

## Generative AI

* [RAG from Scratch][4]. This LangChain YouTube playlist looks at RAG (Retrieval Augmented Generation) from scratch. RAG is a general methodology for connecting LLMs with external data sources. The playlist consists of 10 videos, each focusing on a different aspect of RAG. The video series will build an understanding of RAG from scratch, starting with the basics and building up to more advanced techniques. The videos are well-structured and easy to follow, making them suitable for beginners and experts. I recommend this playlist to anyone interested in learning about RAG and how it can be used to enhance LLMs with external data sources.
* [Most Impactful RAG Papers][5]. This LinkedIn post provides a link to a comprehensive list of the most impactful RAG papers from the past year. This treasure trove includes over 60 papers, each accompanied by succinct summaries and topic tags, providing a rich resource for anyone interested in the cutting-edge of language model research. The surge in RAG research directly responds to the rapid advancements and expanding applications of large language models (LLMs), highlighting the community's drive to enhance RAG's efficiency in tandem with LLMs' broader adoption. The curated selection is thoughtfully categorized to cater to various interests within the RAG domain. Categories range from surveys providing a comprehensive overview of RAG methods and advanced techniques to enhance RAG's efficiency to domain-specific adaptations showcasing the versatility and depth of current research. This compilation is a goldmine for researchers, practitioners, and enthusiasts alike, offering insights into RAG's latest trends and innovations. It underscores the importance of continuous learning and adaptation in the fast-evolving field of AI and machine learning, encouraging a deeper dive into the papers to unlock new potentials and applications of RAG.
* [Evolution of RAGs: Naive RAG, Advanced RAG, and Modular RAG Architectures][6]. A lot of RAG today :smile:. This article delves into the evolution of RAG architectures, highlighting their pivotal role in addressing the limitations of large language models (LLMs) like ChatGPT, Bard, and Claude. RAG, by integrating external databases, enhances the accuracy and credibility of generated content, especially for knowledge-intensive tasks. This integration allows for continuous updates and the inclusion of domain-specific information, addressing issues such as hallucination and outdated knowledge inherent in standalone LLMs. The article categorizes the development of RAG into three distinct stages: Naive RAG, Advanced RAG, and Modular RAG. Naive RAG, the earliest form, follows a straightforward "Retrieve-Read" framework but faces challenges in retrieval precision and content generation coherence. Advanced RAG addresses these issues with improved indexing techniques and retrieval optimization, enhancing the quality and relevance of retrieved content. Modular RAG, the latest innovation, offers a flexible and adaptable architecture, incorporating specialized modules for improved retrieval, processing, and task-specific adaptations. This modular approach not only overcomes the limitations of its predecessors but also sets a new standard in building RAG applications, promising more accurate, relevant, and context-aware responses in LLMs.
* [Inside DBRX: Databricks' Impressive Open Source LLM][7]. Databricks has made a significant leap in the open-source generative AI space by releasing DBRX, a large language model (LLM) that showcases impressive performance across various industry benchmarks. DBRX, built on a mixture-of-experts (MoE) approach, includes a baseline model (DBRX Base) and an instruction-fine-tuned variant (DBRX Instruct), both demonstrating Databricks' prowess in dataset quality and training processes. DBRX operates on a transformer-based, decoder-only framework, utilizing a sophisticated MoE structure with 132 billion parameters, of which only 36 billion are engaged for any given input. This model stands out by employing 16 smaller experts, allowing for a significantly larger number of expert combinations, thereby enhancing the model's quality. The training dataset, comprising 12 trillion tokens, is meticulously compiled, offering a token-for-token effectiveness believed to be twice as efficient as previous models developed by Databricks. DBRX Instruct, tailored for instruction-following tasks, shares the MoE architecture and excels in applications requiring brief interactions. Both DBRX and its instruct variant have been rigorously evaluated, showing superior performance in general knowledge, commonsense reasoning, and specialized domains like programming and mathematics. Accessible via the HuggingFace platform, DBRX and DBRX Instruct promise potent tools for complex language understanding and generation tasks, representing a significant upgrade in Databricks' LLM offerings and positioning themselves as significant contributors to the new wave of generative AI.

## Streaming

* [Eventhouse Overview: Handling Real-Time Data with Microsoft Fabric][1]. This blog post on the Microsoft Fabric blog introduces Eventhouse, a cutting-edge addition to its real-time analytics suite. Eventhouse is designed to manage and analyze vast volumes of real-time data, offering a shared workspace for multiple KQL databases. This platform stands out for its ability to ingest, process, and analyze data streams almost instantaneously, making it an ideal solution for handling event-based data like telemetry, IoT data, and financial records. With features like automatic indexing, partitioning, and the ability to suspend services to optimize costs, Eventhouse is poised to revolutionize how organizations approach real-time data analytics. I find it fascinating to see how Microsoft is pushing the boundaries of real-time data analytics with Eventhouse. The ability to manage multiple databases in a unified workspace not only streamlines operations but also significantly reduces costs and complexity. This could be a game-changer for industries reliant on timely data insights like finance, security, and IoT. It'll be interesting to see how this technology evolves and how it will be adopted across different sectors.
* [Apache Kafka and Tinybird (ClickHouse) for Streaming Analytics HTTP APIs][2]. In this blog post by [Kai Waehner][3], he delves into the innovative integration of Apache Kafka with Tinybird, leveraging the power of ClickHouse for enhanced streaming analytics and HTTP APIs. He highlights how Tinybird, built atop the open-source ClickHouse database, sets itself apart by offering real-time analytics through a REST/HTTP layer, simplifying the integration and application publishing process. This combination efficiently handles large-scale analytical workloads, with Tinybird providing a user-friendly platform for developing scalable data products. The post also shares insights from customer stories like Factorial and FanDuel, showcasing the practical benefits of this integration in real-world applications, from HR software to online gambling, emphasizing the importance of data freshness and reduced query latency.

## WIND (What Is Niels Doing)

Today, the CfS (Call for Speakers) for [**Data and AI Community Day Durban**][8], April 27th, closes, so I am busy evaluating submissions. There are so many awesome submissions that it is going to be tough to select the speakers. I plan to announce the speakers by the end of the week. 

I am also prepping for [**Data and AI Community Day Johannesburg**][9] which is happening on the 20th of April:

![](/images/posts/speaker-banner.jpg)

**Figure 1:** *Generative AI and CoPilot Studio*

As you see in *Figure 1*, I am doing a session on how to use GenerativeAI with CoPilot Studio, and I am really looking forward to it.

Both the **Data and AI Community Day** events are free. To attend you register for:

* Johannesburg: [**Register for Data and AI Community Day Johannesburg**][10]
* Durban: [**Register for Data and AI Community Day Durban**][11]

Please register and join us for a day of learning and networking!

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

[1]: https://blog.fabric.microsoft.com/en-us/blog/eventhouse-overview-handling-real-time-data-with-microsoft-fabric
[2]: https://www.kai-waehner.de/blog/2024/04/04/apache-kafka-and-tinybird-clickhouse-for-streaming-analytics-http-apis
[3]: https://www.linkedin.com/in/kaiwaehner/
[4]: https://www.youtube.com/playlist?list=PLfaIDFEXuae2LXbO1_PKyVJiQ23ZztA0x
[5]: https://www.linkedin.com/posts/areganti_genai-genai-llms-activity-7179666154016133120-tEaM/
[6]: https://www.marktechpost.com/2024/04/01/evolution-of-rags-naive-rag-advanced-rag-and-modular-rag-architectures
[7]: https://pub.towardsai.net/inside-dbrx-databricks-impressive-open-source-llm-ba376b7fb93c
[8]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/
[9]: https://www.dataandaicommunity.co.za/events/JHB-202404.html
[10]: https://www.quicket.co.za/events/253233-data-and-ai-community-day-joburg-april-2024/#/
[11]: https://www.quicket.co.za/events/254487-data-and-ai-community-day-durban/#/
