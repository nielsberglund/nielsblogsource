---
layout: post
title: Interesting Stuff - Week 3
author: nielsb
date: 2017-01-21T05:37:16+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - databases
  - Apache Kafka
  - R
  - Microsoft R Server
  - Derivco
  - CIDR
description: Weekly roundup of what interesting stuff I have found.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - databases
  - CIDR
  - Apache Kafka
  - R
  - Microsoft R Server
  - Derivco
---

Throughout the week, I read a lot of blog-posts, articles, etc., that has to do with things that interest me:

* data science
* data in general
* distributed computing
* SQL Server
* transactions (both db as well as non db)
* and other "stuff"

This is the "roundup" of the posts that has been most interesting to me, this week. 

<!--more-->

This week there will be quite a few links to white-papers from this years [**The Conference on Innovative Data Systems Research**][3] (CIDR). It was started in 2002 by very illustrious people from the database industry: [**Michael Stonebraker**][4], [**Jim Gray**][5], and [**David DeWitt**][6]! The conference gives the database community a venue to present groundbreaking and innovative data systems architectures. This year it was held January 8 - 11, and you can find all the presentations [here][7].

I have had a quick glance through the white-papers and following are the ones that I am interested in and have had a chance to look at in some details:

* [Data Ingestion for the Connected World][8]. Discussion around new architecture for doing ETL in a world where real-time data is of out-most importance. The solution, which I am really, really interested in getting to know more about, centers around:
    * [Apache Kafka][10], a message broker type system
    * [S-Store][9] which is a streaming OLTP engine, which seeks to seemlessly combine online transactional processing with push-based stream processing for real-time applications.
    * [Intel’s BigDAWG][11], a distributed polystore engine
* [Evolving Databases for New-Gen Big Data Applications][12]. Presenting a system for handling high-volume transactions while executing complex analytics queries concurrently in a large-scale distributed big data platform.
* [SnappyData: A Unified Cluster for Streaming, Transactions, and Interactive Analytics][13]. Yet another system for OLTP workloads and analysis in real-time.
* [The Data Civilizer System][14]. As a data scientist you probably spend most of your time finding, preparing and cleaning data, instead of doing "real" work! This paper presents **Data Civilizer**, a system to help data scientists to:
    * discover data sets from large number of tables
    * link relevant data sets
    * compute answers from the data stores that holds the discovered data
    * clean the desired data
    * iterate through the tasks using a workflow system

As mentioned before, the above papers were the ones of interest that I had a chance to at least skim through. There are a wealth more of papers at the [site][7], so go an have a look. I also want do a shout-out to [**the morning paper**][2], which - the last week - has started dissecting these papers. So if you don't have time to go through all the papers yourself, browse to [**the morning paper**][2], and get the papers served to you!

So what else have I found interesting this week:

## Data Science

* [Microsoft R Server tips from the Tiger Team][15]. Blogpost from [Revolution Analytics][16] with quite a few links with tips about [**Microsoft R Server**][17]. Very useful "stuff"!!
* [Announcing Data Science Utilities Version 0.11, for the Team Data Science Process][18]. Microsoft has released a new version of tools and utilities for its [**Team Data Science Process**][19]. This something I will take a very close look at!
* [Microsoft R Server in the News][20]. Another blogpost from [Revolution Analytics][16], this time with links to articles in the tech press about the capabilities of [**Microsoft R Server**][17] in production environments. Some cool stuff in there!

## Distributed Computing

* [Apache Kafka: Getting Started][21]. [**Apache Kafka**][10] is one of the more popular message brokers out there (it is much more than a message broker), and Kafka appears in most solutions for distributed applications. Just see above in [Data Ingestion for the Connected World][8]! This post is a very good introduction how to get started with Kafka. 
* [Reactive Kafka][22]. Kafka again. This time from [InfoQ][23], and a presentation about how the new reactive streams interface for Kafka can be used to build robust applications in the microservices world.

## SQL Server

* [Automate Delivery of SQL Server Production Data Environments Using Containers][24]. Exactly as what the title says; how containers can be used in the SQL Server World. This is something that is of very much interest to us here at [**Derivco**][de], seeing how many SQL Server instances we have out in the world (we have one of the biggest SQL Server installations world-wide).


That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][1] me.

[1]: mailto:niels.it.berglund@gmail.com
[2]: https://blog.acolyer.org
[3]: http://cidrdb.org/
[4]: https://en.wikipedia.org/wiki/Michael_Stonebraker
[5]: https://en.wikipedia.org/wiki/Jim_Gray_(computer_scientist)
[6]: https://en.wikipedia.org/wiki/David_DeWitt
[7]: http://cidrdb.org/cidr2017/program.html
[8]: http://cidrdb.org/cidr2017/papers/p124-meehan-cidr17.pdf
[9]: http://sstore.cs.brown.edu/
[10]: https://kafka.apache.org/
[11]: http://users.eecs.northwestern.edu/~jennie/research/bigdawg_record.pdf
[12]: http://cidrdb.org/cidr2017/papers/p123-barber-cidr17.pdf
[13]: http://cidrdb.org/cidr2017/papers/p28-mozafari-cidr17.pdf
[14]: http://cidrdb.org/cidr2017/papers/p44-deng-cidr17.pdf
[15]: http://blog.revolutionanalytics.com/2017/01/tiger-team-tips.html
[16]: http://blog.revolutionanalytics.com
[17]: https://www.microsoft.com/en-us/cloud-platform/r-server
[18]: https://blogs.technet.microsoft.com/machinelearning/2017/01/11/announcing-data-science-utilities-version-0-11-for-the-team-data-science-process/
[19]: https://github.com/Azure/Microsoft-TDSP
[20]: http://blog.revolutionanalytics.com/2017/01/microsoft-r-server-in-the-news.html
[21]: https://www.confluent.io/blog/apache-kafka-getting-started/
[22]: https://www.infoq.com/presentations/kafka-reactive-streams
[23]: https://www.infoq.com
[24]: http://www.sqlshack.com/automate-delivery-of-sql-server-production-data-environments-using-containers/
[de]: (/derivco)



