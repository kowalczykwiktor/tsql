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