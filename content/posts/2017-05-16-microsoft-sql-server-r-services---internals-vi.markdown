---
layout: post
title: Microsoft SQL Server R Services - Internals VI
author: nielsb
date: 2017-05-16T19:38:41+02:00
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
description: This post looks at the directories created by the launchpad service in SQL Server R Services when executing an external script.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe   
---

This is the seventh post in a series about **Microsoft SQL Server R Services**, and the sixth post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

In this post we will look at the directories that are created when we execute `sp_execute_external_script`.

<!--more-->

## Recap

In [Internals - III][si3] we spoke about how Windows user accounts are created during installation, and together with the user account; directories named as the individual Windows accounts are created in the `c:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. These directories act as storage for files, results, objects, etc., during execution of an external script. 

When a user executes an external script in SQL Server, that account is being mapped to one of the 20 Windows account created, and it is under that Windows account the external part of the script is executed. Subsequently the files, etc., mentioned above, ends up in a sub-directory of the user account directory. 

During execution the launchpad service creates working directories (the sub-folders above) and processes. The sub-directories are created with a `Guid` as name, and the processes will get the same name as the sub-directory. In [Internals - III][si3] we saw an excerpt from a log- showing among other things the creation of directories and processes. Below in *Code Snippet 1* you see a part of that file:

```
WorkingDirectory(C:\...\MSSQLSERVER01\5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF) created (1)
WorkingDirectory(C:\...\MSSQLSERVER01\E7AB7781-A8C7-421F-BAA0-074075B41082) created (1)

