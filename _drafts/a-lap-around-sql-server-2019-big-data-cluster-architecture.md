---
type: post
layout: "post"
title: "A Lap Around SQL Server 2019 Big Data Cluster: Architecture"
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
  - SQL Server 2019 Big Data Cluster
tags:
  - SQL Server 2019 Big Data Cluster
  - Kubernetes
  - Azure Kubernetes Service
  - Azure Data Studio
  - Spark
  - Hadoop
  - Python
description: 
keywords:
  -   
---

This post is the second in series about **SQL Server 2019 Big Data Cluster** based on a presentation I do: **A Lap Around SQL Server 2019 Big Data Cluster**.

In the first post [A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology][1] we looked at - as the title implies - the background of SQL Server 2019 Big Data Cluster, (BDC), and the technology behind it.

In this post, we look at the architecture and components of a BDC.

<!--more-->

Before we dive into the architecture, let's refresh our memories around what we covered in the [previous][1] post.

## Recap

We are getting more and more data, and the data comes in all types and sizes. We need a system to be able to manage, integrate, and analyze all this data. That's where SQL Server comes into the picture.

SQL Server has continuously evolved from its very humble beginnings based on Ashton Tate/Sybase code base to where it is now:

* SQL Server in Linux.
* SQL Server in Containers.
* SQL Server on Kubernetes.

With all the capabilities now in SQL Server, it is the ideal platform to handle big data.

The SQL Server itself is not enough to achieve what we want, so in addition to SQL Server a BDC includes quite a few open-source technologies:

* Apache Spark
* Hadoop File System (HDFS)
* Influx DB
* Graphana
* Kibana
* Elasticsearch
* more ...

Oh, and a BDC is not only one SQL server, but quite a few instances. The SQL Server instances are SQL on Linux containers, and the whole BDC are deployed to and runs on Kubernetes.

In the post, we briefly mentioned how we deploy a BDC, and we said we have essentially two options:

* Deploy via Python scripts.
* Deploy using **Azure Data Studio**.

We looked at how to manage and monitor a BDC, and we spoke about the tools for managing and monitoring:

* `kubectl` - used to manage the Kubernetes cluster the BDC is deployed to.
* `azdata` - manage the BDC.

In this post, looking at the architecture, we use the tools above, so ensure you have them installed if you want to follow along.





We started looking at how SQL Server has constantly evolved from a very basic RDBMS based on Ashton Tate/Sybase code base to what it is today. At the same time we are getting more and more data. This data comes in all types and sizes, and we need a system to be able to manage, integrate and analyze all this data.






![](/images/posts/<image_name_incl_ext>)

**Figure 1:** **

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright


<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  


[1]: {{< relref "2020-04-26-a-lap-around-sql-server-2019-big-data-cluster.md" >}}
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:   

<!--
[series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services)
[series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages)
[series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context)
-->

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->