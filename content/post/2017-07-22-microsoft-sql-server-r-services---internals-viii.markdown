---
layout: post
title: Microsoft SQL Server R Services - Internals VIII
author: nielsb
date: 2017-07-22T08:47:47+02:00
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Data Science
  - SQL Server R Services Series
  - SQL Server R Services
  - SQL Server Machine Learning Services  
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - BxlServer.exe
description: Here we look at some of the components the launchpad service loads; Rterm.exe, BxlServer.exe, etc.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - BxlServer.exe   
---

This is the ninth post in a series about **Microsoft SQL Server R Services**, and the eight post that drills down into the internal of how it works. To see other posts (including this) in the series, go to: [**SQL Server R Services**](/sql_server_2k16_r_services)

So far in this series we have been looking at what happens in SQL Server as well as the launchpad service when we execute `sp_execute_external_script`, and we have still no real "clue" to where the R engine comes into play.

Well, hopefully that will change (at least a little bit) with this post, as we here will look at what happens when we leave the launchpad service.

<!--more-->

Before we dive into the "juicy" stuff, let's remind ourselves where we are.

## Recap

Normally in the recaps in this series, we have looked at what was covered in the previous "episode". In this recap, let's look at he "full" picture up until now. 

The first post in the series - [Microsoft SQL Server 2016 R Services Installation][sinst] - covered the installation of SQL Server 2016 R Services, and it also touched upon the external procedure which allows us to execute external scripts; `sp_execute_external_script`. We looked at the signature of the procedure as well as executing the equivalent to a "Hello World" script. 

In the subsequent posts we talked about - when executing `sp_execute_external_script` - how SQL Server calls into the launchpad service, and how the launchpad service - through the `rlauncher.dll` creates multiple `Rterm.exe` processes as in *Figure 1* below. One of the processes will be used to run the external script:

![](/images/posts/sql-launchpad-rterm_processes.png)

**Figure 1:** *Rterm.exe Processes*

I addition to creating `Rterm.exe` processes, the launchpad service also creates backing directories for those processes. These backing directories are used for saving output, intermediate results etc. The following figure was used to show what the call flow looks like: 

![](/images/posts/sql-launchpad_processes_post.png)

**Figure 2:** *Call Flow Executing sp_execute_external_script*

We discussed how the number of processes can be controlled by the `PROCESS_POOL_SQLSATELLITE_GROWTH` setting in `rlauncher.config` file, and how it defaults to 5 if nothing is set.

In [Internals - VI][si6] we came back to the backing directories, and we realized that in addition to the backing directories created for the Rterm processes, one more directory is created - which will be the "official" working directory for the session, and we showed this using this figure:

![](/images/posts/sql_r_services_6_launchpad_working_dir.png)

**Figure 3:** *Launchpad, Directories and Processes*

While we were investigating the directories created in [Internals - VI][si6] we saw that, while we executed an external script, files and sub-directories were created in the various backing directories:

![](/images/posts/sql_r_services_7_outputdir.png)

**Figure 4:** *Contents Process Directory*

In *Figure 4* we see he content of the directory which is the processing directory, and in [Internals - VII][si7] we looked into what creates those files/directories and what they are for. We came to the conclusion that both the launchpad service (probably through the `rlauncher.dll`) created some files, whereas `Rterm.exe` created others.

That's where we are, and now it is time to look at the world outside of the launchpad, and try to figure out what is being used when executing an external script.

## Rterm.exe

In [Internals - III][si3] we saw how the launchpad service creates Rterm processes, and how the launchpad service calls `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo` followed by `launchpad!CSQLSatelliteConnection::WriteMessage` to call into the Rterm process chosen for execution of the external script. So what does `Rterm.exe` and the RTerm process do?

To answer that let us first look at what the R "engine" really is, and let's do that by looking at standard CRAN R, and for this I use RStudio as an IDE. So, let's open RStudio and make sure it uses the CRAN R engine:

![](/images/posts/sql_r_services_8_rstudio_cran.png)

**Figure 5:** *RStudion CRAN R*

At that stage if I check in **Process Explorer** to see what processes are loaded I see something like this:

![](/images/posts/sql_r_services_8_rstudio_rsession.png)

**Figure 6:** *Processes Loaded*

So in *Figure 6* we see how the `rstudio.exe` is host for `rsession.exe`, which in turn host `conhost.exe`. For this discussion `conhost.exe` has no real impact, but if you want to know more about it, [here][1] is a good article explaining why we have `conhost.exe`. 

Going back to `rsession.exe`; in Process Explorer, we look at what dll's it has loaded (click on ``rsession.exe` followed by **Ctrl-D** ) we'll see something like this:   

![](/images/posts/sql_r_services_8_rstudio_rsession_dlls1.png)

**Figure 7:** *Loaded dll's*

*Figure 7* above shows 7 dll's loaded by `rsession.exe`, and what is interesting is the second from bottom, which has a path pointing to the R libraries. When we look further down in the list we'll see more dll's from the R libraries:

