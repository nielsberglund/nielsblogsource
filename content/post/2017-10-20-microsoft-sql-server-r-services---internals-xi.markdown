---
layout: post
title: Microsoft SQL Server R Services - Internals XI
author: nielsb
date: 2017-10-20T18:42:47+02:00
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
  - SqlSatellite
description: What are the two strange TCP/IP packets sent from SQL Server to SqlSatellite, and who sends them?
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - SqlSatellite
---

This is the twelfth post in a series about **Microsoft SQL Server R Services**, and the eleventh post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

In the last [post][si10] we spoke about how the transfer of data happens between SQL Server and the R components, and we saw how data was transferred over the TCP connection between the **SqlSatellite** and SQL Server. In the post we mentioned that the protocol being used is  **Binary eXchange Language** protocol(**BXL**), and this post was supposed to talk about BXL.

<!--more-->

However, while I was investigating BXL I did some WinDbg ["spelunking"][1] in SQL Server and came across some interesting "stuff" that ties into how data is being sent, so I decided to post about that instead (a future post will definitely cover BXL).

## Recap

In [Internals - X][si10], as mentioned above, we looked at how data was transferred from SQL Server to R. By using **WireShark** we could see how the data was transferred over the TCP connection between the **SqlSatellite** and SQL Server. 

> **NOTE:** We discussed the communications mechanisms in general and the TCP connection specifically in [Internals - IX][si9].

To see what happens in SQL Server as well as the launchpad service when a script executes we set some break-points in WinDbg, for both processes:

* SQL Server: `sqllang!SpExecuteExternalScript`
* SQL Server: `sqllang!CSQLSatelliteConnection::OpenNpConnection`
* SQL Server: `sqllang!CSQLSatelliteConnection::WriteMessage`
* SQL Server: `sqllang!CUDXR_ExternalScript::ConnectToSatellite`
* Launchpad: `launchpad!Np::AcceptConnection`
* Launchpad: `launchpad!Np::ReadAsync`
* Launchpad: `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo`
* Launchpad: `launchpad!CSQLSatelliteConnection::WriteMessage`

The script used when investigation what happens is very simple:

```sql
exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
                 d<-42'
```
**Code Snippet 1:** *Basic External Script*

The reason for using simple code like in *Code Snippet 1*, is that it might make it easier to understand what is happening, and we can compare with what is happening when executing some other, not so basic, code. Notice how in *Code Snippet 1* there is a `Sys.sleep`. It is there to make it easier to determine - when debugging - when data is sent to R and when data is coming back.

When we executed the code in *Code Snippet 1*, we saw how the breakpoints where hit as below:

1. `sqllang!SpExecuteExternalScript` is called.
1. `sqllang!CSQLSatelliteConnection::OpenNpConnection`
1. `launchpad!Np::AcceptConnection`
1. `launchpad!Np::ReadAsync`
1. `launchpad!Np::ReadAsync`
1. `launchpad!Np::ReadAsync`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. `launchpad!Np::ReadAsync`
1. `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo`
1. `launchpad!CSQLSatelliteConnection::WriteMessage` - notice how nothing happens in the SQL process until `WriteMessage` is executed.
1. `sqllang!CUDXR_ExternalScript::ConnectToSatellite`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. Pause for `Sys.sleep`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. `launchpad!Np::ReadAsync`
1. `launchpad!CSQLSatelliteConnection::WriteMessage`

The above led us to the conclusion - which I voiced in the start of this recap - that data may not be sent via the launchpad service, but over the SqlSatellite TCP connection. The reason that conclusion was achieved was that some of the `sqllang!CSQLSatelliteConnection::WriteMessage` did not have a corresponding `launchpad!Np::ReadAsync`. 

In [Internals - X][si10] we further proved that theory by using *Process Monitor* and capturing what TCP packets were sent to the SqlSatellite (or rather `BxlServer.exe` - which hosts SqlSatellite). When executing the code in *Code Snippet 1* we saw *Process Monitor* output like so:

![](/images/posts/sql_r_services_10_procmon_output1.png)

**Figure 1:** *Process Monitor Base Output*

Combined with the breakpoints the flow looked like below:

