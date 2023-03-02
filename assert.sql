do $$
declare 
	film_count integer;
begin
	select count(*)
	into film_count
	from film;
	
	raise notice 'Total films are %', film_count;
	assert film_count < 100, 'Films are above 100 limit';
end $$;