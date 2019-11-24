---
type: post
layout: "post"
title: Fix PolyBase in SQL Server 2019 Developers Edition
author: nielsb
date: 2019-11-20T05:52:17+02:00
comments: true
highlight: true
draft: false
categories:
  - SQL Server 2019
tags:
  - SQL Server 2019
  - Polybase
description: How to fix PolyBase not working out of the box, in SQL Server 2019 Developer edition.
keywords:
  - SQL Server 2019
  - Polybase   
---

At [MS Ignite][1] in Orlando November 4 - 8, 2019, Microsoft announced the general availability of SQL Server 2019. At the same time, the SQL Server 2019 Developers Edition appeared as an MSDN download, and of course, I downloaded it and installed it on my dev box.

After the installation, I noticed that PolyBase did not start up correctly, and I saw dump files all over the place. After some investigation, I figured out what the issue was, and this blog post describes the fix.

<!--more-->

## PolyBase Intro

Before we go into the issue and solution, let us do a quick introduction of PolyBase and also look at the installation of PolyBase.

PolyBase enables you to, in your SQL Server instance, process Transact-SQL queries that read data from external data sources. Microsoft introduced PolyBase in SQL Server 2016, and in that version of PolyBase the only data-sources you could process data from were: Hadoop and Azure Blob Storage. That changed in SQL Server 2019 where PolyBase now supports:

* Hadoop.
* Azure Blob Storage.
* SQL Server.
* Oracle.
* Teradata.
* MongoDB
* ODBC Generic Types, (only PolyBase in SQL Server 2019 on Windows).

#### Installation

You either install PolyBase as part of a regular installation of a SQL Server instance, or you add it after installation. In both cases, you select it during feature selection:

![](/images/posts/sql-2k19-polybase-issue-install.png)

**Figure 1:** *PolyBase Feature Selection*

In *Figure 1* we see how I chose both the *PolyBase Query Service* as well as the *Java connector for HDFS data sources*. After clicking on from there passing *Feature Rules*, and *Instance Configuration* we get to *PolyBase Configuration*:

![](/images/posts/sql-2k19-polybase-issue-install2.png)

**Figure 2:** *PolyBase Configuration*

As we see from *Figure 2* I choose a standalone PolyBase-enabled instance.

I click on from there and eventually the installation finishes:

![](/images/posts/sql-2k19-polybase-issue-install3.png)

**Figure 3:** *Installation Complete*

We see in *Figure 3* how all components are green which indicates that the installation has succeeded. Cool!

## Problem

But has the installation succeeded? What usually I do after a SQL installation is to go to *Services* and change properties for the various SQL services, (automatic startup to manual startup, etc.). When I do this, I see:

![](/images/posts/sql-2k19-polybase-issue-services.png)

**Figure 4:** *Services*

What we see in *Figure 4* is a view of services a couple of minutes after the installation. We see that the SQL Server service, (`MSSQLSERVER`), is in `Running` state. However, the two PolyBase services are still in a `Starting` state. Something must have gone wrong, but what!

> **NOTE:** Depending on how long after installation you look at services you may see the PolyBase Engine in a stopped state, but the Data Movement still in a `Starting` state.

Let us see if we can try and figure out what is wrong. We start by going to the SQL Server log files directory, which is at: `<path_to_sql_instance>\MSSQL\Log`. In there you find a `Polybase` directory with a `dump` subdirectory:

![](/images/posts/sql-2k19-polybase-issue-dump-dir.png)

**Figure 5:** *PolyBase Dump Directory*

In *Figure 5* we see how the `dump` directory contains a `.dmp` file. Maybe we can find any clues if we open it in **WinDbg**:

```bash
Comment: 'Stack Trace'
Comment: 
  '<Identity>
     <Element key="CodePackageName" val="DwDms.Code"/>
     [snip]
     <Element key="ExceptionMessage" val="A network-related or 
      instance-specific error occurred while establishing a connection 
      to SQL Server. The server was not found or was not accessible. 
      Verify that the instance name is correct and that SQL Server is 
      configured to allow remote connections. 
      (provider: TCP Provider, error: 0 - The remote computer refused 
       the network connection.)"/>
     <Element key="ExceptionType" val="System.Data.SqlClient.SqlException"/>
     [snip]
     </Identity>'
```
**Code Snippet 1:** *Exception in File*

