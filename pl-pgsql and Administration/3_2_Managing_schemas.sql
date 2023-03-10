SELECT current_schema();

SHOW search_path;

CREATE SCHEMA temp;

CREATE TABLE temp.s(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Will raise an error, need to specify schema name prior to tablename.
select * from s;

GRANT USAGE ON SCHEMA temp 
TO hr;

-- List all the schemas in current DB and their privileges.
SELECT * 
FROM pg_catalog.pg_namespace
ORDER BY nspname;

-- ALTER schema
-- RENAME schema
ALTER SCHEMA temp 
RENAME TO demo;

-- change the OWNER
ALTER SCHEMA demo
OWNER TO hr;

-- DROP schema with CASCADE 
DROP SCHEMA IF EXISTS demo CASCADE;
