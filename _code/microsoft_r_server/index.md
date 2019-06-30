---
layout: demopage
title: "Microsoft R Server"
date: 2017-02-24 18:10
---

This is the demo code accompanying the blog-post *Microsoft R Server*.

> **NOTE:** The database part of the code requires SQL Server 2016 (or higher).

### Instructions

1. Run the script `01.create_db_and_table.sql` in the `sql` folder. This creates the database to use as well as the necessary database objects (one table :) ).
1. If you look in the `data` folder, you'll see it is empty. Before going further you should download [mortgage data from here][1] (it is ~64 Mb).
    * After you have downloaded it, unzip the `.csv` files into the `data` directory.
1. Open from the `sql` folder the 02.insert_mortgage_data.sql. This script `BULK INSERT`s mortgage data from `.csv` files into the `dbo.tb_MortgageData` table. You need to assign a value to the `@path` variable at around line 12 in the script. The variable should point to the `data` directory where the `.csv` files reside. Make sure the @path variable is closed off with a "\". 
1. Execute the script. 



[1]: http://packages.revolutionanalytics.com/datasets/mortDefault.zip