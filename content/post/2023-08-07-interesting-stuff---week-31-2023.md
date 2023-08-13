---
type: post
layout: "post"
title: Interesting Stuff - Week 31, 2023
author: nielsb
date: 2023-08-07T06:49:53+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-31-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-31-23.jpg"
categories:
  - roundup
tags:
  - GenerativeAI
  - OpenAI
  - Kafka
  - Data Saturday Durban
description: "This week: Master the art of prompt engineering. OpenAI's evolution from GPT-1 to GPT-4, with a teaser of GPT-5 Explore RAG-based chatbots. Dive into event-driven serverless apps. Join Niels on data adventures."
---

🔥 In this weeks roundup. Unleash the Power of AI: Master the art of prompt engineering, crafting effective cues for NLP models. 

Explore RAG-based chatbots and OpenAI's evolution from GPT-1 to GPT-4, with a teaser of GPT-5. 

Dive into event-driven serverless apps and harmonize streaming with standardized hashing. Join Niels on data adventures and secure your spot at Data Saturday Durban.🔗🚀


<!--more-->

## Generative AI

* [Practical Prompt Engineering][1]. The blog post looks at designing and optimizing prompts for natural language processing models. The author explains what prompts are, why they are important, and how to create effective prompts. The post also provides examples of prompt engineering for different tasks, such as sentiment analysis, text summarization, and question answering. The author concludes by suggesting some best practices and resources for prompt engineering. This article is a required read for my developers in [Derivco](/derivco).
* [Building a RAG-based Conversational Chatbot with Langflow and Streamlit][2]. The article is about building a RAG-based conversational chatbot with Langflow and Streamlit. The author explains RAG, how it works, and why it suits conversational AI. The author also demonstrates how to use Langflow, a low-code platform for building natural language applications, and Streamlit, a framework for creating web apps, to create a chatbot that can answer questions based on Wikipedia articles. The author provides the code and screenshots of the chatbot and some examples of its responses. The author concludes by highlighting the benefits and limitations of RAG and suggesting some possible improvements.
* [OpenAI's Evolution: A Race to GPT5][3]. The article is about the evolution of OpenAI's GPT models, which are powerful language models based on the Transformer architecture. The author describes the main features and achievements of each iteration, from GPT-1 to GPT-4, as well as some of the challenges and ethical issues they faced. The author also speculates about the possible features and improvements of GPT-5, which is expected to be released soon. The article also covers some financial and regulatory aspects of OpenAI's development.

## Streaming

* [Two Ways to Build Event-Driven Serverless Applications Using Confluent Cloud and AWS Lambda][4]. This blog post discusses two ways to build event-driven serverless applications: Confluent Cloud and AWS Lambda. The first way is using the Confluent Lambda Sink Connector, which allows you to invoke Lambda functions from Kafka topics using synchronous or asynchronous modes. The second way is using event source mapping, which enables Kafka to trigger Lambda functions automatically and scale them based on the workload. The post also compares the pros and cons of each way and provides a reference use case for each pattern. 
* [The Importance of Standardized Hashing Across Producers][5]. The article discusses the importance of standardized hashing across Java and non-Java producers for streaming applications. The author explains how different default partitioning strategies in Java and non-Java producers can cause data inconsistencies and challenges for developers. The author explores some options to overcome this issue, such as using custom partitioners, configuring `librdkafka`, or using Confluent Schema Registry. The article also provides code snippets and examples to illustrate the problem and the solutions.

## WIND (What Is Niels Doing)

You who read my blog may have noticed that this roundup is published a day late. The reason for this:

![](/images/posts/dsd-jhb.jpg)

**Figure 1:** *Speaking Data Saturday Johannesburg*

I presented at Data Saturday Johannesburg and arrived home late Sunday evening. I had a great time! Thanks to [Michael][8] and his team, who - as always - organized a top-notch event. Also, thanks to [Carike][7], who both presented and took many photos, the one above included.

Michael and Carike will be at **Data Saturday Durban** on August 19, so come by and attend their presentations! You may ask when they are speaking and what they are speaking about. I have the answer for you, and you find the answer [here](/dsd.html).

I had to upload the schedule to my blog, as I am waiting for the **Data Saturday Durban** website to be updated.

Have a look at the schedule, and if you still need to register - [Do It][6]! It is free, and you get to listen to some excellent speakers.

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

[1]: https://towardsdatascience.com/practical-prompt-engineering-74e96130abc4
[2]: https://ai.plainenglish.io/building-a-rag-based-conversational-chatbot-with-langflow-and-streamlit-784e2b77bcbe
[3]: https://pub.towardsai.net/openais-evolution-a-race-to-gpt5-a126a3cf763e
[4]: https://www.confluent.io/blog/two-ways-to-build-event-driven-serverless-applications/
[5]: https://www.confluent.io/blog/standardized-hashing-across-java-and-non-java-producers/
[6]: https://datasaturdays.com/2023-08-19-datasaturday0043/
[7]: https://www.linkedin.com/in/carike-botha-859a2a141/
[8]: https://www.linkedin.com/in/michaeladrianjohnson/
