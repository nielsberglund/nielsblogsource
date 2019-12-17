---
type: post
layout: "post"
title: How to Deploy SQL Server 2019 Big Data Cluster Using Azure Data Studio
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

For you who follows my sporadic posts, you may wonder why I have yet another post, (YAP), covering how to deploy a **SQL Server 2019 Big Data Cluster**, (BDC), using **Azure Data Studio**, (ADS).
 
The answer to that is that the version of BDC I deployed was a pre-release, and since then BDC has gone GA, (General Availability), and there are certain differences in deployment process between RC1, and RTM.

So in this post let us look at how to deploy BDC RTM to Azure Kubernetes Service using ADS.

<!--more-->

## Pre-Reqs

To deploy using **Azure Data Studio**, (ADS), you need ADS (duh - see below), but you also need some other things.

> **NOTE:** If you wonder where you have seen this pre-req section before, the answer is that it is almost identical to the pre-req section in my [previous install post][1].

#### Azure Subscription

As this post covers how to deploy a **SQL Server 2019 Big Data Cluster** to **Azure Kubernetes Service**, (AKS), you need an Azure subscription. If you do not have one, you can sign up for a free trial subscription [here][2].

#### Python

Well, Python is not a tool as such, but you need Python installed on the machine you install from, as the ADS deployment runs some Python scrips. You need Python3, and on my machine, I have Python 3.7.3. Ensure that Python is on the `PATH`.

#### azdata

`azdata` is a Python command-line tool enabling cluster administrators to bootstrap and manages the big data cluster via REST APIs. It replaces `mssqlctl`, which was the previous command-line tool for deploying a BDC.

There are a couple of steps to install `azdata`:

* If you have `mssqlctl` installed you need to uninstall it:

```bash
$ pip3 uninstall -r https://private-repo.microsoft.com/ \
                           python/ctp3.1/mssqlctl/requirements.txt
```
**Code Snippet 1:** *Uninstall `mssqlctl`*

