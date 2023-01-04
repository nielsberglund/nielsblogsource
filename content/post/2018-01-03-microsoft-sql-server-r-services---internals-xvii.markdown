---
layout: post
title: Microsoft SQL Server R Services - Internals XVII
author: nielsb
date: 2018-01-03T09:57:38+02:00
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
  - BXL
  - Process Monitor
description: Using WinDbg to find out what happens inside SQL Server when data is returned from SqlSatellite
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - BXL
  - Process Monitor
---

This is the 18:th post in a series about **Microsoft SQL Server R Services**, and the 17:th post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

The last *Internals* posts have discussed the transport of data between SQL Server and the SqlSatellite. In [Internals - XVI][si16] we looked at how data came back from the SqlSatellite, and what the data looked like. 

<!--more-->

This post is a continuation of that post, and here we'll look at what happens inside SQL Server when data is returned from the SqlSatellite and the R engine.

## Recap

In [Internals - XVI][si16] we looked at the packets being sent back to SQL Server from the SqlSatellite when a dataset is returned. We saw how there were actually two packets coming back, one small and one bigger, we deduced that those packets were:

* The smaller packet had something to do with column meta-data. We'll try and see what we can find out about this packet in this post.
* The bigger packet held the actual data.

The reason why the second package was bigger was due to the data being treated as originating from nullable columns, so quite an overhead was put onto the various columns:

| Data Type | 1 Row | 2 Rows | Comment |
| --- | :---: |:---: | --- |
| tinyint | 2051 | 2055 | - |
| smallint | 2051 | 2055 | - |
| int | 2051 | 2055 | - |
| real | 1078 | 1086 | - |
| float | 1078 | 1086 | No difference related to storage size|
| bigint | 1078 | 1086 |
| money | 1078 | 1086 |
| decimal | 1078 | 1086 | No difference related to storage size|

**Table 1:** *Packet Sizes from SqlSatellite*

Part of the overhead is the 32 bytes column overhead as we discussed in [Internals - XIV][si14], and a 28 bytes end-sequence, where the end-sequence appears once per data-set, and is not per column. It is somewhat like a row in the data-set. Part of this post is trying to figure out what goes on with this end-sequence.

When looking at the various sizes coming back, we see it is a lot less than what we saw in [Internals - XIV][si14], sending data to SqlSatellite. This is due to R supporting a lot less data-types than SQL Server, and therefore the data might be implicitly converted to a compatible data type.

## Housekeeping

Housekeeping in this context is talking about the tools we'll use, as well as the code. This section is here here for those of who want to follow along in what we're doing in the posts.

#### Helper Tools

To help us figure out the things we want, we will use *Process Monitor*, and *WinDbg*: 

* *Process Monitor*, will be used it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10] as well as in [Internals - XIV][si14].
* In the last few posts I have used *WinDbg preview* a my debugger, but in this post I am reverting back to *WinDbg* "classic". If you need help with setting it up, that is covered in [Internals - I][si1].

#### Code

The code below sets up the database and creates some tables with some data. It is more or less the same as we've used in the last posts:

```sql
USE master;
GO

SET NOCOUNT ON;
GO

DROP DATABASE IF EXISTS ResultData;
GO

CREATE DATABASE ResultData;
GO

USE ResultData;
GO

DROP TABLE IF EXISTS dbo.rand_1M
CREATE TABLE dbo.rand_1M(RowID bigint identity primary key, 
                          y int NOT NULL, rand1 int NOT NULL,
              rand2 int NOT NULL, rand3 int NOT NULL, 
              rand4 int NOT NULL, rand5 int NOT NULL);
GO

INSERT INTO dbo.rand_1M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(1000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
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
**Code Snippet 1:** *Database, and Database Object Creation*

The code we'll use should by now look very familiar:

```sql
EXEC sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(10)
                             OutputDataSet<-InputDataSet'
               , @input_data_1 = N'SELECT TOP(1) rand1 FROM dbo.rand_1M'
