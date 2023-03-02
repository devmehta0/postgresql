do $$
declare
	email varchar(255) := 'info@gmail.com';
begin
-- 	check emial for duplicate
-- 	...
-- report duplicate email 
	raise exception 'duplicate emial %', email
		using message = 'check the email again';
end $$;