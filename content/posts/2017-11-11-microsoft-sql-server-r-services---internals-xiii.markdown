---
layout: post
title: Microsoft SQL Server R Services - Internals XIII
author: nielsb
date: 2017-11-11T20:02:50+02:00
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
  - SqlSatellite 
  - SqlSatellite.dll   
description: When is SQL statements executed when executing external scripts?
keywords:
  - SQL Server R Services
  - SQL Server Machine Learning Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
  - SqlSatellite
  - SqlSatellite.dll       
---

This is the fourteenth post in a series about **Microsoft SQL Server R Services**, and the thirteenth post that drills down into the internal of how it works. To see other posts (including this) in the series, go to [**SQL Server R Services**](/sql_server_2k16_r_services).

Sorry guys, in my last post [Internals - XII][si12] I said we'd - in this post - look into the **Binary eXchange Language** protocol(**BXL**) which is used when sending data from SQL Server to the SqlSatellite. The protocol is also involved when we send  one row of data containing 5 integers, and the packet size for that ends up being 6300 bytes.

Well, we won't look at that in this post, I was once again led astray when researching how data is sent. 

<!--more-->

What we will look into however is something we haven't really discussed at all before, and that is: when is the `SELECT` statement for the `@input_data_1` parameter executed? 

However, before we get into all this, let us do a recap.

## Recap

In he last two "episodes" in the internals we have looked what packets are being sent between SQL server and the SqlSatellite. In [Internals - XI][si11] we looked at how SQL Server connected to the launchpad process, and how that caused the SqlSatellite to open a socket connection to SqlServer. Connection of the socket caused two authentication packages to be sent to the SqlSatellite from SQL Server. The process was illustrated as in this figure:

![](/images/posts/sql_r_services_11_calls.png)

**Figure 1:** *Flow in SQL Server*

The numbered arrows shows the communication out from SQL Server, and in what order it happens:

1. `sqllang!CSQLSatelliteConnection::OpenNpConnection` - SQL Server opens named pipe connection to the launchpad service.
1. `sqllang!CSQLSatelliteConnection::WriteMessage` - Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. During `sqllang!CSQLSatelliteConnection::AuthenticateConnection` SQL Server sends the first packet to the SQL Satellite. The packet has something to do with authentication.
1. After the first packet is sent, a second packet (still within `sqllang!CSQLSatelliteConnection::AuthenticateConnection`), which also is related to authentication, is sent on a separate thread to SqlSatellite.

In essence, [Internals - XI][si11] was all about connection and authentication. In [Internals - XII] we looked at what data packages were sent to the SqlSatellite from SQL Server, and we saw how both script as well as any result for `@input_data_1` was sent. We used following figure to illustrate how the data was sent, and from what routines:

![](/images/posts/sql_r_services_12_calls.png)

**Figure 2:** *Flow 2 in SQL Server*

The numbered arrows shows the communication out from SQL Server, and in what order it happens:

1. SQL Server opens named pipe connection to the launchpad service.
1. Message sent to the launchpad service.
1. After the call above, the SqlSatellite opens a TCP/IP connection to SQL Server.
1. SQL Server sends the first packet to the SQL Satellite for authentication purposes.
1. A second authentication packet is sent to SqlSatellite.
1. The script is sent from inside `sqllang!CSatelliteProxy::PostSetupMessage`
1. The data for `@input_data_1` is sent.
1. The first end packet is sent.
1. The second end packet is sent.

## Helper Tools

To help us figure out the things we want, we will use *WinDbg* and *Process Monitor*: 

* *Process Monitor*, will be used it to filter TCP traffic. If you want to refresh your memory about how to do it, we covered that in [Internals - X][si10].
* In [Internals - XII][si12] I mentioned about the new and more modern [WinDbg][1], and how I'd be using it going forward. Well, when writing this post I came across a scenario where I couldn't do what I wanted to do in the new *WinDbg*, so in this post I'll be using only the old version. If you need help with setting it up, that is covered in [Internals - I][si1].

> **NOTE:** What I wanted to do in the new *WinDbg* was to set event filters. For the life of me I could not find out where and how to do it.

## Code

In most of the other posts in this series, the code we have executed haven't required a specific database or tables. In this post we'll use a specific database with some tables. The code to create the database, tables and populate data looks like this:

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

