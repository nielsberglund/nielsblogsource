---
type: post
layout: "post"
title: Interesting Stuff - Week 34, 2024
author: nielsb
date: 2024-08-25T08:39:43+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-34-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-34-24.jpg"
categories:
  - roundup
tags:
  - databases
  - Generative AI
  - Season of AI
  - Confluent Cloud
description: "This week’s blog dives into the why behind a hedge fund’s custom database, explores Microsoft’s latest AI models, and celebrates 5 years of Confluent Cloud connectors. Plus, a recap of my Generative AI talk at the Season of AI event in Cape Town, with Johannesburg up next!"
---

In this week's tech roundup, we explore why a hedge fund built its own database, dive into Microsoft's latest AI advancements with the Phi 3.5 series, and celebrate five years of Confluent Cloud connectors shaping the future of data streaming.

Plus, catch a glimpse of my recent adventures at the **Season of AI** event in Cape Town, where we delved into the magic of Generative AI despite a few technical challenges. Next up: Johannesburg—here's to smoother skies and glitch-free talks!

<!--more-->

## Databases

* [Why a Hedge Fund Built Its Own Database][1]. This [InfoQ][iq] presentation examines the intriguing decision-making process behind Man Group's development of ArcticDB, their bespoke database solution. The presenter articulates the necessity of building a specialized tool to handle the massive scale and complexity of high-frequency data required for their operations. What stands out is how they embraced innovation, recognizing that existing solutions couldn't meet their unique needs. This approach is a testament to the importance of adaptability and the willingness to go beyond conventional methods to achieve success in highly specialized fields like quantitative finance.

## Generative AI

* [Microsoft AI Releases Phi 3.5 mini, MoE and Vision with 128K context, Multilingual and MIT License][2]. In this post, the author explores Microsoft's recent release of three advanced AI models—Phi 3.5 Mini Instruct, Phi 3.5 MoE, and Phi 3.5 Vision Instruct. These models showcase significant advancements in AI capabilities, particularly in handling large datasets and complex tasks. Despite its compact size, the Phi 3.5 Mini Instruct model excels in long-context tasks with its 128K context length. Phi 3.5 MoE introduces a Mixture of Experts' architecture that optimizes performance by activating specific subsets of experts as needed. Lastly, Phi 3.5 Vision Instruct pioneers in the multimodal AI space, integrating visual and textual data to tackle complex tasks like medical imaging and autonomous vehicle decision-making.
* [Fine-tuning now available for GPT-4o][3]. This post announces the launch of fine-tuning for GPT-4o, allowing developers to customize the model for their specific applications. OpenAI offers 1M training tokens daily for free until September 23, enabling developers to enhance performance and accuracy with their own datasets. The fine-tuning process can improve response structure, tone, and adherence to domain-specific instructions. GPT-4o fine-tuning is available to all paid usage tiers, with significant cost benefits. Success stories include Cosine's AI assistant Genie, which achieved state-of-the-art results on the SWE-bench benchmark, and Distyl's top placement on the BIRD-SQL leaderboard, highlighting the potential of fine-tuning to deliver superior performance in various domains. This move by OpenAI not only broadens the accessibility of advanced AI tools but also empowers developers to push the boundaries of what's possible in AI-driven applications. It clearly indicates that we're entering a new era of highly customizable, high-performance AI.

## Streaming

* [5 Years of Confluent Cloud Connectors: Exploring Your Top Connector Picks][4]. This post offers a fascinating look at how Confluent Cloud connectors have become integral to modern data streaming architectures. The evolution from the first connector to a robust ecosystem of over 80 options demonstrates how essential these tools have become for organizations looking to streamline data integration. The focus on stream governance and the introduction of new use cases like real-time RAG highlight the forward-thinking nature of Confluent's approach. It's exciting to see how the platform is not just keeping pace with the demands of real-time data processing but also setting the stage for innovative applications, such as the seamless integration with Apache Iceberg tables through Tableflow. This adaptability and innovation are key reasons why Confluent is a leader in the data streaming space.

## WIND (What Is Niels Doing)

Yesterday started with a classic "Why am I doing this again?" moment as I boarded an early morning flight to Cape Town, coffee in hand and sleep still a distant dream. [Lemi Masalu][lemi] and I were on a mission to unlock the mysteries of Generative AI and Large Language Models for an eager audience at the **Season of AI** event. Despite a couple of technical gremlins trying to steal the show, the talk went surprisingly well—proof that even when the tech gods are playing tricks, the magic of GenAI prevails!

![](/images/posts/unlock-magic-jhb.png)

**Figure 1:** *Season of AI - Johannesburg*

But, no rest for the wicked! Next weekend, we're hitting the road (or rather, the skies) again, heading to the Johannesburg leg of **Season of AI**. So, this week is all about becoming best friends with those technical kinks—because as much as we love a bit of excitement, we'd prefer our next show to be glitch-free. Here's to a week of debugging and prepping for round two!

More info about the event [here][5]. If you are in Johannesburg next weekend, we hope to see you there!

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

[1]: https://www.infoq.com/presentations/arcticdb/
[2]: https://www.marktechpost.com/2024/08/21/microsoft-ai-releases-phi-3-5-mini-moe-and-vision-with-128k-context-multilingual-and-mit-license/
[3]: https://openai.com/index/gpt-4o-fine-tuning/
[4]: https://www.confluent.io/blog/top-confluent-connectors/
[5]: https://cptmsdug.dev/
