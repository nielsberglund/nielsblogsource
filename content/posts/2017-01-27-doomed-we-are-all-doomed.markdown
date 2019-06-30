---
layout: post
title: Doomed, We are All Doomed I Say!
author: nielsb
date: 2017-01-27T18:58:40+02:00
comments: true
categories:
  - SQL Server
tags:
  - transactions
  - error handling
  - XACT_STATE()
  - XACT-ABORT()
description: SQL Server and XACT_STATE(). A blog-post about doomed transactions in SQL Server and XACT_STATE()
keywords:
  - transactions
  - error handling
  - XACT_STATE()
  - XACT-ABORT()  
---

Just to set things straight, the title of this post has nothing to do with US politics, but the infinitely more important (and exciting) subject of transactions in **SQL Server** and the concept of **doomed** transactions. Why I came across the idea for this post was due to a discussion I had with a colleague of mine - Sameer Chunilall - who didn't agree with my [post][1] a while ago about `XACT_ABORT`, he believes it is a good thing (mostly), where I believe it is a bad thing (mostly). 

<!--more-->

We ~~argued~~ discussed at length, and then decided that we both were right. Or rather I decided I was right, and he decided he was right :). Jokes aside, during the discussions the concept of **doomed** transactions were brought up, and that led me to writing this blog post.

Before we go any further, I have written a couple (three actually) posts that deal with transactions and/or error-handling in SQL Server, so if you want to refresh your memory they can be found here (in chronological order):

* [Transactions in SQL Server (take 2956)][3]
* [SQL Server Error Handling Gotchas][2]
* [Abort, Abort, We Are XACT_ABORT:ing, Or Are We?!][1]

Before we start talking about doomed transactions, let's look at something that has a definitive impact if a transaction will be doomed or not.

> **NOTE**: There is no special demo code for this blog post, if you want you can [download the code from the `XACT_ABORT` blog post](/downloads/code/xact_abort.zip), and edit according to the code snippets here.

## Statement, Scope and Batch Termination

In SQL Server you execute statements and batches. A statement is what it says it is, a single T-SQL statement, like:

```sql
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1');
```
**Code Snippet 1:** *T-SQL Statement*

A batch is what is executed at a point in time from an application (SSMS, ADO.NET, etc.):

``` sql
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1');

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID'); 

INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3');
GO
```
**Code Snippet 2:** *T-SQL Batch*

> **NOTE:** The `GO` statement in *Code Snippet 2*, is an SSMS "thing". When executing code from a script, the`GO` statement denotes batches.

When executing a stored procedure, that is also a batch. If a procedure calls other procedures, they are all executing inside the same batch. The code below shows 4 procedures we will use going forward:

``` sql
-- the DROP ... IF EXISTS only works on SQL SERVER 2016+
DROP PROCEDURE IF EXISTS dbo.pr_Caller
DROP PROCEDURE IF EXISTS dbo.pr_1;
DROP PROCEDURE IF EXISTS dbo.pr_2;
DROP PROCEDURE IF EXISTS dbo.pr_3;
GO

CREATE PROCEDURE dbo.pr_3
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(3, 'Details for OrderID 3')
END
GO

CREATE PROCEDURE dbo.pr_2
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_2: Before Insert'

--this should just work
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(2, 'Details for OrderID 2');

---- this should cause a fk exception
--INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
--VALUES(5, 'Details for Invalid OrderID');

---- invalid object name 
--SELECT * FROM dbo.tb_MyTable;

---- Conversion failure
-- DECLARE @n int;
-- SELECT @n = CONVERT(int,'ABC');

PRINT 'dbo.pr_2: Before EXEC dbo.pr_3'
EXEC dbo.pr_3;
END
GO

CREATE PROCEDURE dbo.pr_1
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_1: Before Insert'
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(1, 'Details for Order 1')
PRINT 'dbo.pr_1: Before EXEC dbo.pr_2'
EXEC dbo.pr_2;
END
GO

CREATE PROCEDURE dbo.pr_Caller
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_Caller: Before Begin TX'
BEGIN TRANSACTION
PRINT 'dbo.pr_Caller: Before EXEC dbo.pr_1'
EXEC dbo.pr_1;
PRINT 'dbo.pr_Caller: Before Commit TX'
COMMIT
END
GO
```
**Code Snippet 3:** *Call Chain of Procedures*

As we can see, `dbo.pr_Caller` starts a transaction, calls `dbo.pr_1`, which in turn calls `dbo.pr_2`, which finally calls `dbo.pr_3`. When all is "said and done", `dbo.pr_Caller` commits the transaction. The procedure `dbo.pr_2` is the "dodgy" procedure in this call chain, and we will use it to simulate some error conditions that will result in various termination types. As you can see in *Code Snippet 3*, `dbo.pr_2` has some commented out code, and it is this code that will cause terminations. Initially we'll execute the code as is, and this should not cause any errors:

