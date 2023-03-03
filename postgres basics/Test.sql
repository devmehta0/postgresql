-- below query select various tables in PG:
-- select * from pg_catalog.pg_tables
-- WHERE schemaname != 'pg_catalog';

-- exporing city and country table by counting no. of cities in each country: 
-- select c.country, count(city) 
-- from city ct, country c 
-- where ct.country_id = c.country_id
-- group by ct.country_id,c.country
-- order by count desc;

-- LIMIT statement:
SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 4 OFFSET 3;

-- FETCH statement:
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
OFFSET 5 ROWS
FETCH FIRST 5 ROW ONLY;

-- Self join
CREATE TABLE employee_sj (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	manager_id INT,
	FOREIGN KEY (manager_id) 
	REFERENCES employee_sj (employee_id) 
	ON DELETE CASCADE
);
INSERT INTO employee_sj (
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES
	(1, 'Windy', 'Hays', NULL),
	(2, 'Ava', 'Christensen', 1),
	(3, 'Hassan', 'Conner', 1),
	(4, 'Anna', 'Reeves', 2),
	(5, 'Sau', 'Norman', 2),
	(6, 'Kelsie', 'Hays', 3),
	(7, 'Tory', 'Goff', 3),
	(8, 'Salley', 'Lester', 3);

SELECT 
	e1.first_name as emp,
	e2.first_name as mgr
FROM
	employee_sj e1
INNER JOIN
	employee_sj e2 ON e1.employee_id = e2.manager_id

-- Subquery:
SELECT
	first_name,
	last_name
	FROM
		payment, customer
	WHERE
		payment.customer_id = customer.customer_id
	ORDER BY 
		customer.customer_id;
		
-- 2.
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
	
-- 3. 
select * from payment;