```
**Code Snippet 2:** *Base Code to Execute*

The reason there is a `Sys.sleep` in the code in *Code Snippet 2*, is so we can more easily determine at about what time data should be coming back from the SqlSatellite.

## WinDbg Debugging

In [Internals - XV][si15], we used *WinDbg*, and we saw the routines involved when sending data to the SqlSatellite:

```c++
sqllang!CUDXR_ExternalScript::PushRow
sqllang!CServerCargoContext::PostOneRow
sqllang!CSQLSatelliteMessageDataChunk::WritePayloadHeader
sqllang!CSQLSatelliteMessageDataChunk::WriteData
sqllang!CUDXR_ExternalScript::PushEOS
sqllang!CSQLSatelliteMessageDataChunk::WriteMessageBlockDone
```
**Code Snippet 3:** *Routines Used when Sending Data*

Now we'll aim to do the same thing here, and we'll start with trying to find routines being used when receiving data, and we'll start with trying to find the "main" routine for receiving results. Remember in [Internals - XV][si15], we saw how `sqllang!CUDXR_ExternalScript::PushRow` where were things "started", when sending data. Perhaps there is something similar in the `CUDXR_ExternalScript` when receiving? So:

* Start up *WinDbg* as admin. 
* Attach to the SQL Server process.

After having attached to the process, execute in the *WinDbg* console: `x sqllang!CUDXR_ExternalScript*`. That returns quite a few routines, from which we can see if anyone looks promising. When I ran it I found a couple that caught my interest:

```c++
sqllang!CUDXR_ExternalScript::PullRow
sqllang!CUDXR_ExternalScript::ProcessResultRows
```
**Code Snippet 4:** *Interesting sqllang!CUDXR_ExternalScript Routines*

Let's now set breakpoints at the two routines above, plus a breakpoint at `sqllang!CSatelliteCargoContext::SendPackets`. The reason for the breakpoint at `SendPackets` is that it is there to indicate where we are, as `PullRow` can be called based on processing inside SQL Server, not only as result of data coming back from the SqlSatellite. Now execute the code in *Code Snippet 2*, and you'll see how:

* `PullRow` is called once before `SendPackets` - that's not interesting to us.
* `SendPackets` is called.
* `PullRow` is called.
* A pause followed by `ProcessResultRows` being called twice.

A couple of questions comes up after having seen the above:

* Why is the second `PullRow` called immediately after `SendPackets`?
* Why are there two `ProcessResultRows`, when only one row is returned?

Just to confirm the last bullet point; change the `TOP` clause in *Code Snippet 2* to 5 instead of one and execute again. The breakpoint at `ProcessResultRows` is now hit 6 times. So `ProcessResultRows` is definitely related to number of rows returned, but also something else. Let's see if we can figure out what happens here:

* Disable all breakpoints except for the `ProcessResultRows` breakpoint.
* Clear the *WinDbg* command window by `.cls`.
* Change the `TOP` clause in *Code Snippet 2* to be 3.
* Execute the code.
* Each time the `ProcessResultRows` breakpoint do a `wt -l4` (trace and watch 4 levels deep).
* After each "trace and watch", copy the output to new files and name them `wt1.txt`, `wt2.txt`, etc.

There should, after completing the execution, be four files, let's compare these four files. 

> **NOTE:** If you haven't done the `wt` as above, you can download the four files, plus a couple of others from [here](/downloads/misc/sql_r_services_internal17.zip).

What we see is that the first file is bigger than the others, it has ~165 lines whereas the others are between 65 - 70 lines. The last third part of the first file (from about line 104), looks very much like the second and third files. We can also see that the fourth file is not similar to the other tree.

Now what we'll do is to look at the similarities between the three first files and try to understand what is happening. In the files we see some interesting routines:

```c++
sqllang!CUDXR_ExternalScript::ProcessResultRows
  sqllang!CServerCargoContext::ReadOneRow
   ...
    sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage
  sqllang!CServerCargoContext::ReadOneRow
    sqllang!CSQLSatelliteMessageDataChunk::ReadData
     ...
      MSVCR120!memcpy_s
        MSVCR120!memcpy
        MSVCR120!MoveSmall
      MSVCR120!memcpy_s
    ...
sqllang!CUDXR_ExternalScript::ProcessResultRows
  sqllang!CUDXR_ExternalScript::OutputRow
    sqllang!CTds74::SendRowImpl
      sqllang!CColMetaData::CCols
    ...
  sqllang!CUDXR_ExternalScript::OutputRow
