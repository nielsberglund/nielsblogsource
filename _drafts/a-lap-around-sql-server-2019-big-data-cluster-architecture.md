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

In the first post [**A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology**][1] we looked at - as the title implies - the background of SQL Server 2019 Big Data Cluster, (BDC), and the technology behind it.

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

Oh, and a BDC is not only one SQL server, but quite a few instances. The SQL Server instances are SQL on Linux containers, and the whole BDC are deployed to and runs on Kubernetes (k8s).

We spoke a bit about k8s, and what constitutes a k8s cluster, (nodes, pods, etc.). In the post we tried to illustrate a k8s cluster like so:

![](/images/posts/bdc-lap-around-bdc-kubernetes-1.png)

**Figure 1:** *Kubernetes*

In *Figure 1* we see some of the parts of a two-node Kubernetes cluster, with a Master node. Later in this post, we talk some more about the Master node, and the role it plays.

In the post, we briefly mentioned how we deploy a BDC, and we said we have essentially two options:

* Deploy via Python scripts.
* Deploy using **Azure Data Studio**.

We looked at how to manage and monitor a BDC, and we spoke about the tools for managing and monitoring:

* `kubectl` - used to manage the Kubernetes cluster the BDC is deployed to.
* `azdata` - manage the BDC.

In this post, looking at the architecture, we use the tools above, so ensure you have them installed if you want to follow along.

## Architecture

How can we figure out what the architecture looks like? Well, in the [**A Lap Around SQL Server 2019 Big Data Cluster: Background & Technology**][1] post, we discussed k8s pods and how we could get information about the pod by executing some `kubectl` commands.

So let us go back to the pod we looked at briefly in the last post: `master-0`, which is the pod containing the SQL Server master instance. We look at that pod to see if we can get some information from it, which will help us in gaining insight into the architecture of a BDC. The code we use looks like so:

``` bash
kubectl get pods master-0 -n sqlbdc-cluster -o JSON
```
**Code Snippet 1:** *Get Pod Information*

In *Code Snippet 1* above we see how we use `kubectl get pods` and we:

* Send in the name of the pod we are interested in,
* Indicate the k8s namespace the pod is in.
* Want the output, `-o` flag, formatted as JSON.

When we execute the code in *Code Snippet 1* we see something like so:

![](/images/posts/bdc-lap-around-arch-pods1.png)

**Figure 2:** *Get Pods*

The `kubectl get pods master-0` command returns all information about that particular pod, and in *Figure 2* we see the first 20 lines or so of the JSON output.

Notice the section outlined in red, the `metadata` section. This section contains general information about the pod, and if we look closer, we can see three labels outlined in, purple, yellow and green respectively: 

* `app` with a value of `master`.
* `plane` with a value of `data`.
* `role` with a value of `master-pool`.

Maybe these labels would give us some insight if we were to look at all pods? Ok, so let's do that, and we will use some `kubectl -o` "magic" to get the information we want:

```bash
kubectl get pods -n sqlbdc-cluster \ 
                 -o custom-columns=NAME:.metadata.name, \
                    APP:.metadata.labels.app, \
                    ROLE:.metadata.labels.role,\
                    PLANE:.metadata.labels.plane
```
**Code Snippet 2:** *Custom Columns*

To retrieve the information we want, we use the `custom-columns` output option. We see in *Code Snippet 2* how we say we want four columns back: `NAME`, `APP`, `ROLE, and `PLANE`, and what labels those are. We then execute:

![](/images/posts/bdc-lap-around-arch-roles-planes.png)

**Figure 3:** *Pods with Custom Output*

In *Figure 3* we see the result from executing the code in *Code Snippet 2* and we see all pods in the `sqlbdc-cluster` namespace, i.e. all pods in the BDC. Wee see how the BDC has two planes, the control plane and the data plane.

#### Control & Data Plane

Let us make a short diversion here and talk a bit about control and data planes.

In distributed systems/services, we need a way to manage and monitor our services, and that is the role of the control plane. In the previous [post][1] we spoke about the master node in a k8s cluster and how we interact with the master node for management of the cluster. 

However, k8s has no idea about a SQL Server 2019 Big Data Cluster; in which order pods should be deployed etc. This is where the BDC control plane comes in. It knows about the BDC, so whenever there needs to be an interaction between the Kubernetes cluster and the BDC the k8s master node interacts with the BDC's control plane. Take a deployment as an example; when deploying to the BDC, the control plane acts as the coordinator and ensures services, etc., are "spun up" in the correct order. 

That is, however, not the only thing the control plane does. Remember from my previous [post][1] how we briefly discussed monitoring of a BDC and how we said we use Grafana, and Kibana together with the underlying InfluxDB and EleasticSearch as persistent stores. Well, the control plane is also responsible for monitoring, and in *Figure 3* you see some examples of this, where there are `APP`'s related to logs and metrics.

The data plane is what we communicate with when working with the BDC, doing queries etc. - the application traffic. In addition to that, the data plane is also responsible for:

* Routing.
* Load balancing.
* Observability.

Now, knowing a bit about the planes, let us have a look at roles.

#### role

In Kubernetes you have the notion of a `Role`, and that has to do with security: a `Role` sets permissions within a namespace. The `role` I refer to here has nothing to do with that. No, a `role` in this context is a way to describe the role of a Kubernetes component, i.e. what it does or belongs to. With that in mind we can get some information/insight about the architecture of the BDC from it. 




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