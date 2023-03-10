select * from film;

select replacement_cost from film;

-- max()
select round(max(replacement_cost),2)
		from film;

-- min()
select round(min(replacement_cost),2)
		from film;

-- avg()
select round(avg(replacement_cost),2) 
		from film;

-- count()			 
select count(*),count(replacement_cost)
		from film;

-- sum()			 
select rating, sum(rental_duration)
		from film
		group by rating
		order by rating;