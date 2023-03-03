CREATE TABLE basket(
	id SERIAL PRIMARY KEY,
	fruit VARCHAR(50) NOT NULL
);

INSERT INTO basket(fruit) values('apple');
INSERT INTO basket(fruit) values('apple');

INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('orange');
INSERT INTO basket(fruit) values('orange');

INSERT INTO basket(fruit) values('banana');

SELECT
    id,
    fruit
FROM
    basket;

-- selecting duplicate fruits 
SELECT 
	fruit,
	COUNT(fruit)
FROM
	basket
GROUP BY 
	fruit
HAVING
	COUNT(fruit)>1 
ORDER BY 
	fruit;

-- DELETE DUPLICATE
DELETE FROM
	basket a
		USING basket b
WHERE
	a.id < b.id
	AND a.fruit = b.fruit;
		
SELECT
    fruit,
    COUNT( fruit )
FROM
    basket
GROUP BY
    fruit
HAVING
    COUNT( fruit )> 1
ORDER BY
    fruit;
	
-- display table after deleting
SELECT * FROM basket;
