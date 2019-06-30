/*
Missing Index Details from predict.sql - win10-dev.TestParallel (sa (54))
The Query Processor estimates that implementing the following index could improve the query cost by 73.9133%.
*/

/*
USE [TestParallel]
GO
CREATE NONCLUSTERED INDEX [ix_Rand_3M_rand5]
ON [dbo].[tb_Rand_3M] ([rand5])
INCLUDE ([y],[rand1],[rand2],[rand3],[rand4])
GO
*/


DROP INDEX [ix_Rand_3M_rand5]
ON [dbo].[tb_Rand_3M] ([rand5])