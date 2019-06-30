---
type: post
layout: "post"
title: SQL Server 2019 Big Data Cluster via Minikube 
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server
  - Microsoft R Server
  - Microsoft Machine Learning Server
  - Data Science
  - SQL Server R Services
  - SQL Server Machine Learning Services 
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services 
  - R
  - Python
description: 
keywords:
  -   
---

At the [**Microsoft Ignite 2018**][1] conference back in September Microsoft released **SQL Server 2019** for public preview, and I wrote two short blog posts about it:

* [What is New in SQL Server 2019 Public Preview][2].
* [SQL Server 2019 for Linux in Docker on Windows][3].

What Microsoft also announced was **SQL Server 2019 Big Data Clusters**, which combines the SQL Server database engine, Spark, and HDFS into a unified data platform! Yes, you read that right: SQL Server, Spark, and Hadoop right out of the box. Seeing that both Spark and Hadoop are mainly Linux based, what makes the Big Data Cluster possible is **SQL Server on Linux**. When you deploy a **SQL Server 2019 Big Data Cluster**, you deploy it as containers on **Kubernetes**, where the Kubernetes cluster can be in the cloud, such as [**Azure Kubernetes Service**][5], or on-prem like [**Red Hat OpenShift**][6].

Ok, that sounds all good - but what if I want to test this out, or develop on an environment where I do not have direct access to a *Kubernetes* cluster?

So, that is what the rest of this blog post covers. How we can deploy **SQL Server 2019 Big Data Clusters** to our local dev-box/laptop, using **Minikube**.

<!--more-->

> **NOTE:** SQL Server 2019 is in public preview, but the preview does not contain the Big Data Cluster parts. To deploy **SQL Server 2019 Big Data Clusters** you need to be part of the SQL Server 2019 Early Adoption Program, for which you can sign up for [here][10]. 

## Minikube

So what is *Minikube*; from its [webpage][7]: *Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.*

That's cool, so if I install *Minikube*, I can "mimic" a *Kubernetes* cluster, and hopefully install a **SQL Server 2019 Big Data Cluster** into that "fake" *Kubernetes* cluster. 

#### Installation

Based on what OS you are on, you have options how to install *Minikube*, and this [page][8] gives a good explanation of those options and how to install it. Since I am a Windows guy, I install it from [Chocolatey.org][9]:

``` bash
choco install -y minikube
```
**Code Snippet 1:** *Install Minikube via Chocolatey*

When I execute the code in *Code Snippet 1*, I see something like so:

![](/images/posts/sql_2k19_bdc_install_minikube.png)

**Figure 1:** *Install Minikube Result*

In *Figure 1* we see how *Minikube* gets installed, but we also see how something named `kubernetes-cli` gets installed (outlined in red). 

#### kubectl

The `kubernetes-cli` (Kubernetes command line tool), gives you an executable `kubectl.exe` which you use to deploy and manage applications on Kubernetes. So you:

* Create a *Kubernetes* cluster with `minikube`.
* Use `kubectl` to deploy to that cluster, and manage the cluster.

#### Hypervisor

To use `minikube` and `kubectl` you need a hypervisor installed. The reason for this is that when you create the Kubernetes cluster, `minikube` also creates a VM. On Windows, you can either use *Hyper-V* or *VirtualBox*. In my case, since I am on Windows and also have **Docker** installed, I use *Hyper-V*.

> **NOTE:** The default hypervisor for Minikube is VirtualBox.

When you use Hyper-V, you should also set up an external network switch, as Minikube uses, by default, the first HyperV virtual network it finds, and that is most likely an internal one. If Minikube picks up the internal network, it cannot access the Internet from the VM it created to pull Docker images etc. So it is generally good practice to create an external switch.

#### Hyper-V External Switch

To set up an external switch for Hyper-V you use the **Hyper-V Manager**:

![](/images/posts/sql_2k19_bdc_hyperv_mngr.png)

**Figure 2:** *Hyper-V Manager*

In *Figure 2* we see the *Hyper-V* manager's UI. To create an external switch we click on the *Virtual Switch Manager* under the *Actions* tab to the right (outlined in red). That gives us a dialog like so:

