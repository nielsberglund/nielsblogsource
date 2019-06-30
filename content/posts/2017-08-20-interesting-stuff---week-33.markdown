---
layout: post
title: Interesting Stuff - Week 33
author: nielsb
date: 2017-08-20T20:25:44+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Apache Kafka
  - Apache Flink
  - .NET Core 2.0
  - Azure Event Grid
description: Cool stuff about Apache Kafka, Apache Flink, Azure Event Grid and other interesting topics.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Apache Kafka
  - Apache Flink
  - .NET Core 2.0
  - Azure Event Grid   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

<!--more-->

## .NET

* [Announcing .NET Core 2.0][1]. Well, not much to add - .NET Core 2.0 final has been released!
* [Disassembling .NET Code with BenchmarkDotNet][5]. [Adam][as] has enhanced [BenchmarkDotNet][6] to also disassemble the .NET code that is benchmarked. 

## SQL Server

* [The DMV Diaries: sys.dm_os_threads][2]. So while [Ewald][ew] is on a [threads and tasks journey][3], he also peeks into the diaries of DMV's. This is the first, in hopefully many to come posts about the guts of DMV's. I have said it before, and I say it again; [Ewald's][ew] blog is a **MUST** read if you are interested in the inner workings of SQL Server! What are you waiting for - go ahead and read it!!!

## Azure/Cloud

* [Event Grid][4]. This is so "freaking" awesome, so there are no words for it! A single service for managing routing of all events from any source to any destination. Designed for high availability, consistent performance, and dynamic scale! I so **have to** ~~play with it~~ research this!

## Distributed Computing

* [On the design of distributed programming models][7]. Is there a need for a programming model for distributed computing? [Adrian][mp] dissects a white paper making the case for it.

## Streaming

It's been a while since I have had any coverage of **Apache Kafka** and / or **Apache Flink**. Fortunately that changes today!

* [Flink Forward Berlin Preview: Apache Flink Internals Sessions][8]. A preview of what is to come at the [Flink Forward][9] conference in Berlin September 11 - 13. All I can say is that I hope there will be video recordings available after the conference, as it looks awesome!
* [Using Apache Kafka as a Scalable, Event-Driven Backbone for Service Architectures][10]. A practical guide to building event driven systems using Apache Kafka as the message broker.
* [Leveraging the Power of a Database ‘Unbundled’][11]. "Hello my name is Niels, and I am a database guy!". That's me; but this, this is "absofreakinglutely" awesome! I am right now installing Docker so I can download Kafka containers onto my Windows machine and start playing with this!!!

## Data Science

* [How to build an image recognizer in R using just a few images][12]. The boys at [Revolution Analytics][re] talks about how to build your own image recognizer using the new **Image Featurizer** capabilities of Microsoft R Server. Go forth and read, this is cool!!!
* [A Data Science Microsoft Project Template You Can Use in Your Solutions][13]. [Buck Woody][bw] blogs about a Microsoft Project template for Data Science built on top of the [Microsoft Team Data Science Process][14].
* [20 years of the R Core Group][15]. The [Revolution Analytics][re] guys points out that it was 20 year since the R Core Group was established. Happy Birthday!!!

## SQL Server R Services

* [Microsoft SQL Server R Services - Internals IX][si9]. I published "episode" nine of the SQL Server R Services Internals "saga". Here we look at what communication methods are being used between the various components in play when we execute `sp_execute_external_script`.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[as]: http://adamsitnik.com/about/
[bw]: https://buckwoody.wordpress.com/
[1]: https://blogs.msdn.microsoft.com/dotnet/2017/08/14/announcing-net-core-2-0/
[2]: http://sqlonice.com/dmv-diaries-sys-dm_os_threads/
[3]: http://sqlonice.com/footsteps-of-cooperative-wait/
[4]: https://azure.microsoft.com/en-us/services/event-grid/
[5]: http://adamsitnik.com/Disassembly-Diagnoser/
[6]: https://github.com/dotnet/BenchmarkDotNet
[7]: https://blog.acolyer.org/2017/08/17/on-the-design-of-distributed-programming-models/
[8]: https://data-artisans.com/blog/flink-forward-berlin-preview-apache-flink-internals-sessions
[9]: https://berlin.flink-forward.org/
[10]: https://www.confluent.io/blog/apache-kafka-for-service-architectures/
[11]: https://www.confluent.io/blog/leveraging-power-database-unbundled/
[12]: http://blog.revolutionanalytics.com/2017/08/image-featurizer.html
[13]: https://buckwoody.wordpress.com/2017/08/17/a-data-science-microsoft-project-template-you-can-use-in-your-solutions/
[14]: https://docs.microsoft.com/en-us/azure/machine-learning/data-science-process-overview
[15]: http://blog.revolutionanalytics.com/2017/08/20-years-of-the-r-core-group.html
[si9]: {{< relref "2017-08-18-microsoft-sql-server-r-services---internals-ix.markdown" >}}