sqllang!CUDXR_ExternalScript::ProcessResultRows
```
**Code Snippet 5:** *Routines from sqllang!CUDXR_ExternalScript::ProcessResultRows*

By now we understand that `ProcessResultRows` is doing what it says on the packet; it takes the rows coming back from the SqlSatellite, processes it, and then outputs it through `sqllang!CUDXR_ExternalScript::OutputRow`. From what we see in *Code Snippet 5*, it looks like the rows being outputted is outputted in the *TDS* format - look at the calls to `sqllang!CTds74::SendRowImpl`. This would make sense since clients etc., do not "speak" *BXL*, and from what we've seen - *BXL* is what is coming back from the SqlSatellite.

> **EDITED:** The following section down to `PullRow` has been slightly changed, to make it more readable.

So the similar code in the three files (`wt1`, `wt2`, and `wt3`) processes the rows coming back, and outputs them as TDS, cool! So what about the first part of the first `ProcessResultRows`, what does that do? Let's have a look at the trace file for the first `ProcessResultRows`:

```c++
sqllang!CUDXR_ExternalScript::ProcessResultRows
  sqllang!CServerCargoContext::ReadOneRow
    ...
    sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage
  sqllang!CServerCargoContext::ReadOneRow
    ...
    sqllang!CServerCargoContext::ReceiveOneDataChunk
      ...
      sqllang!CSQLSatelliteMessageDataChunk::BindBufferForRead
        sqllang!CSQLSatelliteMessageDataChunk::ReadPayloadHeader
      sqllang!CSQLSatelliteMessageDataChunk::BindBufferForRead
    ...
    sqllang!CServerCargoContext::ReceiveOneDataChunk
      sqllang!CSQLSatelliteCommunication::SendAckMessage
        ...
      sqllang!CSQLSatelliteCommunication::SendAckMessage
        sqllang!CSQLSatelliteConnection::PostWriteRequest
        sqllang!CSQLSatelliteConnection::WriteMessage
      sqllang!CSQLSatelliteCommunication::SendAckMessage
        sqllang!CSQLSatelliteConnection::WaitWriteDone
      sqllang!CSQLSatelliteCommunication::SendAckMessage
    sqllang!CServerCargoContext::ReceiveOneDataChunk
     ...
  sqllang!CServerCargoContext::ReadOneRow
    sqllang!CSQLSatelliteMessageDataChunk::BindBufferForRead
      sqllang!CSQLSatelliteMessage::BindBufferForRead
    ...
      sqllang!CSQLSatelliteMessageDataChunk::ReadPayloadHeader
    sqllang!CSQLSatelliteMessageDataChunk::BindBufferForRead
  ...
  ```
  **Code Snippet 6:** *Routines from First ProcessResultRows*

In *Code Snippet 6* we see various parts of the first 2/3 of the first call to `ProcessResultRows`. What is interesting is the `sqllang!CServerCargoContext::ReceiveOneDataChunk`, `sqllang!CSQLSatelliteMessageDataChunk::ReadPayloadHeader` and the `sqllang!CSQLSatelliteCommunication::SendAckMessage` calls.

From what I gather, the `ReceiveOneDataChunk` routine reads in data that has been received from a socket, the `ReadPayloadHeader` reads the column header for each column in the result-set being returned, in order to determine data types etc. The `SendAckMessage`, sends a message back to the SqlSatellite, most likely indicating that SQL Server has received the two packages being sent from the SqlSatellite. We can confirm the "sending message back" part by: 

* Disabling all break-point in *WinDbg* except for the breakpoint at `sqllang!CUDXR_ExternalScript::ProcessResultRows`. 
* Set a breakpoint at `sqllang!CSQLSatelliteConnection::WriteMessage`, but disable it.
* Run *Process Monitor* as admin and load the filter we used in [Internals - XVI][si16] where we filtered for `TCP Send` and `TCP Receive` for `BxlServer.exe`.

Execute the code in *Code Snippet 2*, and when you hit the `ProcessResultRows` breakpoint, look at the output from *Process Monitor*. You should see something like so:

![](/images/posts/sql_r_services_17_procmon1.png)

**Figure 1:** *Output Before WriteMessage*

We see in *Figure 1* how the two data packets have been sent to SQL Server, but nothing else has happened. Enable the `WriteMessage` break-point and continue the execution. We'll now break at `WriteMessage`, but nothing has happened in *Process Monitor* (no more packages have been sent or received). However, when we now continue the execution we'll see in *Process Monitor how a packet is sent to the SqlSatellite (`BxlServer.exe`) with a length of 28 bytes, and then two packets are returned back from the SQlSatellite:

![](/images/posts/sql_r_services_17_procmon2.png)

**Figure 2** *Output After WriteMessage*

We see the ack message sent to the SqlSatellite outlined in red in *Figure 2*, and the two packets coming back outlined in blue. Further down in this post as well as in an upcoming post we'll see if we can determine what the two packets coming back from the SqlSatellite do.

Now we've seen how the first `ProcessResultRows` is doing both schema "stuff" as well as processing the first row, and how the second and third `ProcessResultRows`, handle the remaining rows. What about the fourth file, the last `ProcessResultRows` - what does that one do? Let's have a look at some of the calls that happens:

```c++
sqllang!CUDXR_ExternalScript::ProcessResultRows
  sqllang!CServerCargoContext::ReadOneRow
    ...
    sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage
  sqllang!CServerCargoContext::ReadOneRow
    sqllang!CServerCargoContext::ReceiveOneDataChunk
      ...