``` sql
TRUNCATE TABLE dbo.tb_OrderDetail;
GO
EXEC dbo.pr_Caller;
GO
SELECT * FROM dbo.tb_OrderDetail;
GO
```
**Code Snippet 4**: *Batch Executions*

> **NOTE:** The code above starts with `TRUNCATE TABLE` we do that just to make sure everything is cleaned up before execution. Oh, and BTW - how many batches are executed above? Answer in comments or [email][ma].

When executing the above you should see three rows coming back from the `SELECT` statement, all is good:

![](/images/posts/batch_no_errors.png )
**Figure 1:** *Procedure Execution No Errors*

So what happens now if we were to `ALTER` proc 2 a bit, comment out the insert for `OrderID` 2, and uncomment the insert for `OrderID` 5. There is no order with that id, so it should result in a foreign key constraint error. The proc should look like so:

``` sql
ALTER PROCEDURE dbo.pr_2
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_2: Before Insert'

----this should just work
--INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
--VALUES(2, 'Details for OrderID 2');

-- this should cause a fk exception
INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
VALUES(5, 'Details for Invalid OrderID');

---- invalid object name 
--SELECT * FROM dbo.tb_MyTable;

---- Conversion failure
-- DECLARE @n int;
-- SELECT @n = CONVERT(int,'ABC');

PRINT 'dbo.pr_2: Before EXEC dbo.pr_3'
EXEC dbo.pr_3;
END
GO
```
**Code Snippet 5:** *Proc Which Will Cause FK Violation*

After `ALTER`:ing the proc and executing as in *Code Snippet 4*, we get something like:

![](/images/posts/fk_error.png)
**Figure 2:** *FK Error After Procedure Execution*

So we got a FK violation error, but we can also see that we continued the execution in `dbo.pr_2`, and called `dbo.pr_3`. Furthermore, the result gives us two rows back, from `dbo.pr_1` and `dbo_pr_3`:

![](/images/posts/result_after_fk.png)
**Figure 3:** *Result After FK Error*

### Statement Termination

What we just have seen is **statement termination**. The statement causing an error stopped executing, but we continued executing - even within the same proc - straight after that statement. Furthermore, the error had no *negative* impact on the transaction. This may or may not be what you expect and want.

I guess that most of you who read this have heard about statement termination before, so what we just have done should not come as any surprise.

Some of the errors that can cause statement termination are:

* Most of `CONSTRAINT` errors:
    * `NOT NULL`
    * `PRIMARY KEY` and `FOREIGN KEY` errors
    * `CHECK CONSTRAINT`
* Errors raised by the user
* Quite a few more :)

### Scope Termination

**Scope Termination** is probably not as well known as statement termination. A scope termination is when SQL Server terminates the statement that caused the exception and subsequent execution within the same *scope*. In the examples we are using, *scope* would be an individual procedure. So, let us have a look at an scope termination example, let us `ALTER` our "naughty" procedure `dbo.pr_2` and comment out the statement which caused the FK violation, and un-comment where the procedure does a `SELECT` from the non-existent table `dbo.tb_MyTable`:

``` sql
ALTER PROCEDURE dbo.pr_2
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_2: Before Insert'

----this should just work
--INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
--VALUES(2, 'Details for OrderID 2');

---- this should cause a fk exception
--INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
--VALUES(5, 'Details for Invalid OrderID');

-- invalid object name 
SELECT * FROM dbo.tb_MyTable;

---- Conversion failure
-- DECLARE @n int;
-- SELECT @n = CONVERT(int,'ABC');

PRINT 'dbo.pr_2: Before EXEC dbo.pr_3'
EXEC dbo.pr_3;
END
GO
```
**Code Snippet 6**: *SELECT from Non-Existent Table*

When you execute as in *Code Snippet 4*, the outcome is:

![](/images/posts/scope_abort.png)
**Figure 4:** *Scope Abort Error*

As expected an error happened, but compared to the statement termination example, `dbo.pr_2` did not continue executing (we did not see `dbo.pr_2: Before EXEC dbo.pr_3`). The statement that caused the error was terminated **AND** all subsequent statements within that scope (procedure). However, the batch continues and `dbo.pr_Caller` committed the transaction. When you look at the *Results* tab in SSMS you will see one row returning from the `SELECT` statement; the insert done by `dbo.pr_1`.

So, what causes scope termination? I have tried to look into that, but so far the only error type I have found termination the scope is when you try to access a missing object. If you know more types, please [email][ma] me, and I can update this post.

> **NOTE:** Neither statement termination, nor scope termination have any effect on a transaction.