CreateProces(C:\...\R_SERVICES\bin\x64\rterm.exe
    --slave --no-restore --no-save
    -e "library(RevoScaleR);
    sessionDirectory <- 'C:\...\5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF';
    sessionId <- '5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF';
  
CreateProces(C:\...\R_SERVICES\bin\x64\rterm.exe
    --slave --no-restore --no-save 
    -e "library(RevoScaleR); 
    sessionDirectory <- 'C:\...\E7AB7781-A8C7-421F-BAA0-074075B41082';
    sessionId <- 'E7AB7781-A8C7-421F-BAA0-074075B41082';
```
**Code Snippet 1:** *Excerpt from Creation of Processes and Directories*

Notice how, in *Code Snippet 1*, the working directories are created first, followed by the processes. In the example above, two directories are created first followed by two processes. This happens for the two first directories and processes. After the two first ones, one directory will be created followed by one process, and so on, and so on. You can also see from the log how the name of the directory is used when creating the processes.

## Directories

So, what is the purpose of the working directories? Well, we said in the beginning it was to store files etc., during execution of external scripts. So let us see what happens, when executing. The code we'll use in this post is similar to the code in the other posts in the series:

``` sql
EXEC sp_execute_external_script  
             @language =N'R',
             @script=N'
             pid <- Sys.getpid()
             d <- getwd()
             cat(paste0("WorkDir: ", d))
             cat("\n")
             OutputDataSet<-data.frame(ProcessId=pid,WorkingDir=d)'
WITH RESULT SETS ((ProcessID int, [WorkingDir] nvarchar(1024) not null));
```
**Code Snippet 2:** Code to Execute*

As you see in *Code Snippet 2*, we retrieve both the process id, as well as the working directory, and these two variables are output in the result set. The working directory is further more printed out, in the `cat` function.

Let's execute the code in *Code Snippet 2*, but before you do that:

1. Stop the launchpad service if it is running.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Start the launchpad service again.
1. Execute the code in *Code Snippet 2*.

The result of the execution looks something like so:

![](/images/posts/sql_r_services_6_dir1.png)

**Figure 1:** *Resultset from Code Execution*

In *Figure 1* we see that we executed in a process with an id of: 9092, and that the reported working directory is `E0A85B09-65C6-BD28-71A6B14917E9`. So let us then go to the account - MSSQLSERVER01 - and see what it looks like:

![](/images/posts/sql_r_services_6_dir2.png)

**Figure 2:** *Content of Account Directory After Execution*

Strange, we see 6 different directories, but not the directory that is reported to be the working directory. So let us try to figure out what happens:

1. Stop the launchpad service.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Open the `rlauncher.config` file in a text editor and change the value of `JOB_CLEANUP_ON_EXIT` to 0, and save the file (you need to this as admin).
1. Restart the launchpad service.

> **NOTE:** By setting the `JOB_CLEANUP_ON_EXIT` to 0 we tell the launchpad service to not delete any directories etc., after we have executed (the executing process will still be torn down though). By doing this we hope that we'll be able to see something that will cast some light on this.

Execute the code in *Code Snippet 2* and see what is returned as working directory, and compare that with the directories under the user account directory under `ExtensibilityData`. When I executed the code on my box, the working directory name returned in the result was `5DA4E521-5A5D-4E14-B3FC-769F994A7AD3`, and the directory structure looked like so:

![](/images/posts/sql_r_services_6_dir3.png)

**Figure 3:** *Directory Structure Including Working Directory*

So, there is a directory, but if you look at the contents you will see it is empty. The other directories though have content, and looks similar to:

![](/images/posts/sql_r_services_6_dir_content.png)

**Figure 4:** *Content*

If you browse through the directories you will see that the content in all of them except for one (and the working directory), looks like what we see in *Figure 4*. The one where it is different looks something like what we have in *Figure 5*:

![](/images/posts/sql_r_services_6_dir_content_rscript.png)

**Figure 5:** *Directory with Different Content*

In *Figure 5* we see how there is a file `<Guid-Value>.R, and how the `stdout.txt` file has a 1kb size. In another post we'll look at the content of the directories, and what it means. 

However, we still haven't really figured out about the working directory, and how it is created. If you remember from [Internals - III][si3] and [IV][si4], how we said that the launchpad service creates a number of directories (5+1 as default) as well as processes when an external script is executed, and after execution one process and directory is torn down. So why have I seven directories when the default settings has not changed on the SQL instance I run this on, I really should have six?

We actually saw the answer to that in [Internals - III][si3], when we at one stage looked at the `rlauncher.log` file and saw what is logged when executing an external script with a `TRACE_LEVEL` of 4. Instead of going back to that post, let us repeat it here:

1. Stop the launchpad service.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Open the `rlauncher.config` file in a text editor and change the value of `TRACE_LEVEL` to 4, and save the file (you need to this as admin). Oh, and keep the setting of `JOB_CLEANUP_ON_EXIT` at 0, as per above.
1. Delete the log files in the `C:\<sql_instance_path>\MSSQL\Log\ExtensibilityLog`
1. Restart the launchpad service.
1. Execute the code again.

On my box, the working directory came back as `67F7F651-8465-4F6B-B90E-0571DD84677D`, and that directory also existed in the directory structure for the used user account, exactly as above. Then drilling down into the `rlauncher.log` file, around the time we executed, we see this (this is heavily redacted, to make it readable):

```
Session(67F7F651-8465-4F6B-B90E-0571DD84677D) [SqlSatellite] created.
Session(67F7F651-8465-4F6B-B90E-0571DD84677D) 
    CleanupOnExit=0, Settings.JobCleanupOnExit=0
Session 67F7F651-8465-4F6B-B90E-0571DD84677D assigned to MSSQLSERVER01 user

ProcessPool(MSSQLSERVER01-ss-2) with minimum processes 5 created
ProcessPool(MSSQLSERVER01-ss-2) 
    started GrowAsyncWorker() thread 11744 [00002DE0].

WorkingDirectory(C:\...\MSSQLSERVER01\C23EA5B2-620C-473A-99F5-8BB37CCDA0B7) 
    created (0)
WorkingDirectory(C:\...\MSSQLSERVER01\3AEBD29C-E024-46F6-A25E-27E680AF9729) 
    created (0)

CreateProces(
    C:\...\R_SERVICES\bin\x64\rterm.exe  --slave --no-restore --no-save 
    -e "library(RevoScaleR); sessionDirectory <- 
    'C:\...\\MSSQLSERVER01\\C23EA5B2-620C-473A-99F5-8BB37CCDA0B7';
    sessionId <- 'C23EA5B2-620C-473A-99F5-8BB37CCDA0B7';
    ...

CreateProces(
    C:\...\R_SERVICES\bin\x64\rterm.exe  --slave --no-restore --no-save 
    -e "library(RevoScaleR); sessionDirectory <- 
    'C:\...\\MSSQLSERVER01\\3AEBD29C-E024-46F6-A25E-27E680AF9729';
    sessionId <- '3AEBD29C-E024-46F6-A25E-27E680AF9729';
 
 ...

Session[67F7F651-8465-4F6B-B90E-0571DD84677D] 
    attached to pooled processes [3AEBD29C-E024-46F6-A25E-27E680AF9729]

...

```
**Code Snippet 3:** *Partial Log from Executing*

From *Code Snippet 3* we see what we also saw in [Internals - III][si3]:

* A session is created.
* A process pool is created.
* Working directories are created.
* Processes are created pointing to the working directories.
* The session created initially is being attached to one of the pooled processes.

But, when looking at the session it has the same "name" as the working directory, and we see how the session is attached to one of the processes. So it seems that the creation of a session also creates a directory. The process that the session is attached to becomes the process the external script is executed under, and the directory created together with the session becomes the working directory. 

Is there any way we can see if the theory of a session-directory being created?

Seeing that we haven't used WinDbg for a while, let's try and see if we can confirm what is happening. In [Internals - III][si3], we looked at the call chain when executing an external script, and it looked something bit like so:

```cpp
1. launchpad!CLaunchContext::LaunchServTask
2.  launchpad!SatelliteSessionManager::ConstructSatelliteSession
2.    launchpad!SatelliteJobObject::CreateSatelliteJobObject
2.      launchpad!SatelliteSessionManager::CreateNewSessionObject
3.        launchpad!CLaunchContext::Launch
4.          Rlauncher!"MiscCalls"
4.            launchpad!SQLSatellite_LaunchProcess
4.              launchpad!CreateProcessForSatelliteSession
4.                launchpad!PhysicalUserContext::LaunchProcess
4.                  KERNELBASE!CreateProcessInternalW
4.          Rlauncher!"MiscCalls"
4.            launchpad!SQLSatellite_LaunchProcess
4.              launchpad!CreateProcessForSatelliteSession
4.                launchpad!PhysicalUserContext::LaunchProcess
4.                  KERNELBASE!CreateProcessInternalW
4.                launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
4.                launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
4.                  launchpad!SatelliteJobObject::AssociateProcess
4.                  launchpad!SatelliteJobObject::AssociateProcess
```
**Code Snippet 4:** *High Level Call Chain*

1. Initially a call to `LaunchServTask` happens.
2. We then create a satellite session, a job object and a session object.
3. We then come into the code path were we launch the launcher and create the RTerm processes: `launchpad!CLaunchContext::Launch`. 
4. In there we do multiple calls to the launcher dll (`Rlauncher!"MiscCalls"`), create the actual processes and assigns that to the job object. We initially create two processes, and one of the processes will be mapped to the session (as we saw from the log-file). This is then repeated multiple times.

So, somewhere in the call chain in *Code Snippet 4*, our directories are created. To try and figure out what happens, let's:

1. Stop the launchpad service.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Restart the launchpad service.
1. Open WinDbg and attach to the launchpad service (you need to run WinDbg as admin).

> **NOTE:** The [Internals - I][si1] has more information how to attach to a process, and what commands to use.

Now, let's set some break points at:

1. `bp launchpad!SatelliteSessionManager::CreateNewSessionObject`
1. `bp KERNELBASE!CreateDirectoryW`
1. `bp launchpad!SQLSatellite_LaunchProcess`

So what we try to do is to establish in what order things happen, and how many times the `KERNELBASE!CreateDirectoryW` is called. While we execute we should also, in file explorer, see what directories are created in the user account directory. Let's run the code now.

The output from the debugger looked for me like this:

``` cpp
Breakpoint 0 hit
launchpad!SatelliteSessionManager::CreateNewSessionObject:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 2 hit
launchpad!SQLSatellite_LaunchProcess:

Breakpoint 2 hit
launchpad!SQLSatellite_LaunchProcess:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 2 hit
launchpad!SQLSatellite_LaunchProcess:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 2 hit
launchpad!SQLSatellite_LaunchProcess:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 2 hit
launchpad!SQLSatellite_LaunchProcess:

Breakpoint 1 hit
KERNELBASE!CreateDirectoryW:

Breakpoint 2 hit
launchpad!SQLSatellite_LaunchProcess:

```
**Code Snippet 5:** *Creation of Directories and Processes*


In *Code Snippet 5* we see how: 

* Three directories are created initially, the first one being the directory for the session. 
* Then two processes, which will use the second and third directory.
* Then one directory followed by one process, until we're done.

**UPDATE & EDIT:** The following is somewhat edited, and I have added a couple of pictures to make things more understandable. I have added *Figure 6*, and *Figure 7* and rearranged (and added) some text.

The above is in line what we discussed in [Internals - III][si3], as well as *Code Snippet 1* where we saw how two directories are created initially, followed by two processes. However, it is not two directories, but three - where the first directory will become the working directory, and the rest of the directories will be backing directories for the R processes.

In [Internals - III][si3] we had a figure like below, in order to show what happens:

![](/images/posts/sql-launchpad_processes_post.png)

**Figure 6:** *Launchpad, Directories and Processes*

We now see that that *Figure 6* is not entirely correct, as it leaves out the creation of the working directory. The following figure (where some of the internal callas are taken out) should be more accurate:

![](/images/posts/sql_r_services_6_launchpad_working_dir.png)
**Figure 7:** *Launchpad, Directories and Processes*

So, that's fine - we now "kind of" understands how the working directory is created. Now, when you look at *Figure 4*, you see that inside one of the created directories are some files, and a sub-directory. When we ran the code after having set the break points, as above, we did not see any `KERNELBASE!CreateDirectoryW` calls which would have created the sub directories. What's up with that, and where do the files in the directories come from, and what do they do? Questions, questions, so many questions. Hopefully we'll get some answers in subsequent posts!

## Summary

When we execute an external script, processes are created with backing directories. The script is executed in a session, and that session do have a backing directory as well. That directory becomes the working directory for the R process the script execute in.

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright
[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[ba]: https://twitter.com/bob_albright

