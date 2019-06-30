---
layout: post
title: Microsoft SQL Server R Services - Internals VII
author: nielsb
date: 2017-07-11T20:08:13+02:00
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
  - Process Monitor
description: We look at the files and sub-directories created when executing sp_execute_external_script.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - Process Monitor 
---

(WOW, I finally managed to get this post out! Yay to me!!)

This is the eighth post in a series about **Microsoft SQL Server R Services**, and the seventh post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

In this post we will look more at some of the directories that are created when we execute `sp_execute_external_script`, as well as files being created in those directories.

<!--more-->

## Recap

In previous posts([here][si2], [here][si3], [here][si4] and [here][si5]) we have talked about how the launchpad service creates a number of **RTerm** processes when we execute an `sp_execute_external_script` request. The number of processes are configurable by the `PROCESS_POOL_SQLSATELLITE_GROWTH` setting in the `rlauncher.config` file, and by default 5 processes are created. These processes are added to a process pool, and when executing subsequent requests, or concurrent requests from different sessions, processes are picked up from the pool and used. At the same time new processes are created and added to the pool.

In the [Microsoft SQL Server R Services - Internals VI] [si6] post we talked about the directories that are created when executing `sp_execute_external_script`. We saw, when we execute the script, how (with a default `PROCESS_POOL_SQLSATELLITE_GROWTH` setting):

* Three directories are created initially, the first one being the directory for the session - this is the R working directory. 
* Then two processes, which will use the second and third directory.
* Then one directory followed by one process, until we're done.

From the above we understand that each process has a backing directory, and in the [post][si6] we saw how the various directories had some files and sub-directories inside, as in *Figure 1 below*:

![](/images/posts/sql_r_services_6_dir_content.png)

**Figure 1:** *Directory Content*

The figure above is from the [Internals - VI][si6] post. In that post we could not really determine where the sub-directories came from. So in this post let us figure out what the created files are for, and from where the sub-directories originate (or at least let us try to figure it out).

## Files

In various documentation of SQL Server R Services it is stated that the directories created during execution of `sp_execute_external_script` is to store files, intermediate results etc. We will run some code to see what files are created, but before that let's set things up to make life somewhat easier for us:

1. Stop the launchpad service.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Open the `rlauncher.config` file in a text editor and change the value of `JOB_CLEANUP_ON_EXIT` to 0, and save the file (you need to do this as admin).
1. Restart the launchpad service.

> **NOTE:** By setting the `JOB_CLEANUP_ON_EXIT` to 0 we tell the launchpad service to not delete any directories etc., after we have executed (the executing process will still be torn down though).

The code we initially want to run is similar to what we ran in [Internals - VI][si6]:

``` sql
EXEC sp_execute_external_script  @language =N'R',
                                 @script=N'
                                 pid <- Sys.getpid()
                                 d <- getwd()
                                 cat(paste0("ProcessId: ", pid))
                                 cat("\n")
                                 cat(paste0("WorkDir: ", d))
                                 cat("\n")
                                 OutputDataSet<-data.frame(ProcessId=pid,WorkingDir=d)'
WITH RESULT SETS ((ProcessID int, [WorkingDirectory] nvarchar(1024) not null));
```
**Code Snippet 1:** *External Script*

As you see in *Code Snippet 1*, the R script captures information about the process id we execute under as well as the working directory. It uses the `cat` function to output the data, the question is where it outputs it to? Normally `cat` would output to the standard output connection, the console, if no file name has been given as argument. So let us see what happens when we execute the code. 

In SQL Server Management Studio (SSMS) - under the *Results* tab, I get the returning result set containing the process id as well as the working directory path. Under the *Messages* tab I get something like what is shown in *Figure 2* below:

![](/images/posts/sql_r_services_7_output1.png)

**Figure 2:** *Output from R Script*

So that is the result from the `cat` function. This makes sense as we can see the *Messages* tab as something like a console. But is the output from `cat` anywhere else? Let's go and have a look in the user account directory in `C:\<sql_instance_path>\MSSQL\ExtensibilityData`, and the specific account used when executing the script. It is most likely *MSSQLSERVER01* if you execute from a default instance, but if you are unsure you can have a look at the output from the script and the value for the working directory. Just before the `Guid` value is the name of the account used.

When we look under the user account directory, we'll see multiple directories, all with a `Guid` like string as name. As we covered in previous posts, these directories are the backing directories for the processes created. When you look through these directories you'll see (as we said in [Internals VI][si6]), that most of the directories look the same; they have one subdirectory and 3 files. There are however two directories that are somewhat different; one is empty, and that is the working directory, and one that has four files in it. The one directory with four files in it is the directory for the process the code executed under (I call it process directory), and when you look in that directory you see something like so:

