IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('[dbo].[procedure_name]'))
BEGIN
    DROP PROCEDURE '[dbo].[procedure_name]'
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE '[dbo].[procedure_name]'
......
......
......