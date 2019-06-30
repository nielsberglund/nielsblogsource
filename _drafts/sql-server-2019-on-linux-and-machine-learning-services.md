---
type: post
layout: "post"
title: "SQL Server 2019 on Linux and Machine Learning Services"
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

The last year, year and a half, I have been busy writing posts about **SQL Server Machine Learning Services** (the ability to execute R and Python code from inside SQL Server):

* [**SQL Server Machine Learning Services**](/series/sql_server_2k16_r_services)
* [**Install R Packages in SQL Server ML Services**](/series/sql_server_ml_services_install_packages)
* [**sp_execute_external_script and SQL Server Compute Context**](/series/spees_and_sql_compute_context)

Apart from the three "series" above, I also have other individual posts about SQL Server Machine Learning Services. The common theme between all the posts is that they cover *SQL Server on Windows*, as the first version, (2017), of *SQL Server on Linux* did not have support for Machine Learning Services.

> **NOTE:** Microsoft introduced SQL Server Machine Learning Services in SQL Server 2016 with R only. In SQL Server 2017, Microsoft added the ability to execute Python code as well. However, as I said above, this was only for *SQL Server on Windows*.

The support for Machine Learning Services in *SQL Server on Linux* changed with **SQL Server 2019 on Linux**, as Microsoft announced at their **Ignite** conference how *SQL Server on Linux* now has support for Machine Learning Services!

So, in this post, I take a look at how Machine Learning Services work with *SQL Server 2019 on Linux*. This post is not in-depth, I leave that for future posts.

<!--more-->

## Environment

*SQL Server on Linux* sounds really cool, but - where do I run it as *SQL Server 2019 on Linux* comes in different flavours:

* Red Hat
* SUSE
* Ubuntu
* Docker

Since I am a Windows guy, and I do not have a Linux box or Linux VM lying around I am thrilled to see that I can get *SQL Server 2019 on Linux* as a Docker image. I install [Docker for Windows][1], and then I grab the image and install it. If you want a more detailed description of what I did, see [SQL Server 2019 for Linux in Docker on Windows][2].

## Azure Data Studio

Before we get into the "nitty gritty" about the ins-and-outs of the *SQL Server 2019 on Linux Machine Learning Services*, I just want to mention what I use to interact with SQL Server: **Azure Data Studio** (*ADS*). Microsoft announced *Azure Data Studio* at Ignite as so: 

*Azure Data Studio is a new cross-platform desktop environment for data professionals using the family of on-premises and cloud data platforms on Windows, MacOS, and Linux. Previously released under the preview name SQL Operations Studio, Azure Data Studio offers a modern editor experience with lightning fast IntelliSense, code snippets, source control integration, and an integrated terminal. It is engineered with the data platform user in mind, with built-in charting of query resultsets and customizable dashboards.*

It is an evolution of the "old" *SQL Operations Studio* (what an awful name - SOS), and to me, it has some interesting functionality:

* Cross platform.
* Supports SQL Server Big Data Cluster.
* Charting of resultsets.
* Support for Notebooks (right now Python, T-SQL in a later release).
* Integrated terminal.

![](/images/posts/sql_2k19Docker_azure_data_studio.png)

**Figure 1:** *Azure Data Studio and Integrated Terminal*

What we see in *Figure 1* is *ADS* with visualised resultsets, some dashboards and - outlined in red - the integrated terminal. Now, let us get down to business.

## SQL Server 2019 on Linux

To start with, let us check that our new SQL Server works, e.g. that we can execute some statements. What I do is I start up *ADS*, connect to my SQL Server and executes in a new query file: `SELECT * FROM sys.databases`:

![](/images/posts/sql_2k19lnxml1_result.png)

**Figure 2:** *Query Result in ADS*

As we see in *Figure 2*, it seems to work.  

OK, now let us see if we can use machine learning. We know that in **SQL Server 2017 Machine Learning Services** `sp_execute_external_script` (*SPEES*) is the entry point to the external engine (R or Python). So let us execute a simple *SPEES* call:

