do 
$$
declare
	i int = 0;
	j int = 0;
begin
	<<outer_loop>>
	loop
		i=i+1;
		exit when i>3;
-- 		inner loop
		j=0;
		<<inner_loop>>
		loop
			j=j+1;
			exit when j>3;
			raise notice '(i,j): (%,%)', i,j;
		end loop inner_loop;
	end loop outer_loop;
end;
$$

-- examining direct exit:
do
$$
begin
  
  <<simple_block>>  
   begin
  	 exit simple_block;
     -- for demo purposes
	 raise notice '%', 'unreachable!';
   end;
   raise notice '%', 'End of block';
end;
$$

-- CONTINUE statement:
do
$$
declare
   counter int = 0;
begin
  
  loop
     counter = counter + 1;
	 -- exit the loop if counter > 10
	 exit when counter > 10;
	 -- skip the current iteration if counter is an even number
	 continue when mod(counter,2) = 0;
	 -- print out the counter
	 raise notice '%', counter;
  end loop;
end;
$$

