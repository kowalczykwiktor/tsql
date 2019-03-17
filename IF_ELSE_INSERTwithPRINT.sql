SET @count = (SELECT COUNT(Id)
              FROM OwnerType)
IF @count = 3
  BEGIN
    PRINT N'DODAJE POZYCJE 4 i 5'
    INSERT INTO OwnerType([Name])
    VALUES ('OrganizationOwner')
    INSERT INTO OwnerType([Name])
    VALUES ('TemporaryOwner');
    PRINT N'DODANO'
  END
ELSE
  IF @count = 4
    BEGIN
      PRINT N'DODAJE POZYCJE 5'
      INSERT INTO OwnerType([Name])
      VALUES ('TemporaryOwner');
      PRINT N'DODANO'
    END