IF EXISTS(SELECT *
          FROM sys.objects
          WHERE object_id = OBJECT_ID(N'[dbo].[BIAListView]') AND type IN (N'V'))