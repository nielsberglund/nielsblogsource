---
type: post
layout: "post"
title: Interesting Stuff - Week 24, 2024
author: nielsb
date: 2024-06-16T09:38:32+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-24-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-24-24.jpg"
categories:
  - roundup
tags:
  - Generative AI
  - Kafka
  - Flink
  - streaming
  - Data & AI Community Day Durban
  - Season of AI
  - RisingWave
description: "Explore the latest tech developments in this week's blog post, featuring OpenAI's .NET library, Apple integration, and Andrew Ng's AI assistant course. Discover how data streaming is revolutionizing customer loyalty programs and get updates on Data & AI Community Day Durban: Season of AI."
---

This week, dive into the latest tech innovations, including OpenAI's official .NET library release and its integration with Apple devices, enhancing user experiences with advanced AI capabilities. 

Learn from Andrew Ng's new course on building AI assistants and explore the power of data streaming for customer loyalty programs. Check out updates on the upcoming Data & AI Community Day Durban: Season of AI, where speaker selections are underway. Secure your spot now and be part of the excitement! 🚀

<!--more-->

## Generative AI

* [OpenAI Releases Official .NET Library][1]. This [InfoQ][iq] post highlights the significant collaboration between OpenAI and Microsoft, resulting in the release of the first beta of OpenAI's official .NET library. This library, available as a NuGet package, supports the entire OpenAI API, including GPT-4o and Assistants v2, and offers synchronous and asynchronous APIs. The collaboration aims to enhance the .NET ecosystem with advanced AI capabilities, making it easier for developers to integrate with OpenAI and Azure OpenAI services. The community is encouraged to provide feedback to refine the library before its stable release.
* [Let's reproduce GPT-2 (124M)][2]. In this YouTube video, [Andrej Karpathy][3] demonstrates how to reproduce GPT-2 (124M) from scratch. The video covers the whole process: First, he builds the GPT-2 network, then he optimizes its training to be really fast, followed by setting up the training run following the GPT-2 and GPT-3 paper and their hyperparameters, then run, and come back the following morning to see the results and enjoy some amusing model generations. Remember that in some places, this video builds on the knowledge from earlier videos in the Zero to Hero Playlist. The video is four! hours long, so you might want to watch it in parts.
* [OpenAI and Apple announce partnership to integrate ChatGPT into Apple experiences][4]. This post announces a partnership between OpenAI and Apple to integrate ChatGPT into iOS, iPadOS, and macOS, enhancing user experiences across Apple devices. This integration allows Siri to utilize ChatGPT's capabilities for better responses and includes systemwide Writing Tools powered by ChatGPT. Privacy is a top priority in this partnership, with no data stored by OpenAI and IP addresses obscured, ensuring the ethical use of AI. The integration will be available later this year, with free user access and additional features for ChatGPT subscribers.
* [Building Your Own Database Agent][5]. This X tweet by [Andrew Ng][6] announces a new short course, 'Building Your Own Database Agent,' in collaboration with Microsoft's [Adrián González Sánchez][7]. This practical course is designed to equip participants with the skills to create an AI assistant that translates natural language questions into SQL queries. This enables easy data access for everyone in an organization. Using Azure OpenAI Service and LangChain, participants will learn to implement retrieval augmented generation and function calling, gaining valuable hands-on experience with CSV files and SQL databases.

## Streaming

* [How to Use Flink SQL, Streamlit, and Kafka: Part 2][8]. This Confluent blog post is the second in a series detailing the use of Flink SQL, Streamlit, and Kafka to create a live data-driven user interface for a market data application. It discusses managing multiple threads using async.io, running Kafka consumers and producers concurrently, and visualizing stock prices with Streamlit and Altair. The post also covers deployment tips and handling challenges related to Flink SQL and async programming in Python.
* [Next-Gen Customer Loyalty Programs with Data Streaming][9]. This blog post explores how next-gen customer loyalty programs can leverage data streaming to provide personalized, real-time experiences. It discusses how businesses can use Confluent's platform to integrate real-time data from various sources, process it with Apache Flink, and deliver dynamic rewards and personalized offers. By utilizing streaming data, companies can enhance customer engagement, improve reward cycles, and gain a competitive edge through tailored loyalty programs. We at [**Derivco**](/derivco) are very interested in and working actively on this. We see that Apache Flink is not necessarily a requirement, and we are looking at other tools apart from Apache Flink (RisingWave is an example).

## WIND (What Is Niels Doing)

Last Friday, the CfS (Call for Speakers) for [**Data & AI Community Day Durban: Season of AI**][10], July 20th, closed, so I am busy evaluating submissions. There are so many awesome submissions that it is going to be tough to select the speakers. I plan to announce the speakers by the end of the week.

![](/images/posts/season-of-ai-data-ai-day-3.png)

**Figure 1:** *Data & AI Community Day Durban: Season of AI*

If you plan to attend, hurry, tickets are flying off the virtual shelf faster than ever before! Secure your spot now and be part of the excitement. This is your chance to be part of something special. Register today and join the celebration! 🚀

* [**Register here for Data & AI Community Day Durban: Season of AI**][11]

I hope to see you there!

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

[1]: https://www.infoq.com/news/2024/06/openai-microsoft-dotnet/
[2]: https://www.youtube.com/watch?v=l8pRSuU81PU
[3]: https://www.youtube.com/channel/UCXUPKJO5MZQN11PqgIvyuvQ
[4]: https://openai.com/index/openai-and-apple-announce-partnership/
[5]: https://x.com/AndrewYNg/status/1801277928740970619
[6]: https://www.linkedin.com/in/andrewyng/
[7]: https://www.linkedin.com/in/adriangs86/
[8]: https://www.confluent.io/blog/how-use-flinksql-streamlit-kafka-part-2/
[9]: https://www.confluent.io/blog/customer-loyalty-program/
[10]: https://aimldatadurban.org/events/2024/season-of-ai-1/
[11]: https://www.quicket.co.za/events/264747-data-ai-community-day-durban-season-of-ai/#/
