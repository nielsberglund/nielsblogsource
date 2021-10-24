---
type: post
layout: "post"
title: Ingest Data from Kafka Into Azure Data Explorer for Superfast Real-Time Analytics
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - Azure
  - Azure Data Explorer
tags:
  - Azure Data Explorer
  - Kusto
  - KQL
  
description: 
keywords:
  -   
---

If you follow my blog, you probably know that I am a huge fan of Apache Kafka and event streaming/stream processing. Recently **Azure Data Explorer** (*ADX**) has caught my eye. In fact, in the last few weeks, I did two conference sessions about ADX. A month ago, I published a blog post related to Kafka and ADX: [**Run Self-Managed Kusto Kafka Connector Serverless in Azure Container Instances**][7]. 

As the title of that post implies, it looked at the ADX Kafka sink connector and how to run it in Azure. What the post did not look at was how to configure the connector and connect it to ADX. That is what we will do in this post (and maybe in a couple of more posts).

<!--more-->

## Background


## Pre-Reqs

This section is here if you want to follow along. This is what you need:

* Docker desktop. If you are on Windows and don't have it, you download it from [here][3].
* An Azure account. If you don't have an Azure subscription, sign up for a [free account][1].
* An Azure Data Explorer cluster and database. To see how to set up a cluster and a database, look here: [Quickstart: Create an Azure Data Explorer cluster and database][2].
* Kafka cluster. You can either run the cluster "on-prem" or in the cloud. I wrote a blog post about how to run Confluent Platform using Docker [here][4] and running Confluent Cloud on Azure [here][5]. In this post, I use Confluent Cloud in Azure.
* You need to download the Kusto connector from [here][6]. In the [**Run Self-Managed Kusto Kafka Connector Serverless in Azure Container Instances**][7] post, I downloaded and used the 2.0 version. In this post, we will use the [2.2 version][8].

#### Confluent Cloud CLI

We need a way to post messages/events to Kafka, and usually, I have a .NET Core application for that. Since in this post I only will send a few messages, I am going to use the [**Confluent Cloud CLI**][13] (ccloud) tool. This tool is a must for anyone using Confluent Cloud as it enables developers to create, manage, and deploy their Confluent components.

You find download and install instructions [here][12] and some examples of how to use it [here][14]. If your Kafka is on-prem, bare metal, or Docker, there are commands based on script files for various operations. In this post, the following commands are what you need if you are not using Confluent Cloud:

* `/kafka-topics`: handle topics; list, create, etc.
* `/kafka-console-producer`: publish messages to a topic.
* `/kafka-console-consumer`: consume messages from a topic.

Having sorted out the pre-reqs, and some Kafka tools, let us move on.

## Scene Setting

Before we go further, let's see what data we are working with. Since I am working at [Derivco](/derivco), an online gaming company, I guess it is only natural that my sample data is gameplay-related. The idea is that, in this post, we have online players playing various types of games, and the games are submitting game events to a Kafka topic. The event looks something like so:

```json
{
  "playerId": Int32,
  "gameId": Int32,
  "win": Int64,
  "score": Int32,
  "eventTime": DateTime
}
```
**Code Snippet 1:** *Event Schema*

The fields we see in *Code Snippet 1* are:

* `playerId`: the unique id of a player.
* `gameId`: an identifier for the specific game a player is playing.
* `win`: playing the game may result in a "win", which is a unit of "something".
* `score`: each interaction in a game by a player earns the player a score. 
* `eventTime`: the time in UTC when the event happened.

The event we see the schema for above is what is submitted to Kafka.

#### Create Topic

Let us create the topic to which the events are submitted:

``` bash
# list existing topics
$ ccloud kafka topic list

# the above returns no topics
# create a topic for gameplay
$ ccloud kafka topic create gameplay --partitions 4

# check that we have a topic
$ ccloud kafka topic list
```
**Code Snippet 2:** *Create Kafka Topic*

In *Code Snippet 2* we see:

* before I create the topic, I check what topics exist in the cluster. As this is a brand new Confluent Cloud cluster, there were no topics.
* I create the `gameplay` topic, explicitly setting the number of partitions to four. If I hadn't set the number of partitions, it would default to six.
* to ensure that the topic has been created, I check for topics again, and yes - it is there.

Let us publish an event to finish the *Setting the Scene* topic (did you see what I did there?).

#### Test Publish

We start with setting up a listener in a terminal window, so we can see when data arrives in the topic:

```bash
# setup a listener, when clicking enter it will start listening
ccloud kafka topic consume gameplay -b
Starting Kafka Consumer. Use Ctrl-C to exit.
```
** Code Snippet 3:** *Consume from Topic*

