---
layout: post
title: Microsoft SQL Server R Services - Internals III
author: nielsb
date: 2017-04-13T06:13:14+02:00
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
description: SQL Server R Services series. Here we look at what happens when the launchpad service creates processes in SQL Server R Services.
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe  
---

This is the fourth post in a series about **Microsoft SQL Server R Services**, and the third post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

In the previous internals posts [here][2] and [here][3] we have looked at what goes on inside SQL Server when executing an R script, and what happens in the launchpad service when executing. 

This post was initially to be about the R runtime, and what other parts are involved when executing R scripts in SQL Server. However, during my "spelunking" around I realized that I did not really understand what happens when we create the processes for the R runtime from the launchpad service and the launcher (which is what I covered in the [internals II post][3]). 

So, instead of looking at the R runtime and the other R related components, we'll look at what happens when creating external processes. A subsequent blog-post will cover the R runtime and components.

<!--more-->

To begin with, the code we use in this post to execute R scripts are the same as we have used in the other posts:

``` sql
EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));
GO
``` 
**Code Snippet 1:** *Execute sp_execute_external_script*

The code in *Code Snippet 1* doesn't do much, but it is quite sufficient for our purposes. Having said that, let us get on with it.

## Recap

Let us refresh our memories about what the two previous internals posts covered, by looking at some images from those two posts. In [internals I][2] we said that the following happened when executing what *Code Snippet 1* shows:

![](/images/posts/sql-launchpad_post.png)

**Figure 1:** *Call Flow Executing sp_execute_external_script* 

In *Figure 1* we see how an named pipe connection is opened from the SQL Server engine into the launchpad service, and eventually the routine `sqllang!CSQLSatelliteConnection::WriteMessage` writes a message to the service. The message will at one stage or another cause the `launchpad!CLaunchContext::Launch` routine in the launchpad service to be called.

*Figure 2* below, from the [internals II][3] shows the flow the call in *Figure 1* enters the launchpad service:

![](/images/posts/sql-launchpad-r-post.png)

**Figure 2:** *Launchpad Service Call Flow*

Various routines are called, and eventually `launchpad!PhysicalUserContext::LaunchProcess` is called followed by `KERNELBASE!CreateProcessInternalW` which creates the *RTerm.exe* process, which you can see in *Figure 3*. The script to be executed is sent to the R process in the `launchpad!CSQLSatelliteConnection::WriteMessage` call.

In the beginning of this post I mentioned that I had changed what to cover in this post, and what you see in *Figure 3* is partly why I did that:

![](/images/posts/sql_r_services_launchpad_after_launch_process.png)

**Figure 3:** *RTerm Process* 

We see a number of RTerm processes, why is that? Let us see if we can answer that question as well as see what happens when we create the processes as well as when the R script code executes. To understand how that works we should however first talk about users and user accounts.

## User Accounts

When we execute something in SQL Server we do it in context of a user, either a SQL Server user or Windows user, and SQL Server has the concept of `ISOLATION LEVELS` to ensure that the same code can be executed concurrently. When we execute `sp_execute_external_script` however, we exit SQL Server and the actual execution takes place outside of the SQL Server engine; inside the external runtime. The external engine does not have the notion of `ISOLATION LEVELS`, so if multiple users executed the same script concurrently, bad things could potentially happen. How can we ensure isolation between users executing concurrently?

To ensure isolation, SQL Server R Services creates during installation a pool of Windows accounts in a Windows account group. The group (and accounts) are created per instance of SQL Server R Service. The group for SQL Server R Services installed on the default SQL Server instance is **SQLRUserGroup** and for non-default instances it is **SQLRUserGroupInstanceName**. On my machine I have three installations of SQL Server, with SQL Server R Services installed on all of them, and *Figure 4* shows the groups that have been created:

![](/images/posts/sql_r_services_usergroups.png)

**Figure 4:** *SQL Server R Services User Groups* 

So what does a user group look like then? If we double click on the **SQLRUserGroup**, we'll see something like so:

![](/images/posts/sql_r_services_usergroup_users.png)

**Figure 5:** *Members in User Group* 

The installation of SQL Server R Services creates by default 20 user accounts, named MSSQLSERVER01...20 for the default instance, and InstanceName01...20 for named instances. When executing external scripts the executing user will be mapped to one of these accounts by the launchpad service.

> **NOTE:** The number of accounts created can be altered. See this [MSDN post][4] for information about that.