sqllang!CUDXR_ExternalScript::ProcessResultRows
  sqllang!CUDXR_ExternalScript::EndOutput
    KERNEL32!TlsGetValueStub
    KERNEL32!TlsGetValue
  sqllang!CUDXR_ExternalScript::EndOutput
    sqllang!CTdsConn<0>::EndResultSetImpl
      sqllang!SendDoneWarnings
    sqllang!CTdsConn<0>::EndResultSetImpl
  sqllang!CUDXR_ExternalScript::EndOutput
sqllang!CUDXR_ExternalScript::ProcessResultRows
```
**Code Snippet 7:** *Routines from Last ProcessResultRows*

From the code in *Code Snippet 7* we see how there is a `ReceiveOneDataChunk` call, which indicates data is being read after having  been received from a socket. It also looks like that this last `ProcessResultRows` indicates that there are no more data: `sqllang!CUDXR_ExternalScript::EndOutput`, `sqllang!CTdsConn<0>::EndResultSetImpl` and `sqllang!SendDoneWarnings`. The question is what indicates this in the packets SQL Server receives from the SqlSatellite? This is now some speculation from my side, but I strongly suspect this originates from one of the 28 byte packets coming back from SqlSatellite after SQL Server sent the ack message above. I also think that the end-sequence that we mentioned in [Internals - XVI][si16] as well as in the *Recap* above, has something to do with this.

Now we should be able to answer the question above about why there are one more `ProcessResultRows` than rows returned, and we should also have a fairly good grasp of what happens when processing rows returned from the SqlSatellite:

* Rows are processed by `sqllang!CUDXR_ExternalScript::ProcessResultRows`.
* During the first `ProcessResultRows` the column header(s) are processed, followed by the first row.
* Subsequent rows are processed by `ProcessResultRows`.
* A final `ProcessResultRows` processes one of the packets received back from SqlSatellite after ack message has been sent.

So, what about the first question we had above; why is there a `PullRow` called straight after `SendPackets`, e.g. the `PullRow` happens before data is returned from the SqlSatellite? To try to figure this out, let's disable all breakpoints, except for the breakpoint at `sqllang!CUDXR_ExternalScript::ProcessResultRows`, and execute *Code Snippet 2* again (you can take out the `Sys.sleep` if you want). When you execute and hit the breakpoint `ProcessResultRows` for the first time, look at the call-stack: `k`:

```c++
sqllang!CUDXR_ExternalScript::ProcessResultRows
sqllang!CUDXR_ExternalScript::PullRow+0xf4
sqlmin!CQScanUdx::GetRow+0x196
sqlmin!CQueryScan::GetRow+0x81
sqllang!CXStmtQuery::ErsqExecuteQuery+0x4dc
sqllang!CXStmtSelect::XretExecute+0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1>+0x40d
sqllang!CMsqlExecContext::FExecute+0xa9e
sqllang!CSQLSource::Execute+0x983
sqllang!SpExecuteExternalScript+0x140e
...
```
**Code Snippet 8:** *Call Stack at First ProcessResultRows*

What we see in *Code Snippet 8*  is the important part of the call-stack and we can see how `ProcessResultRows` is called from within `PullRow`. Interesting, `PullRow` is called right after `SendPackets`, before the result has come back, and still `ProcessResultRows` is called from within `PullRow`, after the result is back? Let's see if we can figure out what's happening:

* Disable all breakpoints.
* Set a breakpoint at `sqllang!CUDXR_ExternalScript::PullRow`.
* Change the `Sys.sleep(10)` in *Code Snippet 2*, to `Sys.sleep(60)`.
* Execute the code.
* Continue past the first `PullRow`.

When you hit the `PullRow` for the second time, do a `wt`. You'll see how the code continues, up until the execution starts in the R engine, and the code hits `Sys.sleep`. At this stage, copy out the output from `wt` into a new file (call it `pull_row_1.txt`). 

> **NOTE:** The trace files for `PullRow` are also part of the download mentioned above.

At some stage the execution continues, and after the full `wt`, copy the whole trace into a second file `pull_row_full.txt`. Now open the `pull_row_1.txt` file, and look at the last 11 lines (for me it starts at around line 888):

```c++
sqldk!SOS_Scheduler::Switch
  KERNEL32!QueryPerformanceCounter
  ntdll!RtlQueryPerformanceCounter
