---
type: post
layout: "post"
title: Interesting Stuff - Week 18, 2024
author: nielsb
date: 2024-05-05T15:19:44+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-18-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-18-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Streaming
  - Kafka
  - Confluent Cloud
  - GitHub Copilot
  - Season of AI
description: "Explore this week's top tech highlights, from GitHub's Copilot Workspace to Confluent Cloud's Freight Clusters. Discover the latest advancements in Generative AI and streaming, plus get a glimpse of the upcoming Season of AI event! Don't miss out on the future of technology."
---

🚀 Dive into this week's tech highlights! From GitHub's game-changing Copilot Workspace to Confluent Cloud's revolutionary Freight Clusters, discover how cutting-edge advancements in Generative AI and streaming are shaping the future of technology. 

Plus, get a sneak peek into the upcoming Season of AI event, promising a day filled with AI, Data, ML, and more! Don't miss out on the latest innovations driving the tech landscape forward. 💡🌐

<!--more-->

## Generative AI

* [GitHub Copilot Workspace: Welcome to the Copilot-native developer environment][1]. GitHub recently introduced GitHub Copilot Workspace, a new collaborative coding environment that aims to enhance developers' productivity. This tool integrates seamlessly with Visual Studio Code, allowing teams to work together efficiently while leveraging Copilot's advanced code suggestions and autocomplete capabilities. With features like real-time collaboration and integrated pull requests, GitHub Copilot Workspace promises to streamline the development process and foster collaboration among developers. My thoughts: GitHub Copilot Workspace appears to be a significant step forward in fostering collaborative coding environments. This move could potentially revolutionize how teams collaborate on coding projects, ultimately leading to increased productivity and efficiency. I am excited to see how this tool evolves and how it impacts the developer community in the future.
* [Introducing improvements to the fine-tuning API and expanding our custom models program][2]. OpenAI has announced enhancements to its fine-tuning API and an expansion of its custom models program, aiming to simplify the creation and deployment of custom AI models for developers. The fine-tuning API now offers better support for tasks like text generation and summarization, along with more extensive documentation and tutorials. OpenAI is also broadening its custom models program, providing developers with access to larger models and more compute resources for their projects. 
* [This AI Research from Cohere Discusses Model Evaluation Using a Panel of Large Language Models Evaluators (PoLL)][3]. The AI research discussed in this post looks at model evaluation using a panel of large language models (LLMs) evaluators' poll. This innovative approach leverages multiple LLMs to evaluate the performance of other language models, enabling more robust and comprehensive evaluations. By aggregating the responses from different LLMs, researchers can gain insights into the strengths and weaknesses of various language models, potentially leading to improved model development and performance. This research represents a promising approach to ensuring the reliability and accuracy of AI systems, potentially addressing the limitations of traditional evaluation methods. I am eager to see how this research evolves and its implications for the AI community.

## Streaming

* [Real-time brand sentiment analysis with ClickHouse and Redpanda][4]. This blog post looks at the realm of real-time sentiment analysis powered by Generative AI (Gen AI). It explores how Gen AI models can be trained to understand and analyze human sentiment in real-time, enabling businesses to gain valuable insights from customer feedback, social media interactions, and other sources of unstructured data. By harnessing the power of Gen AI for sentiment analysis, organizations can make more informed decisions, enhance customer experiences, and drive business growth. My thoughts: This is something I am very interested in, and want to investigate further.
* [Introducing Confluent Cloud Freight Clusters][5]. This blog post introduces Confluent Cloud Freight Clusters, a novel addition to Confluent Cloud tailored for high-throughput workloads at a fraction of the cost of self-managing Apache Kafka. Leveraging Confluent Cloud’s Kora engine, Freight clusters prioritize cost-effective networking over ultra-low latency, making them ideal for scenarios like logging and telemetry. By directly writing data to cloud object storage, Freight clusters significantly reduce inter-AZ replication costs, potentially saving users up to 90%. This innovative approach, although trading off some latency, offers substantial savings and scalability for enterprises grappling with data-intensive operations. My thoughts: This is something we ([Derivco](/derivco)) should look into.

## WIND (What Is Niels Doing)

In last week's [roundup][6], I wrote how [**Data & AI Community Day Durban**][7] just had finished. This week, I have collated evaluations, feedback and stats from the event:

* We had 175 attendees on the day (we expected 100 - 120).
* Average session rating: 6.49/7.
* Average speaker rating: 6.62/7.

Those numbers and the positive comments we received from attendees and speakers are encouraging. We are already planning the following event:

![](/images/posts/season-of-ai-data-ai-day-3.png)

**Figure 1:** *Data & AI Community Day Durban: Season of AI*

**Season of AI** is a Microsoft community concept where Microsoft make content available for the community. The content is free to reuse and remix to deliver to local user groups, meetups, and community events.

So, July 20 is the **Data & AI Community Day Durban: Season of AI** event date. We are planning a full-day event with AI content, but also other content, such as Data, ML, Streaming, etc. We are still working on the details, so look out for announcements on the [**Data & AI Community Day Durban**](https://aimldatadurban.org) website.

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

[1]: https://github.blog/2024-04-29-github-copilot-workspace/
[2]: https://openai.com/index/introducing-improvements-to-the-fine-tuning-api-and-expanding-our-custom-models-program
[3]: https://www.marktechpost.com/2024/04/30/this-ai-research-from-cohere-discusses-model-evaluation-using-a-panel-of-large-language-models-evaluators-poll
[4]: https://redpanda.com/blog/real-time-sentiment-analysis-gen-ai
[5]: https://www.confluent.io/blog/introducing-confluent-cloud-freight-clusters/
[6]: {{< relref "2024-04-28-interesting-stuff---week-17-2024.md" >}}
[7]: https://aimldatadurban.org/events/2024/data-ai-community-day-dbn-1/
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:

<!-- [postref]: {{< relref "file_name_incl_ext" >}} -->

<!-- [series1]: [SQL Server R Services](/sql_server_2k16_r_services) -->
<!-- [series2]: [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) -->
<!-- [series3]: [sp_execute_external_script and SQL Server Compute Context](/spees_and_sql_compute_context) -->


<!-- [findstr]: findstr /I <word_to_find> * -->
<!-- [findstr]: findstr /I /c:<"phrase to find"> * -->