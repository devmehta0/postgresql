-- below command for psql to backup DB1 database:
pg_dump -U postgres -h localhost -d DB1 -f backup.sql

-- Restore backup file
psql -U postgres -d db2 -h localhost -f backup.sql