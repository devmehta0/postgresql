SELECT 'String Constant';
select $$I'm a string constant that contains a backslash \$$;

SELECT $message$I'm string constant that contains a backslash \$message$;

do 
$$
declare
   film_count integer;
begin 
   select count(*) into film_count
   from film;
   raise notice 'The number of films: %', film_count;
end;
$$

-- Function:
CREATE OR REPLACE FUNCTION find_film_by_id(
	id INT
) RETURNS VARCHAR
LANGUAGE SQL
as 
	'SELECT title FROM film
	WHERE film_id = id';

-- Drop function:
drop function find_film_by_id;

-- Calling funtion:
select find_film_by_id(1);

-- select * from film where film_id=1;

-- PL/SQL Block
do $$
<<first_block>>
declare
	film_count integer := 0;
begin
-- 	get number of films
	select count(*)
	into film_count
	from film;
-- 	display message
	raise notice 'the number of films is %', film_count;
end first_block $$;

