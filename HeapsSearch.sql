SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
GO
SELECT OBJECT_NAME(object_id) AS table_name
       ,forwarded_record_count
       ,page_count
       ,record_count
       ,FORMAT(page_count * 8 / 1024.0, '### ### ##0.00') AS size_MB
       ,index_type_desc
       ,avg_fragmentation_in_percent
       ,fragment_count
       ,FORMAT(avg_page_space_used_in_percent, '0.00') AS avg_page_space_used_in_percent
FROM   sys.dm_db_index_physical_stats(DB_ID(), NULL, DEFAULT, DEFAULT, 'DETAILED')
WHERE  index_type_desc = 'HEAP'
ORDER BY forwarded_record_count DESC
         ,size_MB DESC 
         ,record_count DESC;