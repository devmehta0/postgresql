-- CREATE TABLE
DROP TABLE IF EXISTS links;

CREATE TABLE links (
   link_id serial PRIMARY KEY,
   title VARCHAR (512) NOT NULL,
   url VARCHAR (1024) NOT NULL
);

-- ADD COLUMN
ALTER TABLE links
ADD COLUMN active boolean;

SELECT * FROM links;

-- DROP COLUMN
ALTER TABLE links 
DROP COLUMN active;



