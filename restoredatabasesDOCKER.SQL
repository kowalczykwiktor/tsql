USE [master]
BACKUP LOG [devBCM] TO  DISK = '/var/opt/mssql/backup/DEV_LogBackup_2018-10-11_11-33-51.bak' WITH NOFORMAT, NOINIT,  NAME = 'DEV_LogBackup_2018-10-11_11-33-51', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [devBCM] FROM  DISK = '/var/opt/mssql/backup/DEV.bak' WITH  FILE = 1,  MOVE 'DEV_Data' TO '/var/opt/mssql/backup/devBCM.mdf',  MOVE N'DEV_Log' TO '/var/opt/mssql/backup/devBCM.ldf',  NOUNLOAD,  STATS = 5

GO


USE [master]
RESTORE DATABASE [AdventureWorks] FROM  DISK = '/var/opt/mssql/backup/AdventureWorksDW2016CTP3.bak' WITH  FILE = 1,  MOVE 'AdventureWorksDW2014_Data' TO '/var/opt/mssql/backup/AdventureWorksDW2016CTP3_Data.mdf',  MOVE 'AdventureWorksDW2014_Log' TO '/var/opt/mssql/backup/AdventureWorksDW2016CTP3_Log.ldf',  NOUNLOAD,  STATS = 5

GO