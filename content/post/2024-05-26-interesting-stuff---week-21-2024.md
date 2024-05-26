---
type: post
layout: "post"
title: Interesting Stuff - Week 21, 2024
author: nielsb
date: 2024-05-26T09:47:32+02:00
comments: true
highlight: true
draft: false
image: "/images/banner/posts/wrup-21-24.jpg"
thumbnail: "/images/thumbnails/posts/wrup-21-24.jpg"
categories:
  - roundup
tags:
  - MS Build
  - MS Fabric
  - Generative AI
  - Deep Q-Networks
  - Kafka
  - Realtime Intelligence
description: "This week's blog post highlights Microsoft Build 2024, featuring updates to Microsoft Fabric and Real-Time Intelligence, along with insights on Deep Q-Networks and the Phi-3 vision-language model. Plus, learn about Confluent Cloud's Elastic CKUs for Kafka management and get a sneak peek at the SWAG for Data & AI Community Day Durban."
---

📅 In this week's blog post, we dive into highlights from Microsoft Build 2024, which featured groundbreaking updates to Microsoft Fabric and Real-Time Intelligence.

Discover the power of Deep Q-Networks in reinforcement learning and the versatile applications of Microsoft's Phi-3 vision-language model. Explore how Confluent Cloud's Elastic CKUs are revolutionizing Kafka cluster management.

Plus, get a sneak peek at the exciting SWAG for the upcoming [**Data & AI Community Day Durban: Season of AI**][7] event. 🚀🎉

<!--more-->

## Misc.

* [Microsoft Build 2024 Session Schedule][1]. The link leads to the session schedule for Microsoft Build 2024. The conference was held in Seattle, WA, USA, from May 21st to May 24th and covered a wide range of topics related to Microsoft technologies, development tools, cloud services, AI, and more. Even though the conference has concluded, the session schedule offers a unique opportunity to engage with the content. You can download recorded videos of interesting sessions and look deeper into the topics that pique your curiosity. I have marked quite a few sessions for later viewing!

## MS Fabric

* [Microsoft Build event announcements on Fabric][2]. This blog post explores several significant updates to Microsoft Fabric that were announced at the MS Build 2024 conference. One of the most thrilling updates is the Real-Time Intelligence feature. This revolutionary SaaS solution is designed to empower businesses to easily act on high-volume, time-sensitive data. Whether you're a low-code/no-code user or a professional developer, this feature provides real-time data insights and anomaly detection through AI-powered tools. The enhancements like the Fabric Workload Development Kit and Fabric Data Sharing aim to streamline app development and data integration across platforms. By integrating AI skills within Fabric, users can build intuitive AI experiences, enhancing data-centric workflows and driving business efficiency. This is a game-changer in the world of real-time data analysis!
* [Microsoft Fabric Goes All-In on Real-Time Data Intelligence][3]. This article also discusses the new Real-Time Intelligence solution in Microsoft Fabric. This end-to-end solution empowers users of all skill levels to gain actionable insights from streaming data. The Real-Time Intelligence feature integrates seamlessly within Microsoft Fabric, allowing businesses to manage, discover, and act on high-volume, time-sensitive data from a centralized hub. Users can ingest, transform, and route data from various external sources, leveraging AI-powered tools to visualize and analyze this data in real-time​. One of the most notable capabilities is the Real-Time Hub, a centralized catalog for streaming data. This hub facilitates easy access to a wide range of data sources and supports event-driven capabilities. This allows businesses to monitor and react to various events in real-time, such as triggering workflows or sending notifications​, thereby enhancing their operational agility and responsiveness.

As many of you who follow my blog know, I am deeply fascinated by streaming and real-time analysis. The introduction of the Real-Time Intelligence feature in Microsoft Fabric has me particularly excited, and I am eager to delve deeper into its capabilities. Expect some blog posts on this topic to "pop up". I hope you share my enthusiasm and find these posts informative and engaging!

## Generative AI

