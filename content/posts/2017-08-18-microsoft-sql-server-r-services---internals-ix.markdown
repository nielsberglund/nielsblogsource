---
layout: post
title: Microsoft SQL Server R Services - Internals IX
author: nielsb
date: 2017-08-18T17:44:22+02:00
comments: true
categories:
  - SQL Server R Services
  - SQL Server
  - Microsoft R Server
  - Data Science 
  - SQL Server R Services Series
  - SQL Server Machine Learning Services
tags:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - BxlServer.exe
  - SqlSatellite.dll
description: Where we look at SqlSatellite and communication between SQL Server R Services components
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - BxlServer.exe
  - SqlSatellite.dll   
---

This is the tenth post in a series about **Microsoft SQL Server R Services**, and the ninth post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

We are now nearing the end of the Internals part of this series (you probably say "about time"). When I started this series way back in March this year, I thought that the Internals would be two, maximum three episodes. Boy was I wrong!

In this post we'll look at how the various components are communicating with each other.

<!--more-->

## Recap

In [Internals - VIII][si8] we looked at what different components are involved when we execute `sp_execute_external_script`:

* SQL Server calls into the launchpad service.
* The launchpad service calls into the `Rlauncher.dll`.
* The `Rlauncher.dll` creates Rterm processes.
* Through Rterm, the `R.dll` is loaded together with `RxLink.dll`.
* The `RxLink.dll` creates the `BxlServer.exe` process.
* To coordinate with SQL Server, `BxlServer.exe` loads `BxServerLink.dll`.

The above can be illustrated as in *Figure 1* below

![](/images/posts/sql_r_services_8_arch_overview.png)

**Figure 1:** *Components In Play*

The questions are though how the components are communicating and what is involved in getting back to SQL Server after `BxlServer.exe` and `BxServerLink.dll` have done their "magic"?

## Demo Code

Before we drill into the questions above, let's look at the demo code we'll use. Let's start with setting up the database and a table with some data we can use. All in all 1 million rows:

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

DROP TABLE IF EXISTS dbo.rand_1M
CREATE TABLE dbo.rand_1M(RowID bigint identity primary key, y bigint, 
                          rand1 bigint, rand2 bigint, rand3 bigint, rand4 bigint, 
                          rand5 bigint);

INSERT INTO dbo.rand_1M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(1000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS bigint) 
  , CAST(ABS(CHECKSUM(NEWID())) % 20 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 25 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 14 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 50 AS bigint)
  , CAST(ABS(CHECKSUM(NEWID())) % 100 AS bigint)
FROM sys.objects o1
CROSS JOIN sys.objects o2
CROSS JOIN sys.objects o3
CROSS JOIN sys.objects o4;
GO
```
**Code Snippet 1:** *Setup of Database, Table and Data*

The data is more or less the same data we used in [Internals - V][si5], and the code to execute looks also almost the same: 

```sql
EXEC sp_execute_external_script
          @language = N'R'
        , @script = N'
             #Sys.sleep(10)
             pid <- Sys.getpid()
             d <- getwd()
             cat(paste0("ProcessId: ", pid))
             cat("\n")
             cat(paste0("WorkDir: ", d))
             cat("\n")
             r <- rxLinMod(y ~ rand1 + rand2 + rand3 + rand4 + rand5, 
                           data=InputDataSet)
             coef <- r$coefficients
             icept <- coef[1];
             OutputDataSet <- data.frame(pid=pid, nRows=r$nValidObs, 
                                          intercept=icept)'
       , @input_data_1 = N'
              SELECT y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_10M'
       
WITH RESULT SETS ((pid BIGINT NOT NULL, nRows BIGINT NOT NULL, 
                   intercept FLOAT NULL)); 
