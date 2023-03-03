CREATE TABLE order_details(
	order_id SERIAL,
	item_id INT NOT NULL,
	item_text VARCHAR NOT NULL,
	price DEC(10,2),
	PRIMARY KEY(order_id,item_id)
);

CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;

INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);


SELECT
    order_id,
    item_id,
    item_text,
    price
FROM
    order_details;        
	
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';