DROP TABLE IF EXISTS dbo.tb_Tab1;
CREATE TABLE dbo.tb_Tab1(RowID bigint identity primary key,
                         ColInt int NOT NULL,
             ColIntN int NULL,
             ColBigInt bigint NOT NULL,
             ColBigIntN bigint NULL,
             ColDec decimal(10, 6) NOT NULL,
             ColDecN decimal(10, 6) NULL,
             ColString varchar(50) NOT NULL,
             ColStringN varchar(50) NULL,
             ColNString nvarchar(50) NOT NULL,
             ColNStringN nvarchar(50) NULL,
             ColStringMax varchar(max) NOT NULL,
             ColStringMaxN varchar(max) NULL);

INSERT INTO dbo.tb_Tab1(ColInt, ColIntN, ColBigInt, ColBigIntN,  
                        ColDec, ColDecN, ColString, ColStringN, 
                        ColNString, ColNStringN, ColStringMax, 
                        ColStringMaxN)
VALUES (41, 41, 3147483647, 3147483647, 134.56789, 134.56789, 'Hello 41', 
        'Hello 41', N'Hello 41', N'Hello 41', CAST(REPLICATE(
           CAST('Loads of data ' as varchar(max)),1000) AS varchar(max)), 
        CAST(REPLICATE(
        CAST('Loads of data ' as varchar(max)),1000) AS varchar(max))), 
       (42, NULL, 4147483647, NULL, 135.56789, NULL,  'Hello 42', NULL, 
       N'Hello 42', NULL, CAST(REPLICATE(
       CAST('Loads of data ' as varchar(max)), 10000) AS varchar(max)), NULL);
     
GO
```
*Code Snippet 1:** *Setup of Database*

I haven't listed any execute statements, as they will differ throughout this post.

## Execution of `SELECT` Statement for `@input_data_1`

So in quite a few installments of the Internals series, data for the parameter `@input_data_1` has been sent to the SqlSatellite, and in [Internals - XII][si12] we saw what routines were involved when sending it. What we haven't discussed however, is at what stage in the flow the statement in the parameter gets executed. The few times I have thought about it, I assumed it was sometime after the external script has opened, as I saw it being part of the script. Let's find out.

To do this you need to run the old version of *WinDbg*, as we'll enable an event-filter so the debugger breaks at an `C++ EH` exception. In the *Event Filters* dialog you can set how that particular exception should be handled. We want it to be enabled, but not handled:

![](/images/posts/sql_r_services_windbg_eventfilters_enable.png)

**Figure 3:** *Enable C++ EH Exception* 

The idea is that we will execute something with an invalid statement for the `@input_data_1` parameter, and after having set the `C++ EH`exception filter we will be able to see the call-stack leading up to the exception.

So:

1. Run the "old" *WinDbg* as admin.
1. Attach to the `sqlserver.exe` process.
1. Set the event filter as per above.

Set also some breakpoints:

* `bp sqllang!SpExecuteExternalScript`.
* `bp sqllang!CUDXR_ExternalScript::Open`.
* `bp sqllang!CUDXR_ExternalScript::ConnectToSatellite`.
* `bp sqllang!CSQLSatelliteConnection::OpenNpConnection`.

The code to execute looks like this:

```sql
EXEC sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet',
                @input_data_1 = N'SELECT RowID, ColInt3 
                  FROM dbo.tb_Tab1 WHERE RowID = 1';
```
**Code Snippet 2:** *Invalid T-SQL Statement*

As you see in *Code Snippet 2* we are doing a `SELECT` and we are referencing a column - `ColInt3`- which does not exist in the table. When you execute you immediately hit the break-point at `sqllang!SpExecuteExternalScript`, and after you continue, you break for an exception. At this point, check the call-stack: `k`:

```c++
KERNELBASE!RaiseException+0x68
MSVCR120!_CxxThrowException+0xb3 
       [f:\dd\vctools\crt\crtw32\eh\throw.cpp @ 154] 
