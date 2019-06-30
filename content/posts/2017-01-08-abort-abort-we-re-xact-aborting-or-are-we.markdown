---
layout: post
title: Abort, Abort, We Are XACT_ABORT:ing, Or Are We?!
author: nielsb
date: 2017-01-08T11:41:55+02:00
comments: true
categories:
  - SQL Server
tags:
  - SQL Server
  - errorhandling
  - XACT_ABORT
  - t-sql
description: SQL Server and XACT_ABORT(). Here we discuss the dangers of using XACT_ABORT in SQL Server OLTP databases. DO NOT DO IT!!
keywords:
  - SQL Server
  - errorhandling
  - XACT_ABORT
  - t-sql
  - RAISERROR   
---

`SET XACT_ABORT` defines whether a transaction is automatically rolled back when a T-SQL statement raises a run-time exception, and when you read posts from prominent SQL bloggers you quite often see that they recommend to always have `XACT_ABORT` set to `ON`. From the title of this post you may get the impression that I do not necessarily agree, and to an extent you may be right. So, let us see ... 

<!--more-->

## Background

First of all; as with a post a while ago about [**SQL Server Error Handling Gotcha's**][1], this post is based on real world experiences based on the production OLTP databases we have here at [**Derivco**](/derivco).

> Derivco's main OLTP production database has around 5,000 stored procedures, where a small procedure has about 600 - 800 LOC, and a big procedure can have 3,000 - 4,000 LOC. The procedures are also quite heavily nested, where it is not uncommon to have a call chain of 10 - 15 procedures. It is not only one team working on the procedures, but multiple teams are maintaining and developing procedures.

So, back to the issue at hand, and let's begin looking at why we have `XACT_ABORT` in the first place? That has to do with transactions and SQL exceptions; remember back before SQL Server 2005 and `TRY` `CATCH`, an exception did not normally stop execution of a batch, even though the execution of the statement stopped. Let us look at some code for this, and let's start with creating a couple of tables with a foreign key constraint between them:

> **Note:** Most of the code in this post can be downloaded from [here](/downloads/code/xact_abort.zip)

``` sql
-- this database must be created before executing this
USE ErrTestDB;
GO

SET NOCOUNT ON;
GO

--this DROP IF EXISTS syntax requires SQL Server 2016
DROP TABLE IF EXISTS dbo.tb_OrderDetail;
DROP TABLE IF EXISTS dbo.tb_Order;
GO

CREATE TABLE dbo.tb_Order
(
  OrderID int
    CONSTRAINT [pk_Order] PRIMARY KEY, 
  OrderValue int,
  OrderDetail nvarchar(10)
);
GO

CREATE TABLE dbo.tb_OrderDetail
(
  OrderDetailID int identity
    CONSTRAINT [pk_OrderDetail] PRIMARY KEY, 
  OrderID int 
    CONSTRAINT [fk_OrderDetail_OrderID] 
    FOREIGN KEY REFERENCES dbo.tb_Order(OrderID), 
  SomeDetail nvarchar(50)
);
GO

INSERT INTO dbo.tb_Order(OrderID, OrderValue, OrderDetail)
VALUES(1, 100, 'Order 1'), 
      (2, 200, 'Order 2'), 
      (3, 350, 'Order 3');
GO

```
**Code Snippet 1:** *Setup Code*

As you see, we are creating a couple of tables, and then inserts some data into the primary table `dbo.tb_Order`. Now, if we write some code inserting data into `dbo.tb_OrderDetail`, inside a transaction, and we cause an exception to happen - what will the result be:

``` sql
SET NOCOUNT ON;
GO

BEGIN
BEGIN TRANSACTION
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(5, 'Details for Invalid OrderID') -- this should cause a fk exception

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT

SELECT * FROM dbo.tb_OrderDetail
END
GO  
```
**Code Snippet 2:** *Error*

From the code we see how we: 

* start a transaction
* insert for `OrderID` 1
* try to insert for `OrderID` 5
    * this causes a foreign key exception
* insert for `OrderID` 3
* commit the transaction
* `SELECT` from the table

The result from executing the code is that we get an foreign key exception raised, and the `INSERT` statement terminated as in Figure 1:

![](/images/posts/tx_fk_exception.png)

**Figure 1:** *Foreign Key Exception*

However, when looking at the result from the `SELECT` statement, we see how the first and third `INSERT` succeeded:

![](/images/posts/select_after_fk_error.png)

**Figure 2:** *SELECT After Exception*

So, as mentioned before, the exception did not affect the transaction, and anything after the exception executed as nothing had happened, plus the transaction was committed. This may not be the behavior you really wanted, e.g. you expected the transaction to roll back when an exception happened. 

If that's the behavior you wanted, there are a couple (actually 3) of ways to achieve it:

1. Check `@@ERROR` after each `INSERT`, and then `ROLLBACK` and `RETURN`.
1. If you are in an environment using SQL Server 2005+, catch the exception with `BEGIN TRY ... END TRY` and `BEGIN CATCH ... END CATCH`, and do a `ROLLBACK`.
1. Use `XACT_ABORT`.

### XACT_ABORT

By using `XACT_ABORT` we can ensure that the executing batch is terminated as well as any transaction being rolled back if an exception is raised, by setting `SET XACT_ABORT ON`, and then executing your code:

``` sql
SET NOCOUNT ON;
GO

--just clean up so we don't have any "baggage"
TRUNCATE TABLE dbo.tb_OrderDetail

SET XACT_ABORT ON;
BEGIN
BEGIN TRANSACTION

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(1, 'Details for Order 1')

  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(5, 'Details for Invalid OrderID') -- this should cause a fk exception
  
  INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
  VALUES(3, 'Details for OrderID 3')

  COMMIT

SELECT * FROM dbo.tb_OrderDetail
END
GO
```
**Code Snippet 3:** *Executing with XACT_ABORT ON*

The code looks almost like in *Code Snippet 2*, with the addition that we switch on `XACT_ABORT` in the beginning of the batch, oh and yes - we are also cleaning up the `dbo.tb_OrderDetail` table with a `TRUNCATE TABLE` command. When executing the code you almost get the same output as from *Code Snippet 2*, except for the fact that the output message does not say anything about statement termination:

![](/images/posts/fk_error_XACT_ABORT.png)

**Figure 3:** *Output Message after Executing with XACT_ABORT ON*

Also, there is no *Result* tab in the output, which indicates that the `SELECT` statement at the end of the batch did not execute, e.g. the exception caused a batch termination, due to `XACT_ABORT`being `ON`. So what about the transaction, remember that before we switched `XACT_ABORT` `ON`, the first and second `INSERT` statement succeeded. We can safely assume that in this example the third `INSERT` did not succeed, as the batch was terminated, but what about the first? Well, let's see; go ahead and execute the `SELECT * FROM dbo.tb_OrderDetail` and see what the result is. You should get something like in Figure 4:

![](/images/posts/SELECT_XACT_ABORT.png)
**Figure 4:** *Result After XACT_ABORT*

No rows coming back, `XACT_ABORT` rolled back the transaction as well as terminating the batch! That is fairly cool! What about something - somewhat (not much) - more realistic than just a batch execution; like `XACT_ABORT` and stored procedures. Below in *Code Snippet 4*, is code to create three stored procedures. The top level procedure (`dbo.pr_1`) switches `XACT_ABORT` and then goes on to start a transaction, do an insert and call `dbo.pr_2`, which in turns calls `dbo.pr_3`. The last procedure - `dbo.pr_3` - generates a foreign key exception:

> **NOTE:** The transaction handling in all the procs, in all examples, is very much simplified, whereby the procs being called by the top-level proc is not doing anything with transactions, as the transaction should only be committed/rolled back by the proc that started the transaction. See my [blog post][2] from a couple of years ago about *proper* transaction handling.

``` sql
-- proc 1
CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;

COMMIT TRAN;
GO

--proc 2
CREATE PROCEDURE dbo.pr_2
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3')

EXEC dbo.pr_3;
GO

-- proc 3
CREATE PROCEDURE dbo.pr_3
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID'); -- this should cause a fk exception
GO
```
**Code Snippet 4:** *Procedures with XACT_ABORT*

> If you are copying and pasting the code above, make sure you create the procs in opposite order to what is in the Code Snippet.

Let's see what happens when we execute `dbo.pr_1`:

``` sql
-- code for cleanup
-- TRUNCATE TABLE dbo.tb_OrderDetail

EXEC dbo.pr_1;
GO

-- execute this SELECT after you have executed the proc above
-- SELECT * FROM dbo.tb_OrderDetail
GO

```
**Code Snippet 5:** *Execution of the Procedures*

The result is exactly the same as when we executed the code in *Code Snippet 3*. So, even when we execute multiple procedures under the same **SPID**, the `XACT_ABORT` ensures that the batch (call chain) is terminated and the transaction rolls back! 

How cool is that, what is there not to like about automatic transaction rollback when an exception happens!

## What Could Possibly Go Wrong?!

Right let's have a look at a couple of scenarios where `XACT_ABORT` may not be the answer to your prayers.

### IF(@@ERROR<>0)

We'll start where we are in a situation where we still are doing SQL Server error-handling the old way, by checking `@@ERROR` after execution of statements. This could be a scenario where we have quite a few old procedures, which have not been update to `TRY ... CATCH` yet. The procedures look like so:

``` sql
--proc 1
CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;
IF(@@ERROR <> 0)
BEGIN
  PRINT 'dbo.pr_1: We are handling an error, cleaning up, and rolling back'
  ROLLBACK TRAN;
  RETURN
END
PRINT 'Here we are doing something which 
      relies on the execution of dbo.pr_2 being successful'

COMMIT TRAN;
GO

--proc 2
CREATE PROCEDURE dbo.pr_2
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3')

EXEC dbo.pr_3;
IF(@@ERROR <> 0)
BEGIN
  PRINT 'dbo.pr_2: We are handling an error, cleaning up, and raising'
  RAISERROR('dbo.pr_2: Error executing dbo.pr_3', 16, -1);
  RETURN
END
GO

--proc 3
CREATE PROCEDURE dbo.pr_3
AS

SET NOCOUNT ON;

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID'); -- this should cause a fk exception
IF(@@ERROR <> 0)
BEGIN
  PRINT 'dbo.pr_3: We are handling an error, cleaning up, and raising'
  RAISERROR('dbo.pr_3: Error in dbo.pr_3', 16, -1);
  RETURN
END
GO
```
**Code Snippet 6:** *Procedures with Old Style Error Handling*

They do not look much different than the procedures in my [blog post][1] a while ago about "gotcha's" in error handling. The procedures are being "good citizens", and check for errors after executing something that could go wrong, and if there is an error, they re-wind, clean up, and raise the exception up the call-chain. When executing `dbo.pr_1`, as in *Code Snippet 5*, you would see something like so:

![](/images/posts/exec_proc_old_error_handling.png)

**Figure 5:** *Executing Procs Old Style Error Handling*

We see how the exception happens and then how each proc is handling the exception, cleaning up, and re-raising. When `dbo.pr_1` receives the error, it also rolls back the transaction. If everythig had executed successfully, the `dbo.pr_1` proc would have gone on executing code after the error-handling block. In this case we can see it did not do that. Then, when executing the `SELECT` statement, no results are coming back - as everything has been rolled back. 

What would happen if the `dbo.pr_1` proc were to be modified to use `XACT_ABORT`? Let's say a developer has heard about `XACT_ABORT`, and think it sounds cool, so while he is doing other changes to the proc, he also changes it to use `XACT_ABORT`:

``` sql
DROP PROCEDURE IF EXISTS dbo.pr_1;
GO

CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

SET XACT_ABORT ON;

BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;
IF(@@ERROR <> 0)
BEGIN
  -- we have taken out the rollback as XACT_ABORT is ON
  -- however we still need to cleanup
  PRINT 'dbo.pr_1: We are handling an error, cleaning up'
  RETURN
END
PRINT 'Here we are doing something which 
      relies on everything being successful'

COMMIT TRAN;
GO
```
**Code Snippet 7:** *dbo.pr_1 Using XACT_ABORT*

Not much have changed, the developer:

* added `SET XACT_ABORT ON` before the `BEGIN TRANSACTION`
* took out the `ROLLBACK` in the error-handling block (as `XACT_ABORT` is used)
    * we still need to do cleanup in there though

What is the result now when executing `dbo.pr_1`:

![](/images/posts/exec_proc_XACT_ABORT.png)

**Figure 6:** *Executing Procs Using XACT_ABORT*


Whoa, no clean-up, rewinds, anything! I guess that should be expected seeing that `XACT_ABORT` terminates the batch, and rolls back the transaction. However this is one of the reasons I do not like `XACT_ABORT`: you have no control over what happens when an error occur!

### RAISERROR

So far the errors we have seen are errors from T-SQL statements, what if we were to raise an exception through `RAISERROR`? The answer to that is that `RAISERROR` will not cause `XACT_ABORT` to trigger! This means we can be in a very messed up state transaction wise. So if we use `XACT_ABORT` we need to be very careful how we handle exceptions, and we cannot solely rely on it to automatically do a `ROLLBACK`.

> **NOTE:** Using `THROW` would cause `XACT_ABORT` to work as intended, however that would require SQL Server 2012, and `THROW` in itself adds its own issues. See my [blog post][1] for more around that.

### TRY ... CATCH

What happens if we are in a `TRY ... CATCH` situation; e.g. using somewhere in the call-chain the exception handling capabilities introduced in SQL Server 2005?

> See my [blog post][1] about what issues you can run into with mixing and matching error-handling styles.

So let us edit `dbo.pr_3` to do "new" error-handling, and let the other procs stay the same:

``` sql
DROP PROCEDURE IF EXISTS dbo.pr_3;
GO

CREATE PROCEDURE dbo.pr_3
AS

SET NOCOUNT ON;
BEGIN TRY
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID'); -- this should cause a fk exception
END TRY
BEGIN CATCH
  PRINT 'dbo.pr_3: We are handling an error, cleaning up, and raising'
  RAISERROR('dbo.pr_3: Error in dbo.pr_3', 16, -1);
  RETURN
END CATCH
GO
```
**Code Snippet 8:** *TRY ... CATCH in dbo.pr_3*

Here it is the last proc in the call-chain that are using `TRY ... CATCH`, and as it is doing proper exception handling it knows that it did not start the transaction, so in the error handling code it just raises the error. The result is the following:

![](/images/posts/XACT_ABORT_TRY_CATCH.png)

**Figure 7:** *XACT_ABORT and TRY ... CATCH*

Ooops, we really are in a messed up state. I guess that is to be expected seeing what we discovered above regarding `RAISERROR`. Once again, we need to be very careful what we do when we use `XACT_ABORT`. Oh, and what would the result be if we only changed `dbo.pr_1` to use `TRY ... CATCH`, e.g roll back the change in `dbo.pr_3`, and add the "new" style exception handling in `dbo.pr_1`:

``` sql

DROP PROCEDURE IF EXISTS dbo.pr_1;
GO

CREATE PROCEDURE dbo.pr_1
AS

SET NOCOUNT ON;

SET XACT_ABORT ON;
BEGIN TRY
BEGIN TRANSACTION

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')

EXEC dbo.pr_2;
PRINT 'Here we are doing something which 
      relies on the execution of dbo.pr_2 being successful'
COMMIT TRAN
END TRY
BEGIN CATCH
  PRINT 'dbo.pr_1: We are handling an error, cleaning up'
  RETURN
END CATCH
GO

```
**Code Snippet 8:** *TRY ... CATCH in dbo.pr_1*

Notice that we in the `CATCH` block we are not doing rolling back the transaction as we rely on `XACT_ABORT` to handle that. When executing the result is:

![](/images/posts/top_level_try_catch.png)
**Figure 8:** *Top Level TRY ... CATCH and XACT_ABORT*

From the result we see how we immediately ended up in the `TRY ... CATCH` block in `dbo.pr_1`! This indicates that `TRY ... CATCH` *overrides* `XACT_ABORT`! In reality there is no use having `XACT_ABORT` and `TRY ... CATCH` in the same proc!

In fact, I would argue that when we have `TRY ... CATCH` we don't need `XACT_ABORT`, as we can decide what to do with the transaction in the `CATCH` block!

We have now seen quite a few examples where `XACT_ABORT` may not be ideal. My biggest "gripe" with `XACT_ABORT` is not any of those...

### All Errors are Equal, Some are More Equal then Others

I am paraphrasing George Orwell above, and that phrase summarizes why I do not like `XACT_ABORT`. Let me explain...

If we go back to what the code looked like at *Code Snippet 6*. We had three procs which did proper error handling and all was good. Let us assume these procs were some procs for a financial institution where they were called for deposits. We then realized that we needed some code that did something that were not vital for the actual deposit process, but we still needed it to execute together with the other procs (this may be logging, etc). So we introduce a new proc (call it `dbo.pr_Logging`) into the call chain, and in that proc we make sure we handle any errors, because we do not want to affect the deposit process. We handle the errors in the "old" way, as we do not want to mix "old" and "new". All is well and good!

However, we now come to the same scenario we saw in *Code Snippet 7*; the developer who had heard about `XACT_ABORT`. So the developer introduces the `XACT_ABORT` as in *Code Snippet 7*. 

What happens now if an exception happens in `dbo.pr_Logging`? The batch is terminated and the transaction is rolled back. So a non-vital error is now causing the transaction (the deposit) to fail! Ouch!!!!

## Summary

I am against `XACT_ABORT` because:

* You are losing control of what to do when an exception happens
* It does not play well with `TRY ... CATCH`
* **Non-vital exceptions causes the whole transaction to roll back!**

[Download the demo code from here](/downloads/code/xact_abort.zip)


[1]: {{< relref "2016-12-31-sql-server-error-handling-gotchas.markdown" >}}
[2]: {{< relref "2011-09-11-transactions-in-sql-server-take-2956.md" >}}
