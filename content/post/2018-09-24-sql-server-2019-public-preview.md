---
type: post
layout: "post"
title: "What is New in SQL Server 2019 Public Preview"
author: nielsb
date: 2018-09-24T19:17:06+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server
  - Microsoft R Server
  - Microsoft Machine Learning Server
  - Data Science
  - SQL Server R Services
  - SQL Server Machine Learning Services 
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Java
  - Azure Data Studio
description: A very initial investigation of what is new in SQL Server 2019 Machine Learning Services.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
  - Java
  - Azure Data Studio   
---

If you read my roundup for [week 38][1], which I published yesterday, you probably noticed that [**MS Ignite**][2] started today. I mentioned in the post that I was particularly interested in some of the **SQL Server** sessions, as they looked very interesting.

However, even before the sessions started, Microsoft released SQL Server 2019 CTP 2.0 for public preview and, naturally, I jumped on the [download link][3] and started downloading. I managed to get to the link in time before the rest of the world started the download, so I managed to get it down and then did an install.

The rest of this post is about my initial findings mostly in the SQL Server Machine Learning Services space.

> **NOTE:** I have looked at SQL Server 2019 the grand total of an hour, so this is a short post.

<!--more-->

## Installation & Versions

First of all, the installation took forever, at least it felt that way. I believe it took around an hour, just for the install. So if you install, make sure you are not in a hurry.

I chose to install R and Python services in-database. After the installation finished, (finally), I enabled the machine learning services:

```sql
EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE
```
**Code Snippet 1:** *Enable External Scripts*

After executing the code in *Code Snippet 1*, I restarted the SQL Server 2019 instance, and then executed my regular "check everything works" code:

```sql
EXEC sp_execute_external_script 
              @language = N'R'
        , @script = N'd<-42'

EXEC sp_execute_external_script 
              @language = N'Python'
        , @script = N'd=42'

EXEC sp_execute_external_script
                  @language = N'R' ,
                  @script = N'print(R.Version()$version)'

EXEC sp_execute_external_script 
              @language = N'Python'
, @script = N'
import sys
print (sys.version)'
```
**Code Snippet 2:** *Test Code*

As you see, the code is exceptionally advanced (not), but at least the code indicates if there are any issues. The last two `sp_execute_external_script` statements return the R and Python versions. For R the engine is now running on version `3.4.4` whereas in SQL Server 2017 it is `3.3.3`. For Python, it is the same version in both 2017 and 2019: `3.5.2`.

## Extensibility Framework

So, when I read [What's new in SQL Server 2019][4], I came across a lot of interesting "stuff", but one thing that stood out was *Java language programmability extensions*. In essence, it allows us to execute Java code in SQL Server by using a pre-built Java language extension! The way it works is as with R and Python; the code executes outside of the SQL Server engine, and you use `sp_execute_external_script` as the entry-point.

I haven't had time to execute any Java code as of yet, but in the coming days, I definitely will drill into this. Something I noticed is that the architecture for SQL Server Machine Learning Services has changed (or had additions to it). If you remember from my [SQL Server Machine Learning Services](/sql_server_2k16_r_services) posts, the flow when executing `sp_execute_external_script` looked something like so:

* We execute `sp_execute_external_script`.
* SQL Server connects to the Launchpad service.
* Based on the `@language` parameter, Launchpad calls into either `rlauncher.dll` or `pythonlauncher.dll`.
* The respective launcher then launches the external engine.

If now Java is supported is there also a Java launcher? No, as it turns out, there is not, at least not what I could find. However what I did find was this:

![](/images/posts/sql_2k19_ml_impr1.png)

**Figure 1:** *Common Launcher*

In the same directory as the R and Python launchers, I see this new `commonlauncher.dll` together with a config file. When looking at the config file I did not see anything giving any hints to what goes on, but - as I said above - I will investigate.

At this stage I have two theories about what happens when you execute Java code:

1. The Launchpad service knows about the Java extension: `javaextension.dll`, which is in the same directory as the launchers, and routes everything with `@language = Java` to the extension.
1. For any `@language` parameter that is not `R` or `Python`, the Launchpad service calls the `commonlauncher.dll`. 

That's more or less what I found out after an hours "playing around" with SQL Server 2019 CTP 2.0.

## Other Interesting Stuff

In the beginning of this post I mentioned about interesting things I found in the [What's new ...][4] article. In no particular order:

### Big Data Clusters

* Deploy a Big Data cluster with SQL Server and Spark Linux containers on Kubernetes
* Access your big data from HDFS
* Run Advanced analytics and machine learning with Spark
* Use Spark streaming to data to SQL data pools
* Run Query books that provide a notebook experience in Azure Data Studio.

### Data discovery and classification

* Helps meet data privacy standards and regulatory compliance requirements.
* Supports security scenarios, such as monitoring (auditing), and alerting on anomalous access to sensitive data.
* Makes it easier to identify where sensitive data resides in the enterprise, so that administrators can take the right steps to secure the database.

### SQL Server Machine Learning Services failover clusters and partition based modeling

* Partition-based modeling: Process external scripts per partition of your data using the new parameters added to `sp_execute_external_script`. This functionality supports training many small models (one model per partition of data) instead of one large model.
* Windows Server Failover Cluster: Configure high availability for Machine Learning Services on a Windows Server Failover Cluster.

### Azure Data Studio 

Previously released under the preview name SQL Operations Studio, Azure Data Studio is a lightweight, modern, open source, cross-platform desktop tool for the most common tasks in data development and administration. With Azure Data Studio you can connect to SQL Server on premises and in the cloud on Windows, macOS, and Linux.

## Other Resources

[Aaron Bertrand][6] has an [awesome writeup][5] of what's new in SQL Server 2019 from a more database engine perspective. In that writeup he also points to more resources about SQL Server 2019.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright



[1]: {{< relref "2018-09-23-interesting-stuff---week-38.md" >}}
[2]: https://www.microsoft.com/en-us/ignite
[3]: https://www.microsoft.com/en-us/evalcenter/evaluate-sql-server-2019-ctp
[4]: https://docs.microsoft.com/en-us/sql/sql-server/what-s-new-in-sql-server-ver15?view=sql-server-ver15
[5]: https://www.mssqltips.com/sqlservertip/5710/whats-new-in-the-first-public-ctp-of-sql-server-2019/
[6]: https://twitter.com/aaronbertrand