![](/images/posts/sql_r_services_7_outputdir.png)

**Figure 3:** *Contents Process Directory*

As you see in *Figure 3* there are two `.txt` files in the directory, and we can see (from the Size), that it looks like the `stdout0.txt` has some content. When you open the `stdout0.txt` file you see how it contains the output from the `cat` calls in the script. If there had been errors during script execution, the errors would have been written to the `stderr0.txt` file.

OK, so that is the `stdout.txt` and `stderr.txt files - what about the other two files:

* `7F73C367-0684-4B89-9DA7-86BEEA362FD2.R`
* `Rscriptae84173870`

> **NOTE:** The filenames above are what I see on my machine. If you run this, your filenames will most definitely be different.

Let's start with the R file, which looks something like so (paths made short):

``` r
library(RevoScaleR); 
rxIgnoreResult <- .Call('RxSqlSatelliteCall', 
          list(sessionId='1C49FD9B-BA79-4C1E-993B-E04669259CD8', 
               taskId=0, 
               port=51318, 
               logPath='', 
               pipeName='DataSet1_1Col_Int_1Row', 
               sqlSatellitePath='C:\\<sql_inst_binn_path>\\
                                  sqlsatellite.dll',
               errorToStdError=T));
```
**Code Snippet 2:** *R File Set Up Satellite Connection*

This file only exists in the process directory, and the file is used to establish a named pipe connection with the SQL Satellite (we'll cover SQL Satellite in future posts). As we see in *Code Snippet 2*, the script:

* Loads the `RevoScaleR ` package
* Executes the `.Call` function to call into a method named `RxSqlSatelliteCall`, and sends in some arguments for that method.

> **NOTE:** The `.Call` function in R is used to call into C/C++ code.

The arguments sent in to the method are for:

* What port to use for then named pipe connection.
* Name of the named pipe.
* The path to where the SQL Satellite is.

What uses this file? Well, take a look at the `Rscriptae84173870` file, it looks something like so (once again paths shortened):

``` r
library(RevoScaleR); 
sessionDirectory <- 
'C:\\<sql_inst_ext_data_path>\\
     MSSQLSERVER01\\7F73C367-0684-4B89-9DA7-86BEEA362FD2';
sessionId <- '7F73C367-0684-4B89-9DA7-86BEEA362FD2';
scriptFile <- file.path(sessionDirectory, 
                        paste(sessionId, '.R', sep=''));
rxIgnoreCallResult <- .Call('RxSqlSessionStart', 
                   list(sessionDirectory=sessionDirectory, 
                        sessionId=sessionId, 
                        waitTime=-1));