The code in *Code Snippet 3* sets up a listener. After clicking enter, you see the "Starting Kafka Consumer ..." as in the code snippet, and the listener is now ready to receive messages.

Time to publish an event. Open another terminal window and, if you are on Windows, make sure the terminal is Windows command prompt - not PowerShell. For some reason, when I try to publish with `ccloud` using PowerShell, I get errors. Anyway, the code:

``` bash
$ ccloud kafka topic produce gameplay --parse-key --delimiter ,
33, {"playerId":33, "gameId":23, "win":55, "score":123, \ 
      "eventTime":"2021-10-24 04:14:39.572"}
```
** Code Snippet 4:** *Publish to Topic*

We see in *Code Snippet 4* how we use the `ccloud kafka topic produce` command to publish to our `gameplay` topic. The two flags we see are:

* The `--parse-key` flag indicates we supply a message key with the message.
* The `--delimiter` flag defines the delimiter between the message key and message value.

After hitting enter after the first line, we enter the message. In *Code Snippet 4*, we start with the message key `33`, followed by the message value. The message key, `33`, represents the `playerId` as we want to partition the Kafka topic on `playerId`.

> **NOTE:** If you copy the code from *Code Snippet 4*, be aware of the line continuation character (`\`) in the message.

To publish the message, you hit enter, and when you go to the consumer terminal window, you should now see the message.

We now have a topic, and we can produce to that topic. So now, let us go back to connecting up our Kafka topic with Azure Data Explorer.

## Create a Kusto Connect Image

As we know from my previous post and what I mentioned at the beginning of this post, we use a Kafka connector to connect Kafka to ADX, and in the *Pre-Reqs* section, I downloaded the connector.

Suppose I had had an on-prem Kafka Connect installation. In that case, I could have taken my downloaded Kusto connector, copied it into my Kafka connect box, restarted the Kafka Connect process, and all would be good.

> **NOTE:** What I wrote above is a slight simplification; I would have needed to set some connect properties etc., as well. But from a high level, that's what I would have done.

The point above is moot as I don't have a Kafka Connect installation, so I will run the Kusto connector from Docker instead. To do that, I need to create a Docker image of the connector.

#### Create a Dockerfile

We build the image from a `Dockerfile`, so we start with creating the file:

![](/images/posts/kusto-conn-docker-file.png)

**Figure 1:** *Dockerfile*

We see in *Figure 1* above:

* As the connector needs to run in a Kafka Connect process, we use the `FROM` statement to bring in Kafka Connect's latest Confluent base image (`cp-server-connect-base:latest`).
* We copy the `.jar` file of the downloaded connector to a location in Kafka Connect where the `.jar` can be loaded from.
* As I want to connect into a Kafka cluster requiring authentication, I set some security settings. 

The last bullet point above is really "glossing over" what we are doing, so let me explain in a bit more detail. When we use a Kafka connector, the connector consumes from one or more Kafka topics or publishes to one or more Kafka topics. The necessary connection details to the Kafka instance is set up in the individual connector's configuration, which we'll see an example of later.

However, in the [previous post][7], we said how Kafka Connect is a JVM process (a worker) that loads and runs individual connectors such as our Kusto connector. The worker process needs to store configurations of the respective connectors and their state, and it stores this in Kafka. It doesn't have to store it in the Kafka instance the connector(s) consumes from or publishes to - it can use a completely separate Kafka instance and potentially a separate instance per connector. So when we want to use a connector, we need to set that information before configuring the connector. We see that in *Figure 1* lines 5 - 10, we set the security information to connect to the Kafka cluster where we want to store state and configuration.

That is it. We now have created a Docker file.

#### Build the Image

Having the Docker file, we can now go ahead and build the image:

![](/images/posts/kusto-conn-docker-build.png)

**Figure 2:** *Docker Build*

In *Figure 2*, we see how we use the `docker build` command to build an image with a given name. We also use the `-t` flag to *tag* the image. Looking at *Figure 2* it seems like the build has succeeded. Let us see if we have an image by running `docker images`:

![](/images/posts/kusto-conn-docker-image.png)

**Figure 3:** *Kusto Docker Image*

It definitely looks like we are in business as we in *Figure 3* see the newly built image. The image is now available locally, but we can also push it to the likes of Dockerhub, or - as I did in the [previous post][7]  - to Azure Container Instances.

## Run the Connector

For now, we will not push the image anywhere but run it locally, using Docker Compose.

#### Docker Compose Configuration

In the [previous][7] post, we did a quick run of the connector using Docker Compose. Here we will use almost the same Docker Compose file, but look a little bit more in detail what it consists of:

![](/images/posts/kusto-conn-docker-compose.png)

**Figure 4:** *Docker Compose File*

In *Figure 4*, we see the compose file - named `docker-compose.yml` - I created to "spin up" the connector. We see how I have in *Figure 4* added some numbered "bullet" points at the left. They indicate relevant "stuff" for the container so let us look at those and see what they refer to:

1. `image`: the image name and tag which we are using.
1. `container_name`: arbitrary name of the container.
1. `ports`: this tells the container to listen on this particular port, and how to map the internal IP to external.
1. `CONNECT_BOOTSTRAP_SERVERS`: host:port pair for the initial connection to the Kafka cluster. You can define multiple servers with a comma-separated host:port pairs.
1. `CONNECT_REST_ADVERTISED_HOST_NAME`: hostname for other workers to connect to when we run a distributed Kafka Connect cluster. The [**Common mistakes made when configuring multiple Kafka Connect workers**][9] post by Kafka guru Robin Moffat talks more about this.
1. `CONNECT_REST_PORT`: port for the REST API endpoint. It is `8083` by default, so I would not have had to define it in my compose file. Make sure that whatever port number you use is reflected in the `ports` entry in point 3. You use this port to manage and administer your connector.
1. `CONNECT_GROUP_ID`: a string that identifies the Kafka Connect cluster group this worker belongs to. 
1. `CONNECT_CONFIG_STORAGE_TOPIC`: name of the topic in which to store connector and task configuration data. 
1. `CONNECT_OFFSET_STORAGE_TOPIC`: name of the topic in which to store offset data for connectors.
1. `CONNECT_STATUS_STORAGE_TOPIC`: name of the topic in which to store state for connectors.
1. `CONNECT_KEY_CONVERTER`: what class to use for conversion of the message key. This can be overridden by the configuration of an individual connector.
1. `CONNECT_VALUE_CONVERTER`: what class to use for conversion of the message value. This can be overridden by the configuration of an individual connector.

Oh, one thing about the `...STORAGE_TOPIC`'s; if you have multiple Kafka Connect workers in a Connect group (`CONNECT_GROUP_ID`), then those workers need to use the same topics in the same cluster.

#### Run the Container

When we have created the Docker Compose file as per above, we can run the container. However, before we do that, I would like you to check what topics are in the Kafka Cluster: `ccloud kafka topic list`. When I run that code, I only see the topic we created above.

Cool, let us now "spin up" the container:

![](/images/posts/kusto-conn-docker-compose-up.png)

**Figure 5:** *Run Docker Compose*

We see in *Figure 5* how we start the container using the `docker-compose up -d` command. I execute the command in the same directory I have the `docker-compose.yml` file. 

> **NOTE:** The `docker-compose up` command expects a file named `docker-compose.yml`. If you want to use another name, you tell the command the file name using the `-f` flag.

In *Figure 5*, we also see how after the command has been executed, Docker creates an internal network and starts the container.

Seeing what we see in *Figure 5*, the assumption is that all has gone OK. Let us confirm by looking for new topics in the Kafka cluster. I do the same as I did above executing `ccloud kafka topic list`:
 
![](/images/posts/kusto-conn-kafka-topics-2-new.png)

**Figure 6:** *Kafka Topics*

Yay, when looking at *Figure 6* we see three new topics. I.e. the topics we defined in the `docker-compose.yml` file to store status, config and offset. So, so far, so good. Now let us take it one step further.

Remember from above how I said that the `CONNECT_REST_PORT` in the `docker-compose.yml` file defines the port we use to administer and configure the connector. We do this by calling endpoints exposed by the Kafka Connect REST API. 

Let us now use one of the endpoints to see that the Kafka worker is up and running and that our connector is available. The endpoint we use is the same we used in the [previous][post]: `GET /connector-plugins`:

![](/images/posts/kusto-conn-get-connector-plugins.png)

**Figure 7:** *Connector Plugins*

As I run the Docker container on my machine, we see in *Figure 7* (outlined in red) how I make a `GET` request against `localhost:8083` and the `connector-plugins` endpoint. We also see in *Figure 7* that the request is successful. It returns an array of connector plugins, of which our plugin (outlined in yellow) is one.

This is awesome; we have now built a Docker image of the Kusto sink connector and "spun" it up on our local machine. Basically, we are at the same point as at the end of the [previous post][7], apart from the container is not in Azure Container Registry. 

Now it is time to "hook" the connector up to Kafka and Azure Data Explorer.

## Configure the Connector

To do the "hook-up," the connector needs to be configured. From a high level, we need to configure:

* what topic(s) to read data from. 
* the target Azure Data Explorer cluster.
* the target database and table(s) to ingest the data into.

The *Pre-Reqs* section mentioned we needed an ADX cluster and a database, so the assumption is that we already have that. What is then required from an ADX perspective is a table.

#### 























docker exec -it broker /bin/bash

./kafka-topics --list --zookeeper zookeeper:2181
./kafka-topics --zookeeper zookeeper:2181 --create --topic testTopic --replication-factor 1 --partitions 4




I have a completely new Azure Confluent Cloud cluster set up as per this [post][5]. When I open the Confluent Control Center in my browser and look at *Topics*:

![](/images/posts/kusto-conn-kafka-topics-1.png)

**Figure 5:** *Kafka Topics - I*

I see something like in *Figure 5*, only one topic.





Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"


for ($x='' ;$x.length -le 30;$x=$x+'x'){
    Write-Host $x
    Start-Sleep -Milliseconds 20
}



❯ for($i = 0; $i -le 10; $i++) {
>> $orderId = $i + 1
>> $userId = Get-Random -Minimum 50 -Maximum 55
>> $orderValue = Get-Random -Minimum 100 -Maximum 300
>> $d = (Get-Date).ToUniversalTime().ToString( "yyyy-MM-dd HH:mm:ss.fff")
>> $event = '{"orderId": ' + $orderId + ', "userId": ' + $userId + ', "orderAmount": ' + $orderValue + ', "orderDate": '
 + '"' + $d + '"}'
>> Write-Output $event
>> Start-Sleep -Milliseconds 10
>> }


❯ for($i = 0; $i -le 10; $i++) {
>> $orderId = $i + 1
>> $userId = Get-Random -Minimum 50 -Maximum 55
>> $orderValue = Get-Random -Minimum 100 -Maximum 300
>> $d = (Get-Date).ToUniversalTime().ToString( "yyyy-MM-dd HH:mm:ss.fff")
>> $event = @"
>> {
>>   "orderId": $orderId,
>>   "userId": $userId,
>>   "orderAmount": $orderValue,
>>   "orderDate": "$d"
>> }
>> "@
>> Write-Output $event
>> Start-Sleep -Milliseconds 10
>> }


❯ $event = '{
>> "userId": 1,
>> "orderId": 13
>> }'



❯ $event = '{
>> "playerId": 1,
>> "gameId": 23,
>> "win": 23,
>> "score": 125,
>> "eventTime": ' + '"' + (Get-Date).ToUniversalTime().ToString( "yyyy-MM-dd HH:mm:ss.fff") + '"
>> }'






As mentioned before, the file contains the required properties to get this connector up and running. What you see outlined in red are properties naming topics needed to store Kafka offsets, configs and statuses. After we have "spun up" the container, we can check for these topics in our Kafka installation. Let us execute `docker-compose up -d':




##  Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

confluent-hub install microsoftcorporation/kafka-sink-azure-kusto:2.2.0

<!--
  post reference
  [pkg1]: {{< relref "" >}}
-->  

[adx]: https://docs.microsoft.com/en-us/azure/data-explorer/

[1]: https://azure.microsoft.com/en-us/free/
[2]: https://docs.microsoft.com/en-us/azure/data-explorer/create-cluster-database-portal
[3]: https://docs.docker.com/desktop/windows/install/
[4]: {{< relref "2019-06-18-confluent-platform--kafka-for-the-windows--net-developer.md" >}}
[5]: {{< relref "2021-08-14-run-confluent-cloud--serverless-apache-kafka-on-azure.md" >}}
[6]: https://github.com/Azure/kafka-sink-azure-kusto/releases
[7]: {{< relref "2021-09-06-run-self-managed-kafka-connector-in-serverless-azure-container-instance.md" >}}
[8]: https://github.com/Azure/kafka-sink-azure-kusto/releases/download/v2.2.0/kafka-sink-azure-kusto-2.2.0-jar-with-dependencies.jar
[9]: https://rmoff.net/2019/11/22/common-mistakes-made-when-configuring-multiple-kafka-connect-workers/
[10]: https://s3-us-west-2.amazonaws.com/confluent.cloud/ccloud-cli/archives/latest/ccloud_latest_windows_amd64.zip
[11]: https://docs.confluent.io/ccloud-cli/current/multi-cli.html
[12]: https://docs.confluent.io/ccloud-cli/current/install.html#tarball-or-zip-installation
[13]: https://docs.confluent.io/ccloud-cli/current/overview.html
[14]: https://docs.confluent.io/platform/current/tutorials/examples/clients/docs/ccloud.html
[15]:   

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->