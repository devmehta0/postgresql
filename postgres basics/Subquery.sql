-- Subqueries file:
-- IN operator and subquery
SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (
		SELECT
			inventory.film_id
		FROM
			rental
		INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
		WHERE
			return_date BETWEEN '2005-05-29'
		AND '2005-05-30'
	);


-- Shows list of distinct customers using EXISTS:
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			1
		FROM
			payment
		WHERE
			payment.customer_id = customer.customer_id
	);
	
-- Trying different approach to solve the same 2nd query. but it shows all 14000 records(repeating customers)
SELECT
	first_name,
	last_name
	FROM
		payment, customer
	WHERE
		payment.customer_id = customer.customer_id
	ORDER BY 
		customer.customer_id;
		
	
-- 3. 
select * from payment;

-- 4.
select * from customer;

-- ANY operator:
-- calculate maximum length of film in each category.
SELECT
	category_id,
	MAX( length )
FROM
    film
INNER JOIN film_category
        USING(film_id)
GROUP BY
    category_id;
	
-- find all the film whose length is greater than maximum length of any film category.(using ANY operator)
SELECT title
FROM film
WHERE length >= ANY(
    SELECT MAX( length )
    FROM film
    INNER JOIN film_category USING(film_id)
    GROUP BY  category_id );
	
-- ALL operator:
-- To find all films whose lengths are greater than the list of the average lengths 
SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
            SELECT
                ROUND(AVG (length),2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    length;
	
	
-- EXISTS operator:
-- customers who have atleast one payment whose amount greater than 11
SELECT first_name,
       last_name
FROM customer c
WHERE EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;
