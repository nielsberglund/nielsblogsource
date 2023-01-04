---
layout: post
title: Interesting Stuff - Week 13
author: nielsb
date: 2017-04-02T16:39:25+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - Microsoft SQL Server R Services
  - R
  - streaming
description: Weekly roundup of what interesting stuff I have read in blogs etc.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - Microsoft SQL Server R Services
  - R
  - streaming   
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

## Streaming

* [Stream Processing & Analytics with Flink @Uber][1]. A presentation about how Uber builds its next generation of stream processing system to support real-time analytics as well as complex event processing.
* [Scaling up Near Real-time Analytics @Uber &LinkedIn][2]. Another presentation involving Uber. This time in combination with LinkedIn, and how they use Apache Samza, Apache Calcite and Pinot.
* [Real-time Recommendations using Spark Streaming][3]. Presentation about how Netflix uses Kafka, Spark Streaming, and Cassandra for real-time recommendations.
* [Spotify’s Event Delivery – The Road to the Cloud (Part I)][4]. First post in a series about what Spotify is handling event delivery. Really interesting!

## SQL Server
* [Context in perspective 6: Taking Sessions to Task][5]. The sixth post by [Ewald][ew] about context in SQL Server. As usual it is a treasure trove of SQL Server internals information!
* [SQLskills SQL101: Partitioning][6]. Kimberly continues [SQLskills][sqsk] SQL101 series with a post about partitioning.
* [SQL Server On Linux: Core-minidumps and Breakpad][7]. An awesome post by Bob Dorr about debugging SQL Server on Linux and core dumps.
* [Microsoft SQL Server R Services - Internals II][10]. Earlier today I finished the third post in my series about Microsoft SQL Server R Services. This post being the second about the internals. The post drills down into the launchpad service.

## Data Science

* [UK government using R to modernize reporting of official statistics][8]. A post from [Revolution Analytics][re] how the UK government uses R.
* [Learning Scrabble strategy from robots, using R][9]. Another post from [Revolution Analytics][re], this time about how R has been used to analyze Scrabble games.


That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://www.infoq.com/presentations/uber-flink-stream
[2]: https://www.infoq.com/presentations/uber-linkedin-analytics
[3]: https://www.infoq.com/presentations/netflix-recommendation-spark
[4]: https://labs.spotify.com/2016/02/25/spotifys-event-delivery-the-road-to-the-cloud-part-i/
[5]: http://sqlonice.com/context-in-perspective-6-taking-sessions-to-task/
[6]: https://www.sqlskills.com/blogs/kimberly/sqlskills-sql101-partitioning/
[7]: https://blogs.msdn.microsoft.com/bobsql/2017/03/27/sql-server-on-linux-core-minidumps-and-breakpad/
[8]: http://blog.revolutionanalytics.com/2017/03/uk-statistics.html
[9]: http://blog.revolutionanalytics.com/2017/03/scrabblr.html
[10]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
