DECLARE @Name nvarchar(MAX);
DECLARE @Sql nvarchar(MAX);
DECLARE @Result int;

DECLARE @Objects TABLE (
    Id INT IDENTITY(1,1),
    Name nvarchar(1000)
)

INSERT INTO @Objects
	SELECT
		QUOTENAME(SCHEMA_NAME(o.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(o.object_id))
	FROM sys.objects o
	WHERE type_desc IN (
	'SQL_STORED_PROCEDURE',
	'SQL_TRIGGER',
	'SQL_SCALAR_FUNCTION',
	'SQL_TABLE_VALUED_FUNCTION',
	'SQL_INLINE_TABLE_VALUED_FUNCTION',
	'VIEW')
	AND ISNULL(OBJECTPROPERTY(o.object_id, 'IsSchemaBound'), 0) = 0

DECLARE @x INT
DECLARE @xMax INT

SELECT
	@xMax = MAX(Id)
FROM @Objects
SET @x = 1

WHILE @x < @xMax
BEGIN
SELECT
	@Name = Name
FROM @Objects
WHERE Id = @x

SET @Sql = N'EXEC sp_refreshsqlmodule ''' + @Name + '''';
    --PRINT @Sql;

    BEGIN TRY
EXEC @Result = sp_executesql @Sql;
IF @Result <> 0
RAISERROR ('Failed', 16, 1);
END TRY
BEGIN CATCH
PRINT 'This module ''' + @Name + ''' does not compile.';
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH
SET @x = @x + 1
END