sqldk!ExceptionBackout::GetCurrentException+0x385
sqldk!ex_raise2+0x52f
sqldk!ex_raise+0xc4
sqllang!CSQLSource::FCompile+0x230f
sqllang!CSQLSource::FCompWrapper+0xce
sqllang!CSQLSource::Transform+0x556
sqllang!CSQLSource::Execute+0x3b0
sqllang!SpExecuteExternalScript+0x140e
```
**Code Snippet 3:** *Call Stack at Exception*

Notice that the exception happens right after the `SpExecuteExternalScript` but before any of the other breakpoints. That would, sort of, indicate that my assumption about the statement being executed after the opening of the script be incorrect. When you look at the call-stack, it seems that the exception happens during something that has to do with compilation of the query: `sqllang!CSQLSource::FCompile`. I guess it makes sense that SQL Server would check if the query is syntactically correct and also that the objects exists (in our case there is no column named `ColInt3`).

So what would happen if we executed a statement that caused a runtime exception. Let's say we did a `SELECT` with some computation that resulted in an exception, would we fail at the same stage as above? So let's see what happens if the code we execute looks like so:

```sql
EXEC sp_execute_external_script
                @language = N'R' ,
                @script = N'Sys.sleep(10)
                d<-InputDataSet',
                @input_data_1 = N'SELECT RowID, 
                  1 / ISNULL(ColIntN, 0) AS Calc 
                  FROM dbo.tb_Tab1';
```
**Code Snippet 4:** *Division By Zero*

In the `dbo.tb_Tab1` table there are some `NULL` values in the `ColIntN` column, so the code in *Code Snippet 4* will cause a divide by zero exception. Keep the break-points as before and execute the query. You see now how the `SpExecuteExternalScript` break-point is hit followed by: `sqllang!CUDXR_ExternalScript::Open`, `sqllang!CSQLSatelliteConnection::OpenNpConnection` and after `sqllang!CUDXR_ExternalScript::ConnectToSatellite` there is an exception. If we check the call-stack, it looks like so (from `SpExecuteExternalScript`):

```c++
KERNELBASE!RaiseException+0x68
MSVCR120!_CxxThrowException+0xb3 [f:\dd\vctools\crt\crtw32\eh\throw.cpp @ 154] 
sqldk!ExceptionBackout::GetCurrentException+0x385
sqldk!ex_raise2+0x52f
sqldk!ex_raise+0xc4
sqlTsEs!ESArithErrorHandler+0x159
sqlTsEs!CTEsArith<3,56,56,1,0>::RsltArithArgArg+0x94
sqlTsEs!CEsExec::GeneralEval4+0xe7
sqllang!CUDXR_ExternalScript::PushRow+0x78
sqlmin!CQScanUdx::PushNextChildRow+0x13b
sqlmin!CQScanUdx::GetRow+0x79
sqlmin!CQueryScan::GetRow+0x81
sqllang!CXStmtQuery::ErsqExecuteQuery+0x4dc
sqllang!CXStmtSelect::XretExecute+0x322
sqllang!CMsqlExecContext::ExecuteStmts<1,1>+0x40d
sqllang!CMsqlExecContext::FExecute+0xa9e
sqllang!CSQLSource::Execute+0x983
sqllang!SpExecuteExternalScript+0x140e
```
**Code Snippet 5:** *Call Stack at Divide by Zero*

When we compare the call-stacks in *Code Snippet 3* and *Code Snippet 5* we see how the paths are different. It seems that when having `@input_data_1`, some optimization and compilation of the statement happens first, and the statement is actually executed when the connection to the satellite has happened, and it looks like that happens inside `sqllang!CXStmtQuery::ErsqExecuteQuery`.

If we think back to what we covered in Internals [XI][si11] and [XII][si12], and we "merge" that what we have seen so far in this post, it seems that `sp_execute_external_script` has three distinct phases:

1. Compilation and optimizing the `@input_data_1` statement
1. Connecting to launchpad and SqlSatellite and sending the script to the SqlSatellite
1. Executing the `@input_data_1` statement and sending the result to SqlSatellite.

OK, if we let the code continue after having hit the exception and looked at the call-stack, we'll see something somewhat interesting (strange) in the message tab in **SSMS**:

![](/images/posts/sql_r_services_13_error.png)

**Figure 4:** *Error Message from SqlSatellite*

When looking at *Figure 4* it seems that SqlSatellite is confused about something, almost like it would have received a packet/something which it couldn't handle. That would make sense if a packet actually were sent to the SqlSatellite with the result from the `SELECT`, and potentially the data was corrupted due to the null exception.

Let's start with looking at what packages are being sent to the SqlSatellite when executing the code in *Code Snippet 4*. For this we'll use *Process Monitor* and set it up as we did in [Internals - X], as well as in [Internals - XII][si12], to filter TCP packets. When you have set up *Process Monitor* you are ready to execute the code in *Code Snippet 4*, but before you do that, disable all breakpoints in *WinDbg*. Execute the code and look at what *Process Monitor* outputs:

![](/images/posts/sql_r_services_13_error_procmon.png)

**Figure 5:** *Process Monitor Output at Error*

In *Figure 5* we initially see what we expect:

* Authentication packets (lengths 217 and 17).
* The script package (length 256).

But after the script package we see a packet with the length of 28, what is that? Also, we do not see any packet that would be related to the data, so the idea that the SqlSatellite received a packet it could not handle may not be correct. So, where does the message about the SqlSatellite and data chunks in *Figure 4* come from?

#### Packet with Length 28

We'll start with the packet with a length of 28. In [Internals - XII][si12] we saw how packets with a length of 28 were sent as end of script, and end of data packets. Perhaps it is something similar here. We saw in [Internals - XII][si12] how the end packets were sent in a flow looking something like so: 

```c++
sqllang!CXStmtQuery::ErsqExecuteQuery
  sqlmin!CQScanUdx::PushNextChildRow
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendPackets
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
    sqllang!CUDXR_ExternalScript::PushEOS
      sqllang!CSatelliteCargoContext::SendChunkEndMessage