![](/images/posts/sql_2k19_bdc_hyperv_virt_switch1.png)

**Figure 3:** *Virtual Switch Manager*

We see in *Figure 3*, how we want to:

* Create a new virtual switch (outlined in red).
* We want the switch to be external (outlined in yellow)

When we click the *Crete Virtual Switch* button (outlined in blue), the *Virtual Switch Manager* changes to so:

![](/images/posts/sql_2k19_bdc_hyperv_virt_switch2.png)

**Figure 4:** *Create New External Switch*

I can now create my new switch, and in *Figure 4* we see how I:

* Give it a name (outlined in blue).
* How I say it should be an external network switch and which network controller to bind the switch to (outlined in red).

After having clicked *OK* I am now ready to create a cluster.

## Create Cluster

So the above deals with the "pre-reqs", now let us go ahead and create a *Kubernetes* cluster onto which we can deploy the **SQL Server 2019 Big Data Cluster**. To create the cluster, we use Minikube's `start` command, which creates a VM for the Kubernetes cluster (if one does not exist) and the cluster itself.

Theoretically, we can just call `minikube start`, but when I do that on my machine I get an error:

![](/images/posts/sql_2k19_bdc_minikube_start_error.png)

**Figure 5:** *Minikube Start Error*

Remember how I above said that the default hypervisor for Minikube is VirtualBox, and by not defining a hypervisor in the `minikube start` command, that is what Minikube tries to use. Therefore the error outlined in *Figure 5*. 

Fortunately, the `start` command takes a parameter to indicate which hypervisor to use: `--vm-driver`:

```bash
minikube start --vm-driver="hyperv"
```
**Code Snippet 2:** *Minikube Start with Hypervisor

In *Code Snippet 2* above we see how I indicate that Minikube should use the *Hyper-V* hypervisor. If I were to execute the code in *Code Snippet 2*, I get a VM with a Kubernetes cluster, but the VM is created with default settings (memory, hard disk size, etc.). For what we want to do (set up a Kubernetes cluster to deploy a **SQL Server 2019 Big Data Cluster** to), the default settings are not good enough. Remember, we do not "only" deploy a SQL Server instance, but Spark, HDFS, Elastic Search, Kibana and so forth (we are not in Kansas anymore), and all this requires resources. It is recommended that for a Minikube deployment, the host machine should have at least 32 Gb of memory, and the VM should be allocated a minimum of 24Gb, with a hard disk space if at least 100Gb.

Sure, we can create the VM as in *Code Snippet 2*, and then change settings through the Hyper-V manager, but why not do most of it in one go:

```bash
minikube start --vm-driver="hyperv" \ 
               --cpus 4 \
               --memory 16384 \
               --disk-size 100g \
               --hyperv-virtual-switch "minikube"
```
**Code Snippet 3:** *Minikube Start with VM Settings*

What we see in *Code Snippet 3* is how we "spin up" a Minikube VM with settings for:

* What hypervisor to use: `--vm-driver`.
* Number of CPU's: `--cpus`.
* Memory allocated: `--memory`.
* Hard disk size: `--disk-size 100g`.
* Virtual switch: `--hyperv-virtual-switch`.

You may wonder why I only allocate 16Gb memory to the VM, when I above say that the recommendation is at least 24Gb? I do it because my dev-box only has 24Gb of ram (note to self - get more memory).

Since I so not have "oodles" of memory I make sure to shut down all running VM's, and then I execute the code in *Code Snippet 3*. Creating the VM and setting up the cluster takes a couple of minutes, and when it's done it looks like so:

```bash
PS C:\Windows\system32> minikube start --vm-driver="hyperv" \
                           --cpus 4 \
                           --memory 16384 \
                           --disk-size 100g \
                           --hyperv-virtual-switch "minikube"

Starting local Kubernetes v1.10.0 cluster...
Starting VM...
Getting VM IP address...
Moving files into cluster...
Setting up certs...
Connecting to cluster...
Setting up kubeconfig...
Starting cluster components...
Kubectl is now configured to use the cluster.
Loading cached images from config file.
PS C:\Windows\system32>
```
**Code Snippet 4:** *Creating VM and Kubernetes Cluster*

