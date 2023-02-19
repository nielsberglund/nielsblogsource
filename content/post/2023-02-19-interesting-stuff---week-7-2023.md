---
type: post
layout: "post"
title: Interesting Stuff - Week 7, 2023
author: nielsb
date: 2023-02-19T10:02:39+02:00
comments: true
highlight: true
draft: false
featured_image: "/images/banner/posts/wrup-07-23.jpg"
image: "/images/banner/posts/wrup-07-23.jpg"
categories:
  - roundup
tags:
  - Azure Functions
  - Azure Data Explorer
  - Azure Synapse
  - SynapseML
  - OpenAI
description: "So this week, I link to posts about the new v2 Python programming model for Azure functions as well as 'Tinder' for Azure Data Explorer, a.k.a 'Find a Partner'. Then there is quite a bit about OpenAI: use OpenAI in Synapse Analytics, a link to a post by John Gruber about the new Bing, etc."
---

Reading through this post, I realize that this is probably the first post where I have yet to mention Kafka; wow!

So this week, I link to posts about the new v2 Python programming model for Azure functions as well as "Tinder" for **Azure Data Explorer**, a.k.a "Find a Partner". Then there is quite a bit about OpenAI: use OpenAI in Synapse Analytics, a link to a post by John Gruber about the new Bing, etc.

So what are you waiting for? Go ahead and read it :smile:.

<!--more-->

## Azure

* [Developing Azure Functions using the v2 programming model for Python][1]. In this **Azure Friday** YouTube video, Scot Hanselman is joined by two fellow Microsoft:ies working on **Azure Functions**. In the video, they discuss the new v2 programming model for Azure Functions using Python. This new model aims to provide an Azure Functions development experience that is more familiar to Python developers. Key features include triggers and bindings declared as decorators, a simplified folder structure, and support through easy-to-reference documentation. Looks very interesting!

## Azure Data Explorer

* [Now available: "Find my partner" for Azure Data Explorer][2]. I have mentioned this before, and I will do it now again. If you are working with **Azure Data Explorer** and feel you need consulting, training, etc., then browse to the linked post and follow the instructions to "Find a Partner".

## AI/ML

* [Synapse Espresso: Using OpenAI GPT-3 in Synapse!][3]. The second YouTube video this week, I am on a roll! This video shows how we can use Azure OpenAI GPT-3 from within Spark in Synapse Analytics. What makes it possible to use Azure OpenAI is the ability in SynapseML to send requests to Azure Cognitive Services using APIs. Very Cool!
* [Best Practices for Realtime Feature Computation on Databricks][4]. This post is very relevant to us at [Derivco](/derivco) right now. The post examines the most effective architectures for providing real-time models with fresh and accurate data using Databricks Feature Store and MLflow. I so have to test this using the code provided.
* [Bing, the Most Exciting Product in Tech][5]. Do I need to get skates: John Gruber says that Bing is the most exciting product in tech - hell must have frozen over :smile:. Anyway, this post by John Gruber looks at what has been written about Bing lately and the fascinating and frightening scenarios playing out in Bing Chat. When you read his post, please, please follow the links to the various articles; they are excellent! 

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

[1]: https://youtu.be/KARieaWBxuk
[2]: https://azure.microsoft.com/en-us/updates/adx-find-my-partner/?
[3]: https://youtu.be/Qs6hspyTBz8
[4]: https://www.databricks.com/blog/2023/02/16/best-practices-realtime-feature-computation-databricks.html
[5]: https://daringfireball.net/2023/02/bing_the_most_exciting_product_in_tech
