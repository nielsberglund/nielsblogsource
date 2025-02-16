---
type: post
layout: "post"
title: Interesting Stuff - Week 07, 2025
author: nielsb
date: 2025-02-16T09:31:10+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-07-25.jpg"
thumbnail: "/images/thumbnails/posts/wrup-07-25.jpg"
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
description: "AI is accelerating fast! This week's roundup covers superhuman coding AI, the rise of the AI Architect role, and Klarna's AI assistant handling work for 700 staff. Plus, we dive into research on large reasoning models, AI-driven GPU optimisation, and how real-time data innovations are shaping the future of AI."
---

AI is evolving at breakneck speed! This week, we explore Sam Altman's bold prediction of superhuman coding AI by 2025, the rise of the AI Architect role, and Klarna's AI assistant, which now handles work equivalent to 700 full-time staff. Meanwhile, research on large reasoning models suggests AI outperforms specialised systems in competitive coding, and NVIDIA is pushing the boundaries of AI-driven GPU optimisation. 

On the streaming front, Confluent and Databricks are bridging data silos for real-time AI, while time-series and streaming databases continue their battle for real-time dominance. Dive in for a deep dive into the latest in AI, data, and streaming! 

<!--more-->

## Podcast

If you rather listen to the summary:

<iframe title="Interesting Stuff - Week 07, 2025" allowtransparency="true" height="150" width="100%" style="border: none; min-width: min(100%, 430px);height:150px;" scrolling="no" data-name="pb-iframe-player" src="https://www.podbean.com/player-v2/?i=7iv5f-1803131-pb&from=pb6admin&share=1&download=1&rtl=0&fonts=Arial&skin=1&font-color=auto&logo_link=episode_page&btn-skin=7" loading="lazy"></iframe>

