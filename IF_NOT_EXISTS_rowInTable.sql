IF NOT exists(select * from NotificationEventType where [Name] = 'INCIDENT_MARK_AS_Critical')
    BEGIN
INSERT INTO dbo.NotificationEventType ([Name], EntityMetaDataId) VALUES ('INCIDENT_MARK_AS_Critical', (SELECT Id FROM dbo.EntityMetaData WHERE EntityName = 'Incident'))
    END