So no error this time, and from what we see in *Code Snippet 4* it looks like the Kubernetes cluster is up and running. To confirm that all is OK we run `kubectl cluster-info`, which gives us information about what IP address the Kubernetes master runs on together with where CoreDNS is.

> **NOTE:** CoreDNS is a lightweight, extensible DNS server that serves as the Kubernetes cluster DNS.

Above I mentioned how Minikube creates a VM for the cluster, so let us open up Hyper-V manager:

![](/images/posts/sql_2k19_bdc_hyperv_minikube.png)

**Figure 6:** *Minikube VM*

In *Figure 6* we see the various VM's I have on my box, and amongst them, we see the VM that Minikube created: `minikube` (outlined in red). We also see that the VM is running and all the others are stopped. However, look at the memory allocation (highlighted in yellow): 3.3Gb! In *Code Snippet 4* I definitely allocated 16Gb, what is this? 

It turns out that when Minikube creates a VM, it creates with with dynamic memory enabled, and on my box it spans between 512MB up to 1048Gb (that's a lot). It is probably not a good idea to have dynamic memory enabled, so let us change that. While we change settings, let us also change checkpoints setting. It is enabled by default, and for performance reasons we want it disabled. 

To change the settings we need to shut down the VM. We do it either from the Hyper-V manager, or from command line: `minikube stop`. However, on Windows there is a bug in Minikube whereby you cannot stop it in said ways, so you need from command line do:

```bash
# first do this
minikube ssh

# followed by
$ sudo poweroff
```
**Code Snippet 5:** *Shutting down Minikube*

In *Code Snippet 5* we see how we first ssh into the VM with `minikube ssh`, and when we are in the VM we shut down with: `sudo poweroff`.

When the VM has shut down we can now change settings:

![](/images/posts/sql_2k19_bdc_minikube_settings.png)

**Figure 7:** *Change Minikube Settings*

We see in *Figure 7* the *Settings* dialog for the Minikube VM, and the highlighted parts are settings we need to change.

**Memory:**

As mentioned above we need to disable the dynamic memory:

![](/images/posts/sql_2k19_bdc_minikube_memory.png)

**Figure 8:** *Minikube Memory*

We see the in *Figure 8* how I have un-checked the highlighted (yellow) *Enable Dynamic Memory* check-box.

**Checkpoints**

I then disable checkpoints on the VM:

![](/images/posts/sql_2k19_bdc_minikube_checkpoints.png)

**Figure 9:** *Minikube Checkpoints*

In *Figure 9* we see how I have un-checked the *Enable checkpoints* check box.

After the above changes I start up the VM and the cluster again, calling `minikube start`:

![](/images/posts/sql_2k19_bdc_minikube_restart.png)

**Figure 10:** *Minikube Checkpoints*

As we see in *Figure 10*, the cluster is back up. Before we start to deploy the **SQL Server 2019 Big Data Cluster**, let us see how we can monitor what happens in a Kubernetes cluster.

#### Dashboard & Namespaces

Kubernetes has a Web UI (Dashboard), which provides information on the state of Kubernetes resources in your cluster, and on any errors that may have occurred. You use Dashboard to get an overview of applications running on your cluster, as well as for creating or modifying individual Kubernetes resources (such as Deployments, Jobs, DaemonSets, etc).

To load Dashboard in a Minikube environment you execute from commandline (Powershell): `minikube dashboard`:

![](/images/posts/sql_2k19_bdc_minikube_dashboard.png)

**Figure 11:** *Minikube Dashboard*

In *Figure 11* we see the dashboard right after I created the VM and the Kubernetes cluster. Notice what is outlined in red: *namespaces*. *Namespcaces* help different projects, teams, or customers to share a Kubernetes cluster, and when you deploy to Kubernetes you deploy into a namespace. To see what *namespaces* exist in a cluster you execute: `kubectl get namespaces`. When I do it at this stage I see:

![](/images/posts/sql_2k19_bdc_kubectl_namespaces.png)

**Figure 12:** *Kubernetes Namespaces*

When we look at *Figure 12* we see following *namespaces*:

* `default`: A default, (duh), namespace to hold the default set of Pods, Services, and Deployments used by the cluster.
* `kube-public`: A namespace readable by everyone for public [ConfigMap's][14].
* `kube-system`: A namespace for objects created by the Kubernetes system.

So, coming back to Dashboard: when we want to monitor a deployment with Dashboard, we monitor a specific namespace. Enough of this, let us deploy!

## Deploy SQL Server 2019 Big Data Cluster

If you, like me, is a SQL Server guy, you are probably quite familiar with installing SQL Server instances by mounting an ISO file, and running setup. Well, forget all that when you deploy a **SQL Server 2019 Big Data Cluster**. The setup is all done via Python utilities and various Docker images pulled from a private repository.

#### Python & Deployment CLI

Above I mentioned Python, and the deployment requires Python3. I have Python 3.5 on my box, and according to Microsoft version 3.7 also works. As I mentioned above, you install using a Python utility: `mssqlctl`, and you must have Python's package management system `pip` installed to download `mssqlctl` utility. The utility uses Python's HTTP library *Requests*, which you need to install if you do not already have it:

```python
python -m pip install requests
``` 
**Code Snippet 6:** *Installing Python Requests*

The code in *Code Snippet 6* installs the `requests` package in `<python_path>\lib\site-packages`, unless it is already available. What is left to do before we deploy is to download and install `mssqlctl`:

```bash
pip3 install \
   --index-url https://private-repo.microsoft.com/python/ctp-2.0 \
     mssqlctl
```
**Code Snippet 7:** *Download and Install mssqlctl*

We download and install `mssqlctl` from a Microsoft repository as we see in *Code Snippet 7*. After download the source is located in `<python_path>\lib\site-packages` and the executable - `mssqlctl.exe` - is at: `<python_path>\Scripts`.

When you deploy the **SQL Server 2019 Big Data Cluster** using `mssqlctl` you customize the cluster configuration via environment variables read by `mssqlctl`. To see all available environment variables you go [here][11]. Below I list the ones I use:

* SET ACCEPT_EULA=Y - to accept the SQL Server license agreement.
* SET CLUSTER_PLATFORM=minikube - the Kubernetes platform you deploy to: Azure - `aks`, Kubernetes - `kubernetes`, Minikube - `minikube`.
* SET CLUSTER_COMPUTE_POOL_REPLICAS=1 - number of compute pool replicas to build.
* SET CLUSTER_STORAGE_POOL_REPLICAS=1 - number of storage pool replicas to build. Default is 2, but since I am using Minikube I set it to 1 to save on resources.
* SET CLUSTER_DATA_POOL_REPLICAS=1 - number of data pool replicas to build. Default is 2, but since I am using Minikube I set it to 1 to save on resources.
* SET USE_PERSISTENT_VOLUME=false - whether to use persistent volumes or not. Go [here][13] for more information. Since I am on Minikube it does not make much sense to use a persistent volume.
* SET CONTROLLER_USERNAME=controlleruser - the user name for the cluster administrator. You can set this to anything.
* SET CONTROLLER_PASSWORD=<some_secret_password> - the password for the cluster administrator. 
* SET KNOX_PASSWORD=<some_secret_password> - the password for the Knox user. [Knox][12] is an application gateway for interacting with the REST API's and UI's of Apache Hadoop deployments.
* SET MSSQL_SA_PASSWORD=<some_secret_password> - the `sa` password for the master SQL instance. It needs to meet password complexity requirements.
* SET DOCKER_REGISTRY=private-repo.microsoft.com - the registry for the images being pulled.
* SET DOCKER_REPOSITORY=mssql-private-preview - the repository within the registry.
* SET DOCKER_USERNAME=<docker_username> - user name to access the images. You get this when you sign up for the [EAP][10].
* SET DOCKER_PASSWORD=<some_secret_password> - the password for the above user. You get this when you sign up for the [EAP][10].
* SET DOCKER_EMAIL=<email_for_the_docker_user> - the email associated with the registry. You get this when you sign up for the [EAP][10].
* SET DOCKER_PRIVATE_REGISTRY=1 - this has to be set to 1.

Before you deploy the environment variables need to be set, and if you are on Windows, you need to do it from a command prompt (not Powershell). Instead of having to enter these variables individually, I have a `bat` file I run before deploying: `set_env_variables.bat`. After I have set the variables I create the cluster with the `mssqlctl` command, and I do it from command prompt (not Powershell):

```bash
mssqlctl create cluster sqlbigdata1
```
**Code Snippet 8:** *Create Big Data Cluster*

Looking at *Code Snippet 8* we see how I call `mssqlctl` to create a **SQL Server 2019 Big Data Cluster**, and to do it in a namespace called `sqlbigdata1`. When I execute the code I see something like so:

![](/images/posts/sql_2k19_bdc_create_cluster.png)

**Figure 13:** *Create Big Data Cluster*

What we see in *Figure 13* is how we have started to create the main controller and its pod. We also see a note (outlined in red) saying that it can take quite a while to create the cluster. That is definitely an understatement - on my box it takes over 2 hours to create the cluster. To monitor the process you can use Dashboard:

![](/images/posts/sql_2k19_bdc_minikube_dashboard2.png)

**Figure 14:** *Create Big Data Cluster*

In *Figure 14* we see workload statuses for the `sqlbigdata1` namespace, In addition to Dashboard you can use `kubectl` commands, for example: `kubectl get pods -n sqlbigdata1`:

![](/images/posts/sql_2k19_bdc_kubectl1.png)

**Figure 15:** *Create Big Data Cluster*









2018-11-01 04:10:07.0037 UTC | INFO | Creating cluster with name: sqlbigdata1
Exception in thread Thread-1:
Traceback (most recent call last):
  File "c:\users\niels\appdata\local\programs\python\python35\lib\threading.py", line 923, in _bootstrap_inner
    self.run()
  File "c:\users\niels\appdata\local\programs\python\python35\lib\threading.py", line 871, in run
    self._target(*self._args, **self._kwargs)
  File "c:\users\niels\appdata\local\programs\python\python35\lib\site-packages\mssqlctl\__init__.py", line 260, in getControllerLogs
    for line in log.splitlines():
AttributeError: 'list' object has no attribute 'splitlines'


2018-11-01 09:03:16.0490 UTC | ERROR | ('ebcf170b-6b7f-43e2-9790-cceba60962f7', "Failed to get state for cluster 'sqlbigdata1'")
2018-11-01 09:03:16.0491 UTC | ERROR | Failed to get cluster status after 120 minutes. Exiting...
Traceback (most recent call last):
  File "c:\users\niels\appdata\local\programs\python\python35\lib\runpy.py", line 170, in _run_module_as_main
    "__main__", mod_spec)
  File "c:\users\niels\appdata\local\programs\python\python35\lib\runpy.py", line 85, in _run_code
    exec(code, run_globals)
  File "C:\Users\niels\AppData\Local\Programs\Python\Python35\Scripts\mssqlctl.exe\__main__.py", line 9, in <module>
  File "c:\users\niels\appdata\local\programs\python\python35\lib\site-packages\mssqlctl\__init__.py", line 1249, in main
    createCluster(args.name)
  File "c:\users\niels\appdata\local\programs\python\python35\lib\site-packages\mssqlctl\__init__.py", line 868, in createCluster
    raise Exception("Cluster is not ready after %d minutes." % (retryMinutes))
Exception: Cluster is not ready after 120 minutes.



PS C:\Windows\system32> kubectl get pods -n sqlbigdata1
Unable to connect to the server: http2: server sent GOAWAY and closed the connection; LastStreamID=11, ErrCode=NO_ERROR, debug=""
PS C:\Windows\system32> kubectl get pods -n sqlbigdata1
Unable to connect to the server: dial tcp 10.0.0.19:8443: connectex: No connection could be made because the target machine actively refused it.



2018-11-02 04:11:54.0841 UTC [INFO    ] Creating cluster with name: sqlbigdata1 
2018-11-02 04:15:18.0433 UTC [ERROR   ] [RequestId 1c2f2745-f266-407c-96a5-31136c0245f5] Failed to create cluster with status code [500]
2018-11-02 04:15:18.0434 UTC [ERROR   ] [RequestId 1c2f2745-f266-407c-96a5-31136c0245f5] Reason: Internal error occurred while firing create event for cluster 'sqlbigdata1'




2018-11-02 05:28:43.0999 UTC | DEBUG | Starting new HTTPS connection (1): 192.168.99.100:30080
2018-11-02 05:29:05.0574 UTC | DEBUG | https://192.168.99.100:30080 "GET /clusters/sqlbigdata1/log?offset=87 HTTP/1.1" 200 0
2018-11-02 05:29:10.0577 UTC | DEBUG | Starting new HTTPS connection (1): 192.168.99.100:30080
2018-11-02 05:30:40.0132 UTC | DEBUG | https://192.168.99.100:30080 "POST /clusters HTTP/1.1" 500 99
Failed to create cluster
2018-11-02 05:30:40.0133 UTC | ERROR | [RequestId 0a6b4897-9235-4979-9276-8f5e593b5032] Failed to create cluster with status code [500]
2018-11-02 05:30:40.0134 UTC | ERROR | [RequestId 0a6b4897-9235-4979-9276-8f5e593b5032] Reason: Internal error occurred while firing create event for cluster 'sqlbigdata1'

We will keep working on simplifying the installation experience.  Keep in mind though that you are not installing a single feature on a single server.  You are deploying an entire cluster of an Always On Availability Group SQL Server instance for the master (coming soon), a cluster of n number of SQL Server instances for compute pool, a cluster of n number of SQL Server instances for data pool, a storage pool with n number of Spark, SQL Server instances + HDFS, HDFS name node with HA, Spark driver, Elastic Search, InfluxDB, agents on every pod and every Kubernetes node, an admin portal, a controller service with API, a controller SQL Server instance, YARN UI, Spark UI, Kibana, Granfana, etc, etc. and it's all integrated and wired up automatically when everything is done running.  If you step back and think of it that way, it's actually pretty amazing that it can be deployed with a single command. :)