```
**Code Snippet 2:** *Code to Execute*

In *Code Snippet 2* we see how we read in data from the statement in the `@input_data_1` parameter. The actual R code retrieves the process id and work directory and assigns them to the `pid` and  `d` variables which then are printed out through the `cat` statements. After a model has been created in `rxLinMod` some information about the model is returned as a resultset from the `OutputDataSet` variable. The schema of the resultset is defined in `WITH RESULT SETS ...`. For us to be able to determine what is happening when executing the code, there is a `Sys.sleep` statement, which for now is commented out. Before we go any further, let's make sure it works:

1. Restart the launchpad service (stop and start).
1. Execute the code in *Code Snippet 2*.

If everything has worked OK, the Results tab in SSMS should look something like in *Figure 2*, and the Message tab like in *Figure 3*:

![](/images/posts/sql_r_services_9_test_result.png)

**Figure 2:** *Results from Running the Code*

![](/images/posts/sql_r_services_9_test_msgs.png)

**Figure 3:** *Message Output from Running the Code*

As we know that the execution of the R code happens outside of SQL Server, the question is what component(s) are responsible for returning results and messages to SQL Server. Before looking at that, let's look at how communication happens between the various components.

## Communication

The components we are interested in the communication between are:

* SQL Server -> Launchpad
* launchpad -> Rterm
* Rterm -> BxlServer

#### SQL Server -> Launchpad

So, let's start with the communication between SQL Server and the launchpad service. In [Internals - I][si1] and [Internals - II][si2] we used WinDbg and we saw how SQL Server calls (among other things) `sqllang!CSQLSatelliteConnection::OpenNpConnection` to create and open a named pipe to the launchpad service. Let us make double sure that there really is named pipe involved, and the way we'll do that is by using **WinDbg** and [**Process Explorer**][pe].

What we'll do is:

1. Restart SQL Server and the launchpad service (please, do not do this on a production server :) ).
1. Start WinDbg and Process Explorer as admin.
1. In Process Explorer, ensure that the lower pane is visible (Ctrl + L).

To begin we'll see what named pipes SQL Server has created "out of the box" so to speak. Named pipes are exposed as handles in Process Explorer, so by clicking on the `sqlserver.exe` process in Process Explorer and then Ctrl + H you should see handles in the lower pane. By ordering on name and scrolling down to `Device\Named` pipe, you should see something like so:

![](/images/posts/sql_r_services_9_sql_named_pipes1.png)

**Figure 4:** *SQL Server Initial Named Pipes*

As we see in *Figure 4*, we have (at least on my machine) six named pipes. There is nothing that would indicate a named pipe to the launchpad service.

Now you can go on and see what named pipes (if any) the launchpad service (`launchpad.exe`) has. On my machine it looks like this:

![](/images/posts/sql_r_services_9_launchpad_named_pipes1.png)

**Figure 5:** *Launchpad Named Pipes*

Hmm, that is interesting - there are two named pipes with a name similar to what we have seen in previous posts: *sqlsatellite*. However, since the launchpad service is inactive right now, it seems those two named pipes are not connected to anything. 

So far we do not have any evidence of named pipes between SQL Server and the launchpad service, but on the other hand we have not executed anything yet either (since the restart). Let us now go on and execute the code in *Code Snippet 2* again, but before we do that let us do what we did in [Internals - I][si1] and set a breakpoint at `sqllang!CSQLSatelliteConnection::OpenNpConnection`. So attach WinDbg to the `sqlserver.exe` process and set the breakpoint. 

Before you execute the code, uncomment the `Sys.sleep` call and change the time to sleep to 30 seconds (`Sys.sleep(30)`), so you can investigate what is happening. Now, go ahead and execute.

The breakpoint is hit and execution stops. Look in Process Explorer and see what named pipes there are both for SQL Server as well as the launchpad service. At this stage there should not be any more named pipes than what you see in *Figure 4* and *Figure 5*. Continue execution of the code, and look again in Process Explorer. You should now see for SQL Server something like in *Figure 6*:

![](/images/posts/sql_r_services_9_sql_named_pipes2.png)

**Figure 6:** *SQL Server Named Pipes*  

For the launchpad service it looks something like *Figure 7*:

![](/images/posts/sql_r_services_9_launchpad_named_pipes2.png)

**Figure 7:** *Launchpad Named Pipes During Execution*  

We see now how for SQL Server we have a new named pipe: `\Device\NamedPipe\sqlsatellitelaunch`, and for the launchpad service a corresponding additional named pipe: `\Device\NamedPipe\sqlsatellitelaunch`. By now we should be fairly certain that communication between SQL Server and the launchpad service is through named pipes.

#### Launchpad -> Rterm

> **NOTE:** The heading above is somewhat misleading as it is not `Launchpad.exe` that connects to Rterm but `Rlauncher.dll`, however we'll use launchpad for now. 

When I started writing this section, I thought: "how hard can this be, the launchpad service obviously talks to Rterm via named pipes". It turned out to be not that simple. The way I went about "proving" (or not) that named pipes were used was similar to what we did above between SQL Server and the launchpad service, but initially I didn't use WinDbg:

1. Restart SQL Server and the launchpad service.
1. Make sure Process Explorer is up and running.
1. Set a sufficiently high `Sys.sleep` value in the code (I ended up using 120 seconds).
1. Execute the code.

When I at this stage looked at the handles for the launchpad service, I saw the three named pipes we saw in *Figure 7*. That would make sense, we know that one of them is the named pipe connection from SQL Server, and then one of the other two would be used between the launchpad service and Rterm.

> **NOTE:** When using named pipes, and you look at them in Process Explorer, you should see the same name in both source as well as destination.

The problem was that I did not see a named pipe in the executing Rterm process, with the same name as in the launchpad service. Hmm, there went that theory. Well, if named pipes are not used, what about TCP/IP and sockets? So I noted the PID of the launchpad service, executed the code again, and while the code was running I (from command line) used `netstat` to see what socket connections there were. The command I used was `netstat -a -n -o`, which means:

* show all connections and listening ports (`-a`).
* display addresses and port numbers in in numerical form (`-n`).
* display the owning PID associated with each connection (`-o`).

I looked for the PID of the launchpad service to see if there were any connections, but none could be found. Now the original question of "how hard can this be" had an answer - "actually, pretty hard"! At this stage I resorted to some WinDbg ["spelunking"][1], and looked for "promising" routine names. Seeing that a lot of the routines we have seen so far in this series comes from classes with "satellite" in them I executed: `x *!*satellite*`. Eish, that returned a **lot**. However, while scrolling through the output, I came across following routine: `launchpad!CSQLSatelliteConnection::AddProviderDoneIOCPCallback`. Hmm, something that has to do with callback from `IOCP`, could it be that the launchpad service connects via IO Completion Ports (IOCP)? Only one way to find out - set some breakpoints in WinDbg.

In [Internals - II][si2] where we discussed what happens inside the launchpad service, we had a diagram of the flow of a call looking like so:

![](/images/posts/sql-launchpad-r-post.png)

**Figure 8:** *Launchpad Service Call Flow*

In *Figure 8* we see how the communication to Rterm is done in the `launchpad!CSQLSatelliteConnection::WriteMessage` call, so the setup of the IOCP should be done before the `WriteMessage` call, and most likely after the `LaunchServTask` call. So in the already attached WinDbg, I set three breakpoints:

* `bp launchpad!CLaunchContext::LaunchServTask`
* `bp KERNELBASE!CreateIoCompletionPort` (I had read documentation of IOCP and saw that this was a likely call).
* `bp launchpad!CSQLSatelliteConnection::WriteMessage`

If my theory was to be correct, I would see the execution first stop at `LaunchServTask`, followed by `CreateIoCompletionPort` and then finally at `WriteMessage`. I executed the code in *Code Snippet 2* with `Sys.sleep(10)` and this is what I saw in WinDbg:

``` cpp
0:028> g
Breakpoint 3 hit
launchpad!CLaunchContext::LaunchServTask:
0:009> g
Breakpoint 0 hit
KERNELBASE!CreateIoCompletionPort:
0:011> g
Breakpoint 1 hit
launchpad!CSQLSatelliteConnection::WriteMessage:
0:009> g
```
**Code Snippet 3:** *Launchpad Breakpoints being Hit*

This to me indicates that yes, IOCP is being used as communication mechanism between the launchpad service and Rterm.

#### Rterm -> BxlServer

In [Internals - VIII][si8] we spoke about `BxlServer.exe`, how it hosts RevoScaleR code and how it also coordinates with the R runtime in order to manage exchanges of data with SQL Server. The `BxlServer.exe` process is created by the Rterm process via the `RxLink.dll` which acts as a conduit. The source code for `RxLink.dll` is [available][3], and when I had a look at the source, I saw quite a lot of code related to named pipes. So my assumption is that communication between the Rterm process (via `RxLink.dll`) and the BxlServer process happens through named pipes.

Seeing that I don't have any debug symbols for `Rterm.exe`, `R.dll`, `RxLink.dll` or `BxlServer.exe` we'll try and use other methods to prove (or disprove) that named pipes are used. The way we'll do it is to use Process Explorer as we did with the communication between SQL Server and the launchpad service. Now is probably a good time to restart both the SQL Server service as well as the launchpad service (just to start afresh).

After the SQL Server and the launchpad service has been restarted bring back Process Explorer again (as admin). This time though we'll look at the Rterm process and the hosted BxlServer process:

1. In Process Explorer navigate to the launchpad process.
1. Set big enough `Sys.sleep` value in the code. 90 seconds worked fine for me.

When executing the code, look in Process Explorer for the Rterm process and BxlServer process where you have a `CPU` value greater than 0:

![](/images/posts/sql_r_services_9_rterm_bxlserver.png)

**Figure 8:** *Rterm and BxlServer Processes*

In *Figure 8* we see the Rterm and BxlServer processes that are active. When you have found the active processes check if there are any named pipe handles for those two processes (Ctrl+H):

![](/images/posts/sql_r_services_9_rterm_nps.png)

**Figure 9:** *Rterm Named Pipes*

![](/images/posts/sql_r_services_9_bxlserver_nps.png)

**Figure 10:** *BxlServer Named Pipes*

*Figure 9* and *Figure 10* show the named pipes file handles for the Rterm process (*Figure 9*), and BxlServer process (*Figure 10*). As we can, the same named pipes exists in both processes (they have the same names), so we can with some certainty say that communication between Rterm and BxlServer is done via named pipes. With this in mind we can enhance *Figure 1* and show the communication mechanisms:

![](/images/posts/sql_r_services_9_comms1.png)

**Figure 11:** *Communication Mechanisms*

In *Figure 11* the numbers indicate:

* 1 - named pipe.
* 2 - IOCP.
* 3 - named pipe. 

## SqlSatellite

Now, we've seen how the various components are communicating with each other, but - how is data exchanged? E.g, how does a resultset get back to SQL Server, and does the print (`cat`) statements travel back the same way? In *Figure 11* wee see how the BxlServer is doing "stuff" and then interacts with BxServerLink, but it kind of stops there. Surely a dataset like in our code wouldn't go back over the IOCP? Would there be any other components in play? Let's see what we can find out.

Once again use the Process Explorer, but now we are interested in what dll's the BxlServer loads while it's running. Execute the code again, and when you have found the "active" BxlServer process do a Ctrl+D to find the loaded dlls, and see what "pops up":

![](/images/posts/sql_r_services_9_sqlsatellite.png)

**Figure 12:** *SqlSatellite.dll*

When we look at the various dll's that are loaded by BxlServer we come across a name we have seen and briefly mentioned before: `SqlSatellite.dll`. In Internals [II][si2], [III][si3] and [VII][si7] we saw how paths were set, pointing to where the `sqlsatellite.dll` is located. In [Internals - III][si3] we also mentioned how SqlSatellite is an API to support external code and external run times. It is loaded by the BxlServer process and it handles data transfers between SQL Server and external languages (in this case R).

#### Communication

Now we have an idea who handles data exchange (at least some of it), but what mechanism is used? Named pipes could be an option, and we saw in SQL Server that named pipe: `\Device\NamedPipe\sqlsatellitelaunch`. However, that pipe is used by SQL Server for communication with the launchpad service, and there were really no other named pipes that seemed to fit in. How about sockets and TCP/IP? That could be an option, let's see.

Once again, do a restart of SQL Server as well as the launchpad service to make sure we are in a clean state. Make a note of the process id (PID) of SQL Server, well use it to see what socket connections SQL Server has. If Process Explorer is not running, start it up as admin. When SQL Server is restarted check what TCP connections we have by running the `netstat -a -n -o -p TCP` command.

``` cpp 
TCP    127.0.0.1:1434         0.0.0.0:0              LISTENING       2900
TCP    127.0.0.1:52637        0.0.0.0:0              LISTENING       2900
```
**Code Snippet 4:** *TCP Connections SQL Server*

The PID for SQL Server after I restarted was 2900, and from *Code Snippet 4* we can see two listening connections, with no source as of yet. The listener for port 1434 is for the SQL Server Browser Service, whereas port 52637 is something of a mystery. Let's now execute our code and see if anything changes (I set `Sys.sleep` to 90 seconds to make sure I had enough time to see what happens). While the code is executing run `netstat -a -n -o -p TCP -b` (`-b` will display the executable involved in creating the connection). When I executed the code and ran the netstat command I saw the following:

``` cpp
TCP    127.0.0.1:1434         0.0.0.0:0              LISTENING       2900
[sqlservr.exe]
TCP    127.0.0.1:52637        0.0.0.0:0              LISTENING       2900
[sqlservr.exe]
TCP    127.0.0.1:52637        127.0.0.1:64511        ESTABLISHED     2900
[sqlservr.exe]
TCP    127.0.0.1:64511        127.0.0.1:52637        ESTABLISHED     8088
[BxlServer.exe]
```
**Code Snippet 5:** *TCP Connections SQL Server while Executing*

That is interesting! From *Code Snippet 5* we see how SQL Server now has an established TCP connection on port 52637, and the connection originates from PID 8088. That PID is `BxlServer.exe`, and - as we know from earlier - `BxlServer.exe` loads `SqlSatellite.dll`. We now have a TCP/IP connection from SqlSatellite to SQL Server, and it is over that connection data is exchanged.

> **NOTE:** Not all data is exchanged over the TCP/IP socket connection, as we will see in next post.

Finally, let's do some more WinDbg "spelunking" in order to understand how and when the TCP connection is established: 

1. Restart SQL Server and the launchpad service, to clean things up.
1. Attach WinDbg to the SQL Server process
1. Browse symbols with the name TCP 

When browsing for the symbols, you can use this command: `x /1 *!TCP*`. By using the option `/1` you'll only see the names, and no addresses. On my machine that gives me quite a lot, but there are two entries that catch my eye: `sqllang!Tcp::AcceptConnection` and `sqllang!Tcp::Close`. So let us set breakpoints at those two symbols, and see what happens when we execute our code. 

The result when executing the code is that we initially break at `sqllang!Tcp::AcceptConnection`. Followed somewhat later by breaking at `sqllang!Tcp::Close`. Cool, this seems to work - let us set some more breakpoints and try to figure out the flow of events. 

To be able to see the flow, we need to involve the launchpad service as well, as it is that service who "spins up" the Rterm process who in turn creates the BxlServer process who loads BxServerLink as well as SqlSatellite. So, remember from [Internals - III][si3] what the code looked like (from a very high level) to create the executing Rterm processes, it was something like this:

``` cpp
launchpad!SQLSatellite_LaunchProcess
launchpad!CreateProcessForSatelliteSession
launchpad!PhysicalUserContext::LaunchProcess
  KERNELBASE!CreateProcessInternalW