``` sql
EXECUTE sp_execute_external_script @language = N'Python',
                                   @script = N'print(42)'
```                                   
**Code Snippet 1:** *Execute SPEES*

In *Code Snippet 1* we see how we try to execute a call against Python, which, if it succeeded, would print out `42` in the *Messages* tab. However, we get the following error:

``` sql
Msg 39023, Level 16, State 1, Procedure sp_execute_external_script, 
Line 1 'sp_execute_external_script' is disabled on this instance 
of SQL Server. Use sp_configure 'external scripts enabled' 
to enable it.
```
**Code Snippet 2:** *Exception*

Ouch, so it seems that the setting `external scripts enabled` is not enabled. We should have realised that, since when we install R and Python id SQL Server 2016, and 2017 we have to enable external scripts explicitly.  Ok, so let us enable it:


``` sql
EXEC sp_configure 'external scripts enabled', 1
RECONFIGURE WITH OVERRIDE
```
**Code Snippet 3:** *Enable External Script*

After we have executed *Code Snippet 3* we need to restart the SQL Server instance. However, since we run in a Docker container, we do not restart the SQL Server instance as such, but we restart the container:

```bash
# stop the container
docker stop <containername>

# start the container
docker start sql2k19_1
```
**Code Snippet 4:** *Stop and Start the Container*

We use the commands `docker stop` and `docker start` to stop and start the container as we see in *Code Snippet 4*. After we have started the container again, we execute `EXEC sp_configure 'external scripts enabled'` to check if the change has succeeded:

![](/images/posts/sql_2k19lnxml1_script_enabled.png)

**Figure 3:** *External Scripts Enabled*

In *Figure 3* we see how the `run_value` column is now set to `1`, which indicates that external scripts are enabled. So, all should now be good, and we can execute the code in *Code Snippet 1* again:

``` sql
Msg 39111, Level 16, State 1, Procedure sp_execute_external_script,
Line 1 The SQL Server Machine Learning Services End-User License 
Agreement (EULA) has not been accepted.
```
**Code Snippet 5:** *EULA Exception*

Hmm, so now, as we see in *Code Snippet 5*, how we get an error that we have not accepted the *EULA*. That makes sort of sense. If you ever have installed In-Database analytics on a SQL Server on Windows instance, you may remember how you have to accept *EULA*'s for both Python and R. 

The question is how do I accept the *EULA*here in *SQL Server on Linux*? In Windows, as I mentioned above, I would have done it at the time I installed SQL Server, or - if I installed In-Database analytics afterwards - I would have mounted the install media and accepted the *EULA* at that time. 

But wait a second, in the previous paragraphs I have mentioned installation a couple of times. Would we need to do some installation of In-Database analytics on *SQL Server 2019 on Linux* in addition to accept the *EULA*? Maybe we can ["spelunk"][3] around a bit in the container's file system and see what we can find out.

First, from an In-Database analytics installation on SQL Server on Windows we know:

* There is a launchpad service.
* There are launchers for R and Python (`rlauncher` and `pythonlauncher`).
* There are a packages for R and Python with name like `RevoScalexxx`.

So, let us open a bash shell in the container and start looking around: `docker exec -it <containername> /bin/bash`. I do this from the integrated terminal in *ADS*, but the "normal" *Powershell* shell works as well:

![](/images/posts/sql_2k19lnxml1_bash.png)

**Figure 4:** *Bash Shell in Docker*

When I am in the shell in the container, I can start looking for some of the files listed above. I start with looking for launcher related files: `find / -type f -iname "*launch*"`:

![](/images/posts/sql_2k19lnxml1_launcher_files.png)

**Figure 5:** *Launch Files*

As we see in *Figure 5*, there are some launcher related files (outlined in red), but mo launcher for R or Python. What about `RevoScalexxx` files? We replace `"*launch*"` with `"*revoscale*"` in the code from above, and execute. 

