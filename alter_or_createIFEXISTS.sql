--PROCEDURES--
EXEC("
	IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('[dbo].[procedure_name]'))
BEGIN
    DROP PROCEDURE [dbo].[procedure_name]
END

SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER ON;
")


EXEC("
CREATE PROCEDURE '[dbo].[procedure_name]'
......
")


--TABLES--
EXEC("
IF NOT exists(SELECT *
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME = 'TEST2')
  BEGIN
    CREATE TABLE TEST2 (
      Id   BIGINT,
      Name VARCHAR(10)
    )
  END
 ")