---
type: post
layout: "post"
title: How To Install SQL Server on an Azure VM
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server
  - Azure
tags:
  - SQL Server
  - Azure
description: 
keywords:
  -   
---

A while ago, I wanted to do a quick test on a new SQL installation, and I wanted to do it on a clean machine. I was not keen on creating a virtual machine on my local dev-box, as I thought there would be a better way of doing it in the cloud.

I thought it would be pretty straight forward, yeah I am naive, but it turned out to be not that easy. I eventually figured out what to do, so I thought I'd write a post about what I did if I ever need to do it again. So here we go ...

<!--more-->

## Pre-reqs

The assumption is that you have an Azure subscription. If you do not, you can sign up for a free account [here][1].

## Installation

When we have an account/subscription we log onto the portal:

![](/images/posts/azure-vm-sql-portal-1.png)

**Figure 1:** *Azure Portal*

After we have logged in to the portal, we see something like in *Figure 1*. We now want to create a new Azure resource. We do that via the *Create a resource* menu.  We click on the "hamburger" menu we see outlined in red in *Figure 1* to get to that menu. When clicking on the menu, a list is presented where the first item is *Create a resource*. Click on that, and we see:

![](/images/posts/azure-vm-sql-create-resource-1.png)

**Figure 2:** *Create Resource* 

When we look at *Figure 2* there is nothing that really stands out. Sure, we see some items outlined in red in the figure that relates to data and databases. However, when we "drill down" into those items there are nothing there that refers to SQL installations on a VM, it is all more related to managed databases.

I guess we could go into the *Compute* item and deploying a VM, and after having done that we upload the SQL Server install media and we do a manual installation on the VM. I don't see that being much better than doing it on my local machine, and I thought there has to be something better.

After extensive "research", (read Google:ing), I found something that might help:

![](/images/posts/azure-vm-sql-azure-sql-1.png)

**Figure 3:** *Azure SQL - I* 

If I enter *Azure SQL*, in the *Search the Marketplace* search-box a drop-down list pops up, (or should it be down), and in the list is an entry for *Azure SQL* as outlined in red in *Figure 3*. Clicking on that we get something like so:

![](/images/posts/azure-vm-sql-azure-sql-2.png)

**Figure 4:** *Azure SQL - II* 

In *Figure 4*, we see how we can create and manage SQL Server resources, including SQL Server virtual machines, (outlined in red).

So let us click on the *Create* button which in *Figure 4* is outlined in yellow:

![](/images/posts/azure-vm-sql-deploy-option-1.png)

**Figure 5:** *SQL Deployment Option*

After clicking on the *Create* button, we see a form as in *Figure 5*, where we have some choices. We are interested in the *SQL virtual machine* option which is outlined in red. When we click on the drop-down list-box outlined in yellow, we get a list as so:

![](/images/posts/azure-vm-sql-deploy-options.png)

**Figure 6:** *SQL & OS Versions*

The list in *Figure 6* shows us some of the various SQL Server and operating system versions we can deploy. We see, outlined in red that we want to deploy SQL Server 2019 Developer Edition on Windows Server 2019.

> **NOTE:** I should have mentioned this in the pre-reqs above; you have to have licenses for the OS and SQL edition you choose.






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



[1]: https://azure.microsoft.com/en-gb/free/
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