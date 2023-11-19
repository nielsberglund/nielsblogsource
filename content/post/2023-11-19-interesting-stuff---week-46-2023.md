---
type: post
layout: "post"
title: Interesting Stuff - Week 46, 2023
author: nielsb
date: 2023-11-19T10:13:33+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-46-23.png"
thumbnail: "/images/thumbnails/posts/wrup-46-23.png"
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
description: "This week we delve into the dynamic world of AI and streaming technologies, starting with the unexpected ousting of Sam Altman from OpenAI and the latest advancements in Retrieval-Augmented Generation systems. We also explore OpenAI's newest tools, DALL-E 3, GPT-4 Vision, and GPT-4 Turbo, and much more."
---

Welcome to this week's exploration of the ever-evolving tech landscape! We're delving into the seismic shifts at OpenAI with the surprising departure of Sam Altman, and uncovering the transformative power of Retrieval-Augmented Generation in enterprise AI. 

Get ready for a deep dive into OpenAI's latest innovations, including DALL-E 3, GPT-4 Vision, and GPT-4 Turbo, and join me on a personal journey of building a custom GPT application. 

Plus, we'll explore the critical role of ISO 20022 in modernizing payment architectures. 

This week is all about groundbreaking developments and personal adventures in the world of AI and streaming technologies!

<!--more-->

## Generative AI

