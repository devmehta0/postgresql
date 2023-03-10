-- Role and privileges

-- create 
CREATE ROLE alice 
LOGIN 
PASSWORD 'securePass1';

-- List roles/users 
SELECT rolname FROM pg_roles;

CREATE ROLE dev_api WITH
LOGIN
CREATEDB
PASSWORD 'securePass1'
VALID UNTIL '2030-01-01'
CONNECTION LIMIT 100;

-- access denied for alice user
select * from actor;

-- grant select permission for actor table  
GRANT SELECT 
ON actor 
TO alice;

REVOKE SELECT
ON actor
FROM alice;

-- Alter Role
create role calf
login 
password 'securePwd1';

alter role calf 
superuser;

alter role calf
valid until '2050-01-01';

drop role calf;
