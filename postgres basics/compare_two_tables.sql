-- create tables

CREATE TABLE foo (
	ID INT PRIMARY KEY,
	NAME VARCHAR (50)
);

INSERT INTO foo (ID, NAME)
VALUES
	(1, 'a'),
	(2, 'b');

CREATE TABLE bar (
	ID INT PRIMARY KEY,
	NAME VARCHAR (50)
);

INSERT INTO bar (ID, NAME)
VALUES
	(1, 'a'),
	(2, 'b');
	
-- UPDATE one value from bar
UPDATE bar
SET name = 'c'
WHERE
	id = 2;

-- comparing using EXCEPT 
SELECT
	ID,
	NAME,
	'not in bar' AS note
FROM
	foo
EXCEPT
	SELECT
		ID,
		NAME,
		'not in bar' AS note
	FROM
		bar
UNION
SELECT
	ID,
	NAME,
	'not in foo' AS note
FROM
	bar
EXCEPT
	SELECT
		ID,
		NAME,
		'not in foo' AS note
	FROM
		foo;

-- compare using outer join 
SELECT 
	id,
	name
	
FROM
	foo
FULL OUTER JOIN bar USING(id, name)
WHERE 
	foo.id IS NULL
OR bar.id IS NULL;

-- SELECT QUERIES
SELECT * FROM foo;
SELECT * FROM bar;
