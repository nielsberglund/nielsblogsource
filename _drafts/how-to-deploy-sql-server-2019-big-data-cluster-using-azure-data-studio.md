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

Code in Notebooks exists in cells, and to run the code you execute the cell. 

If you have not used Python Notebooks before in ADS, you need to configure Python for use with Notebooks. You enter **Ctrl+Shift+P** to open the command palette, and you search for *Configure Python*:

![](/images/posts/inst-bdcrc1-ads-configure-notebooks.png)

**Figure 3:** *Configure Notebooks*

In *Figure 3* you see the command palette, and you choose *Configure Python for Notebooks*, and follow the instructions.

When you have configured Python for the notebooks, you are ready to deploy the BDC.

## Azure Data Studio Deployment Wizard

When you use ADS to to a deployment you use a deployment wizard who guides you through the steps necessary for the deployment. To start up the wizard you can use the *Command Palette*, (as per above), and you enter *dep* in the textbox:

![](/images/posts/ads-install-bdc-install3.png)

**Figure 1:** *Command Palette Deploy SQL Server*

We see in *Figure 1* the command palette and how I entered *dep* in the text box, which then shows available commands. Among the commands we see *Deployment: Deploy SQL Server ...*, (outlined in red).

Before we go any further I want to mention that we do not necessarily need to use the command palette to get to the *Deploy ...* command:

![](/images/posts/ads-install-bdc-install2.png)

**Figure 2:** *Deploy via Connections*

In *Figure 2* we see the *Deploy SQL Server ...* command, (outlined in red), as we saw in *Figure 1*. In this case, we got to the command by:

* Clicking on the first icon from the top, (outlined in yellow), in the activity bar. The activity bar is the leftmost panel in ADS.
* Click on the ellipsis, (outlined in blue), in the *CONNECTIONS* panel.

So, we get to the *Deploy* command either through the command palette or the *CONNECTIONS* panel.

