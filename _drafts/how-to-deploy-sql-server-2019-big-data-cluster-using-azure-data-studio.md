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

For you who follows my sporadic articles you wonder why I have yeat another post, (YAP), covering how to deploy a **SQL Server 2019 Big Data Cluster**, (BDC), using **Azure Data Studio**, (ADS).
 
The answer to that is that the version of BDC I deployed was a pre-release, and since then BDC has gone GA, (General Avalilability), and there are certain differences in ddeployment process between RC1, and RTM.

So in this post let us look at how to deploy BDC RTM to Azure Kubernetes Service using ADS.

<!--more-->

## Pre-Reqs

To deploy using **Azure Data Studio**, (ADS), you need ADS (duh - see below), but you also need some other things.

> **NOTE:** If you wonder where you have seen this pre-req section before, the answer is that it is almost identical to the pre-req section in my [previous install post].

#### Azure Subscription

As this post covers how to deploy a **SQL Server 2019 Big Data Cluster** to **Azure Kubernetes Service**, (AKS), you need an Azure subscription. If you do not have one you can sign up for a free trial subscription [here][6].

#### Python

Well, Python is not a tool as such, but you need Python installed on the machine you install from, as the ADS deployment runs some Python scrips. You need Python3, and on my machine, I have Python 3.7.3. Ensure that Python is on the `PATH`.

#### azdata

`azdata` is a Python command-line tool replacing `mssqlctl`. It enables cluster administrators to bootstrap and manages the big data cluster via REST APIs.

There are a couple of steps to install it:

* If you have `mssqlctl` installed you need to uninstall it:

```bash
$ pip3 uninstall -r https://private-repo.microsoft.com/ \
                           python/ctp3.1/mssqlctl/requirements.txt
```
**Code Snippet 1:** *Uninstall `mssqlctl`*

In *Code Snippet 1* above I have inserted a line continuation (`\`) to make the code fit the page.

* If you have deployed CTP 3.2, or any later CTP's of the BDC, (including RC1), then you need to uninstall corresponding version of `azdata`:

``` bash
pip3 uninstall -r https://azdatacli.blob.core.windows.net/ \
                  python/azdata/<version-indicator>/requirements.txt
```
**Code Snippet 2:** *Uninstall `azdata`*

In *Code Snippet 2* you see how the uninstall command indicates a version of `azdata` to uninstall via `version-indicator>`. The value of the `<version-indicator> is as follows:

* CTP 3.2: `2019-ctp3.2`.
* RC1: `2019-rc1`.



 takes the version of `azdata` to in `<version-indicatoruninstall: *`2019-ctp3.2`*. If you have the 3.2 version installed you need to confirm when you run the code in *Code Snippet 2* that you want to remove some installed components: 

![](/images/posts/inst-bdcrc1-uninst-azdata.png)

**Figure 1:** *Confirm Uninstall `azdata`*

Just click `y` when asked to proceed.

> **NOTE:** The biggest issue causing errors in a BDC deployment, by far, is using an older version of `azdata`. So please, do not be "that guy" (or girl) - make sure you uninstall `azdata` if you have an earlier version. In fact, before a deployment, always uninstall `azdata` followed by an install, (see below).

* You need the latest version of the Python `requests` package installed:

``` bash
$ pip3 install -U requests
```
**Code Snippet 3:** *Install/Upgrade `requests`*

* When you have executed the code in *Code Snippet 3* you can install `azdata`:

``` bash
$ pip3 install -r https://aka.ms/azdata
```
**Code Snippet 4:** *Installing `azdata`*

After executing the code in *Code Snippet 4* you can go ahead and install the other tools needed.

#### kubectl

The `kubectl` tool is a Kubernetes command-line tool, and it allows you to run commands against Kubernetes clusters. You can use `kubectl` to deploy applications, inspect and manage cluster resources, and view logs.

You can install `kubectl` in different ways, and I installed it from [Chocolatey][3]: `choco install kubernetes-cli`.

#### Azure CLI

The Azure CLI is Microsoft's cross-platform command-line experience for managing Azure resources, and you install it on your local machine. You find install links for Azure CLI [here][4].

## Azure Data Studio

Since this post is about installing and deploying a BDC using **Azure Data Studio**, you also need ADS. You may already have ADS installed, but to be able to install and deploy to the release candidate of BDC you need a specific install. If you have already installed ADS, this ADS version installs side-by-side with existing ADS installations.

The install link to the ADS RC version is [here][2].

#### SQL Server 2019 (Preview)

In addition to ADS, you also need the **SQL Server 2019 (Preview)** extension, which you install after installing ADS.

As opposed to other ADS extensions, you need to download the extension to your machine before you can install it. You download it from [here][5]. After download, you install it from the **File** menu, and the **Install Extension from VSIX Package** item:

![](/images/posts/inst-bdcrc1-inst-extension.png)

**Figure 2:** *Install Extension*

In *Figure 2* you see the **File** menu (outlined in blue), and the **Install Extension from VSIX Package** item outlined in red.

#### Azure Data Studio Notebooks

I mentioned above that you deploy the BDC using ADS deployment *Notebooks*. You may ask yourself what an **Azure Data Studio Notebook** is? Well, Notebooks come from the Data Science world where a Notebook can contain live code, equations, visualizations and narrative text. It is a tool for teaching or sharing information between people. A notebook makes it easy to link lots of docs and code together.

When Microsoft developed ADS, the embedded the [Jupyter][7] service in ADS, which enables ADS to run Notebooks. When you talk about Notebooks, you also talk about *Kernels*. A *Kernel* is the programming language you can write and execute code in, in the *Notebook*:

![](/images/posts/inst-bdcrc1-ads-notebook-kernels.png)

**Figure 3:** *Notebook Kernels*

The drop-down you see in *Figure 3* shows the *Kernels* ADS supports. When you deploy, you use the *Python 3* kernel.

If you have not used Python Notebooks before in ADS, you need to configure Python for use with Notebooks. You enter **Ctrl+Shift+P** to open the command palette, and you search for *Configure Python*:

![](/images/posts/inst-bdcrc1-ads-configure-notebooks.png)

**Figure 4:** *Configure Notebooks*

In *Figure 4* you see the command palette, and you choose *Configure Python for Notebooks*, and follow the instructions.

When you have configured Python for the notebooks, you are ready to deploy the BDC.



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



[1]:
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