![](/images/posts/sql_r_services_8_rstudio_rsession_rdlls.png)

**Figure 8:** *R Dlls*

Among the dll's we see the `R.dll`, which is the main dll for R. So, it seems that `rsession.exe` acts as a host for the R engine, and the R engine is a "bunch" of dll's.

Coming back to `rterm.exe` and what it is, we can now assume it acts in the same way as `rsession.exe`. Let us go back to the code that we used in [Internals - III][si3] when we captured the figure we above in *Figure 1*:

``` sql
EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet;
                              Sys.sleep(120);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));
```
**Code Snippet 1:** *Execute with Sys.Sleep*

Like we did in [Internals - III][si3], we'll execute the code in *Code Snippet 1*, and while the code is running we'll look in Process Explorer and see if we find anything of interest:

1. Stop the launchpad service.
1. Restart the launchpad service.
1. Start *Process Explorer*, order by Process, and scroll down to where you see process names starting with "RT" (on my box there are none at this stage), or where the processes should be.
    * If you at this stage see RTerm, restart the launchpad service again and kill those processes.
1. Execute the code in *Code Snippet 1*.

While the code is running, take a quick look in Process Explorer, and you should see something like so:

![](/images/posts/sql_r_services_8_rterm_processes.png)

**Figure 9:** *RTerm Processes*

The difference between *Figure 1* and *Figure 9*, is that in *Figure 1* I had collapsed the Rterm processes. In *Figure 9* we see how the launchpad service is host for multiple Rterm processes, and how `Rterm.exe` is host for `conhost.exe` as well as `BxlServer.exe`. We'll come back shortly to what `BxlServer.exe` is.

Let's look a bit closer at what dll's we find for one of the active Rterm processes, click on the Rterm process which has a CPU value, and then click **Ctrl-D**.

> **NOTE:** You may have to re-execute the code in *Code Snippet 1*, maybe even increase the sleep time to 3 or 4 minutes to be able to see everything.

When I scroll down in the dll list I see some familiar R dll's, that we also saw in *Figure 8*:

![](/images/posts/sql_r_services_8_rterm_dlls.png)

**Figure 10:** *Rterm R dll's*

At this stage we can safely say that the `Rterm.exe` and its process hosts the R engine. That is cool (yeah I know - I need to get a life), but what does that `BxlServer.exe` do in the mix?

## BxlServer

So the question was, what is the `BxlServer.exe`? To answer that let's take a step back, and look at the R offerings Microsoft has:

* Microsoft R Open - a Microsoft open source offering of R
* Microsoft R Server - Microsoft's commercial R offering.
* SQL Server R Services - the moral equivalent of Microsoft R Server, but with SQL Server as delivery vehicle.

Let's see what happens if we pointed RStudio towards the Microsoft R Open environment:

![](/images/posts/sql_r_services_8_rstudio_mro.png)

**Figure 11:** *RStudio Targeting MRO*

In *Process Explorer*, looking at the rstudio process, it won't look any different than what it did when Rstudio targeted CRAN R as in *Figure 6*, so obviously the Microsoft R Open offering does not "know" of the `BxlServer.exe` we see in *Figure 9*. But, looking at the dll's loaded by `rsession.exe`, we see more or less the same as was loaded by `rterm.exe` in *Figure 10*:

![](/images/posts/sql_r_services_8_rstudio_mro_dlls.png)

**Figure 12:** *RStudio MRO dll's*

What would happen if RStudio targeted the Microsoft R Server (MRS) instead:

![](/images/posts/sql_r_services_8_rstudio_mrs.png)

**Figure 13:** *RStudio Targeting MRS*

This time when looking at the rstudio process we do see `BxlServer.exe` as a process hosted by `rsession.exe`, so it seems that `BxlServer.exe` is specifically for the commercial versions of Microsoft R.

> **NOTE:** There is no difference between the `BxlServer.exe` in MRS and SQL Server R Services. Well, not much anyway :), in next post we'll see some differences.

By now you are probably saying something like: "Niels, this is very informative - NOT, get to the point - what is `BxlServer.exe`". OK, so let us see some of the dll's `BxlServer.exe` has loaded (click on the `BxlServer.exe` process and **Ctrl-D**):

![](/images/posts/sql_r_services_8_rstudio_bxlserver.png)

**Figure 13:** *BxlServer Loaded dll's*

Ooh, that's interesting, look at the path and especially what is in the red rectangle: `RevoScaleR`.

RevoScaleR, is an R package providing both High Performance Computing (HPC) and High Performance Analytics (HPA) capabilities for R.  HPC capabilities allow you to distribute the execution of essentially any R function across cores and nodes, and deliver the results back to the user. HPA adds the ability to handle big data in a high performance way. In addition to this (or rather as part of) RevoScaleR also has functionality to handle data access with high performance, and `BxlServer.exe` is the host for all this.

