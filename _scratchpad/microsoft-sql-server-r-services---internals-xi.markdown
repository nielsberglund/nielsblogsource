---
layout: post
title: Microsoft SQL Server R Services - Internals XI
author: nielsb
date: 
comments: true
categories:
  - SQL Server
  - Microsoft R Server
  - Data Science  
tags:
  - SQL Server R Services
  - R
  - WinDbg
  - Launchpad
  - RTerm.exe
description: 
keywords:
  -   
---

This post is part of a series of blog-posts about Microsoft SQL Server R Services:

1. [Microsoft SQL Server 2016 R Services Installation][sinst]
1. [Microsoft SQL Server R Services - Internals I][si1]
1. [Microsoft SQL Server R Services - Internals II][si2]
1. [Microsoft SQL Server R Services - Internals III][si3]
1. [Microsoft SQL Server R Services - Internals IV][si4]
1. [Microsoft SQL Server R Services - Internals V][si5]
1. [Microsoft SQL Server R Services - Internals VI] [si6]
1. [Microsoft SQL Server R Services - Internals VII][si7]
1. [Microsoft SQL Server R Services - Internals VIII[si8]
1. [Microsoft SQL Server R Services - Internals IX][si9]
1. [Microsoft SQL Server R Services - Internals X][si10]
1. Microsoft SQL Server R Services - Internals XI (this post)
1. More to come (hopefully)

This post is the twelfth post about Microsoft SQL Server R Services, and the eleventh post that drills down into the internal of how it works. In the last [post][si10] we spoke about how the transfer of data happens between SQL Server and the R components. In this post we will look at the protocol that is being used; **Binary eXchange Language** (**BXL**).

In [Internals - X][si10] we spoke about how the transfer of data happens between SQL Server and the R components, and we saw how data was transferred over the TCP connection between the **SqlSatellite** and SQL Server. In the post we mentioned that the protocol being used is  **Binary eXchange Language** protocol(**BXL**). When looking at the data-packets being passed we were somewhat confused how just passing one row of data containing 5 integers, would result in a packet size of 6300 bytes. So in this post we'll look at BXL and also try to figure out what causes such a big size.

I had hoped to explain more about BXL in this post, but unfortunately I have not been able to "glean" that much information as I had wished, but here is what I have found out / deduced. 

<!--more-->

## Recap

In [Internals - X][si10], as mentioned above, we looked at how data was transferred from SQL Server to R. By using **WireShark** we could see how the data was transferred over the TCP connection between the **SqlSatellite** and SQL Server. 


In [Internals - XII][si12] we also saw how the result from a statement for `@input_data_1`  like this: `SELECT 42`, sent a packet with a size of 2023 bytes. E.g. we are sending one row with one column and that has a size of 2023! The reason for this is, among other things, what we'll try to figure out in this post.


DROP TABLE IF EXISTS dbo.rand_50M
CREATE TABLE dbo.rand_50M(RowID bigint identity primary key, y int, 
                          rand1 int, rand2 int, rand3 int, rand4 int, 
                          rand5 int);

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
     
INSERT INTO dbo.rand_50M(y, rand1, rand2, rand3, rand4, rand5)
SELECT TOP(50000000) CAST(ABS(CHECKSUM(NEWID())) % 14 AS INT) 
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



> **NOTE:** We discussed the communications mechanisms in general and the TCP connection specifically in [Internals - IX][si9].

When looking at what data was transferred we saw how the actual R script was transferred, together with columns names for eventual output resultset. For example a script like this:

``` sql title:"Input Output"
EXEC sp_execute_external_script 
            @language =N'R',
            @script=N'Sys.sleep(10)
               d<-42
               OutputDataSet<-InputDataSet',
            @input_data_1 =N'SELECT 42 as col1, 
                             666 AS col2'
WITH RESULT SETS (([TheAnswer] int, 
                   [TheDevil] int));
GO
```
**Code Snippet 1:** *Script with Resultset*

 The script in *Code Snippet 1*, defines both an input dataset as well a output dataset, and - when executing - the data transferred to the SqlSatellite looked something like so:


``` bash title:"Packet 3"
........:......M
...K..B.........
......I.n.p.u.t.
D.a.t.a.S.e.t...
..O.u.t.p.u.t.D.
a.t.a.S.e.t...8.
..8.............
..c.o.l.1...8...
8...............
c.o.l.2...8...8.
..............T.
h.e.A.n.s.w.e.r.
..8...8.........
......T.h.e.D.e.
v.i.l.........S.
y.s...s.l.e.e.p.
(.1.0.)..... . .
 . . . . . . . .
 . . . . . . . .
 . . . . .d.<.-.
4.2..... . . . .
 . . . . . . . .
 . . . . . . . .
 . . .O.u.t.p.u.
t.D.a.t.a.S.e.t.
<.-.I.n.p.u.t.D.
a.t.a.S.e.t...
```
**Code Snippet 2:** *Packet for Input and Output*

The code in *Code Snippet 1*, sends in two columns `col1` and `col2` and we expect a resultset back with two columns; `TheAnswer` and `TheDevil`. In *Code Snippet 2* we see how that results in a packet to the SqlSatellite containing the actual script, the input dataset columns as well as the data columns for the output dataset.

The packet in *Code Snippet 2* is however not the only packet sent to the SqlSatellite. In [Internals - X][si10] we executed code like so:

```sql title:"Code"
exec sp_execute_external_script
                 @language = N'R' ,
                 @script = N'Sys.sleep(30)
                 d<-42'
               , @input_data_1 = N'
              SELECT TOP(1) y, rand1, rand2, rand3, 
                      rand4, rand5 
              FROM dbo.rand_1M'
```
**Code Snippet 3:** *External Script with Data Select*

When we executed the code in *Code Snippet 3* and used Process Monitor to see what happens, we saw something like so:

{% img center /images/posts/sql_r_services_10_procmon_output3.png 648 241 %}
**Figure 1:** *Process Monitor Output Data Select*

In *Figur 1* we see a packet with a size of 350, and that packet is the packet containing the script as well as column (like in *Code Snippet 2*). What is interesting is the second packet, with a size of 6300 bytes. This packet is the packet that sends the data to the SqlSatellite - the result from `SELECT TOP(1) y, rand1, rand2, rand3, rand4, rand5 FROM dbo.rand_1M`. What is interesting is the size; we are selecting one row, the row consists of 6 columns, and those columns were set up as `bigint`. How come one row of 6 `bigint`'s can be 6300 bytes?

That is what we will try and shed some light on in this post.




So the script in *Code Snippet 1* sends the input data to the SqlSatellite



  We saw how the R script, was sent over the TCP connection established between the **SqlSatelliet** and SQL Server. 

{% img center /images/posts/<image_name.ext> w h %}
**Figure 1:** **

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com
[ba]: https://twitter.com/bob_albright
[sinst]: {% post_url 2017-03-04-microsoft-sql-server-2016-r-services-installation %}
[si1]: {% post_url 2017-03-18-microsoft-sql-server-r-services---internals-i %}
[si2]: {% post_url 2017-04-02-microsoft-sql-server-r-services---internals-ii %}
[si3]: {% post_url 2017-04-13-microsoft-sql-server-r-services---internals-iii %}
[si4]: {% post_url 2017-04-23-microsoft-sql-server-r-services---internals-iv %}
[si5]: {% post_url 2017-05-01-microsoft-sql-server-r-services---internals-v %}
[si6]: {% post_url 2017-05-16-microsoft-sql-server-r-services---internals-vi %}
[si7]: {% post_url 2017-07-11-microsoft-sql-server-r-services---internals-vii %}
[si8]: {% post_url 2017-07-22-microsoft-sql-server-r-services---internals-viii %}
[si9]: {% post_url 2017-08-18-microsoft-sql-server-r-services---internals-ix %}
[si10]: {% post_url 2017-08-29-microsoft-sql-server-r-services---internals-x %}
[ba]: https://twitter.com/bob_albright