While executing external scripts, there may be a need to store script objects, intermediate results, etc. For this reason the installation of SQL Server R Services not only creates the user accounts as per above, but it also creates folders for each account where to store the objects, results etc. The folders are created at: `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData`, and are named as the user account. In *Figure 6* below you see an example of this:

![](/images/posts/sql_r_services_userfolders.png)

**Figure 6:** *Folders for User Accounts* 

It is not entirely correct to say that the files, results, etc., are stored directly in the user folder. They are in fact stored in sub-folders of the user folder. Let us do some coding to see an example of the mapping to a user account as well as sub-folders:

1. Stop the launchpad service if it is running.
1. Delete any sub folders of the user account folders in the `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account folders themselves.
1. Restart the launchpad service.
1. Execute the code in *Code Snippet 1*.

When you have executed go to the `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` directory and check in the various user account folders. If you are the only user on the server, you should now see in the *xxx01* folder some sub-folders as in *Figure 7* below:

![](/images/posts/sql_r_services_subfolders.png)

**Figure 7:** *Sub-folders of the User Account Folder* 

If two SQL Server users had executed scripts concurrently two of the user folders would have had sub-folders. If you open one of the sub-folder you should see some files and a folder. This comes from what we mentioned above, about storage of files etc.

The question is why are there more than one sub-folder, since we only executed the code once? The same question can be asked when you look at *Figure 3*, the RTerm processes; why do we have more than one RTerm process for one execution? The other question to ask is if the multiple RTerm processes are related to the multiple sub-folders? We can probably guess that is the case, but can we prove it?

> **NOTE:** Ina future blog-post I'll look into what the files are that are stored in the sub-folders.

## RTerm Processes

The assumption is that there is something in common between the user account's sub-folders and the multiple RTerm processes we saw in *Figure 3*. Let us execute some code and see if we can figure out if our assumption is right. For this we should change the code in *Code Snippet 1* slightly, to inject an artificial pause in the execution. That way it should be easier for us to see what is going on. The code to execute now looks like so:

``` sql
EXEC sp_execute_external_script 
                    @language =N'R',
                    @script=N'OutputDataSet<-InputDataSet;
                              Sys.sleep(120);',
                    @input_data_1 =N'SELECT 42'
