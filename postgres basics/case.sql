SELECT
	title,
	length,
	CASE 
		WHEN length >0
			AND length <=50 THEN 'SHORT'
		WHEN length >50
			AND length <=120 THEN 'MEDIUM'
		WHEN length >120 THEN 'LONG'
	END duration
FROM film
ORDER BY title;