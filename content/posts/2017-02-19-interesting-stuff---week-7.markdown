---
layout: post
title: Interesting Stuff - Week 7
author: nielsb
date: 2017-02-19T18:48:02+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Streaming
  - Kafka
  - rstats
description: Weekly roundup of what interesting stuff I have found.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Streaming
  - Kafka
  - rstats  
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

This post is little late as I was in Cape Town during the weekend and gave a talk at [satRday][1]. The conference was really good, great job by Andrew Collier for arranging this. During the week I'll put the code for my talk up on GitHub.

## Data Science

* [6 Deep Learning Applications a beginner can build in minutes (using Python)][2]. Interesting article trying to de-mystify Deep Learning.
* [Deep Learning in R][3]. More about Deep Learning. This talks about various R packages for Deep Learning.
* [Real-World, Man-Machine Algorithms][5]. This article, which is part of the InfoQ series [An Introduction To Machine Learning][4], talks about the end-to-end flow of developing machine learning models: where to get training data, how to pick the ML algorithm, and so forth.
* [Performance improvements coming to R 3.4.0][6]. Talks about what can be expected in the new R release 3.4, scheduled for March.
* [RedQueen: An online algorithm for smart broadcasting in social networks][7]. From [the morning paper][mp]. This is about algorithms can be used to find the optimal time to post on social networks.

## Streaming

* [Spark is the Future of Analytics][8]. Interesting analysis of Spark.
* [Kafka Streams - how does it fit the stream processing landscape?][11]. Post about Kafka Streams, a library for transforming and combining data streams in Kafka.
* [Towards a real-time streaming architecture][10]. How Sky Betting & Gaming went with Kafka for real-time streaming.
* [User Activity Events using Kafka Streams][12]. More about Kafka and Kafka streams. How to enrich an incoming stream of events with side data, and then compute aggregations based on the enriched stream.

## Big Data & Databases

* [Petabytes Scale Analytics Infrastructure @Netflix][9]. About Netflix' overall big data platform architecture, focusing on Storage and Orchestration. 
* [Spanner, the Google Database That Mastered Time, Is Now Open to Everyone][13]. About Google Spanner, a database that can span multiple geo-locations and still be seen as one instance.

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[de]: (/derivco)
[mp]: https://blog.acolyer.org
[1]: http://capetown2017.satrdays.org/
[2]: https://www.analyticsvidhya.com/blog/2017/02/6-deep-learning-applications-beginner-python/
[3]: http://www.rblog.uni-freiburg.de/2017/02/07/deep-learning-in-r/
[4]: https://www.infoq.com/introduction-machine-learning
[5]: https://www.infoq.com/articles/ml-algorhitm
[6]: http://blog.revolutionanalytics.com/2017/02/preview-r-340.html
[7]: https://blog.acolyer.org/2017/02/15/redqueen-an-online-algorithm-for-smart-broadcasting-in-social-networks/
[8]: https://thomaswdinsmore.com/2017/02/14/spark-is-the-future-of-analytics/
[9]: https://www.infoq.com/presentations/netflix-big-data-infrastructure
[10]: http://engineering.skybettingandgaming.com/2017/01/23/streaming-architectures/
[11]: https://softwaremill.com/kafka-streams-how-does-it-fit-stream-landscape/
[12]: https://www.confluent.io/blog/distributed-real-time-joins-and-aggregations-on-user-activity-events-using-kafka-streams/
[13]: https://www.wired.com/2017/02/spanner-google-database-harnessed-time-now-open-everyone/
