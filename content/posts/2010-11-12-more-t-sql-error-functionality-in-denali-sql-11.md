---
layout: post
title: "More T-SQL Error Functionality in Denali / SQL 11"
author: nielsb
date: 2010-11-12T09:27:56+02:00
categories:
  - SQL Server
tags:
  - denali
  - SQL 11
  - t-sql
comments: true
---
In my previous [post][1] I wrote about the new `THROW` keyword in Denali / SQL 11. Having played around a bit more with Denali, I wanted to write some additional things about `THROW` and it's relation to `RAISERROR`.

<!--more-->

### RAISERROR

First some background / overview of RAISERROR:

* `RAISERROR` allows you to throw an error based on either an error number or a message, and you can define the severity level and state of that error:
* If you call `RAISERROR` with an error number, that error number has to exist in sys.messages.
* You can use error numbers between 13001 and 2147483647 (it cannot be 50000) with `RAISERROR`.

As I mentioned in my previous [post][1], `RAISERROR` has been around since forever - and it works fairly well. One of the major drawbacks with `RAISERROR` - as I also wrote in my previous post; is that it cannot be used to re-throw an error we might have trapped in a structured error handling block. Or rather, this may not be that much a `RAISERROR` issue, as an issue that SQL Server has not previously supported the notion of re-throwing an error. Be as it may with that, there are other drawbacks with `RAISERROR` which I will mention later in this post.

### THROW

In Denali / SQL 11 Microsoft introduces the `THROW` keyword, which allows us to re-throw an exception caught in an exception handling block. Some characteristics of `THROW`:

* Using `THROW` you can throw a specific error number as well as message:

```sql
THROW 50000, 'Ooops', 1;
```
* When using `THROW>` you have to define both an error number as well as a message (and state), unless you re-throw an exception.
* The error number does not have to exist in sys.messages but, it has to be between 50000 and 2147483647.

So, `THROW` looks fairly cool, but what are the drawbacks with `RAISERROR` I mentioned above? ~~Well, for one - beginning with Denali / SQL 11 RAISERROR is being deprecated, i.e. it will eventually be removed from SQL Server~~. Another reason has to do with transactions and error handling.

**UPDATE:** According to [Aaron Bertrand][3], in his [post][4], it is only some very old `RAISERROR` syntax that is being deprecated.

### XACT_ABORT

As every T-SQL programmer worth his (or her) salt should know, an exception does not roll back a transaction by default (ok, ok, it does depend on severity level to an extent - but a "normal" exception does not roll back a tran). I.e. the following code would cause two rows to be inserted in the table `t1`:

```sql
--first create a test table which we will use throughout the code samples
 CREATE TABLE t1 (id int primary key, col1 nvarchar(15));
 --now onto the 'meat'
 BEGIN TRAN
 INSERT INTO t1 VALUES(1, 'row1');
 --emulate some error, this will indeed cause an exception to happen,
 --but the processing will continue
 SELECT 1 / 0
 INSERT INTO t1 VALUES(2, 'row2')
 COMMIT
```

We can indicate to SQL Server that we want "automatic" rollback of transactions when an exception happens by setting `XACT_ABORT`. This will cause a rollback to happen if a system exception happens. So based on the example above, no rows will be inserted when the code below executes:

```sql
SET XACT_ABORT ON
BEGIN TRAN
  INSERT INTO t1 VALUES(3, 'row3');
  SELECT 1 / 0
  INSERT INTO T1 VALUES(4, 'row4')
COMMIT
```
However, what happens if the user throws an exception using `RAISERROR`? In that case no rollback happens, i.e. `RAISERROR` does not honor the `XACT_ABORT` setting:

```sql
SET XACT_ABORT ON
BEGIN TRAN
  INSERT INTO t1 VALUES(5, 'row5');
  --the user raises an error, but the tx will not roll back
  RAISERROR('Oooops', 16, 1)
  INSERT INTO t1 VALUES(6, 'row6')
COMMIT
```
This can catch developers out and is in my opinion a fairly severe drawback. So with the introduction of Denali / SQL 11 and the `THROW` keyword, Microsoft has tried to fix this by making `THROW` honor `XACT_ABORT`:

```sql
SET XACT_ABORT ON
BEGIN TRAN
  INSERT INTO t1 VALUES(7, 'row7');
  --the user raises an error, and the tx will roll back
  THROW 50000, 'Ooops', 1
  INSERT INTO t1 VALUES(8, 'row8')
COMMIT
```
When you run the code above, you will see that the transaction is indeed rolled back and no rows are inserted.

So developers, "go forth" and `THROW` exceptions in SQL Server Denali / SQL 11.

[1]: {{< relref "2010-11-10-new-t-sql-features-in-sql-11-denali-error-handling.md" >}}
[3]: http://sqlblog.com/blogs/aaron_bertrand/
[4]: http://sqlblog.com/blogs/aaron_bertrand/archive/2010/11/22/sql-server-v-next-denali-using-throw-instead-of-raiserror.aspx