#### Error Handling and Scope Termination

An interesting aspect of scope termination is how it is being handled (or not) by error handling. From my previous posts about errors, ([gotchas][2], and [XACT_ABORT][1]), we see how either `IF(@@ERROR <> 0 )`, or `TRY ... CATCH` catch exceptions. How about scope termination errors? You would expect them to be handled the same way as statement termination errors, as they do have the same severity (16), as can be seen from *Figure 3*, and *Figure 4*. In fact that is not the case! It turns out that an `IF(@@ERROR <> 0)` will not catch the error, whereas a `TRY ... CATCH` block will! 

### Batch Termination

After having covered statement termination and scope termination above, I do think that it is pretty clear what **batch** termination is. Some code to show this; once again in `dbo.pr_2`, comment out the `SELECT` statement against the no existing table and un-comment the part where we try to do a `CAST` conversion:

``` sql
ALTER PROCEDURE dbo.pr_2
AS
BEGIN
SET NOCOUNT ON;
PRINT 'dbo.pr_2: Before Insert'

----this should just work
--INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
--VALUES(2, 'Details for OrderID 2');

---- this should cause a fk exception
-- INSERT INTO dbo.tb_OrderDetail(OrderID, SomeDetail)
-- VALUES(5, 'Details for Invalid OrderID');

---- invalid object name 
-- SELECT * FROM dbo.tb_MyTable;

--- Conversion failure
DECLARE @n int;
SELECT @n = CONVERT(int,'ABC');

PRINT 'dbo.pr_2: Before EXEC dbo.pr_3'
EXEC dbo.pr_3;
END
GO
```
**Code Snippet 7:** *Proc Which Will Cause CAST Conversion Error*

When executing this (once again a in *Code Snippet 4*), this is what we get:

![](/images/posts/batch_termination.png)
**Figure 5:** *Batch Termination Error*

When looking at the output as per in *Figure 5*, we can see that no more execution happened in `dbo.pr_2`, as was also the case in scope-termination and *Figure 4*, **BUT** we do not see any further execution in `dbo.pr_Caller` either! The batch completely terminated. But wait a second; what about the transaction that was originally started in `dbo.pr_Caller`? That transaction has been rolled back automatically, when we exited the batch (more about that later).

Errors that can cause batch termination are:

* Conversion errors
* Deadlocks

#### Error Handling and Batch Termination

As with scope termination, `IF(@@ERROR <> 0)` will not catch the error that caused the batch termination, but `TRY ... CATCH` will. So, let's see what happens when we introduce `TRY ... CATCH` in `dbo.pr_Caller`:

``` sql
ALTER PROCEDURE dbo.pr_Caller
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRY
  PRINT 'dbo.pr_Caller: Before Begin TX'
  BEGIN TRANSACTION
  PRINT 'dbo.pr_Caller: Before EXEC dbo.pr_1'
  EXEC dbo.pr_1;
  PRINT 'dbo.pr_Caller: Before Commit TX'
  COMMIT
END TRY
BEGIN CATCH
  PRINT 'In catch block'
END CATCH
END
GO
```
**Code Snippet 8:** *TRY ... CATCH and Batch Termination*

We `ALTER` `dbo.pr_Caller` to have a `TRY ... CATCH`, but we do not do anything other than a `PRINT` statement. Remember, when we didn't have any `TRY ... CATCH`, the transaction was automatically rolled back. It is a little bit different now when we execute it as in *Code Snippet 4*:

![](/images/posts/uncommitable_tx.png)
**Figure 5:** *Uncommittable Transaction*

What happened here? All of a sudden we get quite a few error messages, and what is this about *Uncommittable transaction* at the very end? The short story is that as soon as you introduce `TRY ... CATCH` and you have active transactions - you need to decide what to do with that transaction. 

OK makes sense. In this case, I don't really care what went wrong, and I want to commit the transaction anyway. I conveniently don't pay any attention to the part of *uncommittable* in the error message. After all - this is what I can do if I get a statement termination or scope termination, so why not do it here too! I `ALTER` the procedure to do `COMMIT TRAN` in the `CATCH` block straight after the `PRINT` statement, and then I execute:

![](/images/posts/current_tx_cannot_be_committed.png)
**Figure 6:** *Current Transaction Cannot be Committed*

I am in trouble now. This time I am **really** told that I am doing something wrong: "*The current transaction cannot be committed and cannot support operations
that write to the log file. Roll back the transaction*". What is this?

## Doomed (a.k.a. "Oh, Oh, I am so up the cr33k")

The errors we see in both *Figure 5* as well as in *Figure 6* are due to that SQL Server decides - for one reason or another - that it cannot commit the transaction. The transaction is **doomed**, and the only thing that can be done is to roll it back. It is not straight forward when an error causes a doomed transaction as the way SQL Server handles errors are case by case. Rule of thumb though is that in most cases a doomed transaction is due to some error that has caused a batch termination.