launchpad!Satellite_ResourceManager::AssociateProcessToJobObject
launchpad!SatelliteJobObject::AssociateProcess
launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo
launchpad!CSQLSatelliteConnection::WriteMessage
```
**Code Snippet 6:** *Launchpad Code Flow*

As discussed in [Internal - II][si2] and [Internals - III][si3], when an external script is executed 6 different Rterm processes are "spun" up, bit only one will be the executing process, and the code in *Code Snippet 6* illustrates the code creating the executing Rterm process.

With this in mind, let us:

1. Stop the launchpad service.
1. Delete any sub folders of the user account folders in the `C:\<path_to_sql_server_instance>\MSSQL\ExtensibilityData` directory. Do **NOT** delete the user account folders themselves.
1. Restart the launchpad service.
1. Attach WinDbg to the launchpad process.

Set breakpoints in the attached launchpad process at (make sure that the SQL Server breakpoints are enabled):

* `bp launchpad!SatelliteJobObject::AssociateProcess`.
* `bp launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo`.
* `bp launchpad!CSQLSatelliteConnection::WriteMessage`.

What we now want to do is to run the two WinDbg instances side by side and see when the individual breakpoints are hit, and in what order. Before we begin, clear out the WinDbg command output (`.cls`). Execute the code and look closely at what happens in the two WinDbg instances. 

What I see on my machine is that I break two or three times in launchpad at `launchpad!SatelliteJobObject::AssociateProcess`, and after the second or third break, I break at `sqllang!Tcp::AcceptConnection` in SQL Server. That is followed by `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo` and `launchpad!CSQLSatelliteConnection::WriteMessage`, plus more `launchpad!SatelliteJobObject::AssociateProcess`. After a while I receive two more `launchpad!CSQLSatelliteConnection::WriteMessage` in the launchpad service and a `sqllang!Tcp::Close` in SQL Server.

The conclusion I draw from this is that after the executing Rterm process has been created (and BxlServer, BxLinkServer and SqlSatellite), SqlSatellite connects into SQL Server.

You may notice that the `launchpad!CSQLSatelliteConnection::WriteMessage` breakpoint will be hit a couple of times after the SQL Server `sqllang!Tcp::AcceptConnection`. We'll discuss that in the next Internals blogpost.

## Summary

In this post we set out trying to determine what communication mechanisms there are between the various components interacting when `sp_execute_external_script` is called. We also saw how a "new" component `sqlsatellite.dll` is in the mix, and in the next blogpost in the Internals series we'll look more in detail what it does.

So, *Figure 13* below illustrates quite well the communication mechanisms between the various components:

![](/images/posts/sql_r_services_9_comms2.png)

**Figure 13:** *How Communication Happens*

The figure looks quite like *Figure 11* and the numbers indicate:

* 1 - named pipe.
* 2 - IOCP.
* 3 - named pipe. 
* 4 - TCP/IP

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[pe]: https://technet.microsoft.com/en-us/sysinternals/processexplorer.aspx
[1]: http://queue.acm.org/detail.cfm?id=945136
[2]: https://msdn.microsoft.com/en-us/library/windows/desktop/aa365198%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
[3]: https://packages.revolutionanalytics.com/tools/src/rre-gpl-src.8.0.3.tar.gz

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}