In *Code Snippet 1* above I have inserted a line continuation (`\`) to make the code fit the page.

* If you have deployed CTP 3.2, or any later CTP's of the BDC, (including RC1), then you need to uninstall the corresponding version of `azdata`:

``` bash
pip3 uninstall -r https://azdatacli.blob.core.windows.net/ \
                  python/azdata/<version-indicator>/requirements.txt
```
**Code Snippet 2:** *Uninstall `azdata`*

In *Code Snippet 2* you see how the uninstall command indicates which version of `azdata` to uninstall via `<version-indicator>`. The value of the `<version-indicator> is as follows:

* CTP 3.2: `2019-ctp3.2`.
* RC1: `2019-rc1`.

* With the above in mind, the command I used to uninstall the `RC1` version of `azdata` looks like so:

``` bash
pip3 uninstall -r https://azdatacli.blob.core.windows.net/ \
                  python/azdata/2019-rc1/requirements.txt
```
**Code Snippet 3:** *Uninstall RC1 `azdata`*

In *Code Snippet 3* we see how I have replaced `<version-indicator>` with `2019-rc1`. When you run the command, you have to confirm that you want to remove some installed components: 

![](/images/posts/inst-bdcrc1-uninst-azdata.png)

**Figure 1:** *Confirm Uninstall `azdata`*

Just click `y` when asked to proceed.

> **NOTE:** The biggest issue causing errors in a BDC deployment, by far, is using an older version of `azdata`. So please, do not be "that guy" (or girl) - make sure you uninstall `azdata` if you have an earlier version. In fact, before a deployment, always uninstall `azdata` followed by an install, (see below).

* You need the latest version of the Python `requests` package installed:

``` bash
$ pip3 install -U requests
```
**Code Snippet 4:** *Install/Upgrade `requests`*

When you have executed the code in *Code Snippet 4* you can install `azdata`:

``` bash
$ pip3 install -r https://aka.ms/azdata
```
**Code Snippet 5:** *Installing `azdata`*

After executing the code in *Code Snippet 5* you can go ahead and install the other tools needed.

#### kubectl

The `kubectl` tool is a Kubernetes command-line tool, and it allows you to run commands against Kubernetes clusters. You use `kubectl` to deploy applications, inspect and manage cluster resources, and view logs.

You can install `kubectl` in different ways, and I installed it from [Chocolatey][3]: `choco install kubernetes-cli`.

#### Azure CLI

The Azure CLI is Microsoft's cross-platform command-line experience for managing Azure resources, and you install it on your local machine. You find installation links for Azure CLI [here][4].

## Azure Data Studio

Since this post is about installing and deploying a BDC using **Azure Data Studio**, you also need ADS. Pre-releases of the BDC required special builds of ADS for deployment, (the Insiders builds), and the BDC RC1 release required the ADS RC build.

This is not the case anymore; any ADS build from 1.13.0 is sufficient for deployment. You find installation links for ADS [here][5].

#### Azure Data Studio Notebooks

You deploy the BDC using ADS deployment *Notebooks*. You may ask yourself what an **Azure Data Studio Notebook** is? Well, Notebooks come from the Data Science world where a Notebook can contain live code, equations, visualizations and narrative text. It is a tool for teaching or sharing information between people. A notebook makes it easy to link lots of docs and code together.

When Microsoft developed ADS, they embedded the [Jupyter][6] service in ADS, which enables ADS to run Notebooks. When you talk about Notebooks, you also talk about *Kernels*. A *Kernel* is the programming language you can write and execute code in, in the *Notebook*:

![](/images/posts/inst-bdcrc1-ads-notebook-kernels.png)

**Figure 2:** *Notebook Kernels*

The drop-down you see in *Figure 2* shows the *Kernels* ADS supports. When you deploy, you use the *Python 3* kernel.

If you have not used Python Notebooks before in ADS, you need to configure Python for use with Notebooks. You enter **Ctrl+Shift+P** to open the command palette, and you search for *Configure Python*:

![](/images/posts/inst-bdcrc1-ads-configure-notebooks.png)

**Figure 3:** *Configure Notebooks*

In *Figure 3* you see the command palette, and you choose *Configure Python for Notebooks*, and follow the instructions.

When you have configured Python for the notebooks, you are ready to deploy the BDC.

## Deployment

To deploy you can use the *Command Palette*, (as per above), and you enter *dep* in the textbox:

![](/images/posts/ads-install-bdc-install3.png)

**Figure 1:** *Command Palette Deploy SQL Server*

We see in *Figure 1* the command palette and how I entered *dep* in the text box, which then shows available commands. Among the commands we see *Deployment: Deploy SQL Server ...*, (outlined in red).

Before we go any further I just want to mention that we do not necessarily need to use the command palette to get to the *Deploy ...* command:

![](/images/posts/ads-install-bdc-install2.png)

**Figure 2:** *Deploy via Connections*

In *Figure 2* we see the *Deploy SQL Server ...* command, (outlined in red), as we saw in *Figure 1*. In this case, we got to the command by:

* Clicking on the first icon from the top, (outlined in yellow), in the activity bar. The activity bar is the leftmost panel in ADS.
* Click on the ellipsis, (outlined in blue), in the *CONNECTIONS* panel.

So, we get to the *Deploy* command either through the command palette or the *CONNECTIONS* panel.

To start the deployment process, we click on the *Deploy* command as we see in *Figure 1*/*Figure 2*:

![](/images/posts/ads-install-bdc-install4.png)

**Figure 3:** *Deployment Options*

We see in *Figure 3* how there are different SQL Server deployment options:

* SQL on Windows.
* SQL Container.
* SQL Server Big Data Cluster.

The default deployment option, as we see in *Figure 3*, is to deploy SQL Server as a container image. We also see that ADS checks whether we have the necessary tools installed for the deployment in question. In this case, I do not have `docker` installed, so there is an error.

Fortunately, I do not want to deploy a container but the SQL Server Big Data Cluster, so I click on the BDC option, (outlined in red):

![](/images/posts/ads-install-bdc-install6.png)

**Figure 4:** *BDC Deployment Options*

Clicking the BDC option we see something like in *Figure 4*: the *Select the deployment options* dialog. The dialog gives us the options for the BDC deployment:

* Version - at this stage only SQL Server 2019.
* Deployment target - where we want to deploy the BDC to. In *Figure 4* we see how I chose to deploy to a new Azure Kubernetes Service cluster.

We also see in *Figure 4* how ADS ensure that we have the required tools installed.




As we want to deploy to 

You choose *SQL Server big data cluster*, (outlined in blue), the version *SQL Server 2019 RC big data cluster*, (outlined in yellow), and the target to deploy to: *New Azure Kubernetes Service cluster*. When you click **Select** in the dialog, you see a new dialog:




So, above I said "you are ready to deploy ...". Well, that is not exactly true. Before you do the actual deployment you need to set settings for your cluster:

* Number of nodes.
* Size of disks.
* Number of pool instances.
* and more.

In the case when deploying to AKS, as we do here, you also need to set Azure related settings. 





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


[1]: {{< relref "2019-09-11-install-sql-server-2019-big-data-cluster-using-azure-data-studio.md" >}}
[2]: https://azure.microsoft.com/en-us/free/
[3]: https://chocolatey.org/packages/kubernetes-cli
[4]: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
[5]: https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-ver15
[6]: https://jupyter.org/
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