---
layout: post
title: Interesting Stuff - Week 21
author: nielsb
date: 2017-05-28T20:00:13+02:00
comments: true
categories:
  - roundup
tags:
  - data science
  - distributed computing
  - SQL Server
  - OLEDB
  - Artificial Intelligence
  - Facebook Data Science
  - R
description: Azure Machine Learning, neural algorithms and some other cool stuff.
keywords:
  - data science
  - distributed computing
  - SQL Server
  - OLEDB
  - Artificial Intelligence
  - Facebook Data Science
  - R   
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

This week I do not have much at all. Mostly due to me not having had time to read that much, as work has "reared its ugly head". I have also been (still am) "prepping" for the [Microsoft Cloud Society - Data Science Roadshow][1], where I will be speaking in Johannesburg June 6, about Microsoft Azure Machine Learning.

Having said that, let's see what we have in store for this week.

## SQL Server

* [How It Works: SQL Server Deadlock Trace Flag 1222 Output][2]. Bob Dorr posts about deadlocks, and how trace flag 1222, can trip you up!
* [Scheduler stories: OLEDB, the external wait that isn’t preemptive][3]. [Ewald][ew] continues his deep-dive into SQL Server' internals "murky water", and looks at preemptive waits.

## Data Science

* [“Serving AI with Data” – Recap of the Microsoft AI Immersion Workshop][4]. **AI** is becoming the new buzz-word in the data science space, and in the beginning of May, Microsoft held an *AI Immersion Workshop. The post is a short summary of the workshop, and in it you can find key resources from the workshop.
* [Facebook Publishes New Neural Machine Translation Algorithm][5]. A very interesting article in [InfoQ][iq] about a new approach for neural machine translation (NMT) introduced by Facebook. Very, very interesting!
* [Microsoft R Open 3.4.0 now available][6]. My buddies over at [Revolution Analytics][re] posts about the release of Microsoft R Open 3.4.0.

## SQL Server R Services

Due to my workload at the moment, I am struggling with getting out the next installation of my [SQL Server R Services][sinst] series. It is slow going but I hope to have something out within the next two weeks.

## ~ Finally

That's all for this week. I hope you enjoy what I did put together. If you have ideas for what to cover, please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: https://www.microsoft.com/middleeast/azure/cloud-society/engage-data-science-roadshow.aspx
[2]: https://blogs.msdn.microsoft.com/bobsql/2017/05/23/how-it-works-sql-server-deadlock-trace-flag-1222-output/
[3]: http://sqlonice.com/scheduler-stories-oledb-the-external-wait-that-isnt-preemptive/
[4]: https://blogs.technet.microsoft.com/machinelearning/2017/05/23/serving-ai-with-data-recap-of-the-microsoft-ai-immersion-workshop/
[5]: https://www.infoq.com/news/2017/05/facebook-machine-translation
[6]: http://blog.revolutionanalytics.com/2017/05/microsoft-r-open-340-now-available.html
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