sqldk!SOS_Scheduler::Switch
  KERNEL32!SignalObjectAndWaitStub
  KERNELBASE!SignalObjectAndWait
    KERNELBASE!memset
    ntdll!memset
  KERNELBASE!SignalObjectAndWait
    KERNELBASE!BaseFormatTimeOut
  KERNELBASE!SignalObjectAndWait
```
**Code Snippet 9:** *Call Stack at End of First PullRow*

It seems from the code in *Code Snippet 9*, that we wait to be signaled, so the execution can continue, and when we open the "full" file (`pull_row_full.txt`), we can see that, that is indeed what happens:

```c++
sqldk!SOS_Scheduler::Switch
    KERNEL32!SignalObjectAndWaitStub
    KERNELBASE!SignalObjectAndWait
      KERNELBASE!memset
      ntdll!memset
    KERNELBASE!SignalObjectAndWait
      KERNELBASE!BaseFormatTimeOut
    KERNELBASE!SignalObjectAndWait

// above was the last lines in the first file

      ntdll!NtSignalAndWaitForSingleObject
    KERNELBASE!SignalObjectAndWait
  sqldk!SOS_Scheduler::Switch
    KERNEL32!QueryPerformanceCounterStub
    ntdll!RtlQueryPerformanceCounter
  sqldk!SOS_Scheduler::Switch
    sqldk!SOS_Scheduler::TaskTransition
```
**Code Snippet 10:** *PullRow Being Signaled*

From *Code Snippet 10*, we see how `Pull` is signaled, and continues on with a `Switch` and a `TaskTransition`. The signal happens when SQL Server receives data from the SqlSatellite. There is an internal method `sqllang!CSQLSatelliteConnection::ReadCallBackInternal` which is being called when data is received, and part of `ReadCallBackInternal` is a signal call `sqllang!EventInternal<SuspendQueueSLock>::SignalAll`.

Having briefly discussed signaling, let's go back to `pull_row_full.txt` and look further down in the file, where we see our first `ProcessResultRows`:

```c++
sqllang!CUDXR_ExternalScript::ProcessResultRows
  sqllang!CServerCargoContext::ReadOneRow
    sqldk!CMemProc::Alloc
  sqllang!CServerCargoContext::ReadOneRow
    sqllang!CSQLSatelliteCommunication::GetSQLSatelliteMessage
  sqllang!CServerCargoContext::ReadOneRow
    sqllang!CServerCargoContext::ReceiveOneDataChunk
      sqllang!CSQLSatelliteCommunication::CSQLSatelliteCommunication
    sqllang!CServerCargoContext::ReceiveOneDataChunk
```
**Code Snippet 11:** *ProcessResultRows Called in PullRow*

We see how the code in *Code Snippet 11* is the same as the first lines of the file `wt1.txt`. 

Now we should be able to answer the first question we had; why `PullRow` is called directly after `SendPackets`: it is being called to wait for a call-back and continue handling receiving of data. But what else goes on in `PullRow`, we see the first `ProcessResultRows` at around line 3342, so there must be other "stuff" happening as well?

In fact, if we look a couple of lines above where we found `ProcessResultRows` in `pull_row_full.txt` we'll see something like so:

```c++
    sqllang!CUDXR_ExternalScript::BeginOutput
  sqllang!CUDXR_ExternalScript::ProcessOutputSchema
sqllang!CUDXR_ExternalScript::PullRow

// here is the first ProcessResultRows
  sqllang!CUDXR_ExternalScript::ProcessResultRows
    sqllang!CServerCargoContext::ReadOneRow