In addition to run the HPC, HPA and data access, `BxlServer.exe` also coordinates with the R runtime in order to manage exchanges of data with SQL Server, and it runs most of the R processing. A lot of the coordination and handling of result sets in `BxlServer.exe` is handled by a dll loaded by `BxlServer.exe`: `BxServerLink.dll`. Below we see how the `BxServerLink.dll` is loaded by `Bxlserver.exe`.

![](/images/posts/sql_r_services_8_rstudio_bxserverlink.png)

**Figure 14:** *BxServerLink Loaded by BxlServer.exe*

Let's go back to *Figure 13* , where we see how `rsession.exe` hosts `BxlServer.exe`. How does that work, I mean - `rsession.exe` is a CRAN R executable, and it does not know anything about Microsoft R Services and `BxlServer.exe`? The answer is `R.dll`; when `rsession.exe` loads `R.dll` (which is a Microsoft dll), the `R.dll` then starts to load other dll's. But, `BxlServer.exe` is not a dll, and it runs in a separate process, surely `R.dll` cannot do that? No, it cannot - but what it does do is to load a dll acting as a conduit: the `RxLink.dll`. The `RxLink.dll` creates a new process in where `BxlServer.exe` runs, and that is how communication happens between `rsession.exe` and `BxlServer.exe`. And that is also what happens in SQL Server R Services where `Rterm.exe` is the "host". `Rterm.exe` loads the `R.dll` which loads `RxLink.dll` who then creates a process for `BxlServer.exe`, and `BxlServer.exe` loads `BxLinkServer.dll`.

> **NOTE:** In the next Internals post we'll look more at `RxLink.dll`, and `BxLinkServer.dll`.

Finally, let's make sure that `BxlServer.exe` actually is doing something when we execute an external script in SQL Server R Services. For that we'll use some code we wrote in [Internals V][si5], where we discussed parallelism:

``` sql
USE master;
GO

SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS TestParallel;
GO

CREATE DATABASE TestParallel;
GO

USE TestParallel;
GO

DROP TABLE IF EXISTS dbo.rand_30M
CREATE TABLE dbo.rand_30M(RowID bigint identity primary key, y int, 
                          rand1 int, rand2 int, rand3 int, rand4 int, 
                          rand5 int);

INSERT INTO dbo.rand_30M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(30000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 25 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 50 AS INT)
  , CAST(ABS(CHECKSUM(NEWID())) % 100 AS INT)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO
```
**Code Snippet 2:** *Setup of Database, Table and Data*

The data we create in *Code Snippet 2* makes absolutely no sense at all, but it will serve our purposes of have some volume of data to work with, and cause the execution to run for a little while. 

> **NOTE:** Go back to [Internals - V][si5] if you are interested in seeing what this code does.

The code we want to execute in SQL Server looks like so:

```sql
EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
             #Sys.sleep(30)
             pid <- Sys.getpid()
             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
 
             coef <- r$coefficients
             icept <- coef\[1\];
              OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
       , @input_data_1 = N'
              SELECT  y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_30M'
WITH RESULT SETS ((pid INT NOT NULL, nRows INT NOT NULL, intercept FLOAT NULL)
); 
```
**Code Snippet 3:** *Linear Regression in SQL Server*

To run this:

* Restart the launchpad service (this is to clean-up any RTerm processes).
* Navigate to the `Launchpad.exe` process in *Process Explorer*.
* Execute the code in *Code Snippet 3*.
* While the code is executing, look in *Process Explorer* for RTerm processes.

Among the Rterm and BxlServer processes you should see one `BxlServer.exe` process that has a CPU value, as well as consuming some memory:

![](/images/posts/sql_r_services_8_bxlserver_processing.png)

**Figure 15:** *BxlServer Processing*

So, as I mentioned above, it is the `BxlServer.exe` which is doing he heavy lifting in SQL Server R Services.

## Summary

In this post we have now seen what happens when executing `sp_execute_external_script`:

* SQL Server calls into the launchpad service.
* The launchpad service calls into the `Rlauncher.dll`.
* The `Rlauncher.dll` creates Rterm processes.
* Through Rterm, the `R.dll` is loaded together with `RxLink.dll`.
* The `RxLink.dll` creates the `BxlServer.exe` process.
* To coordinate with SQL Server, `BxlServer.exe` loads `BxServerLink.dll`.

Below I have tried to describe it in a figure:

![](/images/posts/sql_r_services_8_arch_overview.png)

**Figure 15:** *BxlServer Processing*

Notice how, in *Figure 15*, there is nothing about how data gets back to SQL Server. That is something we will discuss in next post. Oh and yes, *Figure 15* looks very much like one of the figures you can see in this [post][2], and I freely admit I have looked at it :).

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://blogs.technet.microsoft.com/askperf/2009/10/05/windows-7-windows-server-2008-r2-console-host/
[2]: https://docs.microsoft.com/en-us/sql/advanced-analytics/r/new-components-in-sql-server-to-support-r

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}