WITH RESULT SETS (([TheAnswer] int not null));
```
**Code Snippet 2:** *Execute with Sys.Sleep*

As you can see in *Figure 2*, the code looks almost the same as in *Code Snippet 1*, apart from that we have injected a `Sys.sleep(120)`, which will make the execution stop for 2 minutes. That should give us ample time to do some "spelunking".

> **NOTE:** For this investigation I use **Sysinternals** [*Process Explorer*][5].

So:

1. Stop the launchpad service.
1. Delete any sub folders of the user account folders in the `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` directory. Do **NOT** delete the user account folders themselves. Keep the *File Explorer* open at the `ExtensibilityData` directory.
1. Restart the launchpad service.
1. Start *Process Explorer*, order by Process, and scroll down to where you see process names starting with "RT" (on my box there are none at this stage), or where the processes should be.
    * If you at this stage see RTerm, restart the launchpad service again and kill those processes.
1. Execute the code in *Code Snippet 2*.

While the code is running, take a quick look in *Process Explorer*, and you should see something like so:

![](/images/posts/sql-launchpad-rterm_processes.png)

**Figure 8:** *RTerm Processes*

You will see multiple RTerm processes running, quickly right click on each of them and you'll see some properties like in the figure below:

![](/images/posts/sql-launchpad-rterm_properties.png)

**Figure 9:** *RTerm Process Properties*

When you look in the properties pop-up window, you can see the part highlighted in *Figure 9*, is actually the path and folder name of one of the sub-folders of the user account:

![](/images/posts/sql_r_services_rterm_subfolders.png)

**Figure 10:** *User Account Sub-folders*

*Figure 10* is just to prove that the above is correct. So it seems that our assumption was correct and that there is a one-to-one relationship between the RTerm processes and the sub-folders. 

It looks like we have answered the question above about correlation between the sub-folders and the RTerm processes, but what about the question why? Well, in my opinion it is for performance reasons. By having a pool of processes for a user, it should be quicker to to execute multiple scripts: a new process does not have to be "spun up" for the execution but can be taken from the process pool. 

So how does this work under the covers?

### Process Pools

In the [internals II post][3] I covered how an external runtime is launched. However we are not launching a runtime as such, we are launching multiple runtime processes (in this case `RTerm.exe`). So even if the [previous post][3] is correct, there are more things going on that what was covered there, and that is related to the multiple processes and the process pool I mentioned above. The way I came across this was due to me pondering why there are multiple RTerm processes launched, and if there was any logic behind the number. I quite often saw 5 processes, and 5 or 6 sub-folders.

My initial thought was that this is stored in some config file, and the obvious file would be for the launcher(s), and we looked at this file in the previous post:

![](/images/posts/sql_r_services_rlauncher_config.png)

**Figure 11:** *RLauncher Configuration*

However, the file doesn't contain that much, and nothing that seems to relate to number of processes. There is the `USER_POOL_SIZE` setting, but it is set to 0, so I guess it is not that. When looking at the file, I saw the `TRACE_LEVEL` setting, and I browsed through the web and came across [this post][6], which briefly discusses `rlauncher.config`, In that post they mention the `TRACE_LEVEL` setting which is used to configure the trace verbosity level of the launchpad service, and the traces stored in the log file for the launchers:

* 1 = Error (default)
* 2 = Performance
* 3 = Warning
* 4 = Information

Maybe if we change the `TRACE_LEVEL` to 4, we'd be able to get more information. I stopped the launchpad service, and opened the config file as an administrator and changed the `TRACE_LEVEL` to 4, and saved it. I then deleted all log files in the `C:\<path_to_slq_server_instance>\MSSQL\Log\ExtensibilityLog`, and restarted the launchpad service. 

When opening the `rlauncher.log` file, there is quite a lot if interesting information, and in the code snippet below I have selected out some of the more interesting bits and pieces:

```
[2017-04-09 05:37:50.253]
 # "stuff" from config
 File=C:\<path_to_sql_server_Instance>\MSSQL\Binn\rlauncher.config
 RHome=C:\<path_to_sql_server_Instance>\R_SERVICES
 MpiHome=C:\Program Files\Microsoft MPI
 InstanceName=MSSQLSERVER
 LogDirectory=
      C:\<path_to_sql_server_Instance>\MSSQL\LOG\ExtensibilityLog
 WorkingDirectory=C:\\PROGRA~1\MICROS~2\MSSQL1~1.MSS\MSSQL\EXTENS~1
 WorkingDirectoryLongPath=
      C:\<path_to_sql_server_Instance>\MSSQL\ExtensibilityData

 1.
 SqlSatellitePath=
      C:\<path_to_sql_server_Instance>\MSSQL\Binn\sqlsatellite.dll
 SqlSatelliteRPath=
      C:\<path_to_sql_server_Instance>\MSSQL\\Binn\\sqlsatellite.dll
 SqlSatelliteDirectory=C:\\<path_to_sql_server_Instance>\MSSQL\Binn

 2.
 ProcessPoolingEnabled=1
 ProcessRecycleEnabled=0
 StaleProcessTime=300000 msecs
 StaleProcessPollTime=60000 msecs
 TelemetryFlushInterval=300000

 3.
 ProcessPoolSqlSatelliteGrowth=5
 ProcessPoolRxJobGrowth=3
```
**Code Snippet 3:** *Excerpt from rlauncher.log*

So, some comments about the above:

1. We have some log entries about **SqlSatellite**. This is an API to support external code and external run times. We will see more about it in later blog-posts.
1. Process pooling, settings if it is enabled and when a process is considered stale. In this case a process is considered stale after 5 minutes of inactivity, and we poll every minute against the processes.
1. Aha, settings about size of the pool.

From the above we can see that the number of processes are not a random number. I still can't find where the actual number is stored, so my assumption is that it is hard coded into respective launcher.

If you remember from the [internal II post][3], I said that I believe that the launcher(s) are loaded when the launchpad service starts up. At the end of the log-file we see some entries that points to that as well:

```
SQLSatellite_InitLauncher(600000, 1, 1, 
    C:\<path_to_sql_server_Instance>\MSSQL\LOG\ExtensibilityLog, 
    C:\<path_to_sql_server_Instance>\MSSQL\Binn\sqlsatellite.dll, 
    C:\<path_to_sql_server_Instance>\MSSQL\ExtensibilityData) 
    completed: 00000000
< SQLSatellite_InitLauncher, dllmain.cpp, 157 (4 msecs)
> SQLSatellite_RegisterLaunchContext, dllmain.cpp, 209
    SQLSatellite_RegisterLaunchContext(000000664E9FF750) 
               completed: 00000000