Unfortunately, this does not give us any hits at all. It is safe to assume that In-Database analytics does not exist in this *SQL Server 2019 on Linux* container.

#### Installation

If In-Database analytics is not installed, how do I go about installing it? I fumbled around quite a bit until I found [this][4] page. What follows in this *Installation* section is more or less what is on [that][4] page with some added details for doing the install in a Docker container.

When you read the [page][4], you see how you install some packages `mssql-mlservices_xxx` packages. However, what you need to do before that is to register the SQL Server repository for the *SQL Server 2019 on Linux* preview. The repository is distro dependent, and on Ubuntu which my Docker container runs on, you do the following in  the bash shell (beware of line breaks added):

```bash
# Import the public repository GPG keys:
wget -qO- https://packages.microsoft.com/keys/microsoft.asc 
                       | apt-key add -

# Register the Microsoft SQL Server Ubuntu repository 
# for SQL Server 2019 preview:
add-apt-repository "$(wget -qO- https://packages.microsoft.com/
                       config/ubuntu/16.04/mssql-server-preview.list)"
```
**Code Snippet 6:** *Register SQL Server Repo*

Importing the GPG keys in *Code Snippet 6* works just fine, but when you call `add-apt-repository` you get an exception: `add-apt-repository: command not found`. Apparently, we miss some packages, and the package in question we miss is: `software-properties-common`. 

Let us go ahead and install it: `apt-get install software-properties-common`. Quite a few new packages that `software-properties-common` depends on get installed together with `software-properties-common`, and after installation, we can run `apt-get update` to ensure everything is up to date. When we now re-run the `add-apt-repository` in *Code Snippet 6* it all works.

We are now in a position to install the machine learning packages, but first we need to, if you want to run any R packages, register the repository for Microsoft's base distribution of R - *MRO*. So, in the bash shell, run (notice the version number):

``` bash
# first run this
wget https://packages.microsoft.com/config/ubuntu/16.04/
            packages-microsoft-prod.deb

# followed by the actual registration
dpkg -i packages-microsoft-prod.deb
```
**Code Snippet 7:** *Base Distribution Repo Registration*

The code in *Code Snippet 7* does this:

* The `wget` command sets the location of the package repo.
* The `dpkg` command registers the repo.

Before we go any further, it is a good idea to run `apt-get update`, to make sure everything is up-to-date.

Now let us install the necessary packages for Python and R. When you read the [page][4] mentioned above you see there are many packages available. We are interested in the packages that gives us a full install: `mssql-mlservices-mlm-py` and `mssql-mlservices-mlm-r`. We start with the Python package (`mssql-mlservices-mlm-py`):

```bash
apt-get install mssql-mlservices-mlm-py
```
**Code Snippet 8:** *Install Python*

When we execute the code in *Code Snippet 8* we see what additional packages are needed and how packages starts to download:

![](/images/posts/sql_2k19lnxml1_python_install.png)

**Figure 6:** *Package Installation*

Towards the end of the intallation you will see some errors:

![](/images/posts/sql_2k19lnxml1_python_install_errors.png)

**Figure 7:** *Package Installation Errors*

We can dismiss the errors we see in *Figure 7*, for now, as we fix them later in the process. Now, if we look in the file system for, for example, launchers (`find / -type f -iname "*launcher*"`): 

![](/images/posts/sql_2k19lnxml1_python_launchers.png)

**Figure 8:** *Python Launcher Files*

In *Figure 8* we see how there are quite a few launcher files. Likewise if we look for `revoscale` we would see some files. So it looks like we are on our way to enable In-Database analytics, and we now do the same for R:

``` bash

```



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



[1]: https://docs.docker.com/docker-for-windows/install/
[2]: {{< relref "sql-server-2019-for-linux-in-docker-on-windows.md" >}}
[3]: http://queue.acm.org/detail.cfm?id=945136
[4]: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-machine-learning?view=sqlallproducts-allversions
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