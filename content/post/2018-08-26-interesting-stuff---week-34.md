---
type: post
layout: "post"
title: Interesting Stuff - Week 34
author: nielsb
date: 2018-08-26T10:22:37+02:00
comments: true
highlight: true
draft: false
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - AWS Lambda
  - Azure Functions
  - Spark
description: .NET monitoring, chaos engineering, Pat Helland, stream integration, serverless, and other cool topics!
keywords:
  - data science
  - distributed computing
  - SQL Server
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - kafka
  - AWS Lambda
  - Azure Functions
  - Spark   
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

## .NET 

* [Monitoring and Observability in the .NET Runtime][1]. Yet another awesome blog-post by [Matthew][mattw]. This post covers how we can monitor .NET through *Diagnostics*, *Profiling* and *Debugging*.

## Distributed Computing

* [Chaos Engineering: Building Immunity in Production Systems][2]. An [InfoQ][iq] presentation discussing Chaos Engineering, its purpose, how to go about it, metrics to collect, the purpose of monitoring and logging, etc.

## Databases / Storage

* [Mind Your State for Your State of Mind][7]. A paper by [Pat Helland][path], where Pat explores the evolution of computation from a single process to microservices, the evolution of storage from files to key-value, and how they interact. Just as a side-note, you should read anything by Pat. He certainly knows what he is talking about!

## Streaming

* [Pakk Your Alpakka: Reactive Streams Integrations For AWS, Azure, & Google Cloud][3]. The link of this post had Cloud in the title, but I believe it fits better into *Streaming*. Anyway, this post links to a webinar about [Alpakka][4]. Alpakka is an integration framework for Akka Streams and the webinar looks at how Alpakka can be used for integrations with other systems.
* [Pat Helland | Kafka Summit 2017 Keynote (Standing on the Distributed Shoulders of Giants)][8]. Speaking about [Pat][path]. Here is a YouTube video from his Kafka Summit keynote in 2017. It is based on a paper he published in 2016: [Standing on Distributed Shoulders of Giants][9].

## Cloud

* [Logical index organization in Cosmos DB][5]. Another Cosmos DB post by [Murat][murba]. In this post, he looks at Cosmos DB's logical indexing subsystem.
* [From Big Data to micro-services: how to serve Spark-trained models through AWS lambdas][6]. This blog-post looks at how you take a Spark trained model, deploy it to AWS and expose it as an AWS Lambda endpoint. Very cool!

## Data Science

* [Snorkel: rapid training data creation with weak supervision][10]. In this post [Adrian][adcol] dissects a white paper which tackles one of the central questions in supervised machine learning: how do you get a large enough set of training data to power modern deep models?
* [Serverless Machine Learning with ML.NET and Azure Functions][11]. Earlier in this weeks roundup, I linked to a post about Spark models and AWS Lambdas. This post talks about training a classification model using [ML.NET][12] and deploy it with [Azure Functions][13].
* [Measuring Model Goodness – Part 1][14]. This post, which is part one of two-part series, is focused on measuring model goodness, specifically looking at quantifying business value and converting typical machine learning performance metrics (like precision, recall, RMSE, etc.) to business metrics.
* [MICROSOFT WEEKLY DATA SCIENCE NEWS FOR AUGUST 24, 2018][15]. I found the [Measuring Model Goodness][14] post above thanks to [Ryan's][ryansw] blog and this post. Ryan's blog is awesome if you are interested in what Microsoft does in data science and AI!

## SQL Server Machine Learning Services

The third post in the [Install R Packages in SQL Server ML Services](/sql_server_ml_services_install_packages) series, which I promised a couple of weeks ago would soon be finished has to wait a bit. Reason for this is my prep for the upcoming SQL Saturdays. 

As usual I present in Johannesburg, Cape Town and Durban:

* [Johannesburg][sqlsatjhb], September 1: 
    * [Overview SQL Server Machine Learning Services][sqlsatjhb_1].

![](/images/posts/sqlsat793_speaking_300x225.png)

* [Cape Town][sqlsatcpt], September 8:
    * [Azure Machine Learning][sqlsatcpt_ml].
    * [The Ins and Outs of sp_execute_external_script][sqlsatcpt_sp].
* [Durban][sqlsatdbn], September 15:
    * [The Ins and Outs of sp_execute_external_script][sqlsatdbn_sp].

Even if you are not interested in the topics I present, please register and come and listen to a lot of interesting talks by some of the industry's brightest people.

### PreCon

This year I also do precons in Cape Town and Durban on the Friday before the SQL Saturday event. My precons is a day where we talk about **SQL Server Machine Learning Services**, what it is and what we can do with it. It is in a format so if you want you can bring your laptop and code along as the day progresses.

The precon is not free, but hey ...

* [Cape Town, September 7 - A Drill Down Into SQL Server Machine Learning Services with Niels Berglund][sqlsatcpt_pre].
* [Durban, September 14 - A Day of SQL Server Machine Learning Services with Niels Berglund][sqlsatdbn_pre].

Even though the titles of the precons are different, I cover the same material.

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
[path]: https://twitter.com/pathelland

[1]: http://mattwarren.org/2018/08/21/Monitoring-and-Observability-in-the-.NET-Runtime/
[2]: https://www.infoq.com/presentations/chaos-engineering-introduction
[3]: https://www.lightbend.com/blog/pakk-your-alpakka-reactive-streams-integrations-for-aws-azure-google-cloud
[4]: https://akka.io/blog/2016/08/23/intro-alpakka
[5]: http://muratbuffalo.blogspot.com/2018/08/logical-index-organization-in-cosmos-db.html
[6]: https://towardsdatascience.com/from-big-data-to-micro-services-how-to-serve-spark-trained-models-through-aws-lambdas-ebe129f4849c
[7]: https://queue.acm.org/detail.cfm?id=3236388
[8]: https://www.youtube.com/watch?v=p9LBi11KR2c
[9]: https://queue.acm.org/detail.cfm?id=2953944
[10]: https://blog.acolyer.org/2018/08/22/snorkel-rapid-training-data-creation-with-weak-supervision/
[11]: http://luisquintanilla.me/2018/08/21/serverless-machine-learning-mlnet-azure-functions/
[12]: https://www.microsoft.com/net/learn/apps/machine-learning-and-ai/ml-dotnet
[13]: https://azure.microsoft.com/en-us/services/functions/
[14]: https://blogs.msdn.microsoft.com/data_insights_global_practice/2018/08/22/measuring-model-goodness-part-1/
[15]: http://101.datascience.community/2018/08/24/microsoft-weekly-data-science-news-for-august-24-2018

[sqlsatjhb]: http://www.sqlsaturday.com/785/EventHome.aspx
[sqlsatjhb_1]: http://www.sqlsaturday.com/785/Sessions/Details.aspx?sid=84967
[sqlsatcpt]: http://www.sqlsaturday.com/793/EventHome.aspx
[sqlsatcpt_ml]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84975
[sqlsatcpt_sp]: http://www.sqlsaturday.com/793/Sessions/Details.aspx?sid=84978
[sqlsatcpt_pre]: https://www.quicket.co.za/events/47683-sqlsaturday-cape-town-2018-precon-a-drill-down-into-sql-server-machine-learning/#/
[sqlsatdbn]: http://www.sqlsaturday.com/803/EventHome.aspx
[sqlsatdbn_sp]: http://www.sqlsaturday.com/803/Sessions/Details.aspx?sid=85097
[sqlsatdbn_pre]: https://www.quicket.co.za/events/55545-sqlsaturday-durban-precon-2018-a-day-of-sql-server-machine-learning-services/#/