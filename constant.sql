-- constant:
do $$ 
declare
   vat constant numeric := 0.1;
   net_price    numeric := 20.5;
begin
   raise notice 'The selling price is %', net_price * ( 1 + vat );
end $$;

-- will try to change the value of constant 
do $$
declare
	vat constant numeric := 0.1;
	net_price numeric := 20.5;
begin
	raise notice 'The selling price is %', net_price*(1+vat);
	vat:=0.05;
end $$;