1. `sqllang!SpExecuteExternalScript` is called.
1. `sqllang!CSQLSatelliteConnection::OpenNpConnection`
1. `launchpad!Np::AcceptConnection`
1. `launchpad!Np::ReadAsync`
1. `launchpad!Np::ReadAsync`
1. `launchpad!Np::ReadAsync`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. `launchpad!Np::ReadAsync`
1. TCP Connect
1. `launchpad!CSQLSatelliteCommunication::SendResumeWithLoginInfo`
1. `launchpad!CSQLSatelliteConnection::WriteMessage`
1. `sqllang!CUDXR_ExternalScript::ConnectToSatellite`
1. TCP Receive
1. TCP Receive
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. TCP Receive
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. TCP Receive
1. Pause for `Sys.sleep`
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. TCP Receive
1. TCP Receive
1. `sqllang!CSQLSatelliteConnection::WriteMessage`
1. `launchpad!Np::ReadAsync`
1. `launchpad!CSQLSatelliteConnection::WriteMessage`

From what we can see, the three first TCP events happens while we connect. The fourth happens after a `WriteMessage`, and the fifth after the second `WriteMessage` before `Sys.sleep`. The remainders will be covered when we investigate how data is returned to SQL Server.

By using **WireShark* we saw how the actual script was sent to SqlSatellite in one of the TCP packets, and if data (`@input_data_1 = SELECT ...`) was sent, that also was transferred in TCP packet(s). In *Figure 2* below we see what it looks like in *Process Monitor* when both script and data is sent:

![](/images/posts/sql_r_services_10_procmon_output3.png)

**Figure 2:** *Process Monitor Output Data Select*

The two highlighted packets (with length of 350, and 6300 respectively) contains the data that is sent to SqlSatellite, but what are the two first packets being sent? That, and what in SQL Server that sends these packets are  what we'll try to figure out in the rest of this post.

## Packets Sent from SQL Server

So let's start at the top; when we look at *Figure 1* we see two `TCP Receive` after the connection is opened, and these two have a length of 217 and 17 respectively. Regardless what we execute, we'll always see these two "events" and they will always have the same lengths. Seeing that they appear after `sqllang!CUDXR_ExternalScript::ConnectToSatellite`, it may have something to do with setup of the connection, or something like that. To find out what these events are, let's do some "spelunking" using WinDbg. Run WinDbg as admin and attach to the `sqlservr.exe` process.

> **NOTE:** The [Internals - I][si1] has more information how to attach WinDbg to a process, and what commands to use.