< SQLSatellite_RegisterLaunchContext, dllmain.cpp, 209 (0 msecs)
> SQLSatellite_GetSupportedScriptTypes, dllmain.cpp, 107
    SQLSatellite_GetSupportedScriptTypes(1) completed: 00000000
< SQLSatellite_GetSupportedScriptTypes, dllmain.cpp, 107 (0 msecs)
```
**Code Snippet 4:** *Initialization of Launcher(s)*

The way I read what is in *Code Snippet 4* is that at the very end of the launchpad service startup, launchers are initialized, and information about what script types are supported is retrieved.

We have now seen what happens when the launchpad service is started, and have drawn some conclusions from that. What will the log-file tell us when we execute some code:

1. Stop the launchpad service.
1. Delete any sub folders of the user account folders in the `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` directory. Do **NOT** delete the user account folders themselves.
1. Delete all log files in the `C:\<path_to_slq_server_instance>\MSSQL\Log\ExtensibilityLog`
1. Restart the launchpad service.
1. Execute the code in *Code Snippet 1* (the code without pause).

When looking through the log-file, it is a LOT of information logged. I have tried to excerpt the most important bits below:

```
1.
Session(3291DD7C-4451-48E1-9838-C5A0DF67FA74) 
   CleanupOnExit=1, Settings.JobCleanupOnExit=1
Session 3291DD7C-4451-48E1-9838-C5A0DF67FA74 
   assigned to MSSQLSERVER01 user

2.
ProcessPool(MSSQLSERVER01-ss-2) with minimum processes 5 created

3. 
WorkingDirectory(C:\...\MSSQLSERVER01\5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF) created (1)
WorkingDirectory(C:\...\MSSQLSERVER01\E7AB7781-A8C7-421F-BAA0-074075B41082) created (1)

4.
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

5.
Assigning PooledProcess(..., ..., 5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF, 
    C:\...\R_SERVICES\bin\x64\rterm.exe) 
    to Job PooledProcess-5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF(0000081C)
Assigning PooledProcess(..., ..., E7AB7781-A8C7-421F-BAA0-074075B41082, 
    C:\...\R_SERVICES\bin\x64\rterm.exe) 
    to Job PooledProcess-E7AB7781-A8C7-421F-BAA0-074075B41082(00000804)

6.
Session[3291DD7C-4451-48E1-9838-C5A0DF67FA74] 
    attached to pooled processes [5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF]

7.
WorkingDirectory(C:\...\A379EE0B-385A-41A9-86C3-A5C9D1FFDE7F) created (1)
CreateProces
    C:\...\R_SERVICES\bin\x64\rterm.exe
    ...
    sessionId <- 'A379EE0B-385A-41A9-86C3-A5C9D1FFDE7F';

8. This is interleaved with 7
SQLSatellite_LaunchSatellite(1, 3291DD7C-4451-48E1-9838-C5A0DF67FA74, 
    1, 51008, nullptr, 000000CC5ADFE720, 
    C:\...\ExtensibilityData\MSSQLSERVER01) completed: 00000000    

7a. here we continue with creation of processes started at 7
Assigning PooledProcess(..., ..., A379EE0B-385A-41A9-86C3-A5C9D1FFDE7F, 
    C:\...\R_SERVICES\bin\x64\rterm.exe) 
    to Job PooledProcess-A379EE0B-385A-41A9-86C3-A5C9D1FFDE7F(00000854)

...

9. 
ProcessPool(MSSQLSERVER01-ss-2) adding PooledProcess(..., ..., 
    E7AB7781-A8C7-421F-BAA0-074075B41082, 
    C:\...\R_SERVICES\bin\x64\rterm.exe)
ProcessPool(MSSQLSERVER01-ss-2) adding PooledProcess(..., ..., 
    A379EE0B-385A-41A9-86C3-A5C9D1FFDE7F, 
    C:\...\R_SERVICES\bin\x64\rterm.exe)
ProcessPool(MSSQLSERVER01-ss-2) adding PooledProcess(..., ..., 
    8CE5541F-3A70-4538-9329-9A74FC0580DE, 
    C:\...\R_SERVICES\bin\x64\rterm.exe)
ProcessPool(MSSQLSERVER01-ss-2) adding PooledProcess(..., ..., 
    97608E5B-B70D-4E69-9D6D-56BEC2FC0F81, 
    C:\...\R_SERVICES\bin\x64\rterm.exe)