Click on the link above to listen to the podcast. Oh, the direct link to the episode is [here](https://nielsitberglund.podbean.com/e/interesting-stuff-week-07-2025/).

## Generative AI

* [Sam Altman REVEALS SUPERHUMAN Coder Coming This Year...](https://www.youtube.com/watch?v=4Wa6St-uosY). This transcript from Wes Roth's YouTube video explores Sam Altman's claims about rapidly advancing AI coding capabilities. Altman suggests AI models are quickly progressing from the millionth-best to potentially the number-one competitive programmer globally by the end of 2025. Roth interprets this as a sign that AI will significantly enable and augment, rather than replace, skilled software engineers. The discussion also covers the importance of co-evolution with AI, the potential of AI in education via personalised tutoring, and strategies for building successful AI-driven start-ups, emphasising creative vision, adaptability, and leveraging AI's strengths to create enduring value. 
* [The AI Architect — Bret Taylor](https://www.latent.space/p/bret). This post is a transcript of a podcast interview with Bret Taylor, a prominent figure in Silicon Valley, discussing the evolution of software engineering in the age of AI. The interview explores several key themes: Firstly, the emergence of the 'AI Architect' role within companies, highlighting the need for individuals who can bridge the gap between technical and business understanding in managing AI agents. Secondly, it delves into Taylor's experiences at Google, recounting the story of rewriting Google Maps and emphasising the importance of close collaboration between product and engineering teams, particularly in rapidly evolving technological landscapes. Thirdly, the discussion touches on the future of software development, speculating on the potential for AI-native programming languages and systems that prioritise verifiable correctness and automated code reviews, as well as the business model evolution of selling software toward outcomes. Finally, the transcript details Taylor's involvement with OpenAI, offering insights into his role in navigating the leadership crisis and the company's broader mission of ensuring AI benefits humanity.
* [How Klarna's AI assistant redefined customer support at scale for 85 million active users](https://blog.langchain.dev/customers-klarna/). This LangChain post is a case study detailing how Klarna revolutionised its customer support using an AI assistant built on LangGraph and LangSmith. Facing challenges in scaling customer support for 85 million active users, Klarna sought a solution to manage escalations efficiently. The AI assistant, acting as a transformative agent, automated 70% of repetitive tasks and achieved 80% faster resolution times, performing the equivalent work of 700 full-time staff. Using LangGraph for controllable agent architecture and LangSmith for testing and prompt optimisation, Klarna significantly improved accuracy and reduced customer escalations. The post highlights the importance of AI-driven customer support in enhancing user experience and operational efficiency, enabling Klarna to deliver personalised, efficient, and scalable support to its global user base.
* [Competitive Programming with Large Reasoning Models](https://arxiv.org/pdf/2502.06807). This paper investigates the power of large reasoning models (LRMs), particularly those trained with reinforcement learning, in tackling complex coding and reasoning tasks. It compares general-purpose models like OpenAI's o1 and o3 with a specialised system, o1-ioi, designed for competitive programming, noting that while specialised systems initially show promise, the scaled-up, general-purpose models eventually outperform them without relying on hand-engineered strategies. The key finding highlights that scaling general-purpose reinforcement learning offers a more robust approach to achieving state-of-the-art AI in reasoning-heavy domains like competitive programming and real-world software engineering. The results demonstrate impressive performance gains in benchmarks like CodeForces, the International Olympiad in Informatics (IOI), and SWE-bench, indicating that LRMs are approaching or even surpassing elite human capabilities in these areas.
* [Automating GPU Kernel Generation with DeepSeek-R1 and Inference Time Scaling](https://developer.nvidia.com/blog/automating-gpu-kernel-generation-with-deepseek-r1-and-inference-time-scaling/). This NVIDIA technical blog post discusses automating the generation of optimised GPU kernels using the DeepSeek-R1 model and inference-time scaling. The article highlights the increasing importance of optimised attention kernels for large language models as the computational complexity grows significantly with input sequence length. NVIDIA engineers developed a novel workflow where DeepSeek-R1 iteratively generates and refines GPU code, guided by a verifier running on an NVIDIA H100 GPU in a closed-loop process, ultimately leading to performance that, in some instances, surpasses hand-optimised kernels, particularly with increased computational resources allocated during inference. The core idea is that allocating more time for inference allows the model to explore more solutions and refine the generated code.

## Streaming

* [Bridging the Data Divide: How Confluent and Databricks Are Unlocking Real-Time AI](https://www.confluent.io/blog/confluent-and-databricks/). In this blog post, Confluent announces an expanded partnership between Confluent and Databricks, aiming to simplify the integration of analytical and operational systems for faster AI deployment. The core problem addressed is that AI's effectiveness is limited by siloed data, where real-time operational data and analytical insights are disconnected, thus requiring better connectivity. The solution involves a Delta Lake-first integration using Confluent's Tableflow, enabling bidirectional data flow and fostering real-time, governed data products, ultimately leading to faster, more accurate, and automated decision-making fuelled by AI. By using this integration, enterprises can ensure AI operates on real-time, trusted data, transitioning from reactive insights to proactive decisions, which can be used in several business needs, from anomaly detection to hyper-personalisation.
* [Time-Series Databases vs. Streaming Databases: Key Differences & Use Cases](https://www.risingwave.com/blog/streaming-vs-time-series-database-comparison/). This post compares time-series databases (TSDBs) and streaming databases, highlighting their core differences in data handling, architectural roles, query patterns, data retention, integration patterns, and ecosystem integration. TSDBs are optimised for storing and analysing historical trends using a pull-based approach, making them suitable for monitoring and historical market analysis. Conversely, streaming databases are engines for real-time data pipelines, designed for continuous queries and event-driven architectures, ideal for fraud detection and real-time monitoring. Ultimately, the source emphasises that while distinct, TSDBs and streaming databases can work together, with streaming databases providing real-time processing and TSDBs offering long-term historical analysis, with a trend of convergence driven by the need for systems that can handle both real-time and historical data, particularly in cloud-native environments. 

## ~ Finally

That's all for this week. I hope you find this information valuable. Please share your thoughts and ideas on this post or [ping][ma] me if you have suggestions for future topics. Your input is highly valued and can help shape the direction of our discussions.

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
[lemi]: https://www.linkedin.com/in/lemimasalu/
[michael]: https://www.linkedin.com/in/michaeladrianjohnson/