* What hypervisor to use for the VM.
* How many CPU's the VM should have.
* The hard-disk size for the VM.
* The amount of memory for the VM. 
* Which network switch to use.





However, before we create the Minikube cluster, you should have a look at 









sql_2k19_bdc_install_minikube.png


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



[1]: https://www.microsoft.com/en-us/ignite/agenda
[2]: https://cloudblogs.microsoft.com/sqlserver/2018/09/25/introducing-microsoft-sql-server-2019-big-data-clusters/
[3]: {{< relref "2018-09-24-sql-server-2019-public-preview.md" >}}
[4]: {{< relref "sql-server-2019-for-linux-in-docker-on-windows.md" >}}
[5]: https://azure.microsoft.com/en-us/services/kubernetes-service/
[6]: https://www.openshift.com/learn/topics/kubernetes/
[7]: https://kubernetes.io/docs/setup/minikube/
[8]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[9]: https://chocolatey.org/search?q=minikube
[10]: https://sqlservervnexteap.azurewebsites.net/
[11]: https://docs.microsoft.com/en-us/sql/big-data-cluster/deployment-guidance?view=sqlallproducts-allversions
[12]: https://knox.apache.org/
[13]: https://docs.microsoft.com/en-us/sql/big-data-cluster/concept-data-persistence?view=sqlallproducts-allversions
[14]: https://unofficial-kubernetes.readthedocs.io/en/latest/tasks/configure-pod-container/configmap/
[15]:   

<!--
[series1]: <> [SQL Server R Services](/series/sql_server_2k16_r_services)
[series2]: <> [Install R Packages in SQL Server ML Services](/series/sql_server_ml_services_install_packages)
[series3]: <> [sp_execute_external_script and SQL Server Compute Context](/series/spees_and_sql_compute_context)
-->

<!--
[findstr]: <> findstr /I \<word_to_find\> *
-->