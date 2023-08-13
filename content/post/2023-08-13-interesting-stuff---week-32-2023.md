---
type: post
layout: "post"
title: Interesting Stuff - Week 32, 2023
author: nielsb
date: 2023-08-13T09:32:16+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-32-23.jpg"
thumbnail: "/images/thumbnails/posts/wrup-32-23.jpg"
categories:
  - roundup
tags:
  - big data
  - OpenAI
  - streaming
  - data saturday durban
description: "This week: Explore Big Data's layers with James Serra's post. GPT-5's potential reshapes AI. Stay updated on streaming trends. Join Niels at Data Saturday Durban for Azure OpenAI insights & top speakers."
---

🔍 In this week's roundup: Discover the power of Big Data's serving layers in James Serra's post, unveiling the benefits of relational and physical layers for data accessibility. 

🚀 Speculate on the groundbreaking potential of OpenAI's trademarked GPT-5, reshaping the AI landscape. 🌊 Stay ahead in the streaming world with Hubert's newsletter, spotlighting rising stars like Redpanda and must-read Flink insights. 

Join Niels at Data Saturday Durban for an Azure OpenAI deep-dive and seize the opportunity to learn from top speakers. Don't miss out!

<!--more-->

## Big Data

* [Serving layers with a data lake][1]. The blog post by [James Serra][2] discusses the need for two types of serving layers on top of a data lake: relational and physical serving layers. A data lake typically has three layers: raw, cleaned, and presentation (also called bronze, silver, and gold). A relational serving layer is where data is presented in the form of a relational data model, such as a SQL view or a Power BI dataset, to make it easier for end-users to find and understand data. A physical serving layer is where data is copied from the presentation layer in the data lake to one or more products, such as Azure Cosmos DB or Azure SQL Database, to make it easier for end-users to access data. The blog post explains the benefits and challenges of each type of serving layer and provides some examples of how to implement them.

## OpenAI

* [GPT-5 is now Trademarked by OpenAI: What Does That Say About the Future of ChatGPT?][3]. This blog post discusses the implications of OpenAI's decision to trademark GPT-5, the next iteration of its generative pre-trained transformer (GPT) models. The author argues that this move signals OpenAI's intention to commercialize its technology, protect its intellectual property, and prevent plagiarism and misuse of its models. The author also speculates on the possible features and capabilities of GPT-5, such as improved natural language understanding, multimodal generation, and human-like dialogue. The author concludes by stating that GPT-5 will be a game-changer for the field of artificial intelligence and will profoundly impact various domains and industries.

## Streaming

* [SUP Aug][4]. This blog post is [Hubert's][6] August streaming newsletter. It summarises the latest news and developments in the streaming world. The newsletter also includes interviews and links to podcasts. A couple of things that caught my eye in this edition: Redpanda and RisingWave; they look like a "match made in heaven". The new Flink book by [Giannis Polyzos][5] looks like a must-read. But, instead of me listing what I found interesting in the newsletter, I suggest you read it yourself. The newsletter is a great way to stay up-to-date with the latest developments in the streaming world. 

## WIND (What Is Niels Doing)

I should have been in Cape Town for Data Saturday Cape Town this weekend. However, the event has been moved to the end of September. Instead, I have been prepping for **Data Saturday Durban**, August 19:

![](/images/posts/dsd-nielsb.jpg)

**Figure 1:** *Data Saturday Durban: Azure OpenAI*

As you see in *Figure 1* I am presenting on **Azure OpenAI**. I am looking forward to this event. Not only because I am presenting but also because I am helping to organize it.

If you haven't registered yet, please hurry up, as very few tickets are left. You register [here][7]. If you still are unsure if you should attend, check out the [agenda][8]. It is an excellent line-up of speakers and topics.

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

[1]: https://www.jamesserra.com/archive/2023/08/serving-layers-with-a-data-lake/
[2]: https://www.linkedin.com/in/jamesserra/
[3]: https://pub.towardsai.net/gpt-5-is-now-trademarked-by-openai-what-does-that-say-about-future-of-chatgpt-5f69769fcc42
[4]: https://hubertdulay.substack.com/p/sup-aug
[5]: https://www.linkedin.com/in/polyzos/
[6]: https://www.linkedin.com/in/hkdulay/
[7]: https://datasaturdays.com/2023-08-19-datasaturday0043/
[8]: https://datasaturdays.com/2023-08-19-datasaturday0043/#schedule