ProcessPool(MSSQLSERVER01-ss-2) adding PooledProcess(..., ..., 
    74E3C23C-56B6-4A16-B1E3-E4C00335FB97, 
    C:\...\R_SERVICES\bin\x64\rterm.exe)

10.
Job PooledProcess-5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF(0000081C) 
    WaitAll(1, 5000) completed with 0
Job PooledProcess-5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF(0000081C) 
    destroyed
~WorkingDirectory
    (C:\...\MSSQLSERVER01\5F3BEB48-4E0A-4D0C-ACCF-3D8C6EB972EF) 
    deleted (0)
11.
Session 3291DD7C-4451-48E1-9838-C5A0DF67FA74 
   removed from MSSQLSERVER01 user
Session(3291DD7C-4451-48E1-9838-C5A0DF67FA74) 
    [SqlSatellite] deleted. Elapsed time: 1222 msecs

```
**Code Snippet 5:** *Log when Executing Script*

Geez, quite a lot of information, and - as I mentioned above - I have tried to just show the log entries that I deem important. The entries themselves are also abbreviated quite a bit. So what do we see:

1. We create a session for this request, and assigns the session to the executing user (MSSQLSERVER01).
1. A pool for the processes is created.
1. Two working directories (sub-folders) are created for the user (MSSQLSERVER01).
1. Two physical RTerm process are created and assigned the id of the sub-folders.
1. The processes are added to a job object (which has been created prior to this).
1. The session is attached to one of the two processes. This process will now execute the request.
1. Four new processes and working directories are created. Interleaved with this is point 8 (below). The existing session is not assigned to any of these. At this stage there are 6 processes in total, two from the original process creation and these four new ones. Five of these processes do not have any session attached.
1. From what I can gather, here is where the request is actually executed. 
1. The 5 processes without the session are added to the process pool, and are available for new requests from the same user.
1. The process which executed the request finishes and is being destroyed.
1. The session is removed and deleted.

From the above we can see how processes are created and then being pooled. The processes will eventually be torn down if they are not in use, as per the `StaleProcessTime` in *Code Snippet 3*.

How does all this now fit into what we covered in the [internals II post][3], and *Figure 2* above? 

## WinDbg

Well, let us try to find out. For this we use our trusty WinDbg (go back to the [internals I post][2] if you need a re-fresher about WinDbg):

1. Stop the launchpad service.
1. Delete any sub folders of the user account folders in the `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` directory. Do **NOT** delete the user account folders themselves.
1. Delete all log files in the `C:\<path_to_slq_server_instance>\MSSQL\Log\ExtensibilityLog`
1. Restart the launchpad service.
1. Attach WinDbg to the launchpad process.

As we did in the [internals I post][2], let's hunt for routines from the symbols. When looking at the log files above we see some references to `SQLSatellite` and in previous posts we have also seen satellite references. So, let us do a very coarse search: `x /n launchpad!*Satellite*`. By using the `/n` flag you sort everything by name, which can make things a bit more readable. Looking through what was returned, I have below listed some classes that looks interesting as well a couple of independent routines:

``` cpp
//classes
launchpad!CSQLSatelliteCommunication
launchpad!CSQLSatelliteConnection
launchpad!CSQLSatelliteMessage
launchpad!CSatelliteCargoContext
launchpad!CSatelliteRuntimeContext
launchpad!SatelliteJobObject
launchpad!SatelliteSession
launchpad!SatelliteSessionManager
launchpad!Satellite_ResourceManager

