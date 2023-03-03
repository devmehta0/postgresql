-- create table posts
CREATE TABLE posts (
  id serial primary key,
	title VARCHAR (255) NOT NULL,
	excerpt VARCHAR (150),
	body TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);

INSERT INTO posts (title, excerpt, body)
VALUES
      ('test post 1','test post excerpt 1','test post body 1'),
      ('test post 2','','test post body 2'),
      ('test post 3', null ,'test post body 3');

select 
	id,
	title,
	COALESCE (excerpt, LEFT(body, 40))
from
	posts;
	
SELECT
	id,
	title,
	COALESCE (
		NULLIF (excerpt, ''),
		LEFT (body, 40)
	)
FROM
	posts;
