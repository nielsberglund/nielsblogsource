---
type: post
layout: "post"
title: Interesting Stuff - Week 10, 2019
author: nielsb
date: 2019-03-10T13:14:44+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - SQL Server 2019
  - distributed computing
  - SQL Server Extensibility Framework
  - Azure
  - Azure Event Hubs
  - .NET Core
  - Java
  - Python
  - R
description: Distributed consensus, Azure in South Africa, Service Fabric and Event Hubs, SQL Server 2019 and Java, and other interesting topics.
keywords:
  - SQL Server 2019
  - distributed computing
  - SQL Server Extensibility Framework
  - Azure
  - Azure Event Hubs
  - .NET Core
  - Java
  - Python
  - R   
---

Throughout the week, I read a lot of blog-posts, articles, and so forth, that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This blog-post is the "roundup" of the things that have been most interesting to me, for the week just ending.

<!--more-->

## Distributed Computing

* [A generalised solution to distributed consensus][1]. Distributed consensus is hard! In this blog post [Adrian][adcol] dissects a white-paper which re-examines the foundations of distributed consensus.

## Azure

* [Microsoft opens first datacenters in Africa with general availability of Microsoft Azure][2]. I guess the title says it all! On March 6, Microsoft opened two data centers in South Africa: South Africa North (Johannesburg) and South Africa West (Cape Town). At the moment the offerings are somewhat sparse, but I have no doubt we'll soon see quite a lot of services.
* [Service Fabric Processor in public preview][3]. Azure Event Hub is an elegant way to ingest data into the Azure ecosystem, and Service Fabric is awesome for hosting and running microservices. Quite often some of the services need to consume from Azure Event Hubs, and until now you have had to write your own consumer, most likely based on *Event Processor Host*. That changes now with the preview of *Service Fabric Processor*, which is a new library for consuming events from an Event Hub that is directly integrated with Service Fabric. Awesome!

## .NET

* [Announcing .NET Core 3 Preview 3][4]. What the title says; .NET Core 3 Preview 3 is available for download. Go and get it!
* [Collecting .NET Core Linux Container CPU Traces from a Sidecar Container][5]. This blog post gives a step-by-step guide of using a sidecar container to collect CPU trace of an ASP.NET application running in a Linux container.

## Data Science

* [MICROSOFT LAUNCHES DATA SCIENCE CERTIFICATIONS][6]. In this blog post [Ryan][ryansw] discusses 3 new certifications Microsoft recently announced aimed at Data Scientists/Engineers. I have always been skeptic to certifications by vendors, brain dumps anyone, but I will definitely have a look at this.  
* [Using Machine Learning to Ensure the Capacity Safety of Individual Microservices][7]. This is a very interesting post by Uber's engineering team, discussing how they apply Machine Learning to forecast micro-services issues!

## SQL Server 2019

* [SQL Server 2019, Java & External Libraries - I][8]. Earlier today I published this post, in which I talk about how to deploy Java code to a database, so it can be loaded from there.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

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

[1]: https://blog.acolyer.org/2019/03/08/a-generalised-solution-to-distributed-consensus/
[2]: https://azure.microsoft.com/en-us/blog/microsoft-opens-first-datacenters-in-africa-with-general-availability-of-microsoft-azure/
[3]: https://azure.microsoft.com/en-us/blog/service-fabric-processor-in-public-preview/
[4]: https://devblogs.microsoft.com/dotnet/announcing-net-core-3-preview-3/
[5]: https://devblogs.microsoft.com/dotnet/collecting-net-core-linux-container-cpu-traces-from-a-sidecar-container/
[6]: https://101.datascience.community/2019/03/07/microsoft-launches-data-science-certifications/
[7]: https://eng.uber.com/machine-learning-capacity-safety/
[8]: {{< relref "2019-03-10-sql-server-2019-java--external-libraries---i.md" >}}