```
**Code Snippet 6:** *Abbreviated Flow Result Data*

Let's set some breakpoints and see what we can figure out:

* `bp sqlmin!CQScanUdx::PushNextChildRow`.
* `bp sqllang!CUDXR_ExternalScript::PushEOS`
* `bp sqllang!CSatelliteCargoContext::SendChunkEndMessage`.
* `bp sqllang!CUDXR_ExternalScript::PushRow`

When we execute we hit:

* `sqlmin!CQScanUdx::PushNextChildRow` followed by
* `sqllang!CUDXR_ExternalScript::PushRow` followed by
* `sqllang!CUDXR_ExternalScript::PushRow` followed by
* `(1a54.23c8): C++ EH exception - code e06d7363 (first chance)`

After the second `PushRow` we break at the exception, and when we let the code continue, we get the error message back, but we also see that a packet with a length of 28 is sent to the SqlSatellite. So, if the packet is not coming from the `SendChunkEndMessage` routine, where does it come from then? Let's do what we did in [Internals - XII][si12] when we did not know from where a packet was sent - set a breakpoint at `mswsock!WSPSend`. The theory behind this is that, at one stage or another, a low level socket call needs to take place. After you have set the breakpoint, execute again and now the breakpoints are hit as follows:

* `mswsock!WSPSend` three times in a row (the two authentication packets and the script packet)
* `sqlmin!CQScanUdx::PushNextChildRow` followed by
* `sqllang!CUDXR_ExternalScript::PushRow` followed by
* `sqllang!CUDXR_ExternalScript::PushRow` followed by
* `(1a54.23c8): C++ EH exception - code e06d7363 (first chance)`

> **NOTE:** The reason we get two `PushRow` is that we are selecting two rows from the table.

Continuing after the exception we will hit `mswsock!WSPSend`, and checking the call-stack - it looks like this:

```c++
mswsock!WSPSend
WS2_32!WSASend+0x16c
sqllang!Tcp::WriteAsync+0x174
sqllang!SNIWriteAsync+0xb0
sqllang!CSQLSatelliteConnection::WriteMessage+0x7d
sqllang!CSQLSatelliteCommunication::SendAbort+0x190
sqllang!CUDXR_ExternalScript::ShutdownService+0x96
sqlmin!CUDXR_ExternalScriptCleanup::Close+0xe
sqlmin!CQueryExecContext::FinalCleanupNoX+0x116
sqlmin!CQueryScan::DestroyQueryOnException+0x129
sqllang!CXStmtQuery::ShutdownOnException+0xc8
sqllang!CXStmtQuery::FinishOnExceptionImp+0x67
sqllang!_isa_available_init+0xe8cf3
MSVCR120!_CallSettingFrame+0x20 
MSVCR120!__CxxCallCatchBlock+0xf5
ntdll!RcConsolidateFrames+0x3
sqllang!CMsqlExecContext::FExecute+0xa9e
sqllang!CSQLSource::Execute+0x983
sqllang!SpExecuteExternalScript+0x140e
```
**Code Snippet 7:** *Call Stack at the Time a Packet is Sent*

Ah, from the call-stack in *Code Snippet 7* we can see how the exception brings us back to `sqllang!CMsqlExecContext::FExecute` and from there we go down a code path which eventually comes into the `sqllang!CSQLSatelliteCommunication::SendAbort` routine, which sends the packet with a length of 28.

We have now an explanation to the packet with a length of 28, it is SQL Server telling the SqlSatellite, that it aborts the process. The question about the message we see about SqlSatellite not being able to read the data chunk is not as straight forward though. 

#### SqlSatellite Data Chunk Message

Initially I thought the message came from inside SQL Server, but based on some tests I did, I believe the message originates in the SqlSatellite after the satellite has received the abort message. Reasoning behind this is based on that the message does not "smell" like a SQL Server Error message; it doesn't have an error number attached and it looks a lot like the output you'd get from the external script engine. Remember from [Internals - VII][si7] where we discussed files and sub-directories created by the launchpad service as well as the external engine, how - by default - two files are created by the launchpad service:

* `stdout0.txt` - for `cat` and `print` output from the engine.
* `stderr0.txt` - for error logging from the engine.  

The tests I did was based on my thinking that if the message originates from SQL Server, then neither `stdout0.txt` nor `stderr0.txt` would contain anything. However if the message originated from the external engine, then I should see something in either of those two files.

To be able to investigate this, I did what we did in [Internals - VII][si7]:

1. Stop the launchpad service.
1. Delete any sub directories of the user account directories in the `C:\<sql_instance_path>\MSSQL\ExtensibilityData` directory. Do NOT delete the user account directories themselves.
1. Open the `rlauncher.config` file in a text editor and change the value of `JOB_CLEANUP_ON_EXIT` to 0, and save the file (you need to do this as admin).
1. Restart the launchpad service.

> **NOTE:** By setting the `JOB_CLEANUP_ON_EXIT` to 0 we tell the launchpad service to not delete any directories etc., after we have executed (the executing process will still be torn down though).

After executing the code in *Code Snippet 4* I browsed through the various subdirectories of the user account directory in `C:\<sql_instance_path>\MSSQL\ExtensibilityData` (most likely *MSSQLSERVER01*), to find the directory which the process executed under. This directory has four files in it and one sub directory (the other directories are either empty, or has three files and a sub directory):

![](/images/posts/sql_r_services_13_user_directory_err_file.png)

**Figure 6:** *Process Directory with stderr.txt*
 
As we can see in *Figure 6* the `stderr.txt` files has a size greater than 0, and when opening I could see the same message as in *SSMS*: 

```c++
SqlSatellite cannot read data chunk.  Error code:0x80004004.
Error in eval(expr, envir, enclos) : 
  SqlSatellite cannot read data chunk.  Error code:0x80004004.
Calls: source -> withVisible -> eval -> eval -> .Call
Execution halted
```
**Code Snippet 8:** *Stderror.txt Content*

Based on this, it seems that particular message comes from the SqlSatellite and the external engine. Oh, when I executed the code in *Code Snippet 2* (fails during compilation), `stderr.txt` was not written to. E.g. the error happened before the SqlSatellite had been initialized. In a future post we will look more at what goes on when data - results as well as errors - come back to SQL Server.

## Summary

In this post we set out to try to understand when and how the statement that makes up `@input_data_1` is executed. We saw: 

* Before the SqlSatellite was initialized the statement is compiled.
* After the satellite has been initialized the statement is executed.

We also saw that if an error happens after the satellite has been initialized, SQL Server sends an abort message to the satellite in the `sqllang!CSQLSatelliteCommunication::SendAbort` routine.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright

[1]: https://www.microsoft.com/en-us/store/p/windbg/9pgjgd53tn86

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

