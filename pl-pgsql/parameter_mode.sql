-- parameter modes

-- OUT mode
CREATE OR REPLACE FUNCTION get_film_stat(
	out min_len int,
	out max_len int,
	out avg_len NUMERIC
) language plpgsql
as 
$$
begin
	select 
		min(length),
		max(length),
		avg(length)::numeric(5,1)
	into 
		min_len, max_len, avg_len
	from film;
end; 
$$

select get_film_stat();

select * from get_film_stat();

-- INOUT mode
create or replace function swap(
	inout x int,
	inout y int
) 
language plpgsql	
as $$
begin
   select x,y into y,x;
end; $$;

select * from swap(10,20);