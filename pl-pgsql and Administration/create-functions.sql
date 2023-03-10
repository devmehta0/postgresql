CREATE FUNCTION get_film_count(len_from int, len_to int)
RETURNS INT
LANGUAGE PLPGSQL
AS 
$$
DECLARE
	film_count INTEGER;
BEGIN
	SELECT count(*)
	INTO film_count
	FROM film
	WHERE length BETWEEN len_from AND len_to;
	
	RETURN film_count;
END;
$$

SELECT get_film_count(len_from := 40, len_to := 90);