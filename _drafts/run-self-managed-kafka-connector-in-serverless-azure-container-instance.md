---
type: post
layout: "post"
title: Run Self-Managed Kusto Kafka Connector Serverless in Azure Container Instances
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - Azure
  - Confluent Cloud
  - Apache Kafka
  - Azure Data Explorer
tags:
  - Kafka
  - Kafka Connect
  - Azure
  - Serverless
  - Confluent Cloud
  - Confluent Platform
  - Azure Data Explorer
  - Docker
description: 
keywords:
  - Kafka
  - Kafka Connect
  - Azure
  - Serverless
  - Confluent Cloud
  - Confluent Platform
  - Azure Data Explorer
  - Docker   
---

A couple of weeks ago, I [posted][1] how I set up Kafka to run serverless in Azure by deploying Confluent Cloud.

If you have followed my blog lately, you have probably seen that I am interested in **Azure Data Explorer** and that I have a couple of conference talks coming. One being:

* **How to do Real-Time Analytics Using Apache Kafka and Azure Data Explorer**: We are looking at how to stream events from Apache Kafka to Azure Data Explorer (ADX) and perform user-facing analytics in near real-time.

The question is how to connect Kafka with ADX? You normally connect Kafka with another system using a Kafka Connect connector, and fortunately a connector exists for connecting Kafka with ADX: the [**Kafka Connect Kusto Sink Connector**][2].

However, since I am running managed Kafka (Confluent Cloud, remember), I need a managed connector to run it in the Confluent Cloud Kafka Connect. In the previous paragraph, I mentioned I was fortunate as we had a Kafka connector for ADX. Unfortunately, it is not a managed connector, so I cannot run it in Confluent Cloud - bummer!

So, this post looks at the various options we have if we want to use the Kafka Connect Kusto Sink Connector connecting Confluent Cloud in Azure with Azure Data Explorer. However, if you are not interested in neither Kafka nor ADX, the post may still be of use for you. The reason being it also covers running Docker images in Azure Container Instances (ACI).

<!--more-->

## Credits

Usually, the credits "roll" at the end of the ~~movie~~ post, but I feel I should start with the credits as this post would not have happened if it wasn't for this blog post:

* [Running a self-managed Kafka Connect worker for Confluent Cloud][3]. I came across this post by Kafka guru extraordinaire [Robin Moffat][4] when I looked into running a self-managed connector when you use Confluent Cloud. The post made me look into what it would take to run the connector in Azure Container Instances (ACI).

As I said, [Robin Moffat][4] is a Kafka Guru, and if you are into Kafka, then you **MUST** read his [blog][5].

## Pre-Reqs

This section is here if you want to follow along. I am listing what you need if you're going to deploy and run a container in ACI, not all required components for Kafka and ADX:

* An Azure account. If you don't have an Azure subscription, sign up for a [free account][6].
* Docker Desktop: We will build a Docker image, so we need Docker Desktop.
* Code to build the image from. The image I build for this post includes the Kusto Sink Connector, which I download from [here][8].

The version (2.0) of the Kusto Sink Connector I downloaded is not the latest you find on the [release page][7], but I could not get the 2.1 version to work.

In addition to the above, I also have Confluent Cloud deployed as per my [post][1] mentioned in the beginning. As I want to connect Kafka to Azure Data Explorer, I also have Azure Data Explorer installed.

## Background

Before we get down into it, let us get an understanding of some of the components in this post:

* Azure Data Explorer
* Confluent Cloud
* Kafka Connect
* Kafka Connect Kusto Sink Connector

#### Azure Data Explorer

Azure Data Explorer is a fully-managed big data analytics cloud platform and data-exploration service that ingests structured, semi-structured (like JSON) and unstructured data. The service then stores this data and answers analytic ad hoc queries on it with seconds of latency. It is a full-text indexing and retrieval database, including time series analysis capabilities, machine learning, regular expression evaluation, and text parsing.

It is ideal for analyzing large volumes of diverse data from any data source, such as websites, applications, IoT devices, and more. Essentially it is a distributed database running on a cluster of compute nodes in Microsoft Azure.

#### Confluent Cloud

In my [post][1] setting up Confluent Cloud I said it is a resilient, scalable streaming data service based on Apache Kafka, delivered as a fully managed service. It is Confluent Platform, running as a managed service in the cloud, and you can run it on Azure, AWS, and Google Cloud.

As it is Confluent Platform, you get so much more than *just* Kafka. You get built-in stream processing through ksqlDB, schema registry for data integrity, managed Kafka Connect connectors for data sources/sinks, and more.

#### Kafka Connect

Kafka Connect is a tool for streaming data between Apache Kafka and other systems scalable and reliable. The way you move data between systems and Kafka is using connectors, and there are two flavors of connectors:

* Source connectors that understand how to interact with the source system send records into Kafka
* Sink connectors that propagate records from Kafka topics to other systems.

Kafka Connect is a JVM process, and it operates separately from the Kafka Broker. The process loads connectors, and the connectors know how to interact with Kafka and the source/sink systems. The connectors are written in Java and packaged into `.jar` files.

#### Kafka Connect Kusto Sink Connector

The Kusto Sink Connector is a Kafka Connect connector. It is - as the name implies - a sink connector, dequeuing events from Kafka topics and ingesting into Azure Data Explorer. The ingestion is, for now, queued ingestion leveraging the Azure Data Explorer Java SDK, i.e. batch mode. 