* [Sam Altman fired as CEO of OpenAI][2]. Let us start with the biggest story this week: Sam Altman being fired as CEO of OpenAI. I have been following OpenAI for a while, and I have been impressed with the work they have done. I have also been impressed with Sam Altman and his work with Y Combinator. I am unsure what to make of this, and much speculation is happening. I am sure we will hear more about this in the coming days and weeks.
* [More on Sam Altman’s Ouster From OpenAI][2]. As I wrote above, there is a lot of speculation about this. John Gruber has some interesting thoughts on this. The piece reports on the unexpected firing of Sam Altman, the company's CEO, highlighting a deep philosophical divide within the organization. It appears that the board's decision was driven by concerns over Altman's leadership style, which they perceived as too profit-driven and aggressive, especially in the context of OpenAI's mission and charter. This tension reflects a broader conflict between a cautious, safety-first approach to AI development and a more ambitious, profit-oriented strategy. The article also notes the surprise and solidarity resignation of Greg Brockman, OpenAI’s co-founder and president, underscoring the shock and complexity of the situation. The firing, described as sudden and without prior indication, raises questions about the future direction of OpenAI and its adherence to its foundational principles. We hae not heard trhe last of this!
* [Embeddings + Knowledge Graphs: The Ultimate Tools for RAG Systems][3]. Onto technical "stuff". This blog-post delves into the evolution and limitations of large language models (LLMs) in natural language processing. Despite their ability to generate fluent text, LLMs are constrained by their training data and need real-world understanding and logical reasoning. The piece highlights the potential of retrieval-augmented generation (RAG) systems, which enhance LLMs by retrieving relevant knowledge from external sources. The article particularly emphasizes the synergy between vector embeddings and knowledge graphs. While vector embeddings offer semantic similarity, knowledge graphs provide structured representations of real-world entities and relationships, enabling more complex reasoning and accuracy in LLMs. This combination could lead to a new level of explanatory ability and logic in conversational AI, akin to the blend of statistical learning and symbolic representations in the human mind. Very interesting!
* [The Moat for Enterprise AI is RAG + Fine Tuning — Here’s Why][4]. This blog post offers a deep dive into the critical role of Retrieval-Augmented Generation (RAG) and fine-tuning in the success of enterprise AI. The author argues that for generative AI to truly succeed in a business environment, it must be secure, scalable, and trusted. This is where RAG and fine-tuning come into play. RAG improves the quality of Large Language Models (LLMs) by accessing a database for up-to-date and reliable information, making it ideal for applications needing contextual data. On the other hand, fine-tuning involves training an existing LLM on a smaller, task-specific dataset, which is great for domain-specific tasks. The article emphasizes that while RAG and fine-tuning have their strengths, RAG is generally more manageable regarding security, scalability, and trust. As the article suggests, the future of enterprise AI lies in effectively leveraging these technologies to ensure data quality and reliability.
* [OpenAI API Dev Day Upgrades Are Mindblowing: Here's DALL-E 3, GPT-4 Vision, and GPT-4 Turbo in Action.][5]. This article focuses on the significant enhancements made to OpenAI's suite of tools, particularly DALL-E 3, GPT-4 Vision, and GPT-4 Turbo. These upgrades improve functionality and enhance performance and usability, marking a significant leap in AI capabilities. The author provides a hands-on perspective, sharing their experiences and even offering code examples for readers to experiment with these tools. This piece serves as both an informative overview and a practical guide for developers eager to explore the cutting-edge of AI technology. I am looking forward to playing with these tools.
* [Building a Custom GPT: Lessons and Tips][6]. The blog-post linked to chronicles the author's journey in developing a personalized GPT application, "The Causal Mindset". The article vividly describes the initial excitement, subsequent challenges, and eventual solutions found in creating this app. The Causal Mindset aims to make causal inference accessible, helping users distinguish between facts and fiction for better decision-making. The author shares their experience with OpenAI's GPTs, emphasizing the importance of an explicit instruction file and embracing an open-source approach. Despite initial setbacks, such as privacy and content stability issues, the author successfully navigates these challenges, offering valuable insights and practical advice for others interested in building custom GPT applications. This article not only serves as a guide for creating personalized GPTs but also highlights the potential of AI in enhancing critical thinking and decision-making skills.

## Streaming

* [Modernize Payments Architecture for ISO 20022 Compliance][7]. This blog post explores the evolving landscape of the payments industry and the critical role of the ISO 20022 standard in this transformation. ISO 20022, a multi-part international standard, aims to unify the language and model for payment data, enhancing the quality and efficiency of the payment ecosystem. The article emphasizes financial institutions' need to overhaul their payment architectures and infrastructure by November 2025 to comply with this standard. Confluent's data streaming platform is presented as a solution to bridge the gap between legacy systems and the new standard, enabling seamless data translation and interoperability. The post delves into how Confluent's features, such as real-time data processing, scalability, and security, make it an ideal platform for building a modern ISO 20022-compliant payments system. This transition is not just a compliance requirement but an opportunity for financial entities to modernize their payment platforms and leverage real-time applications like fraud monitoring and risk management.

## WIND (What Is Niels Doing)

I am prepping for this:

![](/images/posts/cpt-banner.png)

**Figure 1:** *.NET Conference Cape Town*

I am presenting "Streaming with Style: Unleashing the Power of Kafka for .NET Developers" in Cape Town on November 25th. I am looking forward to this. I am also presenting this session next week at the Johannesburg leg of the conference.

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
[rmoff]: https://twitter.com/rmoff
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

[1]: https://www.theverge.com/2023/11/17/23965982/openai-ceo-sam-altman-fired
[2]: https://daringfireball.net/2023/11/more_altman_openai
[3]: https://towardsdatascience.com/embeddings-knowledge-graphs-the-ultimate-tools-for-rag-systems-cbbcca29f0fd
[4]: https://towardsdatascience.com/the-moat-for-enterprise-ai-is-rag-fine-tuning-heres-why-fb2038e40ce9
[5]: https://pub.towardsai.net/openai-api-dev-day-upgrades-are-mindblowing-heres-dall-e-3-gpt-4-vision-and-gpt-4-turbo-in-1e91225e3804
[6]: https://towardsdatascience.com/building-a-custom-gpt-lessons-and-tips-cd1b892ec738
[7]: https://www.confluent.io/blog/payments-architecture-ISO20022-compliance/