//independent routines
launchpad!CreateProcessForSatelliteSession
launchpad!SQLSatellite_Init
launchpad!SQLSatellite_InitLaunchContext
launchpad!SQLSatellite_LaunchProcess
```
**Code Snippet 6:** *Interesting Output*

Having identified interesting classes and function as in *Code Snippet 6*, it is time to fine interesting routines, and through trial and error (setting breakpoints and executing code) finding out what is happening. I eventually arrived at the following (please remember from the previous post that I do not have symbols for the `RLauncher.dll`):

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
4.          Rlauncher!"MiscCalls"
4.            launchpad!SQLSatellite_LaunchProcess
4.              launchpad!CreateProcessForSatelliteSession
4.                launchpad!PhysicalUserContext::LaunchProcess
4.                  KERNELBASE!CreateProcessInternalW
5.  launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo
5.    launchpad!CSQLSatelliteConnection::WriteMessage
4.                launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
4.                 launchpad!SatelliteJobObject::AssociateProcess
6.          Rlauncher!"MiscCalls"
6.            launchpad!SQLSatellite_LaunchProcess
6.              launchpad!CreateProcessForSatelliteSession
6.                launchpad!PhysicalUserContext::LaunchProcess
6.                  KERNELBASE!CreateProcessInternalW
6.                launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
6.                  launchpad!SatelliteJobObject::AssociateProcess
6.          Rlauncher!"MiscCalls"
6.            launchpad!SQLSatellite_LaunchProcess
6.              launchpad!CreateProcessForSatelliteSession
6.                launchpad!PhysicalUserContext::LaunchProcess
6.                  KERNELBASE!CreateProcessInternalW
6.                launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
6.                  launchpad!SatelliteJobObject::AssociateProcess
6.          Rlauncher!"MiscCalls"
6.            launchpad!SQLSatellite_LaunchProcess
6.              launchpad!CreateProcessForSatelliteSession
6.                launchpad!PhysicalUserContext::LaunchProcess
6.                  KERNELBASE!CreateProcessInternalW
6.                launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
6.                  launchpad!SatelliteJobObject::AssociateProcess
7.          launchpad!SatelliteSessionManager::DestroySatelliteSession
7.            launchpad!SatelliteSessionManager::RemoveSessionObjectFromStore
```            
**Code Snippet 7:** *High Level Call Chain*

From *Code Snippet 7* we see how we:

1. Call `LaunchServTask`
2. Creating a satellite session, a job object and a session object.
3. We then come into the code path were we launch the launcher and create the RTerm processes: `launchpad!CLaunchContext::Launch`. 
4. In there we do calls to the launcher dll (`Rlauncher!"MiscCalls"`), create the actual processes and assigns that to the job object. We initially create two processes, and one of the processes will be mapped to the session (as we saw from the log-file).
5. The calls `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo` and `launchpad!CSQLSatelliteConnection::WriteMessage` is where the script is sent to the R process and executed. These calls are interleaved with the create process calls.
6. We continue creating processes until we have six in total.
7. The executing process (and session) is torn down when the execution has finished. 

> **NOTE:** While the code executes we may see six RTerm processes.

## Summary

So, what does all this come to then? We have *Figure 2* which originates from the [internals II post][3], where we looked into what is going on in the launchpad service. In this post we have seen the log files in *Code Snippet 3, 4, 5* and then we have the WinDbg output in *Code Snippet 7*. In *Figure 12* I try to summarize what we have discussed in this post:

![](/images/posts/sql-launchpad_processes_post.png)

**Figure 12:** *Summary*

In *Figure 12* we see: 

* How there are backing folders in `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` for the group of user accounts that are mapped to SQL Server users when executing code via `sp_execute_external_script`. These backing folders will be storage for files etc., when executing. 
    * The files are not placed directly in the account folder but in sub-folders created when the processes are created (see below).
* When executing we, as in *Code Snippet 7*, call `launchpad!CLaunchContext::LaunchServTask`, and create a satellite session and a session object.
* We then go on and start creating working directories (the sub-folders mentioned above), and processes. In the figure the working directories are named `WorkingDir1` etc., whereas in reality the names are `Guid` values. The processes are RTerm processes and are assigned the same `Guid` as the working directory name. So a RTerm process always executes "under" one user account sub-folder.
* After two initial directories and processes have been created, one of the two processes are assigned to the created session.
* When the process has been assigned to the session, the script is executed via; `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo` and `launchpad!CSQLSatelliteConnection::WriteMessage`. This normally happens while the third process is created.
* Processes and working directories 4 - 6 are created. These processes are available for subsequent executions.
* When the execution has finished the session is torn down together with the process.
    * At this stage we now have 5 processes running, and 5 working folders. 

As was the case in the [internals II post][3], some parts of this post is educated guesswork. If anyone have more information I wild be more than happy to correct any inaccuracies. In either case, I hope you have enjoyed this journey in the "bowels" of the launchpad service.

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[1]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[2]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[3]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[4]: https://docs.microsoft.com/en-us/sql/advanced-analytics/r-services/modify-the-user-account-pool-for-sql-server-r-services
[5]: https://technet.microsoft.com/en-us/sysinternals/processexplorer.aspx
[6]: https://docs.microsoft.com/en-us/sql/advanced-analytics/r-services/configure-and-manage-advanced-analytics-extensions