* [Reinforcement Learning: Deep Q-Networks][4]. This article provides a comprehensive overview of Deep Q-Networks (DQN), a type of reinforcement learning algorithm. DQN is a deep learning model which combines Q-learning with deep neural networks to handle complex, high-dimensional environments. The DQN algorithm utilizes two neural networks: the Q Network, which predicts action values, and the Target Network, which provides stable target values to guide learning. This setup helps mitigate issues like instability and catastrophic forgetting during training​. Experience Replay is a crucial component in DQN, ensuring diverse training samples by storing past experiences and randomly sampling batches for training. This process smooths out the learning updates, preventing the network from overfitting to recent experiences and ensuring it generalizes well across various scenarios. By leveraging these techniques, DQNs can efficiently learn and adapt to dynamic environments, making them powerful tools for tasks ranging from game playing to robotics. The structured approach of combining Q-learning with neural networks enables handling complex state spaces that traditional methods struggle with​, making DQNs a versatile and effective reinforcement learning algorithm. 
* [6 Real-World Uses of Microsoft’s Newest Phi-3 Vision-Language Model][5]. Microsoft's Phi-3 vision-language model represents a significant advancement in the integration of visual and linguistic data within artificial intelligence and this post looks some of the real-world applications of this model. This state-of-the-art model combines the capabilities of computer vision and natural language processing to enable a wide range of applications that benefit from understanding and generating insights based on both images and text. Phi-3 leverages advanced algorithms to analyze, interpret, and generate data, providing enhanced accuracy and efficiency in various tasks. One of the standout features of Phi-3 is its ability to process and understand multimodal data seamlessly. This allows for more sophisticated interactions and decision-making processes, making it a versatile tool for industries that rely on complex data inputs. The model is designed to be adaptable, catering to different use cases by offering robust performance in both understanding context and delivering relevant outputs.

## Streaming

* [Serverless Decoded: Reinventing Kafka Scaling with Elastic CKUs][6]. Managing Kafka clusters to handle fluctuating workloads can be challenging due to unpredictable spikes and capacity planning. This blog post examines how Confluent Cloud addresses these issues with autoscaling, serverless clusters powered by Elastic Confluent Units (eCKUs). This solution dynamically allocates resources based on actual demand, reducing infrastructure costs and operational overhead. It ensures optimal performance without over-provisioning, enhancing efficiency and reliability for mission-critical applications.

## WIND (What Is Niels Doing)

Imagine my surprise when a package arrived from Microsoft:

![](/images/posts/swag-cropped.jpg)

**Figure 1:** *Data & AI Community Day Durban: Season of AI - SWAG*

When I opened tha package I saw it was SWAG for the upcoming [**Data & AI Community Day Durban: Season of AI**][7] event on July 20! This full-day - FREE - event will cover a wide array of fascinating topics such as Azure AI & ML, Generative AI, Database Development, Streaming, and much more. 

Take the chance to attend, learn, network, and grab some amazing SWAG! 🎁

The registration link will be shared soon, so watch for updates on the [events website][7], my blog and social media channels.

Interested in speaking? We're still accepting proposals! Share your expertise and passion with the community: [**Submit Proposals**][8]

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

[1]: https://build.microsoft.com/en-US/sessions
[2]: https://www.jamesserra.com/archive/2024/05/microsoft-build-event-announcements-5/
[3]: https://thenewstack.io/microsoft-fabric-goes-all-in-on-real-time-data-intelligence/
[4]: https://towardsdatascience.com/reinforcement-learning-from-scratch-deep-q-networks-0a8d33ce165b
[5]: https://towardsdatascience.com/6-real-world-uses-of-microsofts-newest-phi-3-vision-language-model-8ebbfa317fe8
[6]: https://www.confluent.io/blog/sizing-scaling-kafka-clusters-with-confluent-cloud/
[7]: https://aimldatadurban.org/events/2024/season-of-ai-1/
[8]: https://sessionize.com/seasonofaidbn/
