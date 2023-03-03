-- BELOW CODE WILL RAISE DEFAULT EXCEPTION 
DO
$$
DECLARE
	rec RECORD;
	v_film_id int = 2000;
BEGIN
-- 	select a film
	SELECT film_id, title
	INTO STRICT rec
	FROM film
	WHERE film_id = v_film_id;
	
	RAISE NOTICE '%',rec;
END;
$$

-- USING EXCEPTION CLAUSE AND CONDITIONAL NAME:
do
$$
declare
	rec record;
	v_film_id int = 2000;
begin
	-- select a film 
	select film_id, title 
	into strict rec
	from film
	where film_id = v_film_id;
        -- catch exception
	exception 
	   when no_data_found then 
	      raise exception 'film % not found', v_film_id;
end;
$$
language plpgsql;

