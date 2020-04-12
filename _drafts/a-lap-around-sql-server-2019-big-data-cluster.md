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

The type of Kubernetes cluster does not matter that much, it can be in the cloud, or on-prem. I always deploy to Azure, and the Azure Kubernetes Service, but as I said - it can essentially be any cluster.

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

Each k8s cluster has a master node, (sometimes also called the control plane). The master node runs a collection of processes which manages the cluster and its state. The master node also exposes the API layer which we interact with when managing the cluster.

> **NOTE:** If you create a k8s cluster in Azure, (AKS), the master is abstracted away from you.

As mentioned above, the nodes contain your application's pods. The nodes contain, in addition to your pods, two k8s components:

* `kubelet` - this is the k8s agent which processes the orchestration requests from the master node.
* `kube-proxy` - the proxy routes network traffic and manages IP addressing.

Each node also contains a container runtime, which is the component that allows containerized applications to run.

#### Managing a k8s Cluster

Above I mentioned how the master node exposes an API layer which we interact with when managing the cluster. 

**`kubectl`

The way to manage a cluster is via a command-line tool - `kubectl` - which allows you to inspect cluster resources; create, delete, and update components; etc.

To illustrate the use of `kubectl` I have created a small k8s cluster in Azure. The cluster is named `kubernetes-test`, (imaginative - I know), and the first thing we need to do is to configure `kubectl` to connect to the cluster.

To configure `kubectl I use an Azure CLI command: `az aks get-credentials`, like so:

```bash
az aks get-credentials --name kubernetes-test
                       --resource-group rg-k8s-test 
                       --admin 
                       --overwrite-existing
```
**Code Snippet 1:** *Configure `kubectl`*

We see in *Code Snippet 1* how I pass in the name of the cluster and the resource group as parameters together with two optional parameters:

* `admin` - gets cluster administrator credentials.
* `overwrite-existing` - overwrites any existing cluster entry with the same name.

When I execute the code in *Code Snippet 1* I get:

![](/images/posts/bdc-lap-around-kubectl-cfg.png)

**Figure 1:** *Configure `kubectl`*

The `config` file we see outlined in red in *Figure 1* holds, among other things, the keys for the Kubernetes cluster. To ensure that I can connect to the cluster, I call `kubectl get nodes`:

![](/images/posts/bdc-lap-around-kubectl-nodes.png)

**Figure 2:** *View Nodes*

We see in *Figure 2* the result after executing `kubectl get nodes`, and how my k8s cluster has three nodes. If I were to execute something like `kubectl get pods` I would not get a result back as I have not deployed anything to the cluster yet.

** Kubernetes Dashboard

You do not have to rely on `kubectl` solely for monitoring and managing a Kubernetes cluster, as you can also use the [Kubernetes Dashboard][3]. In Azure you access the dashboard by the `az aks browse` command, and - as with `get-credentials` - you pass in the names of the resource group and cluster: `az aks browse --resource-group rg-k8s-test --name kubernetes-test`, and a new tab opens in your browser:

![](/images/posts/bdc-lap-around-k8s-dash-error.png)

**Figure 3:** *Kubernetes Dashboard Errors*

Hmm, what is this - the tab that opens up shows the dashboard as we see in *Figure 3*, but it is full of warnings!

The problem here is that on AKS Role Based Access Control, (RBAC), is enabled by default and the service account used by the dashboard does not have enough permissions to access all resources.

We fix that by running the following command:

```bash
kubectl create clusterrolebinding kubernetes-dashboard -n kube-system `
              --clusterrole=cluster-admin `
              --serviceaccount=kube-system:kubernetes-dashboard
```
**Code Snippet 2:** *Assign Permissions to Kubernetes Dashboard*

After we execute the code in *Code Snippet 2* we can run the `az aks browse` command as per above, and now the dashboard comes up with no errors.

Further down in this post, I revisit the dashboard in the context of a SQL Server 2019 Big Data Cluster.

So that was a bit about Kubernetes. Admittedly this barely scratches the surface of k8s. If you are interested in knowing more about k8s I can recommend [this YouTube playlist][1], where [Brendan Burns][2], co-creator of Kubernetes, drills down into k8s.

## Deploying BDC to Kubernetes

So, we now know why we need the BDC, and we also know a bit about the platform the BDC runs on. Let us go on and look at how we install/deploy a BDC.

If you, like me, are a SQL Server guy, you are probably quite familiar with installing SQL Server instances by mounting an ISO file, and running setup. Well, you can forget all that when you deploy a BDC. The setup is all done via Python scripts, or a wizard in **Azure Data Studio**, (ADS)!

#### Install Tools

There are some tools needed when deploying a BDC:

* Python - well, Python is not a tool as such, but you need Python installed on the machine you install from.
* `azdata` - command-line tool for installing and managing a big data cluster.
* `kubectl` - I mentioned the command-line tool for monitoring the underlying Kubernetes cluster above.
* Azure Data Studio - a cross-platform graphical tool for querying SQL Server and other data sources.

> **NOTE:** ADS is not required per se unless you use it for deployment, but it is an excellent tool when working with the BDC after deployment.

#### Deployment

The actual deployment of a BDC would require a couple of posts in itself, so here I point you to a couple of resources about BDC deployment:

* [How to deploy SQL Server Big Data Clusters on Kubernetes][4]. This is the official Microsoft documentation for deploying a BDC.
* [How to Deploy SQL Server 2019 Big Data Cluster Using Azure Data Studio][5]. The link here is to a blog post by "yours truly" about how to deploy using ADS.

## Managing a BDC

So now we have installed and deployed our BDC, let us look at how we can manage it.

#### Kubernets Dashboard

Above I mentioned the k8s dashboard, but we did not see it "in action". Let us spin it up against our BDC cluster and see what it looks like.



#### `kubectl`

To begin with we can use `kubectl`, as I mentioned above, to get information about the k8s cluster. Above I said that a k8s cluster consists of, among other things, services, and in a k8s cluster services expose applications both internally and to the outside world.





These services 












Installing/deploying a BDC is nothing like installing a "normal" SQL Server






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
[3]: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
[4]: https://docs.microsoft.com/en-us/sql/big-data-cluster/deployment-guidance?view=sql-server-ver15#deploy
[5]: {{< relref "2019-12-23-how-to-deploy-sql-server-2019-big-data-cluster-using-azure-data-studio.md" >}}
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