```
**Code Snippet 12:** *End of ProcessOutputSchema*

What we see in *Code Snippet 12* is how, above the first call to `ProcessResultRows`, we are in a routine named `ProcessOutputSchema`, and if we go upwards we see how there are at least three more routines dealing with schema:

* `sqllang!CUDXR_ExternalScript::GetOutputSchema`
* `sqllang!CServerCargoContext::ReadSchemaInternal`
* `sqllang!CServerCargoContext::ReadSchemaFromPackets`

If we were to set breakpoints at those routines together with `PullRow` and `ProcessResultRows`, the flow (highly simplified) when executing would be something like this:

```c++
sqllang!CSatelliteCargoContext::SendPackets
sqllang!CUDXR_ExternalScript::PullRow
  sqllang!CUDXR_ExternalScript::ProcessOutputSchema
    sqllang!CUDXR_ExternalScript::GetOutputSchema
      sqllang!CServerCargoContext::ReadSchemaInternal
        sqllang!CServerCargoContext::ReadSchemaFromPackets
  sqllang!CUDXR_ExternalScript::ProcessResultRows
```
**Code Snippet 13:** *Code Flow Handling Schema*

So what SQL Server is doing is that before it start processing the returning rows, it determines what the schema is for the result-set. As far as I can tell, SQL Server uses both the initial "small" packet from the SqlSatellite as well as the packet containing the actual result-set data. 

## Summary

This post tried to determine what SQL Server is doing when data is being returned from the SqlSatellite. We saw how, after the data packet(s) were sent to the SqlSatellite:

* Immediately `sqllang!CUDXR_ExternalScript::PullRow` was called, and waited to be signaled when data was returned.
* The schema of the returning data was determined by calls to `sqllang!CUDXR_ExternalScript::ProcessOutputSchema`, `sqllang!CUDXR_ExternalScript::GetOutputSchema`, `sqllang!CServerCargoContext::ReadSchemaInternal`, and `sqllang!CServerCargoContext::ReadSchemaFromPacket`.
* The result rows were processed, and turned into *TDS* packets, by calls to `ProcessResultRows` (one `ProcessResultRows` per row).
* A final `ProcessResultRows` was called to indicate that no more rows are coming.

The figure below illustrates the flow:

![](/images/posts/sql_r_services_17_flow.png)

**Figure 3:** *Code Flow Receiving Data from SqlSatellite*

If you have read [Internals - XV][si15], you see how *Figure 3* is similar. I have however "compacted" the sending data to SqlSatellite somewhat. The numbered arrows shows the communication out to and in from SQL Server, and in what order it happens:

1. SQL Server opens named pipe connection to the launchpad service.
1. Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. SQL Server sends the first packet to the SQL Satellite for authentication purposes.
1. A second authentication packet is sent to SqlSatellite.
1. The script is sent from inside `sqllang!CSatelliteProxy::PostSetupMessage`
1. The data for `@input_data_1` is sent together with two end packets.
1. Packet are coming back to SQL Server containing meta-data and the actual data.
1. `PullRow` is being signaled.
1. Execution continues to process meta-data as well as result rows.

There are still a couple of things to discuss about data coming back to SQL Server, as well a how errors are handled, and we'll do that in a future post.

## ~ Finally

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
[si7]: {{< relref "2017-07-11-microsoft-sql-server-r-services---internals-vii.markdown" >}}
[si8]: {{< relref "2017-07-22-microsoft-sql-server-r-services---internals-viii.markdown" >}}
[si9]: {{< relref "2017-08-18-microsoft-sql-server-r-services---internals-ix.markdown" >}}
[si10]: {{< relref "2017-08-29-microsoft-sql-server-r-services---internals-x.markdown" >}}
[si11]: {{< relref "2017-10-20-microsoft-sql-server-r-services---internals-xi.markdown" >}}
[si12]: {{< relref "2017-10-31-microsoft-sql-server-r-services---internals-xii.markdown" >}}
[si13]: {{< relref "2017-11-11-microsoft-sql-server-r-services---internals-xiii.markdown" >}}
[si14]: {{< relref "2017-11-25-microsoft-sql-server-r-services---internals-xiv.markdown" >}}
[si15]: {{< relref "2017-12-02-microsoft-sql-server-r-services---internals-xv.markdown" >}}
[si16]: {{< relref "2017-12-24--microsoft-sql-server-r-services---internals-xvi.markdown" >}}