To start the deployment wizard, we click on the *Deploy* command as we see in *Figure 1*/*Figure 2*:

![](/images/posts/ads-install-bdc-install4.png)

**Figure 3:** *Deployment Options*

We see in *Figure 3* how the deployment wizard supports different SQL Server deployment options:

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

When deploying a BDC to AKS we have to do some configuration before the actual deployment can happen, and the configuration consists of five steps:

* Configuration template / profile.
* Azure settings.
* BDC and Docker settings.
* Service settings.
* Summary of settings.

#### Configuration Template

After we have chosen the SQL Server version and deployment target in *Figure 4* we click **Select** and we get the dialog for the configuration template:

![](/images/posts/ads-install-bdc-install7.png)

**Figure 5:** *Configuration Template*

The dialog we see in *Figure 5* allows us to choose a deployment profile. The profile defines things like how many instances we want of the various BDC components and storage requirements. These settings can be changed later during the deployment process.

I chose the `aks-dev-test` profile with default values, 

#### Azure Settings

Going on from the configuration template we see:

![](/images/posts/ads-install-bdc-install8.png)

**Figure 6:** *Azure Settings*

As we see in *Figure 6*, we now are at the settings for the Azure Kubernetes Service cluster.

All of the settings are relatively self-explanatory, and if you are unsure about any of the settings, you can refer back to my [previous post][1] about deploying a BDC via ADS.

It is worth noting that I have changed the *VM size*, and *VM count* from its default of `Standard_E4s_v3`, and `5` to `Standard_B8ms` and `3`. Reason for this is that having fewer nodes cuts down on install time. 

The thing to bear in mind here is that a BDC deployment requires at a minimum around 24 hard disks altogether in your cluster, and each VM has a set number of disks. In my case, each `Standard_B8ms` VM has 16 disks so I should be good (3 * 16).

#### Cluster Settings

Moving on from from Azure settings:

![](/images/posts/ads-install-bdc-install9.png)

**Figure 7:** *BDC Settings*

The dialog we see in *Figure 7* is for configuring settings for the SQL Server BDC. As we see, there are two sections: 

* Cluster settings.
* Docker settings.

When I set up a BDC, I do not use the default value for cluster name, and as you see in the figure I named the cluster: `sqlbdc-cluster`. Make sure you remember the password as you need it later.

At the moment, the only authentication mode supported is *Basic*, so we do not need to do anything there.

For the Docker settings, I go with the default values, and no user-name or password is required.

#### Service Settings

Having done the cluster settings we are now almost finished, and we get to settings for the various BDC services:

![](/images/posts/ads-install-bdc-install10.png)

**Figure 8:** *Service Settings*

In service settings, as we see in *Figure 8*, we define how many instances of various services we want, endpoints for services, and also settings for storage.

When I deploy a BDC, I do not change any of these settings.

#### Settings Summary

We go on from the service settings:

![](/images/posts/ads-install-bdc-install11.png)

**Figure 9:** *Settings Summary*

The last step is not so much of a step where we do things, but - as we see in *Figure 9* - it is a summary of the settings we have defined in the previous steps.

In this final step, (before actual deployment), we can: 

* Save the settings from previous steps to config files.
* Go back and change settings.
* Cancel out.
* Script the settings to a notebook

The last option in the list above is what we choose when we deploy.

## Deployment Notebook

When we click on **Script to Notebook** a Notebook opens:

![](/images/posts/ads-install-bdc-install12.png)

**Figure 10:** *Deploy Notebook*

We see in *Figure 10* the notebook that has been scripted for us based on the settings we defined in the steps above. Since we said we wanted to deploy to a new Azure Kubernetes Service Cluster the Notebook creates a new AKS cluster for us together with deploying the BDC.

When you scroll through the notebook, you see the various stages of the deployment and what it does in each stage:

* Check dependencies.
* Required information.
* Azure settings.
* Default settings.
* Login to Azure.
* Set active Azure subscription.
* Create Azure resource group.
* Create AKS cluster.
* Set the new AKS cluster as current context.
* Create a deployment configuration file.
* Create SQL Server 2019 big data cluster.
* Login to SQL Server 2019 big data cluster.
* Show SQL Server 2019 big data cluster endpoints.
* Connect to master SQL Server instance in Azure Data Studio.

An example of the Notebook is below:

![](/images/posts/ads-install-bdc-install13.png)

**Figure 11:** *Notebook Cells*

In *Figure 11* we see some cells with code, and above the cells describing text.

To do the deployment, you can now either run each cell independently by clicking on the cell and hit F5 or click on the **Run Cells** command at the top of the notebook, (outlined in red in *Figure 10*). In either case, you see what command the cell executes as well as the result:

![](/images/posts/inst-bdcrc1-cell-output.png)

**Figure 12:** *Cell Output*

What you see in *Figure 12* is the output from creating the Azure resource group.

Be aware that the deployment takes a while, and especially the stage *Create SQL Server 2019 big data cluster*. Unfortunatley the Notebook does not give you much information where you are in the deployment, but you can use `kubectl` from the command line to get some feel for where you are in the process:

![](/images/posts/ads-install-bdc-install16-get-pods.png)

**Figure 13:** *Get Pods - I*

We see in *Figure 13* how I have executed `kubectl get pods -n sqlbdc-cluster` early in the deployment process. 

> **NOTE:** For the `-n` flag in the command I use the name of the BDC cluster I assigned in step 3, (*Cluster Settings*), above.

We see that the deployment is busy deploying two controller service, (see below), related pods. If I run the same command a bit later I see:

![](/images/posts/ads-install-bdc-install16-get-pods2.png)

**Figure 14:** *Get Pods - II*

Now we see in *Figure 14* how more pods are deployed, and some of them are also in a running state, amongst them the control pods. As the control pods is in a running state, the controller service should now be up and running.

#### Controller Service

The controller service is, as the name implies, what controls the BDC, and it is the controller service which interacts with the Kubernetes cluster. When deploying a BDC the controller service is always deployed first so it can co-ordinate dployments with the Kubernetes service.

The controller service exposes an endpoint with which we can monitor the BDC. While the deployment is in process we can get to the IP address for the endpoint via a `kubectl` command:

``` bash
kubectl get svc -n sqlbdc-cluster
```
**Code Snippet 6:** *Retrieve Endpoints*

In *Code Snippet 6* we see how I call `kubectl get svc` with the name of the BDC cluster. The command lists all services in the specified namespace, (the `-n` flag), together with information about the services. Part of the information is the exposed IP address, (if any), of the service.

When I run the code in *Code Snippet 6* I see the following:

![](/images/posts/ads-install-bdc-install16-get-pods2.png)

**Figure 15:** *Services*

We see in *Figure 15* the controller service and its external IP adress, (outlined in red). With this in hand we can now use ADS to connect to the controller:

![](/images/posts/ads-install-bdc-controller1.png)

**Figure 16:** *Add Big Data Cluster Controller*

To add a BDC controller we expand the *SQL SERVER BIG DATA CLUSTERS* panel in ADS as we see in *Figure 16*, and click on the `+` sign. That gives us a connection dialog:

![](/images/posts/ads-install-bdc-add-controller.png)

**Figure 17:** *Connect to BDC Controller*

In the connection dialog we see in *Figure 17* we fill in the IP adress and port we retrieved when we executed *Code Snippet 6*. The user name and password are the ones we defined in *Cluster Settings*, (*Figure 7*).





Seeing that the control pods are in a running state, we can use the controller endpoint to monitor the deployment process:



.






Eventually, the deployment finishes, and you get an output from the cell *Create SQL Server 2019 Big Data Cluster*:

![](/images/posts/ads-install-bdc-install17-finished.png)

**Figure 15:** *Deployment Finished*

In *Figure 15* we see the output after a successful deployment.



















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