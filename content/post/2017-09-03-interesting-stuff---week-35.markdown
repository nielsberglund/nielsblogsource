---
layout: post
title: Interesting Stuff - Week 35
author: nielsb
date: 2017-09-03T19:55:48+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - kafka
  - flink   
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, for the week just gone by. 

I know, I know - there is not much for this week. A major reason for this is that, here in South Africa, we are in [SQL Saturday][1] season right now. What has that got to do with anything you may ask - well, it is like this:

<!--more-->

In April/May (or thereabouts) emails are going out from the organizers asking for submissions to the upcoming SQL Saturday's. At that stage I have some "awesome" ides what to present about, typically some new cool stuff coming - hopefully - just in time for SQL Saturday. 

So, I put together some topics with blurbs what the presentation will be about. Then I promptly forget about this until I receive an email a month, or thereabout, before the "gig" - saying what talks have been accepted. At that stage I am like : "cool, my talk about xyz got accepted, let's see what to cover. Ah well, I have plenty of time ...". 

Then, all of a sudden it is one week before the first "gig", and I realize I have nothing prepared yet, so **NOW** it is time to burn the midnight oil. And that is what I have been doing the last week (and will be next week, and the one after that). The upside of this is that the talks could potentially result in a blog-post or two.

Anyway, that aside, here is what I have found.

## SQL Server

* [Fishing for wait types revisited – QUERY_TASK_ENQUEUE_MUTEX][2]. [Ewald][ew] has to eat some "humble pie" when it comes to wait types. This blog-post is awesome from a couple of perspectives: 

    1. [Ewald][ew] is a mere mortal as the rest of us. 
    1. It covers some cool sh*t.

## Streaming

* [Introducing KSQL: Open Source Streaming SQL for Apache Kafka][3]. Man, this is sooo awesome! Apache Kafka and SQL! This can be the best thing since sliced bread!!! I wonder what impact this will have on technologies like [Esper][4] and even [Flink][5].
* [Machine Learning-based anomaly detection in Azure Stream Analytics][6]. Azure Stream Analytics introduces machine learning-based anomaly detection.
* [Azure Event Hubs Capture][7]. Azure Event Hubs have been the preferred choice in Azure to get data into the cloud. Then, if you wanted to push it further - Azure Data Lake, etc. - you had to either write your own consumer or use Azure Stream Analytics, with an output sink. 
  
  With Azure Event Hubs Capture you can automatically deliver the streaming data in Event Hubs to an Azure Blob storage or Azure Data Lake Store account of your choice, with the added flexibility of specifying a time or size interval. Cool!!!

# SQL Server R Services

* [Microsoft SQL Server R Services - Internals X][si10]. This episode covers how data is sent from SQL Server to the R components. Initially I had planned [Internals - X][si10] to be the final posting the internals part of the *SQL Server R Services* series, but I realize now that I need at least two more parts.

## Shameless Self Promotion

In the beginning of this post I wrote about how it is SQL Saturday "season" here in South Africa. If you are around, and interested I am talking at:

* [SQL in Port Elizabeth 06 September 2017][8]. Here I present on 
    * Real World Example of Using R in SQL Server
    * The Definitive Guide to SQL Server Error Handling
* [SQL Saturday 2017 Cape Town][9]. My talk here is:
    * [Real World Example of Using R in SQL Server][10].
* [SQL Saturday 2017 Durban][11]. My talks here are:
    * [A Lap Around New Developer Features in SQL Server 2017][12].
    * [Real World Example of Using R in SQL Server][13].

So please, if you are around - come and say Hi!.

In addition to the above, I just came home from:

* [SQL Saturday 2017 Johannesburg][14]. Here I presented:
    * [A Drill Down into R and Python in SQL Server 2017][15]       

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: http://sqlsaturday.com/
[2]: http://sqlonice.com/fishing-for-wait-types-revisited_query_task_enqueue_mutex/
[3]: https://www.confluent.io/blog/ksql-open-source-streaming-sql-for-apache-kafka/
[4]: http://www.espertech.com/
[5]: https://data-artisans.com/
[6]: https://azure.microsoft.com/en-us/blog/machine-learning-based-anomaly-detection-in-azure-stream-analytics/
[7]: https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-capture-overview
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
[8]: https://www.quicket.co.za/events/33252-sql-in-pe-06-september-2017/#/
[9]: http://www.sqlsaturday.com/637/eventhome.aspx
[10]: http://www.sqlsaturday.com/637/Sessions/Details.aspx?sid=66538
[11]: http://www.sqlsaturday.com/659/eventhome.aspx
[12]: http://www.sqlsaturday.com/659/Sessions/Details.aspx?sid=66543
[13]: http://www.sqlsaturday.com/659/Sessions/Details.aspx?sid=66542
[14]: http://www.sqlsaturday.com/648/eventhome.aspx
[15]: http://www.sqlsaturday.com/648/Sessions/Details.aspx?sid=66531
