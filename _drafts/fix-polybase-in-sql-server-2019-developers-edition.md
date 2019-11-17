---
type: post
layout: "post"
title: Fix PolyBase in SQL Server 2019 Developers Edition
author: nielsb
date: 
comments: true
highlight: true
draft: true
categories:
  - SQL Server 2019
tags:
  - SQL Server 2019
  - Polybase
  
description: 
keywords:
  -   
---

At [MS Ignite][1] in Orlando November 4 - 8, 2019, Microsoft announced the general availability of SQL Server 2019. At the same time, the SQL Server 2019 Developers Edition appeared as an MSDN download, and of course, I downloaded it and installed it on my dev box.

After the installation, I noticed that PolyBase did not start up correctly, and I saw dump files all over the place. After some investigation, I figured out what the issue was, and this blog post describes the fix.

<!--more-->

## PolyBase Intro

Before we go into the issue and solution a quick introduction to PolyBase, and also look at installation.

PolyBase enables you to, in your SQL Server instance, process Transact-SQL queries that read data from external data sources. Microsoft introduced PolyBase in SQL Server 2016. In that version of PolyBase the only data-sources you could process data from were: Hadoop and Azure Blob Storage. That changed in SQL Server 2019 where PolyBase now supports:

* Hadoop.
* Azure Blob Storage.
* SQL Server.
* Oracle.
* Teradata.
* MongoDB
* ODBC Generic Types, (only PolyBase in SQL Server 2019 on Windows).

#### Installation







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



[1]: https://www.microsoft.com/en-us/ignite
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