-- The else section is optional. If the result of the search-expression does not match expression in the when sections and the else section does not exist, the case statement will raise a case_not_found exception.

-- SIMPLE CASE STATEMENT:
do $$
declare
	rate film.rental_rate%type;
	price_segment varchar(50);
begin
	select rental_rate 
	into rate
	from film 
	where film_id = 100;
	
	if found then
		case rate 
			when 0.99 then
				price_segment = 'Mass';
			when 2.99 then 
				price_segment = 'Mainstream';
			when 4.99 then
				price_segment = 'High end';
			else 
				price_segment = 'Unspecified';
			end case;
		raise notice '%', price_segment;
	end if;
end $$;

-- SEARCHED CASE STATEMENT:
do $$ 
declare
    total_payment numeric; 
    service_level varchar(25) ;
begin
     select sum(amount) into total_payment
     from Payment
     where customer_id = 100; 
	 
	 if found then
	    case 
		   when total_payment > 200 then
               service_level = 'Platinum' ;
           when total_payment > 100 then
	           service_level = 'Gold' ;
           else
               service_level = 'Silver' ;
        end case;
		raise notice 'Service Level: %', service_level;
     else
	    raise notice 'Customer not found';
	 end if;
end; $$ 
