---
type: post
layout: "post"
title: Interesting Stuff - Xmas, New Year 2023, Week 1 2024
author: nielsb
date: 2024-01-07T09:38:19+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-01-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-01-24.jpg"
categories:
  - roundup
tags:
  - generative AI
  - streaming
  - streamprocessing
  - RisingWave
description: "Dive into this week's tech insights, exploring the art of perfect tutorials, database innovations, and generative AI's potential. Discover transformative collaborations in real-time ML solutions. "
---

Welcome to this week's whirlwind of tech discoveries! From the art of crafting impactful tutorials to the innovative depths of databases and generative AI, we're diving deep into the realms of technical clarity, database robustness, and AI's potential. 

Plus, explore the transformative collaboration between RisingWave and MindsDB for real-time ML solutions.

<!--more-->

## Misc.

* [Crafting Clarity: How To Structure a Perfect Technical Tutorial?][1]. Since I have been known to write a tutorial or two, I thought this was a good read. The post delves into the anatomy of an effective tutorial, highlighting the importance of clarity, organization, completeness, engagement, and usability as key criteria for a tutorial to be considered "good." It provides a detailed breakdown of the seven essential sections of a tutorial, including the introduction, overview, prerequisites, execution, validation, tearing down, and conclusion, each serving a distinct purpose in guiding novice and experienced creators. The post serves as a comprehensive guide, offering a template and practical tips to help creators structure their tutorials more effectively, ultimately enhancing the learning experience for users.

## Databases

* [Building Pinterest's new wide column database using RocksDB][2]. This Pinterest post shares the journey and technical insights of developing Rockstorewidecolumn, a wide column, schemaless NoSQL database built on RocksDB. The post begins by explaining the advantages of wide column databases over traditional relational databases, emphasizing their flexible columnar structure and schemaless nature. It then delves into the specifics of RocksDB, an efficient, scalable key-value store developed by Meta, and how Pinterest utilized it along with a real-time replicator library, Rocksplicator, to create a highly available and fault-tolerant wide column database. The article further details the logical and storage view of the database, the APIs supported, and key features like versioned values, TTL, pagination, and time range queries, culminating in a real-world application of storing large-scale user sequences at Pinterest. This piece is a deep dive into the challenges and innovations in building a robust database system to support Pinterest's massive scale and dynamic storage needs.

## Generative AI

* [Microsoft Researchers Introduce PromptBench: A Pytorch-based Python Package for Evaluation of Large Language Models (LLMs)][3]. This post introduces PromptBase. It addresses the challenge of disparate evaluation methods by offering a cohesive, modular framework that simplifies the process into four main steps: task specification, dataset loading, LLM customization, and prompt definition. This allows for a more streamlined and accessible evaluation process, compatible with various LLMs implemented in Huggingface. PromptBench facilitates the integration of LLMs into the evaluation pipeline and enhances the process with additional performance metrics and input/output processing functions for a more nuanced understanding of model behaviour. Its user-friendly customization and comprehensive approach make it a significant advancement in the field, promising to reshape the future of LLM evaluation with its standardized and detailed assessments. Very interesting! Also, have a look at the accompanying [paper][4], as well as the repo on [GitHub][5].  
* [InsightPilot: An LLM-Empowered Automated Data Exploration System][6]. This paper introduces InsightPilot, an innovative automated data exploration system powered by Large Language Models (LLMs). It aims to simplify the data exploration process by providing a set of analysis actions that streamline tasks. InsightPilot takes a natural language question and collaborates with the LLM to execute a sequence of analysis actions, explore the data, and generate insights. This system is particularly beneficial in overcoming the challenges of manual data exploration, which is often time-consuming and requires considerable domain knowledge and expertise. The effectiveness of InsightPilot has been demonstrated through user studies and case studies, showing its potential to assist users in gaining valuable insights from their datasets efficiently. This tool represents a significant step forward in automating and enhancing the data analysis process, making it more accessible and less daunting for users of all levels of expertise. I really hope this will be made available to the public at some point!
* [Weak-to-strong generalization][7]. This post looks at OpenAI's research on "Weak-to-strong generalization", which addresses the challenge of aligning future superhuman AI systems, a concept referred to as superalignment. The core idea is to explore whether smaller, less capable models can supervise larger, more capable models, akin to how humans might need to supervise AI systems much smarter than themselves. The research shows that a GPT-2-level model can elicit most of GPT-4's capabilities, achieving close to GPT-3.5-level performance, even on complex problems where the small model fails. This suggests that weak supervisors might effectively control stronger models by leveraging these advanced systems' latent knowledge and capabilities. The results indicate that while naive human supervision might scale poorly to superhuman models, it is feasible to significantly improve weak-to-strong generalization. This opens up new research opportunities and directions, including developing better scalable methods and understanding when and how good weak-to-strong generalization can be expected. Check out this [post][8] for a more detailed explanation.
* [Unlocking Azure AI Studio: My Journey to Overcoming Subscription Snags][12]. In this post by yours truly, I look at, despite having access to Azure OpenAI Service and Azure OpenAI Studio, a perplexing issue that prevented Azure AI Studio from recognizing my subscription. The post details the problem and the moment of realization that led to a simple yet effective solution. By switching to the correct Azure directory, I was able to unlock the full potential of Azure AI Studio for my projects. 

## Streaming

* [Meeting of Minds: RisingWave and MindsDB for a Complete Real-Time ML Solution][9]. This post looks at the collaboration between [RisingWave][10] and [MindsDB][11]. It presents a comprehensive solution for real-time machine learning, aiming to significantly empower data engineering teams by streamlining workflows and offering more insightful data analysis. MindsDB acts as a bridge, seamlessly integrating databases with model training, allowing AI and data teams to streamline their workflow. It supports a wide range of data sources, standardizing the data access layer and eliminating the need for multiple tools for data extraction.

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

[1]: https://www.linkedin.com/pulse/crafting-clarity-how-structure-perfect-technical-dunith-danushka-j9e1e/
[2]: https://medium.com/pinterest-engineering/building-pinterests-new-wide-column-database-using-rocksdb-f5277ee4e3d2
[3]: https://www.marktechpost.com/2023/12/23/microsoft-researchers-introduce-promptbench-a-pytorch-based-python-package-for-evaluation-of-large-language-models-llms/
[4]: https://arxiv.org/abs/2312.07910v1
[5]: https://github.com/microsoft/promptbase/
[6]: https://www.microsoft.com/en-us/research/uploads/prod/2023/12/InsightPilot.pdf
[7]: https://openai.com/research/weak-to-strong-generalization
[8]: https://pub.towardsai.net/outsmarting-the-masters-how-weak-ai-trains-super-ai-2935e8e97178
[9]: https://risingwave.com/blog/meeting-of-minds-risingwave-and-mindsdb-for-a-complete-real-time-ml-solution/
[10]: https://risingwave.com/
[11]: https://mindsdb.com/
[12]: https://nielsberglund.com/post/2023-12-30-unlocking-azure-ai-studio-my-journey-to-overcoming-subscription-snags/