source(scriptFile)
```
**Code Snippet 3:** *Session Start*

Ah, looking at the code in *Code Snippet 3*, we see how that code actually:

* Loads the `RevoScaleR` package.
* Defines the directory for the executing process
* Creates a `scriptFile` argument, pointing to the file in *Code Snippet 2*.
* Starts the process.
* Calls the file from *Code Snippet 2* in the `source` call.

The result of the code in *Code Snippet 2* and *Code Snippet 3* is that after execution a named pipe connection has been made to the SQL Satellite dll, and as I said above - we'll cover the SQL Satellite in a subsequent blog-post.

## Files & Sub-directory Origins

Above we saw (at least kind of), what the files inside the process directory do. What about the sub directory that exist in all backing directories, what does that do, and where does it come from? Remember from the [Internals - VI][si6] post that we said that when we were using **WinDbg** and had break point at `KERNELBASE!CreateDirectoryW` we couldn't see the sub-directory being created. 

There is also a question about who is creating the files that we have just discussed. The obvious answer would be that it is the launchpad service together with the `rlauncher.dll` that create the files. Let's try and prove that.

So, to set things up:

1. Stop the launchpad service.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Restart the launchpad service.

This time we will use [*Process Monitor*][1] from **Sysinternals** instead of WinDbg, as it will be easier to see what files (and directories) are created and by whom.

> **NOTE:** Process Monitor is an advanced monitoring tool for Windows that shows real-time file system, Registry and process/thread activity. 

When you run Process Monitor you will see that it monitors (and logs) a LOT on the machine you run it on:

![](/images/posts/sql_r_services_7_procmon1.png)

**Figure 4:** *Process Monitor Start Up*

In *Figure 4* you see output from Process Monitor right after startup on my machine. In order to get something useful out of what we see, we need to filter out events, or rather say what events we are interested in. We'll start with suppressing event monitoring to begin with, as well as not choosing to see events of certain types:

![](/images/posts/sql_r_services_7_procmon2.png)

**Figure 5:** *Suppress Event Collection*

In *Figure 5* we see the tool-bar of Process Monitor, and how we have paused capturing of events by clicking on the magnifying glass (in the first outlined box). We also have chosen not to receive any events related to registry, network and profiling activity (the second outlined box).

Now we are ready to start to define the events we are interested in, and we do that using the *Filter* menu. We start with resetting the filters:

![](/images/posts/sql_r_services_7_procmon_reset_filter.png)

**Figure 6:** *Reset Process Monitor's Filters*

When you reset the filters, sometimes event capturing will be enabled again. If it is, just disable it once more. Now is probably a good time to clear out the captured events at startup, so under the *Edit* menu click *Clear Display*. Having reset the filters and cleared out the display, we can now create a filter to use, to capture the events we are interested in. So, what are we interested in?

Well, we would like to see what files are being created under the subdirectories of the user account you will execute your R script under. For me it is: `C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\ExtensibilityData\MSSQLSERVER01`, and this will be the starting point for a filter to filter out events. 

To create a filter, under the *Filter* menu click the Filter menu item, and the "Process Monitor Filter" dialog will be shown:

![](/images/posts/sql_r_services_7_procmon_filter_dialog.png)

**Figure 7:** *Process Monitor Filter Dialog*

To create the filter we enter the conditions we want to match:

* The *Path* (from first drop down) should *begins with* (from second drop down): `C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\ExtensibilityData\MSSQLSERVER01`. 
* *Operation* (first drop down) *is* (second drop down): `CreateFile`

Both of those conditions should be *Include*:ed and *Add*:ed. At the end the filter looks like so:

![](/images/posts/sql_r_services_7_procmon_filter_create.png)

**Figure 8:** *Filter Created*

You click *OK*, and you are ready to roll:

1. Re-enable capturing of events in Process Monitor
1. Execute the code in *Code Snippet 2*
1. After executing the code, disable the capturing of events again in Process Monitor

Process Monitor now shows quite a few events:

![](/images/posts/sql_r_services_7_procmon_capured_events.png)

**Figure 9:** *Captured Create File Events*

Let's go back to the user account and find the backing directory for the process, as - at the moment - we are only interested in what happens in that directory. In my case it is `1EB243A4-AE41-4DBD-A315-44B52EECF4B9`. To make it easier to see what happens in Process Monitor, we can change the filter somewhat:

* In the *Path* column in Process Monitor right click on the first occurrence of the path including the process directory, and click *Copy*:

![](/images/posts/sql_r_services_7_procmon_find_path.png)

**Figure 10:** *Copying the Path*

Then open the Filter dialog and:

* Remove the filter condition for the *Path*. That will cause the condition to be entered into the condition fields:

![](/images/posts/sql_r_services_7_procmon_remove_filter.png)

**Figure 11:** *After Remove Condition*

* In the conditions field enter the path to your process directory (the one you copied above).
* Click *Add*, *Apply*, and *OK*.

The number of events displayed should now have been reduced significantly. For me it went from 265 events captured to 53. 

Now we can see how the launchpad service creates the `stdout0.txt`, and `stderr0.txt` files together with the `.R` file (the image is cropped):

![](/images/posts/sql_r_services_7_procmon_launchpad_create_file2.png)

**Figure 12:** **

However, the `Rscriptxxx` file is not created by the launchpad service, but by `RTerm.exe`:

![](/images/posts/sql_r_services_7_procmon_rterm.png)

**Figure 13:** *RTerm Creating Files and Directories*

In *Figure 13* we also see how - in addition to the Rscript file - a directory `Rtmp0AHI82` is created, and inside that directory a file `file5f446ae7ae6` is created. That particular file is not persisted regardless of the setting of `JOB_CLEANUP_ON_EXIT`. I have not been able to figure out - yet - what that file contains, so if anyone out there knows, please let me know. 

## Summary

In this post we have seen how:

* Output from R script (errors and print) are written to files in the processing directory by the launchpad service.
* The launchpad service also writes a script to establish a named piped connection to the SQL Satellite dll.
* The `Rterm.exe` writes a script that starts a session, and `source`:s the script file mentioned above.
* In addition to the session script, `Rterm.exe` also creates a sub directory together with a file. The file is not persisted.

## ~ Finally

First of all, if you have any insight in the files `Rterm.exe` creates, please get in touch! Otherwise, if you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://technet.microsoft.com/en-us/sysinternals/processmonitor.aspx

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
