We, Derivco, has traditionally been (and still are), a very much database bound software development house. What does that mean? It means that all our solutions are based on back end databases, and it was only five years ago that we started looking at stream processing in earnest. Seeing, that in addition to being a database company, we also are a predominantly Microsoft, Windows shop, we did not start out with Kafka, but another broker.

Lately we have come to the realization that for some (not all) workloads, Kafka would suit our purposes better than the other broker, and approximately a year ago we started looking in earnest at Kafka. The two main "obstacles" we had was:

* Linux is the preferred operating system for Kafka, and, as mentioned above, we are mainly a Windows shop.
* Kafkas is Java based, and we are .NET, C#, and we have very stringent security requirements.

The first obstacle was fairly easy to overcome, as throughout the last couple of years we have adopted Linux, and we have quite a few systems running on Linux. The other obstacle is what this blog post aims to discuss: how to get C# clients to work with Kafka, and to do it in a secure way.

We have tried to write this post in such a way it should be easy to follow, and with a lot of code examples, so let us start with the pre-reqs.

## Pre-Reqs

The pre-reqs are here if you want to follow along what we do in this post, and the pre-reqs are:

* Apache Kafka - well, that is quite obvious.
* .NET Core 2.0.

It helps to have an IDE which understands .NET, but it is not necessary as such. Apache Kafka can be on a separate machine, or - as we do below - installed on Docker.

#### Installation Apache Kafka

To start with let us install Kafka on Docker. In this post we use Confluent Platform, and more specifically:

* Zookeeper
* Kafka Broker
* Control Center

To install we use a Docker `.yaml` file, looking like so:

```yaml

```


yaml file (ZK, Broker, Control Center)

check connection, all works

## C# Publisher / Consumer

show code


## Security

Changing broker to ssl

Check with C#








