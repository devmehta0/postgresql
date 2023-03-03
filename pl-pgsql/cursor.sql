-- create a function
CREATE OR REPLACE FUNCTION get_film_titles(p_year int)
	RETURNS TEXT
AS
$$
DECLARE
	titles text DEFAULT '';
	rec_film record;
	cur_films CURSOR(p_year int)
		FOR SELECT title, release_year 
		FROM film
		WHERE release_year = p_year;
BEGIN
	OPEN cur_films(p_year);
	
	LOOP
		FETCH cur_films into rec_film;
		EXIT WHEN NOT FOUND;
		
		
		IF rec_film.title like '%ful%' then
			titles := titles || ',' || rec_film.title || ':' || rec_film.release_year;	
		END IF;
	END LOOP;
	
	CLOSE cur_films;
	
	RETURN titles;
END;
$$
LANGUAGE PLPGSQL;

SELECT get_film_titles(2006);

select * from film;