Since the Kusto connector is not a managed connector, we need to decide where and how to run it.

## Options

Robin covered the various options in his [post][3] a lot better than I ever could, so I won't repeat that. Furthermore, seeing that I say in the title of this post **Azure Container Instances** (ACI), it is probably safe to assume that's the option we'll go with. As a picture says more than a thousand words, our solution looks something like so:

![](/images/posts/kusto-aci-conn.png)

**Figure 1:** *Kafka - ADX Architecture*

We see in *Figure 1* how we have:

* Kafka in Azure (Confluent Cloud). 
* an Azure Container Instances running the Kusto Sink Connector.
* data ingested from the connector into Azure Data Explorer.

Oh, and yes - the data being ingested is published to Kafka from the publisher we see in the upper right-hand corner.

In this post, the term Azure Container Instances has been mentioned a couple of times. What is that, then?

#### Azure Container Instances

ACI gives you an easy way to run containers in the Azure cloud, eliminating the need to manage virtual machines (VMs) or using more complex container orchestration services, like Kubernetes. For me, just testing this out, ACI is "good enough".

There are a couple of ways you can deploy and run a container in ACI:

* Utilise the integration between Docker and Azure and execute `docker run`. You do this mostly in test scenarios.
* Deploy the container image to ACI and run it in ACI.

Even though I said I am using ACI for testing at the beginning of this section, I will not use `docker run` but instead do a "proper" deployment to ACI.

## Create Kusto Sink Connector Image

We start with creating the `Dockerfile` for the image we want to deploy to ACI:

![](/images/posts/kusto-aci-dockerfile.png)

**Figure 2:** *Dockerfile*

As we need to run the connector in Kafka Connect, we base the image on the `cp-server-connect-base` image (the `FROM` statement). This image contains the bare minimum for Kafka Connect. 

In the Pre-Reqs section, I mentioned how I downloaded the Kusto connector. I downloaded it as a zip file and unzipped it to the same directory the `Dockerfile` is in. In line 3, we see how I copy the connector's `.jar` file to `/usr/share/java` in the image. That path is a "well known" path to load connectors from.

The `...OVERRIDE=All` statement on line 5 allows this connector to override consumer and producer properties to not impact all connectors running in that worker.

Lines 7 - 10 in the docker file are core config security settings that need to be set at the Kafka connect worker level and need to be "baked" into the Docker image. These settings are related to authentication and authorization against the Confluent Cloud Kafka.

#### Build the Image

Having created the `Dockerfile`, we can build the image:

![](/images/posts/kusto-aci-docker-build.png)

**Figure 3:** *Docker Build*

In *Figure 3*, we see us executing the `docker build` command and the outcome. When the build has finished, we can check that all looks OK by running `docker images`:

![](/images/posts/kusto-aci-kusto-image.png)

**Figure 4:** *Kusto Docker Image*

Success, we have an image, as we see in *Figure 4*. Well, at least partial success; we don't know if it works yet. Let us find out.

#### Run Locally

To find out if it works, we can run the container image locally using `docker-compose`. We create a `docker-compose.yml` file containing the bare minimum for running the connector:

![](/images/posts/kusto-aci-docker-compose.png)

**Figure 5:** *Docker Compose File*

We see in *Figure 5* the compose file I use to test that my container works. As mentioned before, the file contains the required properties to get this connector up and running. What you see outlined in red are properties naming topics to store Kafka offsets, configs and statuses. After we have "spun up" the container, we can check for these topics in our Kafka installation. Let us execute `docker-compose up -d':

![](/images/posts/kusto-aci-docker-compose-up.png)

**Figure 6:** *Run Docker Compose*

In *Figure 6*, we see that it looks like everything has worked OK and that we have created a connector instance `kusto-conn-1`. We can confirm that it has worked by checking the topics mentioned above or execute a REST call against the Kafka Connect API to `GET` the available connectors:

![](/images/posts/kusto-aci-get-connectors.png)

**Figure 7:** *GET Connectors*

From what we see in *Figure 7* it looks like we are OK. We see, outlined in blue, the `GET` call on port `8083`, and in the result below, we see the connector outlined in red.

## Deploy to ACI



















Anyway, Azure Data Explorer runs in Azure (I guess **Azure** in Azure Data Explorer gives it away), and, as mentioned above, may Kafka installation also runs in Azure. The easiest way to connect Kafka to ADX is using the [**Kafka Connect Kusto Sink Connector**][2].

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



[1]: {{< relref "2021-08-14-run-confluent-cloud--serverless-apache-kafka-on-azure.md" >}}
[2]: https://github.com/Azure/kafka-sink-azure-kusto
[3]: https://rmoff.net/2021/01/11/running-a-self-managed-kafka-connect-worker-for-confluent-cloud/
[4]: https://twitter.com/rmoff
[5]: https://rmoff.net/
[6]: https://azure.microsoft.com/en-us/free/
[7]: https://github.com/Azure/kafka-sink-azure-kusto/releases
[8]: https://github.com/Azure/kafka-sink-azure-kusto/releases/download/v2.0.0/kafka-sink-azure-kusto-2.0.0-jar-with-dependencies.jar
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