Hmm, in *Code Snippet 1* we see an excerpt of the top of the file, (I have "snipped" out parts for brevity), and we see an error about how PolyBase cannot connect to SQL Server via the TCP provider.

## Fix

The error we see in *Code Snippet 1* is a big clue since TCP is not an enabled network protocol by default for SQL Server Developer edition.

Let us enable TCP/IP as a network protocol for SQL Server. We enable network protocols using the *SQL Server Configuration Manager*. Open *SQL Server Configuration Manager* either via the Windows **Start** menu or from *Computer Manager*:

![](/images/posts/sql-2k19-polybase-issue-compmngr.png)

**Figure 6:** *SQL Server Configuration Manager*

In *Figure 6* we see, outlined in blue, *SQL Server Configuration Manager*, and how we have expanded *SQL Server Network Configuration*, (outlined in red). On the right-hand side in *Figure 6* we see how the TCP/IP protocol is indeed disabled.

To enable we right-click on the TCP/IP protocol and in the menu choose **Enable**. When we do that a *Warning* dialog "pops" up:

![](/images/posts/sql-2k19-polybase-issue-enable-warning.png)

**Figure 7:** *Warning Dialog*

So, we see in *Figure 7* that any changes will not happen until the SQL Server instance is restarted. Cool, let us restart the service. We go back to *Services* as in *Figure 4*, and we right-click on the SQL Server service, and choose **Restart**:

![](/images/posts/sql-2k19-polybase-issue-stop-service.png)

**Figure 8:** *Stop Services*

When we try to restart we get the warning we see in *Figure 8*, telling us we need to also restart the *PolyBase Data Movement* service, and the *Launchpad* service.

> **NOTE:** The *Launchpad* service is part of SQL Server Machine Learning Services.

I click **Yes** as in *Figure 8*, and almost immediately I see:

![](/images/posts/sql-2k19-polybase-issue-stop-control.png)

**Figure 9:** *Can Not Stop Service*

The problem that manifests itself by what we see in *Figure 9* is that the *PolyBase Data Movement* service is in a `Starting` state, and cannot be stopped.

What do we do now? Well, we can try and restart the machine, but that seems like overkill, (and it may not work). So let us try to use a command from the command prompt, where we can force the termination of a service: `taskkill`.

To use the `taskkill` command, we need to know either the process-id, (`PID`), of the process we want to terminate, or the process name. To get the `PID` we open *Task Manager* and under the services tab we find the SQL Server service:

![](/images/posts/sql-2k19-polybase-issue-task-manager.png)

**Figure 10:** *Task Manager*

We see in *Figure 10* the `PID`, (highlighted in yellow), which we now use to terminate the SQL Server process:

![](/images/posts/sql-2k19-polybase-issue-task-kill.png)

**Figure 11:** *Task Manager*

As we see in *Figure 11* I called `taskkill` from command prompt which I opened as administrator. I used the process-id from *Figure 10*, and I used the `/F` flag to indicate I wanted to force the termination. The command executed successfully, and as we see in *Figure 11* the process has been terminated.

What is left to do now is to start the SQL Server process, followed by the PolyBase Data Movement service and the PolyBase Engine service. The PolyBase Data Movement service may still be in the state of `Starting, but by right-clicking on the service and choose **Start** it will start:

![](/images/posts/sql-2k19-polybase-issue-services-running.png)

**Figure 12:** *Services Running*

We see in *Figure 12* how the services are up and running.

## Summary

In this post, we saw how we fix the issue where the PolyBase services do not start on a SQL Server 2019 Developer Edition.

We said it was due to that TCP/IP is not by default an enabled SQL Server network protocol for the Developer edition. Therefore the PolyBase services cannot connect to the SQL Server instance at startup. We fixed it by:

* Enable the TCP/IP protocol under *SQL Server Network Configuration* in *SQL Server Configuration Manager*.
* Retrieve the process-id, (`PID`), for the SQL Server service.
* Forcing the process to be terminated by the `taskkill /PID <process-id> /F` command.
* Restart the SQL Server service, followed by the PolyBase services.

Another way to do this is to install SQL Server without the PolyBase features. After installation you enable the TCP/IP protocol, restart SQL Server, and then install the PolyBase features.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://www.microsoft.com/en-us/ignite

