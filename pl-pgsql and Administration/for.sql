-- WHILE LOOP: 
DO $$
DECLARE
	counter integer := 0;
begin
	while counter < 5 loop
		raise notice 'Counter %', counter;
		counter := counter + 1;
	end loop;
end $$;

-- FOR LOOP using STEP:
do $$
begin 
  for counter in 1..6 by 2 loop
    raise notice 'counter: %', counter;
  end loop;
end; $$

-- FOR LOOP to iterate over resultset:
do
$$
declare
	f record;
begin
	for f in select title, length
		from film
		order by length desc, title
		limit 10
	loop
		raise notice '%(% mins)', f.title, f.length;
	end loop;
end;
$$  

-- iterate result set of dynamic query through FOR loop:
do $$
declare
    -- sort by 1: title, 2: release year
    sort_type smallint := 1; 
	-- return the number of films
	rec_count int := 10;
	-- use to iterate over the film
	rec record;
	-- dynamic query
    query text;
begin
		
	query := 'select title, release_year from film ';
	
	if sort_type = 1 then
		query := query || 'order by title';
	elsif sort_type = 2 then
	  query := query || 'order by release_year';
	else 
	   raise 'invalid sort type %s', sort_type;
	end if;

	query := query || ' limit $1';

	for rec in execute query using rec_count
        loop
	     raise notice '% - %', rec.release_year, rec.title;
	end loop;
end;
$$