When we look at the code flow above combining breakpoints together with the *Process Monitor* output we see that the two first `TCP Receive` events (the ones we are interested in appears after `sqllang!CUDXR_ExternalScript::ConnectToSatellite`, but there are no `sqllang!CSQLSatelliteConnection::WriteMessage` preceding them. Let's see if we can find out something based on what `sqllang!CUDXR_ExternalScript::ConnectToSatellite` calls. In [Internals - I][si1] we used the `uf [options] <address>` WinDbg command to see what a particular routine did, so let's do that for `sqllang!CUDXR_ExternalScript::ConnectToSatellite`. In the WinDbg console execute `uf /c sqllang!CUDXR_ExternalScript::ConnectToSatellite` (we're using the `/c` options which displays only the call instructions). That returns something like so:

``` cpp
sqllang!CUDXR_ExternalScript::ConnectToSatellite
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0x30:
    call to sqllang!CSatelliteProxy::RetrieveConnection
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0x5d:
    call to sqllang!CSatelliteProxy::PostSetupMessage
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0x90:
    unresolvable call: call    qword ptr [rax+48h]
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0x9e:
    call to sqllang!ex_raise_oom (00007ff8`3d183fe0)
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0xab:
    call to sqllang!CServerCargoContext::CServerCargoContext
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0xc2:
    call to sqllang!CSatelliteCargoContext::Init
  sqllang!CUDXR_ExternalScript::ConnectToSatellite+0x111:
    call to sqllang!CSatelliteCargoContext::SetupMessageWriter
```
**Code Snippet 2:** *ConnectToSatellite Calls*

Nothing, in *Code Snippet 2*, really stands out and screams "pick me, pick me" (think the donkey in Shrek) - for being responsible for the TCP events, so let's approach it from another angle. Let's try and see if we can find some routine that actually sends the TCP packets.

For that we'll search in WinDbg for some routines that has TCP and Write in their names. So in the WinDbg console, execute the following: `x *!*TCP*Write*`. Hmm, that returned some interesting "stuff" (the result below is somewhat reduced for readability):

```cpp
00007ff8\`3d1bac30 sqllang!Tcp::WriteSync (<no parameter info>)
00007ff8\`3d1ba9b0 sqllang!Tcp::WriteDone (<no parameter info>)
00007ff8\`3d1baf30 sqllang!Tcp::WriteSyncPost (<no parameter info>)
00007ff8\`3d1b6f40 sqllang!Tcp::GatherWriteAsync (<no parameter info>)
00007ff8\`3d1bb200 sqllang!Tcp::WriteSyncWait (<no parameter info>)
00007ff8\`3cf79e40 sqllang!Tcp::WriteAsync (<no parameter info>)
...
```
**Code Snippet 3":** *Partial Output for TCP::Write*

The output in *Code Snippet 3* has some "promising" routines, where `sqllang!Tcp::WriteAsync` looks very interesting. Let's set some breakpoints:

* `bp sqllang!CSQLSatelliteConnection::WriteMessage`
* `bp sqllang!CUDXR_ExternalScript::ConnectToSatellite`
* `bp sqllang!Tcp::WriteAsync`

The breakpoints above are "loosely" based on what we did in [Internals - X], and hopefully they'll give us some clarity in what happens. After having set the breakpoints execute the code in *Code Snippet 1* and notice how the breakpoints are hit:

```cpp
sqllang!CSQLSatelliteConnection::WriteMessage:
sqllang!CUDXR_ExternalScript::ConnectToSatellite:
sqllang!Tcp::WriteAsync:
sqllang!Tcp::WriteAsync:
sqllang!CSQLSatelliteConnection::WriteMessage:
sqllang!Tcp::WriteAsync:
sqllang!CSQLSatelliteConnection::WriteMessage:
sqllang!Tcp::WriteAsync:
# here is sys.Sleep
sqllang!CSQLSatelliteConnection::WriteMessage:
sqllang!Tcp::WriteAsync:
sqllang!CSQLSatelliteConnection::WriteMessage:
```
**Code Snippet 4":** *Breakpoints Hit*

The code in *Code Snippet 4* matches quite well up with what we saw in the flow in the beginning; `ConnectToSatellite` followed by two TCP events, followed by `WriteMessage`, TCP event, `WriteMessage` and TCP event, and then `Sys.sleep`. Here we see two `sqllang!Tcp::WriteAsync` calls after `ConnectToSatellite` without any `WriteMessage`. Maybe if we investigated the call-stack at the first `sqllang!Tcp::WriteAsync`, that could give us some more information:

1. Execute the code in `Code Snippet 1` again.
1. Let it run through the `WriteMessage` and `ConnectToSatellite` breakpoints.
1. When the first `sqllang!Tcp::WriteAsync` breakpoint is hit, check the call-stack: `kc`.

> **NOTE:** By using `kc` we display a clean stack trace where each display line includes only the module name and the function name.

The call-stack after step 3 above, looks like so (I have "snipped" out some of the initial calls):

``` cpp
# Call Site
00 sqllang!Tcp::WriteAsync
01 sqllang!CryptoBase::HandshakeWriteToken
02 sqllang!CryptoBase::ProcessAndWriteSecurityToken
03 sqllang!CryptoBase::ProcessAddProvider
04 sqllang!CryptoBase::NegotiateSecurityContext
05 sqllang!Sspi::InitX
06 sqllang!AddProvider
07 sqllang!SNIAddProviderEx
08 sqllang!CSQLSatelliteConnection::AuthenticateConnection
09 sqllang!CSQLSatelliteConnection::DataCargoAcceptTask
0a sqldk!SOS_Task::Param::Execute
[snip]
```
**Code Snippet 5:** *Call Stack at First WriteAsync*

When we look at the call-stack we see some routines that have to do with security; `NegotiateSecurityContext`, `ProcessAndWriteSecurityToken`, etc. We also see a routine: `sqllang!SNIAddProviderEx`. This refers to the **SQL Server Network Interface** which is a protocol layer that establishes the network connection between the client and the server. Paired this with the routine `sqllang!CSQLSatelliteConnection::AuthenticateConnection` it seems that our initial thoughts that the first packet has something to do with setting up the connection to the satellite may not be totally off. Now, let the code run through by pressing F5 or `g` in the WinDbg console? 

**NOTE:** At this stage, the TCP connection may be closed due to timeout and you eventually will get an error.

So let's ensure that we have the part about `sqllang!CSQLSatelliteConnection::AuthenticateConnection` correct, by setting a breakpoint at it (`bp sqllang!CSQLSatelliteConnection::AuthenticateConnection`). When you execute you will see how you hit that breakpoint breakpoint almost immediately. You can ignore that, and continue executing until you hit `sqllang!CUDXR_ExternalScript::ConnectToSatellite`. After you have hit `ConnectToSatellite`  you break at `sqllang!CSQLSatelliteConnection::AuthenticateConnection`. When you now continue execution you'll see something like so:

```cpp
sqllang!CSQLSatelliteConnection::AuthenticateConnection:
00007ff8\`9fbc1990 488bc4          mov     rax,rsp
0:054> g
Breakpoint 2 hit
sqllang!Tcp::WriteAsync:
00007ff8\`9e864a40 4c8bdc          mov     r11,rsp
0:054> g
Breakpoint 2 hit
sqllang!Tcp::WriteAsync:
00007ff8\`9e864a40 4c8bdc          mov     r11,rsp
0:050> g
Breakpoint 2 hit
sqllang!Tcp::WriteAsync:
00007ff8\`9e864a40 4c8bdc          mov     r11,rsp
```
**Code Snippet 6:** *Breakpoints Hit*

What happens is that straight after the `AuthenticateConnection ` you will hit the `WriteAsync` breakpoint twice, the same way as we see in *Code Snippet 4*. The first hit at `WriteAsync` sort of makes sense, as it ties up with the call-stack we see in *Code Snippet 5*. But what about the second `WriteAsync` (the one that causes the second package to be sent), where does that come from? To try to figure that out, we start with the call-stack for that particular `WriteAsync`.

 Execute the code in *Code Snippet 1* again, and continue to the second `WriteAsync`. When you hit the breakpoint do a `kc` again. The call-stack should now look somewhat like this (this time it is the full call-stack):

```cpp
 # Call Site
00 sqllang!Tcp::WriteAsync
01 sqllang!CryptoBase::HandshakeWriteToken
02 sqllang!CryptoBase::ProcessAndWriteSecurityToken
03 sqllang!CryptoBase::ProcessAddProvider
04 sqllang!SNIProcessAddProviderOnWorker
05 sqldk!SOS_Task::Param::Execute
06 sqldk!SOS_Scheduler::RunTask
07 sqldk!SOS_Scheduler::ProcessTasks
08 sqldk!SchedulerManager::WorkerEntryPoint
09 sqldk!SystemThread::RunWorker
0a sqldk!SystemThreadDispatcher::ProcessWorker
0b sqldk!SchedulerManager::ThreadEntryPoint
0c KERNEL32!BaseThreadInitThunk
0d ntdll!RtlUserThreadStart
```
**Code Snippet 7:** *Call Stack at Second WriteAsync*

Comparing the call-stack in *Code Snippet 7* with the one in *Code Snippet 5* we see that they are somewhat similar. We also see that `sqllang!CSQLSatelliteConnection::AuthenticateConnection` is nowhere to be seen in the second call-stack. However it looks like this call has something to do with SNI as there is the `sqllang!SNIProcessAddProviderOnWorker` call. So what causes the second `WriteAsync`? As we did with `sqllang!CUDXR_ExternalScript::ConnectToSatellite` let's see what calls `AuthenticateConnection` makes (`uf /c sqllang!CSQLSatelliteConnection::AuthenticateConnection`):

```cpp
sqllang!CSQLSatelliteConnection::AuthenticateConnection
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x9d:
    call to sqllang!SNISetInfo
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0xbc:
    call to sqllang!SNIAddProviderEx
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x100:
    call to sqllang!EventInternal<SuspendQueueSLock>::Wait
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x13c:
    call to sqllang!RefCountImpl<CSQLSatelliteConnection>::Release
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x14a:
    call to sqllang!CSQLSatelliteConnection::FireAuthenticationXEvent
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x163:
    call to KERNEL32!TlsGetValueStub
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x17a:
    call to sqldk!SystemThread::MakeMiniSOSThread
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x189:
    call to KERNEL32!TlsGetValueStub
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x1bf:
    call to sqllang!AutoSwitchPreemptive::AutoSwitchPreemptive
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x1d5:
    call to sqllang!CSQLSatelliteConnection::AuthorizeNamedPipeConnection
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x204:
    call to sqllang!SNIGetInfo
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x21c:
    call to SSPICLI!QueryContextAttributesW
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x239:
    call to ADVAPI32!CheckTokenMembershipStub
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x241:
    call to KERNEL32!GetLastErrorStub
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x26c:
    call to sqllang!CSQLSatelliteConnection::FireAuthorizationXEvent
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x2a8:
    unresolvable call: call    qword ptr [rax+10h]
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x2b0:
    call to sqllang!SOS_ExternalAutoWait::~SOS_ExternalAutoWait
  sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x2da:
    call to sqllang!SNIRemoveProvider
```
**Code Snippet 8:** *Calls from AuthenticateConnection*

Looking at the code in *Code Snippet 8*, we can see the call to `sqllang!SNIAddProviderEx` (line 5), but nowhere we see `sqllang!SNIProcessAddProviderOnWorker`. A first thought would be that `SNIProcessAddProviderOnWorker` is called from another routine, but looking at the call-stack for the second `WriteAsync` call (*Code Snippet 7*), we cannot see any particular method that would call `SNIProcessAddProviderOnWorker`. The only thing we see is that the first call in the call-stack is a start of a new thread: `ntdll!RtlUserThreadStart`.

Hmm, based on the fact that a new thread is started and we're doing SNI "stuff", we may assume that we are still inside `AuthenticateConnection`. With that in mind we can now start "spelunking" away in `AuthenticateConnection`. From the code in *Code Snippet 8* wee see that the call to `SNIAddProviderEx` happens at `sqllang!CSQLSatelliteConnection::AuthenticateConnection+0xbc`. We know that the first call to `WriteAsync` happens after `SNIAddProviderEx`, which then tells us that the second `WriteAsync` must happen after `sqllang!CSQLSatelliteConnection::AuthenticateConnection+0xbc`. Next call is at `sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x100`, so let us set a break-point there. 

When you execute again, (and ignore the first breaks on `AuthenticateConnection` and `AuthenticateConnection+0x100`), you will eventually see the following:

```cpp
sqllang!CUDXR_ExternalScript::ConnectToSatellite:
mov     qword ptr [rsp+8],rcx ss:0000010d\`6e4fc2e0=000002ab0d57d620

sqllang!CSQLSatelliteConnection::AuthenticateConnection:
mov     rax,rsp

sqllang!Tcp::WriteAsync:
mov     r11,rsp

sqllang!CSQLSatelliteConnection::AuthenticateConnection+0x100
call    sqllang!EventInternal<SuspendQueueSLock>::Wait

sqllang!Tcp::WriteAsync:
mov     r11,rsp
```
**Code Snippet 9:** *Calls from AuthenticateConnection 2*

Our hunch was right, we can see how we are breaking at `AuthenticateConnection+0x100` right before the second `WriteAsync`. In other words the two packets we are interested in are both sent during authentication of the TCP/IP connection between SQL Server and SqlSatellite. 

## Summary

In this post we set out to find out more about the two TCP/IP packets that are sent from SQL Server to the SqlSatellite, before the actual packages with the script etc., are sent. After some WinDbg "spelunking" we figured out that the packets were sent during the connection to the SqlSatellite, more specifically during `sqllang!CSQLSatelliteConnection::AuthenticateConnection`.

In [Internals - I][si1] I had a figure which tried to illustrate what happens in SQL Server when executing `sp_execute_external_script`, and - based on that figure - I created a new figure where I have included what we found out in this post:

![](/images/posts/sql_r_services_11_calls.png)

**Figure 3:** *Flow in SQL Server*

The numbered arrows shows the communication out from SQL Server, and in what order it happens:

1. `sqllang!CSQLSatelliteConnection::OpenNpConnection` - SQL Server opens named pipe connection to the launchpad service.
1. `sqllang!CSQLSatelliteConnection::WriteMessage` - Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. During `sqllang!CSQLSatelliteConnection::AuthenticateConnection` SQL Server sends the first packet to the SQL Satellite. The packet has something to do with authentication.
1. After the first packet is sent, a second packet (still within `sqllang!CSQLSatelliteConnection::AuthenticateConnection`), which also is related to authentication, is sent on a separate thread to SqlSatellite.

Thus we have figured out what the two first packets are, and where they are sent from.

In the next post we'll look at what is sending the packets containing the scripts, and what the flow looks like.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: http://queue.acm.org/detail.cfm?id=945136

[sinst]: {{< relref "2017-03-04-microsoft-sql-server-2016-r-services-installation.markdown" >}}
[si1]: {{< relref "2017-03-18-microsoft-sql-server-r-services---internals-i.markdown" >}}
[si2]: {{< relref "2017-04-02-microsoft-sql-server-r-services---internals-ii.markdown" >}}
[si3]: {{< relref "2017-04-13-microsoft-sql-server-r-services---internals-iii.markdown" >}}
[si4]: {{< relref "2017-04-23-microsoft-sql-server-r-services---internals-iv.markdown" >}}
[si5]: {{< relref "2017-05-01-microsoft-sql-server-r-services---internals-v.markdown" >}}
[si6]: {{< relref "2017-05-16-microsoft-sql-server-r-services---internals-vi.markdown" >}}
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}
[si9]: {{< relref "2017-08-18-microsoft-sql-server-r-services---internals-ix.markdown" >}}
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
