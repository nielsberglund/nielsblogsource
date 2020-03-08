---
type: post
layout: "post"
title: A Lap Around SQL Server 2019 Big Data Cluster
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

You who read my blog have probably noticed some posts around **SQL Server 2019 Big Data Cluster**, (BDC). You have also most likely seen me posting about giving conference talks and webinars around BDC.

One of the presentations I do around BDC is named "A Lap Around SQL Server 2019 Big Data Cluster", and I thought it would be a good idea to make a blog post around the presentation.

Therefore, in this post, (and maybe some follow-up posts), we look at what **SQL Server 2019 Big Data Cluster** is.

<!--more-->

## Data

Before we "drill into" what a Big Data Cluster is, let us discuss why Microsoft felt the need for BDC. It all comes down to data:

We are getting more and more data, and to stay competitive we need to be able to use that data; to integrate it, manage it and analyze it.

The problem is that the data comes in all shapes and types; relational data, NoSQL, files, etc., etc. So how do we integrate and analyze this data?

#### SQL Server

I come back to the question about how to handle all this data shortly, but before that let us think about the evolution of SQL Server throughout the years.

From its "humble beginnings" as another flavor of Ashton Tate/Sybase, Microsoft evolved SQL Server throughout the years:

* SQL Server 7.0 - re-write of the codebase in C++, introducing User Mode Scheduling, (UMS), a multi-dimensional database called SQL OLAP Services.
* SQL Server 2000 - OLAP Services became Analysis Services.
* SQL Server 2005 - this was a massive release! Microsoft introduced, among other things SQL Server Integration Services, the XML data type, SQL Server Service Broker, and my favorite: SQLCLR.
* SQL Server 2016 - in this release Microsoft introduced SQL Server Machine Learning Services, (the ability to call R code from T-SQL). Microsoft also added PolyBase, which - in this release - allowed the creation of External Table(s) against Hadoop data. 
* SQL Server 2017 - Microsoft added Python in addition to R in SQL Server Machine Learning Services. Also - another biggie - for the first time: SQL Server on Linux, as well as containers!
* SQL Server 2019 - Java is added in addition to R and Python, and it is introduced as SQL Server Extensibility Framework. Polybase is greatly enhanced, and we can now create external tables against relational databases, as well as MongoDB and CosmosDB, plus generic ODBC data sources.

From the above, which is by no means complete, we see how Microsoft has evolved SQL Server to be not only an exceptional relational database but also an engine which can do many things related to data.

Coming back to what I asked above about how to integrate, manage and analyze all types of data, Microsoft sees SQL Server as the hub in all this, and the solution is SQL Server 2019 Big Data Cluster.

The idea is that with SQL Server 2019 Big Data cluster we should be able to handle, (manage, integrate, analyze), not only relational data, but also other types of data, (Big Data), and extend SQL Server to store data in the petabyte range.

## SQL Server 2019 Big Data Cluster

So, from the above, we see that a BDC is not your usual SQL Server instance; it is an entirely different "beast".

As the name implies, a BDC is a cluster of "things". When you deploy the BDC, you deploy a scalable cluster of SQL Server, (multiple instances in fact), Hadoop File System, (HDFS), and Apache Spark. By having these components in the cluster, you can process and analyse massive amounts of data, not only relational data but big data as well.

> **NOTE:** Oh how things have changed. From once at a time shying away from Open Source, Microsoft now embraces Open Source: Linux, Apache Spark, Hadoop File System!

A difference from a "normal" SQL Server installation is that the SQL Server instances in a BDC are SQL Server on Linux in containers. All components in a BDC run in containers, and since we now have multiple containers we need something that manages and orchestrates the containers and their workload. For this we use Kubernetes. So, when we deploy a BDC, we deploy into a Kubernetes cluster.

## Kubernetes

Kubernetes, (k8s), is an open-source container orchestration system for automating application deployment, scaling, and management. Kubernetes helps you with:

* Service discovery, load balancing.
* Storage orchestration.
* Automated rollouts and rollbacks.
* Automated sharding.
* more ...

> **NOTE:** When I first started hearing about Kubernetes I wondered where the abbreviation "k8s" came from and what it means. I had various theories, each one "weirder" than the other. Well, the answer is that k is the first letter in the name, s is the last letter, and the 8 in between stands for the number of letters between k and s.

#### Kubernetes Basics

A k8s cluster consists of:

* Node(s) - the actual servers the cluster runs on. They can be either bare metal or VM's.
* Pod(s) - a Pod is a collection of containers, and a Pod exists on a Node.
* Service - a Service defines a logical set of pods and a policy by which to access them.
* Namespace - a virtual cluster of nodes.
* Volume -  a directory that contains data accessible to containers in a given Pod. Since Pods and therefore containers come and go a Volume provides a mechanism to connect Pods/containers to persistent data stores elsewhere.

Each k8s cluster has a master node, (sometimes also called the control plane). The master node runs a collection of processes which manages the cluster and its state. The master node also exposes the API layer which we interact with when managing the cluster. To interact with the cluster we use a tool called `kubectl`, and below we mention it some more.

> **NOTE:** If you create a k8s cluster in Azure, (AKS), the master is abstracted away from you.

As mentioned above, the nodes contain your application's pods. The nodes contain, in addition to your pods, two k8s components:

* `kubelet` - this is the k8s agent which processes the orchestration requests from the master node.
* `kube-proxy` - the proxy routes network traffic and manages IP addressing.

Each node also contains a container runtime, which is the component that allows containerized applications to run.

The above barely scratches the surface of k8s, and there are so much more to k8s. If you are interested in knowing more about k8s I can recommend [this YouTube playlist][1], where [Brendan Burns][2], co-creator of Kubernetes, drills down into k8s.

## Deploying BDC to Kubernetes






When you discuss k8s there are certain concepts/terminology always used:






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



[1]: https://www.youtube.com/playlist?list=PLLasX02E8BPCrIhFrc_ZiINhbRkYMKdPT
[2]: https://www.linkedin.com/in/brendan-burns-487aa590/
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