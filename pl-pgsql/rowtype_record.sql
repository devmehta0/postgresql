-- SELECT INTO:
DO $$
DECLARE
	actor_count integer;
BEGIN
-- 	select the number of actors from the actor table
	SELECT COUNT(*)
	INTO actor_count
	FROM actor;
	
	RAISE NOTICE 'The number of actors: %', actor_count;
END; $$

-- ROW TYPE to SELECT INTO whole row into variable object:
DO $$
DECLARE
	selected_actor actor%rowtype;
BEGIN 
	SELECT *
	INTO selected_actor
	FROM actor 
	WHERE actor_id =10;
	
	RAISE NOTICE 'The actor name is % %',
	selected_actor.first_name,
	selected_actor.last_name;
END; $$

-- Unlike a row-type variable, a record variable does not have a predefined structure. The structure of a record variable is determined when the select or for statement assigns an actual row to it.
do
$$
declare
	rec record;
begin
	-- select the film 
	select film_id, title, length 
	into rec
	from film
	where film_id = 200;
	
	raise notice '% % %', rec.film_id, rec.title, rec.length;   
	
end;
$$
language plpgsql;

