--on master
CREATE LOGIN kowalczyk_wiktor WITH PASSWORD = 'password'
CREATE USER kowalczyk_wiktor FROM LOGIN kowalczyk_wiktor

--direct database
CREATE USER kowalczyk_wiktor FROM LOGIN kowalczyk_wiktor
ALTER ROLE db_owner ADD MEMBER kowalczyk_wiktor