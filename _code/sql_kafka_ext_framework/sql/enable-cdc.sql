USE GamePlayDB;
GO

EXEC sys.sp_cdc_enable_db
GO

EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'tb_GamePlay',
@role_name     = NULL,
@supports_net_changes = 0
GO

EXEC sys.sp_cdc_disable_table
@source_schema = N'dbo',
@source_name   = N'tb_GamePlay',
@capture_instance = 'ALL'
GO