> **NOTE:** To further drive home that SQL handles errors on a case by case basis, all errors we have seen so far (caused by statement, scope and batch terminations), have had a *severity* of 16.

Just to prove that we can recover from a batch termination without errors, we `ALTER` the `dbo.pr_Caller` procedure, replace the `COMMIT TRAN` with `ROLLBACK TRAN`, and execute. The outcome will be completely different:

![](/images/posts/rollback_tran.png)
**Figure 6:** *Rollback Doomed Transaction*

As *Figure 6* shows, no "nasty" errors - all is OK! So what do we do if we sometimes want to commit the transaction if it is not doomed even if there has been an error, or rather - how can we figure out whether a transaction can be committed or not?

### XACT_STATE()

The way to determine if a transaction can be committed or not is to use `XACT_STATE()`. The `XACT_STATE()` is a scalar function and it reports on the state of the current transaction. There are 3 possible return values:

* -1: a user transaction is active, but it is *doomed*, and it can only be rolled back
* 0: no user transaction is active
* 1: a user transaction is active, it can be committed or rolled back.

To see an example of this `ALTER` the `dbo.pr_Caller` proc's `CATCH` block to look something like *Code Snippet 9* below and then execute.

``` sql
BEGIN CATCH
  DECLARE @state smallint = (SELECT XACT_STATE());
  PRINT 'In catch block and XACT_STATE = ' + CAST(@state as varchar(2));
  IF(@state = -1)
  BEGIN
    PRINT 'We are rolling back'
    ROLLBACK TRAN;
  END
  ELSE IF (@state = 1)
  BEGIN
    PRINT 'We are committing'
  COMMIT TRAN
  END
  ELSE
    PRINT 'No transaction available'
    
END CATCH
```
**Code Snippet 9:** *Using XACT_STATE()*

After execution the output would be like so:

![](/images/posts/xact_state.png)
**Figure 7:** *Rollback Doomed Transaction*

As we see from *Figure 7*, we ended up in the `CATCH` block, `XACT_STATE` was -1, and the transaction was rolled back. You can if you want `ALTER` the "naughty" proc `dbo.pr_2`, and comment out the statement causing the batch termination and un-comment the statement which creates the statement termination. When executing, you should now get an output like so:

![](/images/posts/xact_state_1.png)
**Figure 8:** *Rollback Doomed Transaction*

Here we had decided that even if an exception was raised, we wanted to commit the transaction, unless it was doomed.

> **NOTE:** `XACT_STATE` can be used outside `TRY ... CATCH`, so you can use it even with "old style" error handling.

## XACT_ABORT

I started this blog-post by talking about `XACT_ABORT`, and how I discussed with Sameer if it was good or bad. We have now come full circle and we are back to `XACT_ABORT`. You are probably asking yourself how that fits into here? 

The answer to that is that if you switch on `XACT_ABORT`, even statement termination errors will cause the transaction to be doomed! To test this, `ALTER` the calling proc `dbo.pr_Caller` and insert a `SET XACT ABORT ON` at the beginning of the proc, underneath the `SET NOCOUNT ON`. The first few lines of the proc should look like so:

``` sql
ALTER PROCEDURE dbo.pr_Caller
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRY
```
**Code Snippet 10:** *Setting XACT_ABORT ON*

If you haven't already `ALTER`:ed `dbo.pr_2` to cause a foreign key exception (statement termination and not a "doomable" error), do so - as discussed between *Figure 7* and *Figure 8*. When you now execute you will get the same output as in *Figure 7*.

Finally, it is quite common to hear that triggers can be an issue, as they are rolling back transactions if an error happens in the trigger. The reason for this is that when a trigger executes, it automatically sets `XACT_ABORT ON`. 

I am not completely certain of the reason for this, but I guess it is a good "defensive" measure. So, if you don't want this behavior, you can do a `SET XACT_ABORT OFF` in your triggers.

## Summary

Transactions are doomed:

* When an exception happens which causes a batch termination
* For any exception when `XACT_ABORT` is `ON`.
* When SQL Server feels like it. :)

Exception handling in SQL Server is **NOT** straight forward, especially when mixed with transactions!





[ma]: mailto:niels.it.berglund@gmail.com
[de]: (/derivco)
[1]: {{< relref "2017-01-08-abort-abort-we-re-xact-aborting-or-are-we.markdown" >}}
[2]: {{< relref "2016-12-31-sql-server-error-handling-gotchas.markdown" >}}
[3]: {{< relref "2011-09-11-transactions-in-sql-server-take-2956.md" >}}
