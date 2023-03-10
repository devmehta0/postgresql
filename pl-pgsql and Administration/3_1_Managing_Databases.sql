-- Create DB
CREATE DATABASE hr 
WITH 
   ENCODING = 'UTF8'
   OWNER = temp
   CONNECTION LIMIT = 100;
   
-- Create ROLE 
CREATE ROLE hr
LOGIN 
CREATEDB
PASSWORD 'securePa$$1';

ALTER DATABASE hr
OWNER TO hr;

-- Active sessions for any DB
SELECT  *
FROM pg_stat_activity
WHERE datname = 'postgres';

-- Below statement will terminate the running session of particular database:
SELECT
    pg_terminate_backend (pid)
FROM
    pg_stat_activity
WHERE
    datname = 'hr';
	
-- Rename DB
alter database hr 
rename to hr_backup;    

-- copying DB from prexisting DB
CREATE DATABASE targetdb
with template hr;

-- Below command will create a dump file.(Used in terminal)
pg_dump -U postgres -h localhost -d DB1 -f /home/dev/Desktop/test.sql


-- Get Table size
select pg_size_pretty(pg_relation_size('actor'));

-- Total DB size
select pg_size_pretty(pg_total_relation_size('actor'));

-- DB size
select pg_size_pretty(
	pg_database_size('DB1');
	
-- TABLESPACES SIZE
SELECT
    pg_size_pretty (
        pg_tablespace_size ('pg_default')
    );

SELECT
    pg_database.datname,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
    FROM pg_database;